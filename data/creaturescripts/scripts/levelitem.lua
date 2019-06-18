function onAdvance(cid, skill, oldLevel, newLevel)

local config = {
[100] = {item = 2160, count = 10},
[200] = {item = 2160, count = 15},
[400] = {item = 2160, count = 40},
[500] = {item = 12715, count = 2},
}

if skill == 8 then
for level, info in pairs(config) do
if newLevel >= level and (getPlayerStorageValue(cid, 30700) == -1 or not (string.find(getPlayerStorageValue(cid, 30700), "'" .. level .. "'"))) then
doPlayerAddItem(cid, info.item, info.count)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Parabéns, você atingiu o level "..newLevel.." e ganhou "..info.count.." "..getItemNameById(info.item)..".")
local sat = getPlayerStorageValue(cid, 30700) == -1 and "Values: '" .. level .. "'" or getPlayerStorageValue(cid, 30700) .. ",'" .. level .. "'" 
setPlayerStorageValue(cid, 30700, sat)
end
end
end

return TRUE
end