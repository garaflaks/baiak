function onUse(cid, item, frompos, item2, topos)

local poss = getCreaturePosition(cid)

	if item.uid == 7604 then
		if getPlayerStorageValue(cid,7604) == -1 then
			doSendMagicEffect(poss, 13)
			doSendMagicEffect(frompos, 13)
        		doSendAnimatedText(poss, "TEMPLE", math.random(TEXTCOLOR_RED, TEXTCOLOR_RED))
			setPlayerStorageValue(cid,7604,1)
			setPlayerStorageValue(cid, 8600, getPlayerStorageValue(cid, 8600)+1)
		else
			doPlayerSendTextMessage(cid,25,"[NEW OUTFIT] Você ja conseguiu está estatua.")
			doSendMagicEffect(frompos, 2)
		end
		end

	if item.uid == 7605 then
		if getPlayerStorageValue(cid,7605) == -1 then
			doSendMagicEffect(poss, 13)
			doSendMagicEffect(frompos, 13)
        		doSendAnimatedText(poss, "ELITE", math.random(TEXTCOLOR_RED, TEXTCOLOR_RED))
			setPlayerStorageValue(cid, 8600, getPlayerStorageValue(cid, 8600)+1)
			setPlayerStorageValue(cid,7605,1)
		else
			doPlayerSendTextMessage(cid,25,"[NEW OUTFIT] Você ja conseguiu está estatua.")
			doSendMagicEffect(frompos, 2)
		end
	
	end

	if item.uid == 7606 then
		if getPlayerStorageValue(cid,7606) == -1 then
			doSendMagicEffect(poss, 13)
			doSendMagicEffect(frompos, 13)
        		doSendAnimatedText(poss, "PROMOTION", math.random(TEXTCOLOR_RED, TEXTCOLOR_RED))
			setPlayerStorageValue(cid, 8600, getPlayerStorageValue(cid, 8600)+1)
			setPlayerStorageValue(cid,7606,1)
		else
			doPlayerSendTextMessage(cid,25,"[NEW OUTFIT] Você ja conseguiu está estatua.")
			doSendMagicEffect(frompos, 2)
		end
	
	end





	return true
end