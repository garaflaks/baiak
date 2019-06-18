local config = {
cor = 129 or 215,
tempo = 7, 
storage1 = 19367,
storage2 = 19368
}
local hjintaanosId = 5023
local hjintaanoss = {
        ["Boss Obelisco"] = {pos = {x=916, y=417, z=7}, toPos = {x=1012, y=428, z=7}, time = 7},
}


function onDeath(cid)
		if isMonster(cid) then
        local hjintaanos = hjintaanoss[getCreatureName(cid)]
        quatroumanos = getCreaturePosition(cid)
        if hjintaanos then
                doCreateTeleport(hjintaanosId, hjintaanos.toPos, quatroumanos)
                doCreatureSay(cid, "O teleport irá sumir em "..hjintaanos.time.." segundos e o monstro reviverá.", TALKTYPE_ORANGE_1)
                addEvent(removehjintaanos, hjintaanos.time*1000, hjintaanos)
		countDown(quatroumanos, config.tempo, config.cor)
		
        end
end
        return TRUE
end
 
local summon = {"Boss Obelisco", {quatroumanos}}
 
function removehjintaanos(hjintaanos)
        local t = getTileItemById(quatroumanos, hjintaanosId)
        if t then
                doRemoveItem(t.uid, 1)
                doSendMagicEffect(quatroumanos, CONST_ME_POFF)
		doSummonCreature(summon[1], quatroumanos)
        end
end
