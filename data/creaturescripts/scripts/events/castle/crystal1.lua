local warId = 5023
local wars = {
        ["First Crystal"] = {pos = {x=32466, y=31618, z=9}, toPos = {x=32466, y=31618, z=9}, time = 1},
}


function onDeath(cid)
        local war = wars[getCreatureName(cid)]
        cas = getCreaturePosition(cid)
        if war then
                doCreatureSay(cid, "O primeiro cristal foi destruido, entre e continue!", TALKTYPE_ORANGE_1)
                addEvent(OpenWallCastle, war.time*500, war)               
        end
        return TRUE
end


function OpenWallCastle()
local B2 = {
{1544,{x=1044, y=1275, z=7, stackpos = 1}},
{1544,{x=1045, y=1275, z=7, stackpos = 1}},
{1544,{x=1046, y=1275, z=7, stackpos = 1}},
{1544,{x=1047, y=1275, z=7, stackpos = 1}},
{1544,{x=1052, y=1275, z=7, stackpos = 1}},
{1544,{x=1053, y=1275, z=7, stackpos = 1}},
{1544,{x=1054, y=1275, z=7, stackpos = 1}},
{1544,{x=1055, y=1275, z=7, stackpos = 1}}
}
for i = 1, #B2 do
if getTileItemById(B2[i][2], B2[i][1]).uid == 0 then
doCreateItem(B2[i][1], 1, B2[i][2])
else
doRemoveItem(getThingfromPos(B2[i][2]).uid,1)
end
end
end

function OpenWallCastle2()
local B2 = {
{1544,{x=1044, y=1275, z=7, stackpos = 1}},
{1544,{x=1045, y=1275, z=7, stackpos = 1}},
{1544,{x=1046, y=1275, z=7, stackpos = 1}},
{1544,{x=1047, y=1275, z=7, stackpos = 1}},
{1544,{x=1052, y=1275, z=7, stackpos = 1}},
{1544,{x=1053, y=1275, z=7, stackpos = 1}},
{1544,{x=1054, y=1275, z=7, stackpos = 1}},
{1544,{x=1055, y=1275, z=7, stackpos = 1}}
}
for i = 1, #B2 do
if getTileItemById(B2[i][2], B2[i][1]).uid == 0 then
doCreateItem(B2[i][1], 1, B2[i][2])
else
doRemoveItem(getThingfromPos(B2[i][2]).uid,1)
end
end
end
