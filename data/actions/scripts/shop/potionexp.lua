local config = {
	rate = 1.3, 
	time = 60, -- Minutos
	storage = 21002
}
local function endExpRate(cid)
	if isPlayer(cid) == TRUE then
		doPlayerSetRate(cid, SKILL__LEVEL, 1)
		setPlayerStorageValue(cid, config.storage, -1)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "O efeito da Exp Potion acabou!")
	end
end
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(getPlayerStorageValue(cid, config.storage) < 0) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você está com 30% de EXP extra durante ".. config.time .." minutos.")
			doSendMagicEffect(getPlayerPosition(cid), 28)
              doCreatureSay(cid,'30% Experience Actived!', TALKTYPE_ORANGE_1) 
		doPlayerSetRate(cid, SKILL__LEVEL, config.rate)
		setPlayerStorageValue(cid, config.storage, os.time() + config.time * 60)
		addEvent(endExpRate, config.time * 60 * 1000, cid)
		doRemoveItem(item.uid, 1)
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você ainda está sob o efeito da Exp Potion, espere acabar o tempo para usa-la novamente.")
	end
	return TRUE
end