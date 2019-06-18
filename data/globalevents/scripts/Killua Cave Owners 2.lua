local function filtrateString(str)
	if type(str) ~= "string" then
		return false
	end
	local first, last = 0, 0
	local second, final = 0, #str
	for i = 1, #str do
		if string.byte(str:sub(i,i)) == string.byte('a') then
			first = i + 2
			for t = first, #str do
				if string.byte(str:sub(t,t)) == string.byte(' ') then
					last = t - 1
					break
				end
			end
		end
		if string.byte(str:sub(i,i)) == string.byte('b') then
			second = i + 2
		end
	end
	return {str:sub(first, last), str:sub(second, final)}
end

local f1, t1 = {x = 943, y = 2174, z = 7}, {x = 1100, y = 2296, z = 7}
local f2, t2 = {x = 1186, y = 2225, z = 7}, {x = 1334, y = 2352, z = 7}
local f3, t3 = {x = 1390, y = 2205, z = 7}, {x = 1496, y = 2265, z = 7}
local f4, t4 = {x = 1588, y = 2222, z = 7}, {x = 1664, y = 2320, z = 7}
local f5, t5 = {x = 1725, y = 2241, z = 7}, {x = 1802, y = 2354, z = 7}

function onThink(interval, lastExecution)
	local first = getPlayersInArea(f1, t1)
	local second = getPlayersInArea(f2, t2)
	local third = getPlayersInArea(f3, t3)
	local fourth = getPlayersInArea(f4, t4)
	local fifth = getPlayersInArea(f5, t5)
	
	if first then
		for _, pid in pairs(first) do
			if getPlayerAccountId(pid) ~= tonumber(filtrateString(getGlobalStorageValue(822081))[1]) or getPlayerAccountId(pid) == tonumber(filtrateString(getGlobalStorageValue(822081))[1]) and tonumber(filtrateString(getGlobalStorageValue(822081))[2]) <= os.time() then
				doTeleportThing(pid, getTownTemplePosition(getPlayerTown(pid)))
				doPlayerPopupFYI(pid, "Seu tempo como dono da Cave 1 expirou. Você foi levado até seu templo.")
			end
		end
	end
	if second then
		for _, pid in pairs(second) do
    			if getPlayerAccountId(pid) ~= tonumber(filtrateString(getGlobalStorageValue(822082))[1]) or getPlayerAccountId(pid) == tonumber(filtrateString(getGlobalStorageValue(822082))[1]) and tonumber(filtrateString(getGlobalStorageValue(822082))[2]) <= os.time()	then
        	doTeleportThing(pid, getTownTemplePosition(getPlayerTown(pid)))
				doPlayerPopupFYI(pid, "Seu tempo como dono da Cave 2 expirou. Você foi levado até seu templo.")
			end
		end
	end
	if third then
		for _, pid in pairs(third) do
    			if getPlayerAccountId(pid) ~= tonumber(filtrateString(getGlobalStorageValue(822083))[1]) or getPlayerAccountId(pid) == tonumber(filtrateString(getGlobalStorageValue(822083))[1]) and tonumber(filtrateString(getGlobalStorageValue(822083))[2]) <= os.time() then
        				doTeleportThing(pid, getTownTemplePosition(getPlayerTown(pid)))
				doPlayerPopupFYI(pid, "Seu tempo como dono da Cave 3 expirou. Você foi levado até seu templo.")
			end
		end
	end
	if fourth then
		for _, pid in pairs(fourth) do
    			if getPlayerAccountId(pid) ~= tonumber(filtrateString(getGlobalStorageValue(822084))[1]) or getPlayerAccountId(pid) == tonumber(filtrateString(getGlobalStorageValue(822084))[1]) and tonumber(filtrateString(getGlobalStorageValue(822084))[2]) <= os.time() then
				doTeleportThing(pid, getTownTemplePosition(getPlayerTown(pid)))
				doPlayerPopupFYI(pid, "Seu tempo como dono da Cave 4 expirou. Você foi levado até seu templo.")
			end
		end
	end
	if fifth then
		for _, pid in pairs(fifth) do
    			if getPlayerAccountId(pid) ~= tonumber(filtrateString(getGlobalStorageValue(822085))[1]) or getPlayerAccountId(pid) == tonumber(filtrateString(getGlobalStorageValue(822085))[1]) and tonumber(filtrateString(getGlobalStorageValue(822085))[2]) <= os.time() then
				doTeleportThing(pid, getTownTemplePosition(getPlayerTown(pid)))
				doPlayerPopupFYI(pid, "Seu tempo como dono da Cave 5 expirou. Você foi levado até seu templo.")
			end
		end
	end




	return true
end