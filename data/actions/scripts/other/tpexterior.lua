function onUse(cid, item, fromPosition, itemEx, toPosition)

local teleport = {x=139, y=46, z=6} -- Posição do teleport.
    doTeleportThing(cid, teleport)
	doSendMagicEffect(getCreaturePosition(cid),6)
    doPlayerSay(cid, "BUUM!", TALKTYPE_ORANGE_1)
  end
 
  