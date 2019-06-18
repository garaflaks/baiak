local points = 10

function onUse(cid, item)

doAddPoints(cid, points)
doRemoveItem(item.uid)
doPlayerSendTextMessage(cid, 22, "Gratz! You earned 10 points!")
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYAREA)
doSendAnimatedText(getCreaturePosition(cid), "Points!", TEXTCOLOR_RED)

return true
end