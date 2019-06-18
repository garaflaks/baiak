function onStepIn(cid, item, position, fromPosition)

local teleport = {x=1772, y=173, z=7} -- Posição do teleport.
    doTeleportThing(cid, teleport)
	doSendMagicEffect(getCreaturePosition(cid),6)
   end