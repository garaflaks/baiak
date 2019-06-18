////////////////////////////////////////////////////////////////////////
// OpenTibia - an opensource roleplaying game
////////////////////////////////////////////////////////////////////////
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
////////////////////////////////////////////////////////////////////////
#include "otpch.h"
#include "scheduler.h"

#include "outputmessage.h"
#include "protocol.h"

#ifdef __ENABLE_SERVER_DIAGNOSTIC__
uint32_t OutputMessagePool::outputMessagePoolCount = OUTPUT_POOL_SIZE;
#endif

OutputMessagePool::OutputMessagePool()
{
	for(uint32_t i = 0; i < OUTPUT_POOL_SIZE; ++i)
	{
		OutputMessage* msg = new OutputMessage();
		m_outputMessages.push_back(msg);
#ifdef __TRACK_NETWORK__
		m_allMessages.push_back(msg);
#endif
	}

	m_frameTime = OTSYS_TIME();
}

void OutputMessagePool::startExecutionFrame()
{
	//boost::recursive_mutex::scoped_lock lockClass(m_outputPoolLock);
	m_frameTime = OTSYS_TIME();
	m_shutdown = false;
}

OutputMessagePool::~OutputMessagePool()
{
	for(InternalList::iterator it = m_outputMessages.begin(); it != m_outputMessages.end(); ++it)
		delete (*it);

	m_outputMessages.clear();
}

void OutputMessagePool::send(OutputMessage_ptr msg)
{
	m_outputPoolLock.lock();
	OutputMessage::OutputMessageState state = msg->getState();

	m_outputPoolLock.unlock();
	if(state == OutputMessage::STATE_ALLOCATED_NO_AUTOSEND)
	{
		#ifdef __DEBUG_NET_DETAIL__
		std::clog << "Sending message - SINGLE" << std::endl;
		#endif
		if(msg->getConnection())
		{
			if(!msg->getConnection()->send(msg) && msg->getProtocol())
				msg->getProtocol()->onSendMessage(msg);
		}
		#ifdef __DEBUG_NET__
		else
			std::clog << "[Error - OutputMessagePool::send] NULL connection." << std::endl;
		#endif
	}
	#ifdef __DEBUG_NET__
	else
		std::clog << "[Warning - OutputMessagePool::send] State != STATE_ALLOCATED_NO_AUTOSEND" << std::endl;
	#endif
}

void OutputMessagePool::sendAll()
{
	boost::recursive_mutex::scoped_lock lockClass(m_outputPoolLock);

	const int64_t dropTime = m_frameTime - 10000;
	const int64_t frameTime = m_frameTime - 10;

	for (OutputMessage_ptr omsg : m_addQueue) {
		const int64_t msgFrame = omsg->getFrame();
		if (msgFrame >= dropTime) {
			omsg->setState(OutputMessage::STATE_ALLOCATED);

			if (frameTime > msgFrame) {
				m_autoSend.push_front(omsg);
			} else {
				m_autoSend.push_back(omsg);
			}
		} else {
			//drop messages that are older than 10 seconds
			if (omsg->getProtocol()) {
				omsg->getProtocol()->onSendMessage(omsg);
			}
		}
	}
	m_addQueue.clear();

	for (auto it = m_autoSend.begin(); it != m_autoSend.end();) {
		OutputMessage_ptr omsg = *it;
		if(omsg->size() > 1024 || frameTime > omsg->getFrame()) {
			Connection_ptr connection = omsg->getConnection();
			if(connection && !connection->send(omsg) && omsg->getProtocol())
				omsg->getProtocol()->onSendMessage(omsg);

			it = m_autoSend.erase(it);
		} else {
			it++;
		}
	}

	/*
	for (auto it = m_autoSend.begin(), end = m_autoSend.end(); it != end; it = m_autoSend.erase(it)) {
		OutputMessage_ptr omsg = *it;
		if (frameTime <= omsg->getFrame()) {
			break;
		}

		Connection_ptr connection = omsg->getConnection();
		if(connection && !connection->send(omsg) && omsg->getProtocol())
			omsg->getProtocol()->onSendMessage(omsg);
	}
	*/
}

void OutputMessagePool::releaseMessage(OutputMessage* msg)
{
	Dispatcher::getInstance().addTask(createTask(boost::bind(
		&OutputMessagePool::internalReleaseMessage, this, msg)), true);
}

void OutputMessagePool::internalReleaseMessage(OutputMessage* msg)
{
	if(msg->getProtocol())
		msg->getProtocol()->unRef();
	else
		std::clog << "[Warning - OutputMessagePool::internalReleaseMessage] protocol not found." << std::endl;

	if(msg->getConnection())
		msg->getConnection()->unRef();
	else
		std::clog << "[Warning - OutputMessagePool::internalReleaseMessage] connection not found." << std::endl;

	msg->freeMessage();
#ifdef __TRACK_NETWORK__
	msg->clearTrack();
#endif

	m_outputPoolLock.lock();
	m_outputMessages.push_back(msg);
	m_outputPoolLock.unlock();
}

OutputMessage_ptr OutputMessagePool::getOutputMessage(Protocol* protocol, bool autoSend/* = true*/)
{
	#ifdef __DEBUG_NET_DETAIL__
	std::clog << "request output message - auto = " << autoSend << std::endl;
	#endif
	if(m_shutdown)
		return OutputMessage_ptr();

	boost::recursive_mutex::scoped_lock lockClass(m_outputPoolLock);
	if(!protocol->getConnection())
		return OutputMessage_ptr();

	if(m_outputMessages.empty())
	{
#ifdef __ENABLE_SERVER_DIAGNOSTIC__
		outputMessagePoolCount++;
#endif
		OutputMessage* msg = new OutputMessage();
		m_outputMessages.push_back(msg);
#ifdef __TRACK_NETWORK__
		m_allMessages.push_back(msg);
#endif
	}

	OutputMessage_ptr omsg;
	omsg.reset(m_outputMessages.back(),
		boost::bind(&OutputMessagePool::releaseMessage, this, _1));

	m_outputMessages.pop_back();
	configureOutputMessage(omsg, protocol, autoSend);
	return omsg;
}

void OutputMessagePool::configureOutputMessage(OutputMessage_ptr msg, Protocol* protocol, bool autoSend)
{
	TRACK_MESSAGE(msg);
	msg->reset();
	if(autoSend)
	{
		msg->setState(OutputMessage::STATE_ALLOCATED);
		m_autoSend.push_back(msg);
	}
	else
		msg->setState(OutputMessage::STATE_ALLOCATED_NO_AUTOSEND);

	Connection_ptr connection = protocol->getConnection();
	assert(connection);

	msg->setProtocol(protocol);
	protocol->addRef();
	msg->setConnection(connection);
	connection->addRef();

	msg->setFrame(m_frameTime);
}

void OutputMessagePool::autoSend(OutputMessage_ptr msg)
{
	m_outputPoolLock.lock();
	m_addQueue.push_back(msg);
	m_outputPoolLock.unlock();
}
