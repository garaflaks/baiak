local config = {

money = 25000000, -- Dinheiro que vai custar
item = 12735, -- ID do item que vai vender
count = 1, -- Quantidade
}


function onUse(cid, item, fromPosition, itemEx, toPosition)
pos = getCreaturePosition(cid)
if item.itemid == 10044 then
 if doPlayerRemoveMoney(cid, config.money) == TRUE then
doPlayerAddItem(cid, config.item, config.count)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Voc� acaba de comprar "..config.count.." "..getItemNameById(config.item)..".")
doSendMagicEffect(pos, CONST_ME_MAGIC_BLUE)
 else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Sorry. You need 25 KK's to buy it.")
doSendMagicEffect(pos, CONST_ME_POFF)
end
end
end