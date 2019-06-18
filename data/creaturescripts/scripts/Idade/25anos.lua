local config = {
cor = 129 or 215,
tempo = 7, 
storage1 = 19367,
storage2 = 19368
}
local mhsntanosId = 5023
local mhsntanoss = {
        ["Boss Marid"] = {pos = {x=856, y=418, z=7}, toPos = {x=1008, y=428, z=7}, time = 7},
}


function onDeath(cid)
		if isMonster(cid) then
        local mhsntanos = mhsntanoss[getCreatureName(cid)]
        doisumanos = getCreaturePosition(cid)
        if mhsntanos then
                doCreateTeleport(mhsntanosId, mhsntanos.toPos, doisumanos)
                doCreatureSay(cid, "O teleport irá sumir em "..mhsntanos.time.." segundos e o monstro reviverá.", TALKTYPE_ORANGE_1)
                addEvent(removemhsntanos, mhsntanos.time*1000, mhsntanos)
		countDown(doisumanos, config.tempo, config.cor)
		
        end
end
        return TRUE
end
 
local summon = {"Boss Marid", {doisumanos}}
 
function removemhsntanos(mhsntanos)
        local t = getTileItemById(doisumanos, mhsntanosId)
        if t then
                doRemoveItem(t.uid, 1)
                doSendMagicEffect(doisumanos, CONST_ME_POFF)
		doSummonCreature(summon[1], doisumanos)
        end
end
