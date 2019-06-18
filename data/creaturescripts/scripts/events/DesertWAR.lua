function onCombat(cid, target)
	if isPlayer(cid) and isPlayer(target) then
		if getPlayerStorageValue(cid, 51) == 1 and getPlayerStorageValue(target, 51) == 1 or getPlayerStorageValue(cid, 52) == 1 and getPlayerStorageValue(target, 52) == 1 or getPlayerStorageValue(cid, 71) == 1 and getPlayerStorageValue(target, 71) == 1 or getPlayerStorageValue(cid, 72) == 1 and getPlayerStorageValue(target, 72) == 1 then
			doPlayerSendCancel(cid, "[DESERT WAR] você não pode atacar jogadores do seu time!")
			return false			
		end
	end
	return true
end

function onPrepareDeath(cid, deathList, lastHitKiller, mostDamageKiller)
	if getPlayerStorageValue(cid, 51) == 1 then
		if getGlobalStorageValue(4) > 1 then
			setPlayerStorageValue(cid, 51, 0)
			setGlobalStorageValue(4, getGlobalStorageValue(4)-1)
			doRemoveCondition(cid, CONDITION_OUTFIT)
			doItemSetAttribute(doCreateItem(3058, 1, getPlayerPosition(cid)), "description", "You recognize " .. getCreatureName(cid) .. ". He was killed by Black Assassins team.")
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "[DESERT WAR] Você Morreu!")
		doPlayerSave(cid)
			for _, pid in ipairs(getPlayersOnline()) do
					if getPlayerStorageValue(pid, 51) == 1 or getPlayerStorageValue(pid, 52) == 1 then
						doPlayerSendTextMessage(pid, 18, "[DESERT WAR] Players restante: ".. getGlobalStorageValue(5) .." Black Assassins X ".. getGlobalStorageValue(4) .." Red Barbarians")
					end
				end
		else
			setPlayerStorageValue(cid, 51, 0)
			setGlobalStorageValue(4, getGlobalStorageValue(4)-1)
			doRemoveCondition(cid, CONDITION_OUTFIT)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "[DESERT WAR] Você foi o último sobrevivente do time perdedor e também ganhou recompensa!")
			doPlayerAddItem(cid,12715,1)
			doPlayerAddItem(cid,12734,5)
			doBroadcastMessage("".. getGlobalStorageValue(5) .."[DESERT WAR] Players do Black Assassins team sobreviveram ao evento e obteram a recompensa de 10 Event Coins e 10kk!")
			setGlobalStorageValue(5, getGlobalStorageValue(5)-1)
		doPlayerSave(cid)
			for _, cid in ipairs(getPlayersOnline()) do
				if getPlayerStorageValue(cid, 52) > 0 then
					setPlayerStorageValue(cid, 52, 0)
					doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
					doPlayerAddItem(cid,12715,10)
					doPlayerAddItem(cid,12734,10)
					doRemoveCondition(cid, CONDITION_OUTFIT)
		doPlayerSave(cid)
				end
			end
		end
	elseif getPlayerStorageValue(cid, 52) == 1 then
		if getGlobalStorageValue(5) > 1 then
			setPlayerStorageValue(cid, 52, 0)
			setGlobalStorageValue(5, getGlobalStorageValue(5)-1)
			doRemoveCondition(cid, CONDITION_OUTFIT)
			doItemSetAttribute(doCreateItem(3058, 1, getPlayerPosition(cid)), "description", "You recognize " .. getCreatureName(cid) .. ". He was killed by Red Barbarians team.")
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "[DESERT WAR] Você Morreu!")
		doPlayerSave(cid)
			for _, pid in ipairs(getPlayersOnline()) do
					if getPlayerStorageValue(pid, 51) == 1 or getPlayerStorageValue(pid, 52) == 1 then
						doPlayerSendTextMessage(pid, 18, "[DESERT WAR] Players restantes: ".. getGlobalStorageValue(5) .." Black Assassins X ".. getGlobalStorageValue(4) .." Red Barbarians")
					end
				end
		else
			setPlayerStorageValue(cid, 52, 0)
			setGlobalStorageValue(5, getGlobalStorageValue(5)-1)
			doRemoveCondition(cid, CONDITION_OUTFIT)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "[DESERT WAR] Você foi o último sobrevivente do time perdedor e também ganhou recompensa!")
			doPlayerAddItem(cid,12715,5)
			doPlayerAddItem(cid,12734,5)
			doBroadcastMessage("".. getGlobalStorageValue(4).."[DESERT WAR] Players do Red Barbarians team sobreviveram ao evento e obteram a recompensa de 10 Event Coins e 10KK!")
			setGlobalStorageValue(4, getGlobalStorageValue(4)-1)
		doPlayerSave(cid)
			for _, cid in ipairs(getPlayersOnline()) do
				if getPlayerStorageValue(cid, 51) > 0 then
					setPlayerStorageValue(cid, 51, 0)
					doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
					doPlayerAddItem(cid,12715,10)
					doPlayerAddItem(cid,12734,10)
					doRemoveCondition(cid, CONDITION_OUTFIT)
		doPlayerSave(cid)
				end
			end
		end
	end
	return true
end