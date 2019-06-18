function onStepIn(cid, item, position, fromPosition)

local teleport = {x=1766, y=332, z=8} -- Posição do teleport.
    doTeleportThing(cid, teleport)
	doSendMagicEffect(getCreaturePosition(cid),6)
   end