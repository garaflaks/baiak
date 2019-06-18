function onStepIn(cid, item, position, fromPosition)

local teleport = {x=627, y=460, z=7} -- Posição do teleport.
    doTeleportThing(cid, teleport)
	doSendMagicEffect(getCreaturePosition(cid),6)
    doPlayerSay(cid, "Welcome Back!", TALKTYPE_ORANGE_1)
   end