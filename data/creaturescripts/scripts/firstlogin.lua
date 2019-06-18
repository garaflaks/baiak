function onLogin(cid)
local pos = {x = 804, y = 439, z = 7}

if getPlayerStorageValue(cid, 60633) == -1 then
doTeleportThing(cid, pos)
setPlayerStorageValue(cid, 60633, 1)
end
return true
end