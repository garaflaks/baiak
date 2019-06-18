local config = {
cor = 215,
tempo = 7, 
storage1 = 19367,
storage2 = 19368
}
local muwaId = 5023
local muwas = {
        ["Lucifer"] = {pos = {x=32795, y=31815, z=9}, toPos = {x=32795, y=31815, z=9}, time = 7},
}


function onDeath(cid)
	if isMonster(cid) then
        local muwa = muwas[getCreatureName(cid)]
        muwax = getCreaturePosition(cid)
        if muwa then
                doCreatureSay(cid, "AHHHHHHHHHH AGORA EU ESTOU FURIOSO.", TALKTYPE_ORANGE_1)
                addEvent(removemuwa, 0.1*1000, muwa)
		
        end
end
        return TRUE
end
 
local summon = {"Lucifer Furious", {muwax}}
 
function removemuwa(muwa)
        local t = getTileItemById(muwax, muwaId)
        if t then

                doSendMagicEffect(muwax, CONST_ME_POFF)
		doSummonCreature(summon[1], muwax)
        end
end
