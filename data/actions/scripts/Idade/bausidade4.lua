function onUse(cid, item, frompos, item2, topos)
local posicEx = {x=1001, y=432, z=7}

	if item.uid == 6829 then
		if getPlayerStorageValue(cid,6829) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a 4 Premium Points.")
			doPlayerAddItem(cid,12730,4)
			setPlayerStorageValue(cid,6829,1)
			 doTeleportThing(cid, posicEx, true)
		else
			doPlayerSendTextMessage(cid,25,"This is empty.")
			 doTeleportThing(cid, posicEx, true)
		end
	

	elseif item.uid == 6830 then
		if getPlayerStorageValue(cid,6830) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Vip Amulet.")
			doPlayerAddItem(cid,12728,1)
			setPlayerStorageValue(cid,6830,1)
			 doTeleportThing(cid, posicEx, true)
		else
			doPlayerSendTextMessage(cid,25,"This is empty.")
			 doTeleportThing(cid, posicEx, true)
		end
	
	end
end