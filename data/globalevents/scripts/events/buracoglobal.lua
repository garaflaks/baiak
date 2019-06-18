local storageX2 = 12532
local waittime2 = 3
local tptemplo2 = {x = 153, y = 47, z = 7}
local msg21 = "[BURACO X] O evento foi inciado no templo, esperaremos 3 minutos para começar."
local msg22 = "[BURACO X] O evento foi inciado no templo, restam 1 minuto para começar."
local postopw2 = {x = 826, y = 619, z = 7}
local posdownw2 = {x = 852, y = 642, z = 7}
local maptop1 = {x = 766, y = 606, z = 7}
local mapdown1 = {x = 822, y = 658, z = 7}
local t_l3 = {x = 766, y = 606, z = 7}
local b_r3 = {x = 822, y = 658, z = 7}

function onTime()
doBroadcastMessage(msg21, MESSAGE_STATUS_WARNING)
addEvent(msgsnow3x, 2*1000*60)                            
addEvent(moveToEvent3x, waittime2*1000*60)
doCreateTeleport(1387, {x = 841, y = 631, z = 7}, tptemplo2)
end
                   
function msgsnow3x()
doBroadcastMessage(msg22, MESSAGE_STATUS_WARNING)
end

function moveToEvent3x()
for _, pid in ipairs(getPlayersOnline()) do
if isInRange(getCreaturePosition(pid), postopw2, posdownw2) then
doTeleportThing(pid, {x=math.random(t_l3.x,b_r3.x), y=math.random(t_l3.y, b_r3.y), z=math.random(t_l3.z, b_r3.z)})
doPlayerSetStorageValue(pid, storageX2,1)
doPlayerSendTextMessage(pid,27,"[BURACO X] Bem vindo ao evento Buraco X.")
end
end
doRemoveItem(getTileItemById(tptemplo2,1387).uid)
end