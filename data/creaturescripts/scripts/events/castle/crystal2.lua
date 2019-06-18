local war2Id = 5023
local war2s = {
        ["Second Crystal"] = {pos = {x=32466, y=31618, z=9}, toPos = {x=32466, y=31618, z=9}, time = 1},
}


function onDeath(cid)
        local war2 = war2s[getCreatureName(cid)]
        cas2 = getCreaturePosition(cid)
        if war2 then
                doCreatureSay(cid, "O segundo cristal foi destruido, entre e continue!", TALKTYPE_ORANGE_1)
                addEvent(OpenWallcas2tle, war2.time*500, war2)
        end
        return TRUE
end


function OpenWallcas2tle()
local B3 = {
{1544,{x=1027, y=1261, z=7, stackpos = 1}},
{1544,{x=1028, y=1261, z=7, stackpos = 1}},
{1544,{x=1029, y=1261, z=7, stackpos = 1}}
}
for i = 1, #B3 do
if getTileItemById(B3[i][2], B3[i][1]).uid == 0 then
doCreateItem(B3[i][1], 1, B3[i][2])
else
doRemoveItem(getThingfromPos(B3[i][2]).uid,1)
end
end
end

function OpenWallcas2tle2()
local B3 = {
{1544,{x=1027, y=1261, z=7, stackpos = 1}},
{1544,{x=1028, y=1261, z=7, stackpos = 1}},
{1544,{x=1029, y=1261, z=7, stackpos = 1}}
}
for i = 1, #B3 do
if getTileItemById(B3[i][2], B3[i][1]).uid == 0 then
doCreateItem(B3[i][1], 1, B3[i][2])
else
doRemoveItem(getThingfromPos(B3[i][2]).uid,1)
end
end
end
