local Configs = {
	['22:25'] = {'[Castle War] A guild %s esta dominando e o castle acaba em 35 minutos.', MESSAGE_STATUS_WARNING},
	['22:55'] = {'[Castle War] A guild %s esta dominando e o castle acaba em 5 minutos.', MESSAGE_STATUS_WARNING},
}

local function getDominantGuildName()
	local Name = ""
	local QueryResult = db.getResult("SELECT `id`, `guild_id`, `name` FROM `castle_war` WHERE `id` = 1 ORDER BY `id` DESC LIMIT 1")
	if (QueryResult:getID() ~= - 1) then
		Name = QueryResult:getDataString("name")
		QueryResult:free()
	end
	return Name
end

function onThink(interval, lastExecution)
	local Message = Configs[os.date('%X'):sub(1, 5)]
	return Message and doBroadcastMessage(string.format(Message[1], getDominantGuildName()), Message[2]) or true
end