local config = {
    price = 20,  -- Quantidade de items necess�rio para comprar.
    count = 1,  -- Quantidade que ir� vender.
    item = 12737, -- ID do item que vai vender.
    need = 12734  -- ID do item necess�rio.
}

function onUse(cid, item)
    local pos = getCreaturePosition(cid)
    if item.itemid == 10044 then
        if doPlayerRemoveItem(cid, config.need, config.price) then
            doPlayerAddItem(cid, config.item, config.count)
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Voc� acaba de comprar "..config.count.." "..getItemNameById(config.item)..".")
            doSendMagicEffect(pos, CONST_ME_MAGIC_BLUE)
        else
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Sorry. You need 20 event coins to buy it.")
            doSendMagicEffect(pos, CONST_ME_POFF)
        end
     end
   return true
end