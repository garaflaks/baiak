local config = {
cor = 129 or 215,
tempo = 15, 
storage1 = 19367,
storage2 = 19368
}
local rpId = 5023
local rps = {
        ["Yalahari"] = {pos = {x=1521, y=1867, z=4}, toPos = {x=1522, y=1867, z=3}, time = 15},
}


function onDeath(cid)
	if isMonster(cid) then
        local rp = rps[getCreatureName(cid)]
         ypx = getCreaturePosition(cid)
        if rp then
                doCreateTeleport(rpId, rp.toPos, ypx)
                doCreatureSay(cid, "O teleport irá sumir em "..rp.time.." segundos e o monstro reviverá.", TALKTYPE_ORANGE_1)
                addEvent(removerp, rp.time*1000, rp)
		 countDown(ypx, config.tempo, config.cor)
        end
end
        return TRUE
end
 
local summon = {"Yalahari", {ypx}}
 
function removerp(rp)
        local t = getTileItemById(ypx, rpId)
        if t then
                doRemoveItem(t.uid, 1)
                doSendMagicEffect(ypx, CONST_ME_POFF)
		doSummonCreature(summon[1], ypx)
        end
end
