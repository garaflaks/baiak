function onUse(cid, item, fromPosition, itemEx, toPosition)
local health = 1000
local mana = 1000
if getPlayerStorageValue(cid,1800) >= 1 then
doCreatureSay(cid, "Você já recebeu sua HP/MP.", TALKTYPE_ORANGE_1)
else if getPlayerLevel(cid) >= 200 then
doCreatureSay(cid, "HP/MP recebido com sucesso.", TALKTYPE_ORANGE_1)
setCreatureMaxHealth(cid, getCreatureMaxHealth(cid)+1000)
setCreatureMaxMana(cid, getCreatureMaxMana(cid)+1000)
doSendMagicEffect(fromPosition, 37)
doRemoveItem(item.uid)
setPlayerStorageValue(cid,1800,1)
return TRUE
else
doCreatureSay(cid, "Apenas players level 200 podem usar este item.", TALKTYPE_ORANGE_1)
end
end
end