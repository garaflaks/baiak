local config = {
cor = 129 or 215,
tempo = 7, 
storage1 = 19367,
storage2 = 19368
}
local trintaanosId = 5023
local trintaanoss = {
        ["Boss Infernalist"] = {pos = {x=887, y=418, z=7}, toPos = {x=1008, y=436, z=7}, time = 7},
}


function onDeath(cid)
		if isMonster(cid) then
        local trintaanos = trintaanoss[getCreatureName(cid)]
        tresumanos = getCreaturePosition(cid)
        if trintaanos then
                doCreateTeleport(trintaanosId, trintaanos.toPos, tresumanos)
                doCreatureSay(cid, "O teleport irá sumir em "..trintaanos.time.." segundos e o monstro reviverá.", TALKTYPE_ORANGE_1)
                addEvent(removetrintaanos, trintaanos.time*1000, trintaanos)
		countDown(tresumanos, config.tempo, config.cor)
		
        end
end
        return TRUE
end
 
local summon = {"Boss Infernalist", {tresumanos}}
 
function removetrintaanos(trintaanos)
        local t = getTileItemById(tresumanos, trintaanosId)
        if t then
                doRemoveItem(t.uid, 1)
                doSendMagicEffect(tresumanos, CONST_ME_POFF)
		doSummonCreature(summon[1], tresumanos)
        end
end
