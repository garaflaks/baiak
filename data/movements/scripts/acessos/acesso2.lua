function onStepIn(cid, item, position, fromPosition)

local config = {
msgWelcome = "Bem-Vindo ao acesso2."
}
          if getPlayerStorageValue(cid, 17541) <= 0 then
                    doTeleportThing(cid, fromPosition, TRUE)
                    doPlayerSendCancel(cid, "You don't have premission to pass.")
          return TRUE
		  end
		  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgWelcome)
		  doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return TRUE
end