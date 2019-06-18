local config = {
cor = 129 or 215,
tempo = 15, 
storage1 = 19367,
storage2 = 19368
}
local tpId = 5023
local tps = {
        ["Queen Shaman"] = {pos = {x=267, y=79, z=8}, toPos = {x=248, y=81, z=8}, time = 15},
}


function onDeath(cid)
	if isMonster(cid) then
        local tp = tps[getCreatureName(cid)]
         tpx = getCreaturePosition(cid)
        if tp then
                doCreateTeleport(tpId, tp.toPos, tpx)
                doCreatureSay(cid, "O teleport irá sumir em "..tp.time.." segundos e o monstro reviverá.", TALKTYPE_ORANGE_1)
                addEvent(removeTp, tp.time*1000, tp)
		countDown(tpx, config.tempo, config.cor)
        end
end
        return TRUE
end
 
local summon = {"Queen Shaman", {tpx}}
 
function removeTp(tp)
        local t = getTileItemById(tpx, tpId)
        if t then
                doRemoveItem(t.uid, 1)
                doSendMagicEffect(tpx, CONST_ME_POFF)
		doSummonCreature(summon[1], tpx)
        end
end
