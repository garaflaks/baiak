local war3Id = 5023
local war3s = {
        ["Third Crystal"] = {pos = {x=32466, y=31618, z=9}, toPos = {x=32466, y=31618, z=9}, time = 1},
}


function onDeath(cid)
        local war3 = war3s[getCreatureName(cid)]
        cas3 = getCreaturePosition(cid)
        if war3 then
                doCreatureSay(cid, "O terceiro cristal foi destruido, entre e continue!", TALKTYPE_ORANGE_1)
                addEvent(OpenWallcas3tle, war3.time*500, war3)
        end
        return TRUE
end


function OpenWallcas3tle()
local B4 = {
{8539,{x=1027, y=1270, z=6, stackpos = 1}},
{8539,{x=1028, y=1270, z=6, stackpos = 1}},
{8539,{x=1031, y=1272, z=6, stackpos = 1}},
{8539,{x=1031, y=1273, z=6, stackpos = 1}},
{8539,{x=1031, y=1274, z=6, stackpos = 1}},
}
for i = 1, #B4 do
if getTileItemById(B4[i][2], B4[i][1]).uid == 0 then
doCreateItem(B4[i][1], 1, B4[i][2])
else
doRemoveItem(getThingfromPos(B4[i][2]).uid,1)
end
end
end

function OpenWallcas3tle2()
local B4 = {
{8539,{x=1027, y=1270, z=6, stackpos = 1}},
{8539,{x=1028, y=1270, z=6, stackpos = 1}},
{8539,{x=1031, y=1272, z=6, stackpos = 1}},
{8539,{x=1031, y=1273, z=6, stackpos = 1}},
{8539,{x=1031, y=1274, z=6, stackpos = 1}},
}
for i = 1, #B4 do
if getTileItemById(B4[i][2], B4[i][1]).uid == 0 then
doCreateItem(B4[i][1], 1, B4[i][2])
else
doRemoveItem(getThingfromPos(B4[i][2]).uid,1)
end
end
end
