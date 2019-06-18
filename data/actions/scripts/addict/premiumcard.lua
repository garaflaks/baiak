function onUse(cid, item, frompos, item2, topos)
doPlayerAddPremiumDays(cid,15) 
doRemoveItem(item.uid, 1)
doPlayerSendTextMessage(cid,22,"15 dias de premium adicionados!")
doSendAnimatedText(getThingPos(cid), "Premium!", math.random(1, 255))
end