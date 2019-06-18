function onStepIn(cid, item, position, fromPosition)

local teleport = {x=526, y=497, z=7} -- Posição do teleport.
    doTeleportThing(cid, teleport)
	doSendMagicEffect(getCreaturePosition(cid),6)
    doPlayerSay(cid, "Elite King!", TALKTYPE_ORANGE_1)
   end