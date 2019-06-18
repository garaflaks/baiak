function onStepIn(cid, item, position, fromPosition)

local teleport = {x=68, y=241, z=8} -- Posição do teleport.
    doTeleportThing(cid, teleport)
	doSendMagicEffect(getCreaturePosition(cid),6)
    doPlayerSay(cid, "Welcome to VIP.", TALKTYPE_ORANGE_1)
   end