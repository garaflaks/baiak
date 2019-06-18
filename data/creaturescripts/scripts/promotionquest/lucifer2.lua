local config = {
cor = 215,
tempo = 60, 
storage1 = 19367,
storage2 = 19368
}
local ycIdeeex = 5023
local ycseeea = {
        ["Lucifer Furious"] = {pos = {x=1, y=1, z=1}, toPos = {x=1876, y=272, z=6}, time = 60},
}


function onDeath(cid)
	if isMonster(cid) then
        local yc12s = ycseeea[getCreatureName(cid)]
        rpraaaxxw = getCreaturePosition(cid)
        if yc12s then
                doCreateTeleport(ycIdeeex, yc12s.toPos, rpraaaxxw)
                doCreatureSay(cid, "Lucifer foi derrotado e paz selada, volte a Deus e pegue sua recompensa!", TALKTYPE_ORANGE_1)
                addEvent(removeyc, yc12s.time*1000, yc12s)
		countDown(rpraaaxxw, config.tempo, config.cor)
		
        end
end
        return TRUE
end
 
local summon = {"Lucifer", {rpraaaxxw}}
 
function removeyc(yc12s)
        local t = getTileItemById(rpraaaxxw, ycIdeeex)
        if t then
                doRemoveItem(t.uid, 1)
                doSendMagicEffect(rpraaaxxw, CONST_ME_POFF)
				doSummonCreature(summon[1], rpraaaxxw)
        end
end