function onStepIn(cid, item, position, fromPosition)

local teleport = {x=451, y=31, z=8} -- Posição do teleport.
    doTeleportThing(cid, teleport)
	doSendMagicEffect(getCreaturePosition(cid),6)
    doPlayerSay(cid, "Welcome to acesso 3", TALKTYPE_ORANGE_1)
   end