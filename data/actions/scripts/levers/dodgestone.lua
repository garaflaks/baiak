local config = {

money = 20000000, -- Dinheiro que vai custar
item = 12718, -- ID do item que vai vender
count = 1, -- Quantidade
}


function onUse(cid, item, fromPosition, itemEx, toPosition)
pos = getCreaturePosition(cid)
if item.itemid == 9825 then
 if doPlayerRemoveMoney(cid, config.money) == TRUE then
doPlayerAddItem(cid, config.item, config.count)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Voc� acaba de comprar "..config.count.." "..getItemNameById(config.item)..".")
doSendMagicEffect(pos, CONST_ME_MAGIC_BLUE)
 else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Sorry. You need 20KK's to buy a Dodge.")
doSendMagicEffect(pos, CONST_ME_POFF)
end
end
end