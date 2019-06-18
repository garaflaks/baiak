function onStepIn(cid, item, position, fromPosition)

local teleport = {x=1080, y=1272, z=7} -- Posição do teleport.
    doTeleportThing(cid, teleport)
	doSendMagicEffect(getCreaturePosition(cid),6)
   end