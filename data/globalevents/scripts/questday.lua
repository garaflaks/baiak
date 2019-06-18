function onTime()
local storage = 20041
for _, pid in ipairs(getPlayersOnline()) do
setPlayerStorageValue(pid, storage, -1) -- reset storage from players online
end
db.executeQuery("DELETE FROM `player_storage` WHERE `key` = "..storage) -- reset player offline
return true
end