function getPlayersInRange(position, radiusx, radiusy)
	local creaturesList = {}
	for x = -radiusx, radiusx do
		for y = -radiusy, radiusy do
			if not (x == 0 and y == 0) then
				local creature = getTopCreature({x = position.x+x, y = position.y+y, z = position.z})
				if creature.type == 1 then
					table.insert(creaturesList, creature.uid)
				end
			end
		end
	end

	local creature = getTopCreature(position)
	if creature.type == 1 then
		if not(table.find(creaturesList, creature.uid)) then
			table.insert(creaturesList, creature.uid)
		end
	end
    return creaturesList
end


function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 1946 then
		return doTransformItem(item.uid, item.itemid - 1)
	end

	local v = getPlayersInRange(bomb_config.center_room, 7, 5)
	if #v > 0 then
		return doPlayerSendCancel(cid, "[BOMBERMAN] Por favor espere a partida atual terminar.")
	end

	local players = {}
	for i = 1, #bomb_config.pos_lever do
		local v = getTopCreature(bomb_config.pos_lever[i]).uid 
		players[i] = isPlayer(v) and v or nil
	end

	if #players < 2 then
		return doPlayerSendCancel(cid, "[BOMBERMAN] Você precisa de pelo menos dois jogadores para entrar.")
	end
	
	local first = players[1] and 1 or players[2] and 2 or players[3] and 3 or players[4] and 4
	for i = 1, 4 do
		if players[i] then
			setPlayerStorageValue(players[i], bomb_config.storage.placed, 0)
			setPlayerStorageValue(players[i], bomb_config.storage.max, 1)
			setPlayerStorageValue(players[i], bomb_config.storage.radius, 1)
			doSendMagicEffect(bomb_config.pos_lever[i], CONST_ME_TELEPORT)
			doTeleportThing(players[i], bomb_config.go_lever[i])
			doSendMagicEffect(bomb_config.go_lever[i], CONST_ME_TELEPORT)
		end
	end

	doTransformItem(item.uid, item.itemid + 1)
	return true
end