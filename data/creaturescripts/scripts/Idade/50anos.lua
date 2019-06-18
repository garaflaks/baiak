local config = {
cor = 129 or 215,
tempo = 7, 
storage1 = 19367,
storage2 = 19368
}
local uianosId = 5023
local uianoss = {
        ["Boss Morte"] = {pos = {x=921, y=465, z=7}, toPos = {x=1018, y=432, z=7}, time = 7},
}


function onDeath(cid)
		if isMonster(cid) then
        local uianos = uianoss[getCreatureName(cid)]
        oitoumanos = getCreaturePosition(cid)
        if uianos then
                doCreateTeleport(uianosId, uianos.toPos, oitoumanos)
                doCreatureSay(cid, "O teleport irá sumir em "..uianos.time.." segundos e o monstro reviverá.", TALKTYPE_ORANGE_1)
                addEvent(removeuianos, uianos.time*1000, uianos)
		countDown(oitoumanos, config.tempo, config.cor)
		
        end
end
        return TRUE
end
 
local summon = {"Boss Morte", {oitoumanos}}
 
function removeuianos(uianos)
        local t = getTileItemById(oitoumanos, uianosId)
        if t then
                doRemoveItem(t.uid, 1)
                doSendMagicEffect(oitoumanos, CONST_ME_POFF)
		doSummonCreature(summon[1], oitoumanos)
        end
end
