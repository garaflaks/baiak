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

function isPositionInArray(haystack, needle)
	for i = 1, #haystack do
		if haystack[i].x == needle.x and haystack[i].y == needle.y and haystack[i].z == needle.z then
			return true
		end
	end
	return false
end

function reset()
	local dummy = doCreateItem(10570, 1, bomb_config.center_room)
	for x = bomb_config.from.x, bomb_config.to.x do
		for y = bomb_config.from.y, bomb_config.to.y do
			local pos = {x=x,y=y,z=bomb_config.from.z}
			local i1, i2, i3  = getTileItemById(pos, 8304).uid, getTileItemById(pos, 8306).uid, getTileItemById(pos, 8310).uid
			if i1 > 0 then
				doRemoveItem(i1)
			end
			if i2 > 0 then
				doRemoveItem(i2)
			end
			if i3 > 0 then
				doRemoveItem(i3)
			end
			if queryTileAddThing(dummy, pos, 4) == RETURNVALUE_NOERROR and not isPositionInArray(bomb_config.exceptions, pos) then
				doCreateItem(bomb_config.blockID, 1, pos)
			end
		end
	end
	doRemoveItem(dummy)
end

local function boom(pos, cid)
	local v = getTileItemById(pos, bomb_config.bombID).uid
	if isPlayer(cid) and isInRange(getThingPos(cid), bomb_config.from, bomb_config.to) then
		setPlayerStorageValue(cid, bomb_config.storage.placed, getPlayerStorageValue(cid, bomb_config.storage.placed) - 1)
		doCreatureSay(cid, bomb_config.text, TALKTYPE_ORANGE_2, false, nil, pos)
		doSendMagicEffect(pos, bomb_config.effect)
		local c = getTopCreature(pos).uid
		if isPlayer(c) and isInRange(getThingPos(c), bomb_config.from, bomb_config.to) then
			doSendMagicEffect(pos, CONST_ME_GIFT_WRAPS)
			doTeleportThing(c, bomb_config.temple)
			doSendMagicEffect(bomb_config.temple, CONST_ME_MORTAREA)
			local n1, n2 = getPlayerName(c), getPlayerName(cid)
			doBroadcastMessage(n1==n2 and n1 .. " killed " .. (getPlayerSex(c) == 0 and "her" or "him") .. "self!" or n1 .. " was killed by " .. n2 .. "!", MESSAGE_STATUS_WARNING)
			local a = getPlayersInRange(bomb_config.center_room, 7, 5)
			if #a < 2 then
				doBroadcastMessage(getPlayerName(a[1]) .. " has won the match!", MESSAGE_STATUS_WARNING)
				doPlayerAddLevel(a[1], 1)
				doTeleportThing(a[1], bomb_config.temple)
				doSendMagicEffect(bomb_config.temple, CONST_ME_FIREWORK_RED)
				reset()
				reset()
			end
		else
			local b = getTileItemById(pos, bomb_config.blockID).uid
			if b > 0 then
				doSendMagicEffect(pos, CONST_ME_BLOCKHIT)
				doRemoveItem(b)
				local r = math.random(10)
				if r < 4 then
					doCreateItem(r==1 and 8304 or r==2 and bomb_config.boots_haste or r==3 and 8310, 1, _pos)
				end
			end
		end
		local N, E, W, S, l = 1, 1, 1, 1, getPlayerStorageValue(cid, bomb_config.storage.radius)
		function loopDir(dir)
			local _pos = {x=pos.x+(dir=="E" and E or dir=="W" and -W or 0), y=pos.y+(dir=="N" and -N or dir=="S" and S or 0), z=pos.z}
			if queryTileAddThing(v, _pos, 4) == RETURNVALUE_NOERROR or getTileItemById(_pos, bomb_config.blockID).uid > 0 then
				doSendMagicEffect(_pos, bomb_config.effect)
				local c = getTopCreature(_pos).uid
				if isPlayer(c) and isInRange(getThingPos(c), bomb_config.from, bomb_config.to) then
					doSendMagicEffect(_pos, CONST_ME_GIFT_WRAPS)
					doTeleportThing(c, bomb_config.temple)
					doSendMagicEffect(bomb_config.temple, CONST_ME_MORTAREA)
					local n1, n2 = getPlayerName(c), getPlayerName(cid)
					doBroadcastMessage(n1==n2 and n1 .. " killed " .. (getPlayerSex(c) == 0 and "her" or "him") .. "self!" or n1 .. " was killed by " .. n2 .. "!", MESSAGE_STATUS_WARNING)
					local a = getPlayersInRange(bomb_config.center_room, 7, 5)
					if #a < 2 then
						doBroadcastMessage(getPlayerName(a[1]) .. " has won the match!", MESSAGE_STATUS_WARNING)
						doPlayerAddLevel(a[1], 1)
						doTeleportThing(a[1], bomb_config.temple)
						doSendMagicEffect(bomb_config.temple, CONST_ME_FIREWORK_RED)
						reset()
						reset()
						return "endgame"
					end
				else
					local b = getTileItemById(_pos, bomb_config.blockID).uid
					if b > 0 then
						doSendMagicEffect(_pos, CONST_ME_BLOCKHIT)
						doRemoveItem(b)
						local r = math.random(10)
						if r < 4 then
							doCreateItem(r==1 and 8304 or r==2 and bomb_config.boots_haste or r==3 and 8310, 1, _pos)
						end
						return false
					end
				end
			elseif queryTileAddThing(v, _pos, 4) == 3 then
				return false
			end
			return true
		end
		while N <= l do
			local q = loopDir("N")
			if q == "endgame" then
				return doRemoveItem(v, 1)
			elseif not q then
				break
			else
				N = N + 1
			end
		end
		while E <= l do
			local q = loopDir("E")
			if q == "endgame" then
				return doRemoveItem(v, 1)
			elseif not q then
				break
			else
				E = E + 1
			end
		end
		while W <= l do
			local q = loopDir("W")
			if q == "endgame" then
				return doRemoveItem(v, 1)
			elseif not q then
				break
			else
				W = W + 1
			end
		end
		while S <= l do
			local q = loopDir("S")
			if q == "endgame" then
				return doRemoveItem(v, 1)
			elseif not q then
				break
			else
				S = S + 1
			end
		end
	end
	doRemoveItem(v, 1)
end
function onSay(cid, words, param, channel)
	if isInRange(getThingPos(cid), bomb_config.from, bomb_config.to) then
		setPlayerStorageValue(cid, bomb_config.storage.placed, math.max(getPlayerStorageValue(cid, bomb_config.storage.placed), 0))
		setPlayerStorageValue(cid, bomb_config.storage.max, math.max(getPlayerStorageValue(cid, bomb_config.storage.max), 1))
		setPlayerStorageValue(cid, bomb_config.storage.radius, math.max(getPlayerStorageValue(cid, bomb_config.storage.radius), 1))
		if getPlayerStorageValue(cid, bomb_config.storage.placed) < getPlayerStorageValue(cid, bomb_config.storage.max) then
			doCreateItem(bomb_config.bombID, 1, getThingPos(cid))
			addEvent(boom, bomb_config.delay, getThingPos(cid), cid)
			setPlayerStorageValue(cid, bomb_config.storage.placed, getPlayerStorageValue(cid, bomb_config.storage.placed) + 1)
		end
		return true
	end
end