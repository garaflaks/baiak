battlefield = {
	Time_To_Start_Event = 3, -- Tempo em minutos
	TeleportAID = 45000,
	Min_Players = 2,
	Max_Players = 40,
	storage = 201206300801,
	storage2 = 201206300802,
	tpPos = {x=283, y=225, z=8},
    pos_team_1 = {x=2159,y=557,z=7},
    pos_team_2 = {x=2192,y=556,z=7},
	spectors = {{x=2167,y=549,z=6},{x=2167,y=564,z=6},{x=2183,y=549,z=6},{x=2183,y=563,z=6}},
	team1Name = "Black Assassins",
    team2Name = "Red Barbarians",	
}

function doBroadCastBattle(type,msg)
	for _, cid in pairs(getPlayersOnline()) do
		if getPlayerStorageValue(cid, battlefield.storage2) ~= -1 then
			doPlayerSendTextMessage(cid,type,msg) 
		end 
	end
	return true 
end

function removeTp()
	local t = getTileItemById(battlefield.tpPos, 1387)
	if t then
		doRemoveItem(t.uid, 1)
		doSendMagicEffect(battlefield.tpPos, CONST_ME_POFF)
	end
end

function startBattlefield()
	if getGlobalStorageValue(battlefield.storage) ~= 0 then
		removeTp()
		if (battlefield.Max_Players - getGlobalStorageValue(battlefield.storage)) >= battlefield.Min_Players then
			doBroadcastMessage("[BATTLEFIELD] o evento vai começar em 1 mintuo, crie sua estrategia.")
			addEvent(doBroadcastMessage, 60 * 1000, "[BATTLEFIELD] o evento começou.")
			addEvent(OpenWallBattle, 60 * 1000)
		else
			doBroadcastMessage("[BATTLEFIELD] o evento não começou por falta de players.")
			for _, cid in pairs(getPlayersOnline()) do
				if getPlayerStorageValue(cid, battlefield.storage2) ~= -1 then 
					setPlayerStorageValue(cid, battlefield.storage2, -1)
					doRemoveCondition(cid, CONDITION_OUTFIT)
					doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
				end
			end
		end
	end
end

function OpenWallBattle()
	local x = true
	local B  = { 
		[1] = {1056,{x=2175, y=555, z=6, stackpos = 1}},   
		[2] = {1056,{x=2175, y=556, z=6, stackpos = 1}},
		[3] = {1056,{x=2175, y=557, z=6, stackpos = 1}},
		[4] = {1056,{x=2175, y=558, z=6, stackpos = 1}}   
		} 

	for i = 1, #B do
		if getTileItemById(B[i][2], B[i][1]).uid == 0 then 
			x = false 
		end
		if x == true then
			doRemoveItem(getThingfromPos(B[i][2]).uid,1)
		else
			doCreateItem(B[i][1], 1, B[i][2]) 
		end
	end
end

function getWinnersBattle(storage)
	local team = storage == 1 and battlefield.team1Name or battlefield.team2Name
	doBroadcastMessage("Jogadores do time ".. team .." ganharam o battlefield, eles receberão uma Master Surprise Bag.")
	setGlobalStorageValue(battlefield.storage, -1)
	removeTp()
	OpenWallBattle()
	for _, cid in pairs(getPlayersOnline()) do
		if getPlayerStorageValue(cid, battlefield.storage2) ~= -1 then 
			doRemoveCondition(cid, CONDITION_OUTFIT)
			doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
			if getPlayerStorageValue(cid, battlefield.storage2) == storage then
				doPlayerAddItem(cid,6571,1)
				doPlayerAddItem(cid,12715,1)
				doPlayerAddItem(cid,12701,1)
				doPlayerAddItem(cid,12701,1)
			end
			setPlayerStorageValue(cid, battlefield.storage2, -1)
		end
	end
end