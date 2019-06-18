function onStepIn(cid, item, position, fromPosition)

local teleport = {x=449, y=33, z=7} -- Posição do teleport.
    doTeleportThing(cid, teleport)
	doSendMagicEffect(getCreaturePosition(cid),6)
    doPlayerSay(cid, "Welcome back!", TALKTYPE_ORANGE_1)
   end