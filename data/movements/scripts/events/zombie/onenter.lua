function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
		 if(not isPlayer(cid)) then
					 return true
		 end
		 if(getPlayerAccess(cid) >= ZE_ACCESS_TO_IGNORE_ARENA) then
					 addPlayerToZombiesArea(cid)
		 elseif(#getZombiesEventPlayers() < getZombiesEventPlayersLimit() and getStorage(ZE_STATUS) == 1) then
					 addPlayerToZombiesArea(cid)
					 local players_on_arena_count = #getZombiesEventPlayers()
					 if(players_on_arena_count == getZombiesEventPlayersLimit()) then
								 addZombiesEventBlockEnterPosition() -- removeTP
								 doSetStorage(ZE_STATUS, 2)
								 doBroadcastMessage("Zombie Arena Event começou.")
								
					 else
								doPlayerPopupFYI(cid, "-BR-\nVocê entrou no zombie event. \nAguarde o ínicio do evento. \nObjetivo: Você precisa fugir dos zombies, não deixe nenhum zombie te pegar!")
		
								 doBroadcastMessage(getCreatureName(cid) .. " entrou na Zombie Arena. Estamos esperando " .. getZombiesEventPlayersLimit() - players_on_arena_count .. " players ou o evento iniciará com a quantidade atual de players.")
					 end
		 else
					 doTeleportThing(cid, fromPosition, true)
					 addZombiesEventBlockEnterPosition()
					doCreatureSay(cid, "Evento zombie off!", TALKTYPE_ORANGE_1)
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "O zombie event não está ativo, lembre-se, ocorre todas os dias, ás 10horas e 16horas!")
		 end
		 return true
end