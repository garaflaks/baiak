local config = {
cor = 129 or 215,
tempo = 7, 
storage1 = 19367,
storage2 = 19368
}
local quinzeanosId = 5023
local quinzeanoss = {
        ["Boss Orc"] = {pos = {x=922, y=368, z=7}, toPos = {x=1004, y=428, z=7}, time = 7},
}


function onDeath(cid)
		if isMonster(cid) then
        local quinzeanos = quinzeanoss[getCreatureName(cid)]
        dezesseisanos = getCreaturePosition(cid)
        if quinzeanos then
                doCreateTeleport(quinzeanosId, quinzeanos.toPos, dezesseisanos)
                doCreatureSay(cid, "O teleport irá sumir em "..quinzeanos.time.." segundos e o monstro reviverá.", TALKTYPE_ORANGE_1)
                addEvent(removequinzeanos, quinzeanos.time*1000, quinzeanos)
		countDown(dezesseisanos, config.tempo, config.cor)
		
        end
end
        return TRUE
end
 
local summon = {"Boss Orc", {dezesseisanos}}
 
function removequinzeanos(quinzeanos)
        local t = getTileItemById(dezesseisanos, quinzeanosId)
        if t then
                doRemoveItem(t.uid, 1)
                doSendMagicEffect(dezesseisanos, CONST_ME_POFF)
		doSummonCreature(summon[1], dezesseisanos)
        end
end
