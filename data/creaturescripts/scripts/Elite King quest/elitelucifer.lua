local config = {
cor = 129 or 215,
tempo = 15, 
storage1 = 19367,
storage2 = 19368
}
local twId = 5023
local txm = {
        ["Elite Lucifer"] = {pos = {x=461, y=1012, z=4}, toPos = {x=607, y=1245, z=7}, time = 15},
}


function onDeath(cid)
	if isMonster(cid) then
        local tw = txm[getCreatureName(cid)]
         spuv = getCreaturePosition(cid)
        if tw then
                doCreateTeleport(twId, tw.toPos, spuv)
                doCreatureSay(cid, "O teleport irá sumir em "..tw.time.." segundos e o monstro reviverá.", TALKTYPE_ORANGE_1)
                addEvent(removetw, tw.time*1000, tw)
		countDown(spuv, config.tempo, config.cor)
        end
	end
        return TRUE
end
 
local summon = {"Elite Lucifer", {spuv}}
 
function removetw(tw)
        local t = getTileItemById(spuv, twId)
        if t then
                doRemoveItem(t.uid, 1)
                doSendMagicEffect(spuv, CONST_ME_POFF)
		doSummonCreature(summon[1], spuv)
        end
end
