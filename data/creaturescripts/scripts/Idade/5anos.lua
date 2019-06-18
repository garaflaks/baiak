local config = {
cor = 129 or 215,
tempo = 7, 
storage1 = 19367,
storage2 = 19368
}
local cincoanosId = 5023
local cincoanoss = {
        ["Boss Goblin"] = {pos = {x=858, y=366, z=7}, toPos = {x=1000, y=428, z=7}, time = 7},
}


function onDeath(cid)
		if isMonster(cid) then
        local cincoanos = cincoanoss[getCreatureName(cid)]
        seisanos = getCreaturePosition(cid)
        if cincoanos then
                doCreateTeleport(cincoanosId, cincoanos.toPos, seisanos)
                doCreatureSay(cid, "O teleport irá sumir em "..cincoanos.time.." segundos e o monstro reviverá.", TALKTYPE_ORANGE_1)
                addEvent(removecincoanos, cincoanos.time*1000, cincoanos)
		countDown(seisanos, config.tempo, config.cor)
		
        end
end
        return TRUE
end
 
local summon = {"Boss Goblin", {seisanos}}
 
function removecincoanos(cincoanos)
        local t = getTileItemById(seisanos, cincoanosId)
        if t then
                doRemoveItem(t.uid, 1)
                doSendMagicEffect(seisanos, CONST_ME_POFF)
		doSummonCreature(summon[1], seisanos)
        end
end
