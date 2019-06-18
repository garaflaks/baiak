function onStepIn(cid, item, position, fromPosition)

local config = {
msgDenied = "O castelo não está ativo, lembre-se, ocorre todas os dias ás 22horas!",
msgWelcome = "Bem Vindo ao Castle War, boa sorte!"
}

    if (getGlobalStorageValue(cid, 49512)) == -1 then
doTeleportThing(cid, fromPosition, true)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgDenied)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return TRUE
end
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgWelcome)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
setPlayerStorageValue(cid, 49689, 1)
return TRUE
end