local config = {
cor = 129 or 215,
tempo = 15, 
storage1 = 19367,
storage2 = 19368
}
local tmzId = 5023
local tmzs = {
        ["King Hades"] = {pos = {x=420, y=1199, z=7}, toPos = {x=458, y=1203, z=7}, time = 15},
}


function onDeath(cid)
		if isMonster(cid) then
        local tmz = tmzs[getCreatureName(cid)]
        spx = getCreaturePosition(cid)
        if tmz then
                doCreateTeleport(tmzId, tmz.toPos, spx)
                doCreatureSay(cid, "O teleport irá sumir em "..tmz.time.." segundos e o monstro reviverá.", TALKTYPE_ORANGE_1)
                addEvent(removetmz, tmz.time*1000, tmz)
		countDown(spx, config.tempo, config.cor)
		
        end
end
        return TRUE
end
 
local summon = {"King Hades", {spx}}
 
function removetmz(tmz)
        local t = getTileItemById(spx, tmzId)
        if t then
                doRemoveItem(t.uid, 1)
                doSendMagicEffect(spx, CONST_ME_POFF)
		doSummonCreature(summon[1], spx)
        end
end
