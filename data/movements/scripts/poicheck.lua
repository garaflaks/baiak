local storage = 10543

function onStepIn(cid, item, position, fromPosition)
if getPlayerStorageValue(cid, storage) <= 0 then
setPlayerStorageValue(cid, storage, 1)
return true
end
end