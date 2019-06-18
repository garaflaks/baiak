local config = {
        lottery_hour = "ALGUMAS HORAS", -- Tempo ate a proxima loteria (Esse tempo vai aparecer somente como broadcast message)
        rewards_id = {5958}, -- ID dos Itens Sorteados na Loteria
        crystal_counts = 0, -- Usado somente se a rewards_id for crystal coin (ID: 2160).
        website = "yes", -- Only if you have php scripts and table `lottery` in your database!
        days = {
                "Monday-08:00",
				"Monday-14:00",
				"Monday-18:00",
				"Monday-21:00",
				"Monday-00:00",          

                "Tuesday-08:00",
				"Tuesday-14:00",
				"Tuesday-18:00",
				"Tuesday-22:00",
				"Tuesday-00:00",

                "Wednesday-08:00",
                "Wednesday-14:00",
				"Wednesday-18:00",
				"Wednesday-21:00",
				"Wednesday-00:00",
				
                "Thursday-08:00",
                "Thursday-14:00",
				"Thursday-18:00",
				"Thursday-21:00",
				"Thursday-00:00",

                "Friday-08:00",
                "Friday-14:00",
				"Friday-18:00",
				"Friday-21:00",
				"Friday-00:00",

                "Saturday-10:00",
                "Saturday-14:00",
				"Saturday-18:00",
				"Saturday-21:00",
				"Saturday-00:00",

                "Sunday-07:00",
				"Sunday-10:00",
                "Sunday-14:00",
				"Sunday-18:00",
				"Sunday-21:00",
				"Sunday-00:00"
                }
        }
local function getPlayerWorldId(cid)
    if not(isPlayer(cid)) then
        return false
    end
    local pid = getPlayerGUID(cid)
    local worldPlayer = 0
    local result_plr = db.getResult("SELECT * FROM `players` WHERE `id` = "..pid..";")
    if(result_plr:getID() ~= -1) then
        worldPlayer = tonumber(result_plr:getDataInt("world_id"))
        result_plr:free()
        return worldPlayer
    end
    return false
end

local function getOnlineParticipants()
    local players = {}
    for _, pid in pairs(getPlayersOnline()) do
        if getPlayerAccess(pid) <= 2 and getPlayerStorageValue(pid, 281821) <= os.time() then
            table.insert(players, pid)
        end
    end
    if #players > 0 then
        return players
    end
    return false
end
     
function onThink(cid, interval)
    if table.find(config.days, os.date("%A-%H:%M")) then
        if(getWorldCreatures(o) <= 0)then
            return true
        end

        local query = db.query or db.executeQuery
        local random_item = config.rewards_id[math.random(1, #config.rewards_id)]
        local item_name = getItemNameById(random_item)  
        local data = os.date("%d/%m/%Y - %H:%M:%S")
        local online = getOnlineParticipants()
       
        if online then
            local winner = online[math.random(1, #online)]
            local world = tonumber(getPlayerWorldId(winner))
           
            if(random_item == 2160) then
                doPlayerSetStorageValue(winner, 281821, os.time() + 3600 * 24)
                doPlayerAddItem(winner, random_item, config.crystal_counts)
                doBroadcastMessage("[LOTTERY SYSTEM] GANHADOR: " .. getCreatureName(winner) .. ", PREMIO: " .. config.crystal_counts .." " .. getItemNameById(random_item) .. "s! PARABENS! (PROXIMA LOTERIA EM: " .. config.lottery_hour .. ")")
            else
                doPlayerSetStorageValue(winner, 281821, os.time() + 3600 * 24)
                doBroadcastMessage("[LOTTERY SYSTEM] GANHADOR: " .. getCreatureName(winner) .. ", PREMIO: " ..getItemNameById(random_item) .. "! PARABENS! (PROXIMA LOTERIA EM: " .. config.lottery_hour .. ")")
                doPlayerAddItem(winner, random_item, 1)
            end
            if(config.website == "yes") then
                query("INSERT INTO `lottery` (`name`, `item`, `world_id`, `item_name`, `date`) VALUES ('".. getCreatureName(winner).."', '".. random_item .."', '".. world .."', '".. item_name .."', '".. data .."');")
            end
        else
            print("Ninguem OnLine pra ganhar na loteria")
        end
    end
    return true
end