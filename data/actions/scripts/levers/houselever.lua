function onUse(cid, item, frompos, item2, topos)
	if not getHouseByPlayerGUID(getPlayerGUID(cid)) then 
		doPlayerSendTextMessage(cid,22,"You still do not have a house, buy a talking '!buyhouse' front of her.") return true
	end
	doTeleportThing(cid, getHouseEntry(getHouseByPlayerGUID(getPlayerGUID(cid)))) 
	doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	doTransformItem(item.uid, item.itemid == 9825 and 9826 or 9825)
	return true
end