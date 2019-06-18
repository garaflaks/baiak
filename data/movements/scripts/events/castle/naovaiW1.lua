function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor) 
storage_guild = getGlobalStorageValue(133133) 
local tpos,v = {x=157,y=50,z=7},getThingPos(cid) -- {x=1,y=1,z=1} is the position you teleport to, don't change getThingPos(cid). 
local tpos1,v = {x=157,y=50,z=7},getThingPos(cid) -- {x=1,y=1,z=1} is the position you teleport to, don't change getThingPos(cid). 

if isPlayer(cid) then 
if getPlayerGuildId(cid) == storage_guild then 
doTeleportThing(cid,position) 
else 
doTeleportThing(cid,tpos) 
setPlayerStorageValue(cid, 49689, -1)
doCreatureSay(cid, "Sua Guild perdeu o castle WAR", TALKTYPE_ORANGE_1) 
doSendMagicEffect(getPlayerPosition(cid),6) 
end 
return true 
end
end