local config = {
cor = 215,
tempo = 15, 
storage1 = 19367,
storage2 = 19368
}
local xpId = 5023
local xps = {
        ["The King Mister"] = {pos = {x=458, y=1199, z=7}, toPos = {x=389, y=1161, z=7}, time = 15},
}


function onDeath(cid)
	if isMonster(cid) then
        local xp = xps[getCreatureName(cid)]
        xpx = getCreaturePosition(cid)
        if xp then
                doCreateTeleport(xpId, xp.toPos, xpx)
                doCreatureSay(cid, "O teleport irá sumir em "..xp.time.." segundos e o monstro reviverá.", TALKTYPE_ORANGE_1)
                addEvent(removexp, xp.time*1000, xp)
		countDown(xpx, config.tempo, config.cor)
        end
end
        return TRUE
end
 
local summon = {"The King Mister", {xpx}}
 
function removexp(xp)
        local t = getTileItemById(xpx, xpId)
        if t then
                doRemoveItem(t.uid, 1)
                doSendMagicEffect(xpx, CONST_ME_POFF)
		doSummonCreature(summon[1], xpx)
        end
end
