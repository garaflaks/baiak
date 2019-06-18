local config = {
cor = 129 or 215,
tempo = 7, 
storage1 = 19367,
storage2 = 19368
}
local vinteanosId = 5023
local vinteanoss = {
        ["Boss Raider"] = {pos = {x=952, y=367, z=7}, toPos = {x=1004, y=436, z=7}, time = 7},
}


function onDeath(cid)
		if isMonster(cid) then
        local vinteanos = vinteanoss[getCreatureName(cid)]
        maisumanos = getCreaturePosition(cid)
        if vinteanos then
                doCreateTeleport(vinteanosId, vinteanos.toPos, maisumanos)
                doCreatureSay(cid, "O teleport irá sumir em "..vinteanos.time.." segundos e o monstro reviverá.", TALKTYPE_ORANGE_1)
                addEvent(removevinteanos, vinteanos.time*1000, vinteanos)
		countDown(maisumanos, config.tempo, config.cor)
		
        end
end
        return TRUE
end
 
local summon = {"Boss Raider", {maisumanos}}
 
function removevinteanos(vinteanos)
        local t = getTileItemById(maisumanos, vinteanosId)
        if t then
                doRemoveItem(t.uid, 1)
                doSendMagicEffect(maisumanos, CONST_ME_POFF)
		doSummonCreature(summon[1], maisumanos)
        end
end
