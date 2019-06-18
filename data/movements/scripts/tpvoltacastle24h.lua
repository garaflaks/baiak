function onStepIn(cid, item, position, fromPosition)

local teleport = {x=529, y=152, z=7} -- Posição do teleport.
    doTeleportThing(cid, teleport)
	doSendMagicEffect(getCreaturePosition(cid),6)
    doPlayerSay(cid, "Welcome Castle24h!", TALKTYPE_ORANGE_1)
   end