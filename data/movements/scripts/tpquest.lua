function onStepIn(cid, item, position, fromPosition)

local teleport = {x=639, y=427, z=7} -- Posição do teleport.
    doTeleportThing(cid, teleport)
	doSendMagicEffect(getCreaturePosition(cid),6)
    doPlayerSay(cid, "Quest Room!", TALKTYPE_ORANGE_1)
   end