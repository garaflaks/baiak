local config = {
    itens = {8978, 1},          --ID do item/quantidade que deve "dar" a porta.
    time = 1,                    --Tempo, em segundos, para a porta fechar.
    storage = 90661,
}
function onUse(cid, item, fromPosition, itemEx, toPosition)
    if getPlayerStorageValue(cid, config.storage) > -1 then
        return doPlayerSendCancel(cid, "Você já passou por está porta.")
    elseif getPlayerItemCount(cid, config.itens[1]) < config.itens[2] then
        return doPlayerSendCancel(cid, "Você precisa de "..config.itens[2].." "..getItemNameById(config.itens[1]).." para abrir está porta.")
    end
    local guid, name, itemid = getPlayerGUID(cid), getCreatureName(cid), item.itemid + 1
    addEvent(function()
        item = getTileItemById(toPosition, itemid).uid
        if item > 0 then
            doItemSetAttribute(item, "aid", 24000)
            doTransformItem(item, itemid - 1)
        end
        if isPlayer(cid) then
            setPlayerStorageValue(cid, config.storage, 1)
        else
            cid = getPlayerByName(name)
            if isCreature(cid) then
                setPlayerStorageValue(cid, config.storage, 1)
            else
                db.executeQuery("UPDATE player_storage SET value = 1 WHERE key = "..config.storage.." AND player_id = "..guid)
            end
        end
    end, config.time * 1000)
    doPlayerRemoveItem(cid, config.itens[1], config.itens[2])
	local pose = getPlayerPosition(cid)
	doSendMagicEffect(pose, 40)
    doPlayerSendTextMessage(cid, 27, "Você sacrificou "..config.itens[2].." "..getItemNameById(config.itens[1]).." para abrir está porta.")
    doTransformItem(item.uid, item.itemid + 1)
    doItemSetAttribute(item.uid, "aid", 24000)
    return true
end