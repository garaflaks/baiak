local config = {
cor = 129 or 215,
tempo = 7, 
storage1 = 19367,
storage2 = 19368
}
local quarentaanosId = 5023
local quarentaanoss = {
        ["Boss Water Elemental"] = {pos = {x=946, y=419, z=7}, toPos = {x=1012, y=436, z=7}, time = 7},
}


function onDeath(cid)
		if isMonster(cid) then
        local quarentaanos = quarentaanoss[getCreatureName(cid)]
        seteumanos = getCreaturePosition(cid)
        if quarentaanos then
                doCreateTeleport(quarentaanosId, quarentaanos.toPos, seteumanos)
                doCreatureSay(cid, "O teleport irá sumir em "..quarentaanos.time.." segundos e o monstro reviverá.", TALKTYPE_ORANGE_1)
                addEvent(removequarentaanos, quarentaanos.time*1000, quarentaanos)
		countDown(seteumanos, config.tempo, config.cor)
		
        end
end
        return TRUE
end
 
local summon = {"Boss Water Elemental", {seteumanos}}
 
function removequarentaanos(quarentaanos)
        local t = getTileItemById(seteumanos, quarentaanosId)
        if t then
                doRemoveItem(t.uid, 1)
                doSendMagicEffect(seteumanos, CONST_ME_POFF)
		doSummonCreature(summon[1], seteumanos)
        end
end
