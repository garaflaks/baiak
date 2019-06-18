function onUse(cid, item, fromPosition, itemEx, toPosition)
	local firstPlayerPosition = {x = 141, y = 17, z = 7, stackpos = STACKPOS_TOP_CREATURE}
	local getFirstPlayer = getThingFromPos(firstPlayerPosition)
	local secondPlayerPosition = {x = 141, y = 15, z = 7, stackpos = STACKPOS_TOP_CREATURE}
	local getSecondPlayer = getThingFromPos(secondPlayerPosition)
	local arenaLevel = 100
	local newFirstPlayerPosition = {x = 136, y = 12, z = 7}
	local newSecondPlayerPosition = {x = 136, y = 19, z = 7}
	if(item.uid == 8005) then
		if(getFirstPlayer.itemid > 0 and getSecondPlayer.itemid > 0) then
			if(getPlayerLevel(getFirstPlayer.uid) >= arenaLevel and getPlayerLevel(getSecondPlayer.uid) >= arenaLevel) then
				for arenax = 980, 987 do
					for arenay = 988, 995 do
						local arenaPosition = {x=arenax, y=arenay, z=7, stackpos=253}
						local arenaCreature = getThingFromPos(arenaPosition)
						if(arenaCreature.itemid > 0 and isPlayer(arenaCreature.uid) == FALSE) then
							if(isMonster(arenaCreature.uid) == TRUE) then
								doRemoveCreature(arenaCreature.uid)
							end
						elseif(arenaCreature.itemid > 0 and isPlayer(arenaCreature.uid) == TRUE) then
							doPlayerSendCancel(cid, "Wait for current duel to end.")
							return TRUE
						end
					end
				end
				if(item.itemid == 1945) then
					doTransformItem(item.uid, 1946)
				elseif(item.itemid == 1946) then
					doTransformItem(item.uid, 1945)
				end
				doSendMagicEffect(firstPlayerPosition, 2)
				doSendMagicEffect(secondPlayerPosition, 2)
				doTeleportThing(getFirstPlayer.uid, newFirstPlayerPosition)
				doTeleportThing(getSecondPlayer.uid, newSecondPlayerPosition)
				doSendMagicEffect(newFirstPlayerPosition, 10)
				doSendMagicEffect(newSecondPlayerPosition, 10)
				doPlayerSendTextMessage(getFirstPlayer.uid, 18, "FIGHT!")
				doPlayerSendTextMessage(getSecondPlayer.uid, 18, "FIGHT!")
			else
				doPlayerSendCancel(cid, "Both fighters must have level 100.")
			end
		else
			doPlayerSendCancel(cid, "You need 2 players for a duel.")
		end
	end
	return TRUE
end