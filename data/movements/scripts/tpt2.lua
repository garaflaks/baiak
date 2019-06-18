function onStepIn(cid, item, position, fromPosition)
			doTeleportThing (cid, getTownTemplePosition(getPlayerTown(cid)), TRUE)
			doSendMagicEffect(getCreaturePos(cid), 10)
			doCreatureSay ( cid, "Welcome to Temple!", TALKTYPE_ORANGE_1 )	
			return true		
		end		

