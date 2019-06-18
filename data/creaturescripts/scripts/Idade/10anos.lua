local config = {
cor = 129 or 215,
tempo = 7, 
storage1 = 19367,
storage2 = 19368
}
local dezanosId = 5023
local dezanoss = {
        ["Boss Dwarf"] = {pos = {x=890, y=367, z=7}, toPos = {x=1000, y=436, z=7}, time = 7},
}


function onDeath(cid)
		if isMonster(cid) then
        local dezanos = dezanoss[getCreatureName(cid)]
        onzeanos = getCreaturePosition(cid)
        if dezanos then
                doCreateTeleport(dezanosId, dezanos.toPos, onzeanos)
                doCreatureSay(cid, "O teleport irá sumir em "..dezanos.time.." segundos e o monstro reviverá.", TALKTYPE_ORANGE_1)
                addEvent(removedezanos, dezanos.time*1000, dezanos)
		countDown(onzeanos, config.tempo, config.cor)
		
        end
end
        return TRUE
end
 
local summon = {"Boss Dwarf", {onzeanos}}
 
function removedezanos(dezanos)
        local t = getTileItemById(onzeanos, dezanosId)
        if t then
                doRemoveItem(t.uid, 1)
                doSendMagicEffect(onzeanos, CONST_ME_POFF)
		doSummonCreature(summon[1], onzeanos)
        end
end
