function onStepIn(cid, item, position, fromPosition)

local teleport = {x=1685, y=99, z=7} -- Posição do teleport.
    doTeleportThing(cid, teleport)
	doSendMagicEffect(getCreaturePosition(cid),6)
   end