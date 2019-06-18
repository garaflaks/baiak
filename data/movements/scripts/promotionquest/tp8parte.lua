function onStepIn(cid, item, position, fromPosition)

local teleport = {x=1838, y=46, z=7} -- Posição do teleport.
    doTeleportThing(cid, teleport)
	doSendMagicEffect(getCreaturePosition(cid),6)
	doPlayerSay(cid, "REWARD!", TALKTYPE_ORANGE_1)
   end