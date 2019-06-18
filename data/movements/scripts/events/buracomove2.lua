local topLeftPos = {x = 766, y = 606, z = 7}
local bottomRightPos = {x = 822, y = 659, z = 7}

local function resetTiles()
	local PosZ = topLeftPos.z
	for PosX = topLeftPos.x, bottomRightPos.x do 
		for PosY = topLeftPos.y, bottomRightPos.y do 
			local buraco = getTileItemById({x = PosX, y = PosY, z = PosZ}, 489)
			if buraco and buraco.uid > 0 then
				if getItemAttribute(buraco.uid, "aid") == 12821 then
					doRemoveItem(buraco.uid)
					doCreateItem(231, 1, {x = PosX, y = PosY, z = PosZ})
				end
			end
		end
	end
end

local function winnn()
	local players,str = {},""
	for _, cid in pairs(getPlayersOnline()) do
		if getPlayerStorageValue(cid, 12532) == 1 then
			table.insert(players, cid)
		end
	end
	for i = 1, #players do
		if(#players <= 1) then
			local winner = players[1]
			if(winner) then
				doPlayerAddItem(winner, 12669, 1, true)
				doPlayerAddItem(winner, 12715, 1, true)
				doPlayerAddItem(winner, 12701, 1, true)
				doPlayerAddItem(winner, 12734, 5, true)
				doPlayerSendTextMessage(winner, MESSAGE_STATUS_CONSOLE_BLUE, "[BURACO X] Você ganhou o evento buraco x.")
				doBroadcastMessage("[BURACO X] O player " .. getCreatureName(winner) .. " ganhou nosso evento exclusivo buraco x! \n Recompensa: 2 days VIP, 20kk, 1 potion exp, 10 event coins.")
				doPlayerSetStorageValue(winner, 12532,-1)
				doTeleportThing(winner, getTownTemplePosition(1))
			else
				doBroadcastMessage("[BURACO X] O evento acabou, ninguem ganhou! ninguem ganhou?!?!?! WTF!")
			end
			resetTiles()
		end
	end
end

local function kickevento(posQ)
	if getTopCreature(posQ).uid ~= 0 then
		local m = getTopCreature(posQ).uid
		doSendMagicEffect(getCreaturePos(m), 6)
		doTeleportThing(m, getTownTemplePosition(1))
		doSendMagicEffect(getCreaturePos(m), 6)
		doPlayerSetStorageValue(m, 12532,-1)
		doPlayerSendTextMessage(m, MESSAGE_STATUS_CONSOLE_BLUE, "[BURACO X] Você perdeu.")
		addEvent(winnn, 10) 
	end 
end

function onStepIn(cid, item, position, fromPosition, lastPosition)
	if isPlayer(cid) then
		local posQ = getPlayerPosition(cid)
		local buraco = doCreateItem(489, 1, lastPosition)
		doItemSetAttribute(buraco, "aid", 12821)
		addEvent(kickevento, 5000, posQ)   
		countDown(posQ, 5, 129)
	end
end