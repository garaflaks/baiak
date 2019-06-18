function onUse(cid, item, frompos, item2, topos)
local config = {
item = 6119, -- ID do item.
exaust = 48088, --storage do exhaust.
tempo = 30, -- tempo de exhaust.
}
	if getTileInfo(getThingPos(cid)).protection == false then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[ATENÇÃO] Você so pode se teletransportar se estiver em area protection zone.")
	return false
	end
	if getPlayerStorageValue(cid, config.exaust) < os.time() then
		if item.itemid == config.item then
			doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
	        doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYAREA)
	        doSendAnimatedText(getCreaturePosition(cid), "Teleport!", TEXTCOLOR_RED)
			setPlayerStorageValue(cid, config.exaust, config.tempo + os.time())
		end
	else
		doPlayerSendTextMessage(cid, 22, "[ATENÇÃO] Você deve esperar 30 segundos para usar o item novamente.")
	end
return true
end