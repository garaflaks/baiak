local Configs = {
	Days = {
		["Monday"] = {
			["21:59"] = {players = 2},
		},
		["Tuesday"] = {
			["21:59"] = {players = 2},
		},
		["Wednesday"] = {
			["21:59"] = {players = 2},
		},
		["Thursday"] = {
			["21:59"] = {players = 2},
		},
		["Friday"] = {
			["21:59"] = {players = 2},
		},
		["Saturday"] = {
			["21:59"] = {players = 2},
		},
		["Sunday"] = {
			["21:59"] = {players = 2},
		},
	},
	Crystals = {
		{"First Crystal", {x = 1048, y = 1276, z = 7}},
		{"Second Crystal", {x = 1028, y = 1260, z = 7}},
		{"Third Crystal", {x = 1029, y = 1272, z = 6}},
		{"Rei", {x = 1043, y = 1248, z = 6}},
	}
}

local function checkCrystalExist(Position)
	local Monster = getTopCreature(Position).uid
	if isMonster(Monster) then
		return true
	end
	return false
end

local function CreateCrystals()
	for i = 1, #Configs.Crystals do 
		if not checkCrystalExist(Configs.Crystals[i][2]) then
			doCreateMonster(Configs.Crystals[i][1], Configs.Crystals[i][2], false, true)
		end
	end
end

function onThink(interval, lastExecution)
	if Configs.Days[os.date("%A")] then
		hours = tostring(os.date("%X")):sub(1, 5)
		tb = Configs.Days[os.date("%A")][hours]
		if tb and (tb.players % 2 == 0) then
			setGlobalStorageValue(49512, 1)
			doBroadcastMessage("O castle semanal acaba de ser aberto, entre no teleport CastleWar e participe, o mesmo se encerrará em 1 hora, conquiste o trono!", MESSAGE_STATUS_WARNING) 
			doBroadcastMessage("Para ganhar o castle war semanal, você ou alguem de sua guild deverá subir na poutrona do rei localizada ao nordeste do mapa, primeiramente derrote os crystais!", MESSAGE_STATUS_WARNING) 
			CreateCrystals() 
		end
	end
	return true
end