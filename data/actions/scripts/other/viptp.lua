function onUse(cid, item, fromPosition, itemEx, toPosition)

local teleport = {x=171, y=18, z=6} -- Posição do teleport.
    doTeleportThing(cid, teleport)
	doSendMagicEffect(getCreaturePosition(cid),6)
    doPlayerSay(cid, "Welcome to Vip Boat!", TALKTYPE_ORANGE_1)
  end
 
  