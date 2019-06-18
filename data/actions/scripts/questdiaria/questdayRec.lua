function onUse(cid, item, frompos, item2, topos)
configs = {
}
	if item.uid == 20041 then
		if getPlayerStorageValue(cid,20041) == -1 then
			doPlayerSendTextMessage(cid,25,"[DAILY QUEST] Você acaba de ganhar 10kk, 2 Event coins, 1 potion exp e 1 reflect.")
			doPlayerAddItem(cid, 12715, 10)
			doPlayerAddItem(cid, 12734, 2)
			doPlayerAddItem(cid, 12701, 1)
			doPlayerAddItem(cid, 2319, 1)
			setPlayerStorageValue(cid,20041,1)
			doTeleportThing(cid, getTownTemplePosition(1))
		else
			doPlayerSendTextMessage(cid,25,"[DAILY QUEST] isto está vazio.")
			doTeleportThing(cid, getTownTemplePosition(1))
		end
	
	end
	return TRUE
end