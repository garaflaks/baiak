function onUse(cid, item, frompos, item2, topos)
doPlayerAddPremiumDays(cid,90) 
doRemoveItem(item.uid, 1)
doPlayerSendTextMessage(cid,22,"90 days of premium [VIP]!")
doSendAnimatedText(getThingPos(cid), "Premium!", math.random(1, 255))
end