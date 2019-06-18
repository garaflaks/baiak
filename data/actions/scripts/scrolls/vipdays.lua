local vipdays = 10

function onUse(cid, item)

doAddVipDays(cid, vipdays)
doRemoveItem(item.uid)
doPlayerSendTextMessage(cid, 22, "Gratz! You earned 10 vip days!")
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYAREA)
doSendAnimatedText(getCreaturePosition(cid), "Vip Days!", TEXTCOLOR_RED)

return true
end