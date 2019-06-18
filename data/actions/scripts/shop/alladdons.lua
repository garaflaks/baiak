function onUse(cid, item, fromPosition, itemEx, toPosition)

if getPlayerStorageValue(cid,1820) >= 1 then
doCreatureSay(cid, "Você já recebeu seus addons.", TALKTYPE_ORANGE_1)
else if getPlayerLevel(cid) >= 20 then
doCreatureSay(cid, "Você recebeu todas as addons full!", TALKTYPE_ORANGE_1)
doPlayerAddAddons(cid, 3)
doSendMagicEffect(fromPosition, 37)
doRemoveItem(item.uid)
setPlayerStorageValue(cid,1820,1)
return TRUE
else
doCreatureSay(cid, "Apenas players level 20 podem usar este item.", TALKTYPE_ORANGE_1)
end
end
end