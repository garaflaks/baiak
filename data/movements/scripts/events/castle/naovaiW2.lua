function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
storage_guild = getGlobalStorageValue(133133)
local tpos,v = {x=1088,y=1062,z=7},getThingPos(cid) -- {x=1,y=1,z=1} is the position you teleport to, don't change getThingPos(cid).
local tpos1,v = {x=1170,y=1129,z=7},getThingPos(cid) -- {x=1,y=1,z=1} is the position you teleport to, don't change getThingPos(cid).

	    if getPlayerGuildId(cid) == storage_guild then
                doCreatureSay(cid, "Bem vindo ao seu castelo!", TALKTYPE_ORANGE_1)
		doTeleportThing(cid,position)
		doSendMagicEffect(v,12)
	else
		doTeleportThing(cid,lastPosition)
                doCreatureSay(cid, "Este castelo nao pertence a sua guild!", TALKTYPE_ORANGE_1)
		doSendMagicEffect(getPlayerPosition(cid),3)
	end
	return true
end