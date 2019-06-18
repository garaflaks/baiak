local config = {
	
	positions = {
	    {{x=649, y=384, z=7}, {x=648, y=378, z=8}},
		{{x=648, y=383, z=7}, {x=647, y=377, z=8}},
		
		{{x=649, y=383, z=7}, {x=648, y=377, z=8}},
		{{x=650, y=383, z=7}, {x=649, y=377, z=8}},

	},
	
	storageTime1 = 10045,
	storageTime2 = 10046,
	money = 500,-- em k
}

local Sum = {x = 648, y = 379, z = 8}

local posiC = {x = 649, y = 385, z = 7}
local posiC2 = {x = 648, y = 380, z = 8}
local kick = {x = 645, y = 383, z = 7}
local jafezQuest = 20041

function onUse(cid, item, fromPosition, item2, toPosition)

	if getGlobalStorageValue(100322) == 1 then
		return doPlayerSendCancel(cid, "[DAILY QUEST] Existem outros players na quest, aguarde um instante.") and doSendMagicEffect(getThingPos(cid), 2)
	end

	-- Checando posições 1
	for i = 1, #config.positions do
		local creature = getTopCreature(config.positions[i][1]).uid
		
		if not isPlayer(creature) then
			return doPlayerSendCancel(cid, "[DAILY QUEST] Não existe players em todas as posicões.") and doSendMagicEffect(getThingPos(cid), 2)
		end
		if getPlayerStorageValue(creature, 20041) == 1 then
			return doPlayerSendCancel(cid, "[DAILY QUEST] Algum player ja fez essa quest hoje.") and doSendMagicEffect(getThingPos(cid), 2)
		end

	end

	  addEvent(TpREMOVE, 120000, cid)
	  addEvent(TpREMOVE2, 120001, cid)
	doCreatureSay ( cid, "UI PARTIU!", TALKTYPE_ORANGE_1 )
	countDown(posiC, 120, 129)
	countDown(posiC2, 120, 129)
		doSummonCreature("DemonDay", Sum)

	setGlobalStorageValue(100322, 1)
		
  -- Teleportando posições 1
	for i = 1, #config.positions do
		local creature = getTopCreature(config.positions[i][1]).uid
		doTeleportThing(creature, config.positions[i][2])
		doPlayerSendTextMessage(creature, 27, "[DAILY QUEST] Você começou a quest.")
		doSendMagicEffect(getThingPos(creature), 6)
		setPlayerStorageValue(creature, 14235, 1)
	end

	return true
end


function TpREMOVE(cid)
local players,str = {},""
for _, cid in pairs(getPlayersOnline()) do
setGlobalStorageValue(100322, -1)
if getPlayerStorageValue(cid, 14235) == 1 then
table.insert(players, cid)
end
end

for i = 1, #players do
doTeleportThing(players[i], kick)
setPlayerStorageValue(players[i], 14235, -1)
		doPlayerSendTextMessage(players[i], 27, "[DAILY QUEST] O tempo acabou.")
end
return 
end

function TpREMOVE2()
local area = {{x=644,y=374,z=8},{x=653,y=383,z=8}}
local remove, clean = true, true
for x = area[1].x - 1, area[2].x + 1 do
for y = area[1].y - 1, area[2].y + 1 do
local pos = {x=x, y=y, z=area[1].z}
local m = getTopCreature(pos).uid
if remove ~= false and m ~= 0 and isMonster(m) then doRemoveCreature(m) end
if clean ~= false then doCleanTile(pos, false) end
if m ~= 0 and isPlayer(m) then end
end
end
return true
end