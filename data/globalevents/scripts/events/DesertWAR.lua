function onTime ()
	doItemSetAttribute(doCreateItem(1387, 1, {x = 142, y = 47, z = 7, stackpos = 1}), "aid", 2137)
	doBroadcastMessage("[DESERT WAR] o evento começa em 3 minutos! O teleporte vai ser fechado quando o evento começar.", MESSAGE_STATUS_WARNING)
	setGlobalStorageValue(4, 0)
	setGlobalStorageValue(5, 0)
	addEvent(startDesert, 3 * 60 * 1000)
	return true
end

function startDesert()
	doRemoveItem(getTileItemById({x = 142, y = 47, z = 7}, 1387).uid, 1)
	if getGlobalStorageValue(4) > 0 and getGlobalStorageValue(5) > 0 then
		doBroadcastMessage("[DESERT WAR] boa sorte a todos os jogadores! O teleporte foi fechado.", MESSAGE_STATUS_WARNING)		
		for _, cid in ipairs(getPlayersOnline()) do
			if getPlayerStorageValue(cid, 51) > 0 or getPlayerStorageValue(cid, 52) > 0 then
				doCreatureSetNoMove(cid, false)
			end
		end
	else
		doBroadcastMessage("[DESERT WAR] o evento não iniciou por nao possuir players suficiente.")
		for _, cid in ipairs(getPlayersOnline()) do
			if getPlayerStorageValue(cid, 51) > 0 or getPlayerStorageValue(cid, 52) > 0 then
				doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
				doCreatureSetNoMove(cid, false)
			end
		end
	end
	return true
end