local function createWalls()
	local WallID = 8539
	local Positions = {
		{8539, {x = 1027, y = 1270, z = 6}},
		{8539, {x = 1028, y = 1270, z = 6}},
		{8539, {x = 1031, y = 1272, z = 6}},
		{8539, {x = 1031, y = 1273, z = 6}},
		{8539, {x = 1031, y = 1274, z = 6}},
		{1544, {x = 1044, y = 1275, z = 7}},
		{1544, {x = 1045, y = 1275, z = 7}},
		{1544, {x = 1046, y = 1275, z = 7}},
		{1544, {x = 1047, y = 1275, z = 7}},
		{1544, {x = 1052, y = 1275, z = 7}},
		{1544, {x = 1053, y = 1275, z = 7}},
		{1544, {x = 1054, y = 1275, z = 7}},
		{1544, {x = 1055, y = 1275, z = 7}},
		{1544, {x = 1027, y = 1261, z = 7}},
		{1544, {x = 1028, y = 1261, z = 7}},
		{1544, {x = 1029, y = 1261, z = 7}},
	}
	for i = 1, #Positions do 
		if getTileItemById(Positions[i][2], Positions[i][1]).uid == 0 then
			doCreateItem(Positions[i][1], 1, Positions[i][2])
		end
	end
end

local function getDominantGuildName()
	local Name = ""
	local QueryResult = db.getResult("SELECT `id`, `guild_id`, `name` FROM `castle_war` WHERE `id` = 1 ORDER BY `id` DESC LIMIT 1")
	if (QueryResult:getID() ~= - 1) then
		Name = QueryResult:getDataString("name")
		QueryResult:free()
	end
	return Name
end

local function expulsePlayers()
	local players = {}
	if getGlobalStorageValue(49512) == 1 then
		for _, cid in pairs(getPlayersOnline()) do
			if getPlayerStorageValue(cid, 49689) == 1 then
				doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
				setPlayerStorageValue(cid, 49689, -1)
			end
		end
		doBroadcastMessage("O castle semanal acaba de ser encerrado, a guild " .. getDominantGuildName() .. " irá reinar durante 24 horas, até amanhã as 22horas! Parabéns aos vencedores!", 21)
		setGlobalStorageValue(49512, -1)
	end
	return true
end

function onTime()
	expulsePlayers()
	createWalls()
	return true
end