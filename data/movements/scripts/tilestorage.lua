function onStepIn(cid, item, position, fromPosition)

local config = {
msgDenied = "Pegue primeiro os seus equipamentos no andar de baixo!",
msgWelcome = "Bem Vindo ao WakeBaiak, boa sorte!"
}

    if getPlayerStorageValue(cid, 12360) <= 0 then
doTeleportThing(cid, fromPosition, true)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgDenied)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return TRUE
end
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgWelcome)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return TRUE
end