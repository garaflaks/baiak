function onUse(cid, item, frompos, item2, topos)

local posicEx = {x=1001, y=432, z=7}

	if item.uid == 6825 then
		if getPlayerStorageValue(cid,6825) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a 6 Reflects.")
			doPlayerAddItem(cid,2319,1)
			doPlayerAddItem(cid,2319,1)
			setPlayerStorageValue(cid,6825,1)
			 doTeleportThing(cid, posicEx, true)
		else
			doPlayerSendTextMessage(cid,25,"This is empty.")
			 doTeleportThing(cid, posicEx, true)
		end
	

	elseif item.uid == 6826 then
		if getPlayerStorageValue(cid,6826) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a 5 Evevent Coins, 2 Dias VIP, 1 Stamina Refiler and 1 Cave Exclusiva.")
			doPlayerAddItem(cid,12734,5)
			doPlayerAddItem(cid,12669,1)
			doPlayerAddItem(cid,12544,1)
			doPlayerAddItem(cid,12759,1)
			setPlayerStorageValue(cid,6826,1)
			 doTeleportThing(cid, posicEx, true)
		else
			doPlayerSendTextMessage(cid,25,"This is empty.")
			 doTeleportThing(cid, posicEx, true)
		end
	
	end
end
