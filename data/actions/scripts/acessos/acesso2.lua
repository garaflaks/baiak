function onUse(cid, item, fromPosition, itemEx, toPosition)

local config={
removeOnUse = "yes" -- remover quando usar ("yes" or "no")
}

local storageplayer = getPlayerStorageValue(cid, 17541)

doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Acesso 2 ativado.")
setPlayerStorageValue(cid, 17541, 1)
doSendMagicEffect(getPlayerPosition(cid), math.random(28,30))
if (config.removeOnUse == "yes") then
doRemoveItem(item.uid, 1)
end

return TRUE
end