function onStepIn(cid, item, position, fromPosition)
if getCreatureStorage(cid, 52356) == 1 then
    return true
end

local n = getCreatureName(cid)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
setPlayerStorageValue(cid, 52356, 1)
broadcastMessage("O player [" .. n .. "] conseguiu completar a promotion quest.", MESSAGE_STATUS_WARNING)
return true
end