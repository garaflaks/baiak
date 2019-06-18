local config = {
stamina = 2520, -- Stamina do player ao usar o item, 2520 = Full stamina!
ti = 1*60, -- Tempo para usar em horas.
}
 
function onUse(cid, item, fromPos, itemEx, toPos)
 
local st = 25090

if getPlayerStamina(cid) >= config.stamina then
return doPlayerSendTextMessage(cid, 25, "Your stamina is already full.")
end

if getPlayerStorageValue(cid, st) > os.time() then
doPlayerSendTextMessage(cid, 25, "You need wait " .. getPlayerStorageValue(cid, st) - os.time() .. ' second' .. (getPlayerStorageValue(cid, st) - os.time() == 1 and "" or "s") .. " to use this item again.")
return true
else
doPlayerSetStamina(cid, config.stamina)
doRemoveItem(item.uid, 1)
setPlayerStorageValue(cid, st, os.time() + config.ti)
return true
end
return true
end