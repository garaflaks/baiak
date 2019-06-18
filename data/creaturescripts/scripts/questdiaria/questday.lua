local config = {
cor = 129 or 215,
tempo = 15, 
storage1 = 10367,
storage2 = 10368
}
local qdayId = 5023
local qdays = {
        ["DemonDay"] = {pos = {x=648, y=380, z=8}, toPos = {x=649, y=405, z=8}, time = 15},
}


function onDeath(cid)
		if isMonster(cid) then
        local qday = qdays[getCreatureName(cid)]
         qyad = getCreaturePosition(cid)
        if qday then
                doCreateTeleport(qdayId, qday.toPos, qyad)
                doCreatureSay(cid, "[DAILY QUEST] O teleport irá sumir em "..qday.time..".", TALKTYPE_ORANGE_1)
                addEvent(removeqday, qday.time*1000, qday)
		countDown(qyad, config.tempo, config.cor)
		
        end
end
        return TRUE
end
 
local summon = {"DemonDay", {qyad}}
 
function removeqday(qday)
local Xpos = {x=1014, y=1049, z=9}
        local t = getTileItemById(qyad, qdayId)
        if t then
                doRemoveItem(t.uid, 1)
                doSendMagicEffect(qyad, CONST_ME_POFF)
        end
end
