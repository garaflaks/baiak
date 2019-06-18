function onStepIn(cid, item, position, fromPosition)

local teleport = {x=1598, y=60, z=7} -- Posição do teleport.
    doTeleportThing(cid, teleport)
	doSendMagicEffect(getCreaturePosition(cid),6)
   end