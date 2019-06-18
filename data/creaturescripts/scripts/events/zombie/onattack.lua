function loseOnZombieArena(cid)
kickPlayerFromZombiesArea(cid)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "BOOM! Você esta morto.")
local players = getZombiesEventPlayers()
if(#players <= 1) then
	 local winner = players[1]
	 if(winner) then
		 doPlayerAddItem(winner, 12711, 1, true)
		 doPlayerAddItem(winner, 12669, 1, true)
		 doPlayerAddItem(winner, 12734, 5, true)
		 doPlayerSendTextMessage(winner, MESSAGE_STATUS_CONSOLE_BLUE, "[ZOMBIE EVENT] Você ganhou o evento zombie.")
		 doBroadcastMessage("[ZOMBIE EVENT] Depois de " .. os.time() - getPlayerZombiesEventStatus(winner) .. " segundos de batalha " .. getCreatureName(winner) .. " ganhou o zombie event contra " .. getStorage(ZE_ZOMBIES_SPAWNED) .. " zombies! \n PREMIO: 2 days VIP, 1 potion exp, 5 Event coins.")
		 kickPlayerFromZombiesArea(winner)
	 else
		 doBroadcastMessage("[ZOMBIE EVENT] O zombie event acabou! NINGUEM GANHOU?!?!?")
	 end
	 doSetStorage(ZE_STATUS, 0)
	 doSetStorage(ZE_PLAYERS_NUMBER, ZE_DEFAULT_NUMBER_OF_PLAYERS)
	 doSetStorage(ZE_ZOMBIES_TO_SPAWN, 0)
	 doSetStorage(ZE_ZOMBIES_SPAWNED, 0)
	 local width = (math.max(ZE_spawnFromPosition.x, ZE_spawnToPosition.x) - math.min(ZE_spawnFromPosition.x, ZE_spawnToPosition.x)) / 2 + 1
	 local height = (math.max(ZE_spawnFromPosition.y, ZE_spawnToPosition.y) - math.min(ZE_spawnFromPosition.y, ZE_spawnToPosition.y)) / 2 + 1
	 local centerPos = {x=math.min(ZE_spawnFromPosition.x, ZE_spawnToPosition.x)+width,y=math.min(ZE_spawnFromPosition.y, ZE_spawnToPosition.y)+height,z=ZE_spawnFromPosition.z}
	 for z = math.min(ZE_spawnFromPosition.z, ZE_spawnToPosition.z), math.max(ZE_spawnFromPosition.z, ZE_spawnToPosition.z) do
		 centerPos.z = z
		 for i, uid in pairs(getSpectators(centerPos, width, height, false)) do
			 if(isMonster(uid)) then
				 doRemoveCreature(uid)
			 end
		 end
	 end
end
end

function onStatsChange(target, cid, changetype, combat, value)
if((cid and isMonster(cid) and getCreatureName(cid) == "Zombie Event") or (isInRange(getThingPosition(target), ZE_spawnFromPosition, ZE_spawnToPosition) and changetype == STATSCHANGE_HEALTHLOSS and math.abs(value) >= getCreatureHealth(target))) then
	 doCreatureAddHealth(target, getCreatureMaxHealth(target))
	 loseOnZombieArena(target)
	 return false
end
return true
end