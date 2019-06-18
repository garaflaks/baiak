local function getDominantGuildName()
    local Name = ""
    local QueryResult = db.getResult("SELECT `id`, `guild_id`, `name` FROM `castle_war` WHERE `id` = 1 ORDER BY `id` DESC LIMIT 1")
    if (QueryResult:getID() ~= - 1) then
        Name = QueryResult:getDataString("name")
        QueryResult:free()
    end
    return Name
end

function onStartup()
    setGlobalStorageValue(133133, getDominantGuildName())
    return true
end