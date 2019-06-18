function onUse(cid, item, frompos, item2, topos)
doPlayerAddPremiumDays(cid,30) 
doRemoveItem(item.uid, 1)
doPlayerSendTextMessage(cid,22,"30 days of premium [VIP]!")
doSendAnimatedText(getThingPos(cid), "Premium!", math.random(1, 255))
end