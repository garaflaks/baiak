function onUse(cid, item, frompos, item2, topos)

function nome()
id = getPlayerGUID(cid)
doRemoveCreature(cid)
end



function free()
if getPlayerVocation(cid) == 4 or getPlayerVocation(cid) == 8 then
level = getPlayerLevel(cid)
hp = math.floor(level*20)
mana = math.floor(level*10)
setCreatureMaxHealth(cid, hp)
setCreatureMaxMana(cid, mana)
doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
doCreatureAddMana(cid, getCreatureMaxMana(cid))
end
if getPlayerVocation(cid) == 3 or getPlayerVocation(cid) == 7 then
level = getPlayerLevel(cid)
hp = math.floor(level*20)
mana = math.floor(level*20)
setCreatureMaxHealth(cid, hp)
setCreatureMaxMana(cid, mana)
doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
doCreatureAddMana(cid, getCreatureMaxMana(cid))
end
if getPlayerVocation(cid) == 1 or getPlayerVocation(cid) == 5 or getPlayerVocation(cid) == 2 or getPlayerVocation(cid) == 6 then
level = getPlayerLevel(cid)
hp = math.floor(level*10)
mana = math.floor(level*40)
setCreatureMaxHealth(cid, hp)
setCreatureMaxMana(cid, mana)
doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
doCreatureAddMana(cid, getCreatureMaxMana(cid))
end

end


if item.itemid == 12717 and vip.hasVip(cid) == TRUE then          
id = tonumber(15) or 1
vip.addVipByAccount(getPlayerAccount(cid) ,vip.getDays(id))
doPlayerSendTextMessage(cid,25,"Você recebeu "..tonumber(id).." dias de Free VIP.")
doRemoveItem(item.uid, 1)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN)
elseif item.itemid == 12717 and vip.hasVip(cid) == FALSE then
id = tonumber(15) or 1
vip.addVipByAccount(getPlayerAccount(cid) ,vip.getDays(id))
doPlayerSendTextMessage(cid,25,"Você recebeu "..tonumber(id).." dias de Free VIP.")
doRemoveItem(item.uid, 1)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN)
doPlayerSetPromotionLevel(cid, 1) 
addEvent(free, 300)
end


end