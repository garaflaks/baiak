function onUse(cid, item)

doPlayerSetSex(cid, getPlayerSex(cid) == 0 and 1 or 0)
doRemoveItem(item.uid)
doPlayerSendTextMessage(cid, 22, "Sex changed successfully! Please relogin.")
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYAREA)
doSendAnimatedText(getCreaturePosition(cid), "New sex!", TEXTCOLOR_RED)

return true
end