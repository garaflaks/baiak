function onUse(cid, item, frompos, item2, topos)

local posicEx = {x=1001, y=432, z=7}

	if item.uid == 6823 then
		if getPlayerStorageValue(cid,6823) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a 2kk's, 2 PotionsExp, 2 Critical Feathers and 2 Dodge Stone.")
			doPlayerAddItem(cid,12715,2)
			doPlayerAddItem(cid,12711,2)
			doPlayerAddItem(cid,12713,2)
			doPlayerAddItem(cid,12718,2)
			setPlayerStorageValue(cid,6823,1)
			 doTeleportThing(cid, posicEx, true)
		else
			doPlayerSendTextMessage(cid,25,"This is empty.")
			 doTeleportThing(cid, posicEx, true)
		end

	elseif item.uid == 6824 then
		if getPlayerStorageValue(cid,6824) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a 5 Critical Feathers and 5 dodge.")
			doPlayerAddItem(cid,12713,5)
			doPlayerAddItem(cid,12718,5)
			setPlayerStorageValue(cid,6824,1)
			 doTeleportThing(cid, posicEx, true)
		else
			doPlayerSendTextMessage(cid,25,"This is empty.")
			 doTeleportThing(cid, posicEx, true)
		end
	
	end
	return TRUE
end