function onStepIn(cid, item, position, fromPosition)

local teleport = {x=157, y=50, z=7} -- Posição do teleport.
    doTeleportThing(cid, teleport)
	doSendMagicEffect(getCreaturePosition(cid),6)
	doPlayerSay(cid, "TEMPLO!", TALKTYPE_ORANGE_1)
   end