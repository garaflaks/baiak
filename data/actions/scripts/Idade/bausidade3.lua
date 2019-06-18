function onUse(cid, item, frompos, item2, topos)
local posicEx = {x=1001, y=432, z=7}

	if item.uid == 6827 then
		if getPlayerStorageValue(cid,6827) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a 2 Double Exp Potion and 4 Reflect.")
			doPlayerAddItem(cid,12701,1)
			setPlayerStorageValue(cid,6827,1)
			 doTeleportThing(cid, posicEx, true)
		else
			doPlayerSendTextMessage(cid,25,"This is empty.")
			 doTeleportThing(cid, posicEx, true)
		end
	



		elseif item.uid == 6828 then
		if getPlayerStorageValue(cid,6828) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a 1 Vip Ring.")
			doPlayerAddItem(cid,12726,1)
			setPlayerStorageValue(cid,6828,1)
			 doTeleportThing(cid, posicEx, true)
		else
			doPlayerSendTextMessage(cid,25,"This is empty.")
			 doTeleportThing(cid, posicEx, true)
		end
	
	end
end