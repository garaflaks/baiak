-- Addon System Levers --
-- Created by WakeSoft -- 
-- Baiak 2.0 Project by Wake --

local config = {
[4001] = {
name = "First Citizen Addon",
addon_type = 1,
outfit = {136,128},
cost = 2000000,
items = {},
},
[4002] = {
name = "Second Citizen Addon",
addon_type = 2,
outfit = {136,128},
cost = 2000000,
items = {},
},
[4003] = {
name = "First Hunter Addon",
addon_type = 1,
outfit = {137,129},
cost = 0,
items = {5947,1},
},
[4004] = {
name = "Second Hunter Addon",
addon_type = 2,
outfit = {137,129},
cost = 0,
items = {5875,1},
},
[4005] = {
name = "First Mage Addon",
addon_type = 1,
outfit = {138,130},
cost = 0,
items = {5809,1},
},
[4006] = {
name = "Second Mage Addon",
addon_type = 2,
outfit = {138,130},
cost = 0,
items = {5903,1},
},
[4007] = {
name = "First Knight Addon",
addon_type = 1,
outfit = {139,131},
cost = 0,
items = {5880,100},
},
[4008] = {
name = "Second Knight Addon",
addon_type = 2,
outfit = {139,131},
cost = 0,
items = {5924,1},
},
[4009] = {
name = "First Nobleman Addon",
addon_type = 1,
outfit = {140,132},
cost = 1500000,
items = {},
},
[4010] = {
name = "Second Nobleman Addon",
addon_type = 2,
outfit = {140,132},
cost = 1500000,
items = {},
},
[4011] = {
name = "First Summoner Addon",
addon_type = 1,
outfit = {141,133},
cost = 0,
items = {5958,1},
},
[4012] = {
name = "Second Summoner Addon",
addon_type = 2,
outfit = {141,133},
cost = 0,
items = {5904,15},
},
[4013] = {
name = "Full Warrior Addons",
addon_type = 3,
outfit = {142,134},
cost = 30000000,
items = {5919,1},
},
[4014] = {
name = "Full Assassin Addons",
addon_type = 3,
outfit = {156,152},
cost = 50000000,
items = {5804,1},
},
[4015] = {
name = "Full Beggar Addons",
addon_type = 3,
outfit = {157,153},
cost = 0,
items = {5948,100},
},
[4016] = {
name = "Fulls Brotherhood Addons",
addon_type = 3,
outfit = {279,278},
cost = 0,
items = {6500,1000},
},
[4017] = {
name = "Full Demonhunter Addons",
addon_type = 3,
outfit = {288,289},
cost = 0,
items = {7382,1},
},
[4018] = {
name = "Full Norseman Addons",
addon_type = 3,
outfit = {252,251},
cost = 3000000,
items = {7290,15},
},
[4019] = {
name = "Full Nightmare Addons",
addon_type = 3,
outfit = {269,268},
cost = 10000000,
items = {7418,1},
},
[4020] = {
name = "Full Jester Addons",
addon_type = 3,
outfit = {270,273},
cost = 10000000,
items = {7958,1},
},
[4021] = {
name = "Full Barbarian Addons",
addon_type = 3,
outfit = {147,143},
cost = 100000000,
items = {7380,1},
},
[4022] = {
name = "Full Pirate Addons",
addon_type = 3,
outfit = {155,151},
cost = 20000000,
items = {5810,1},
},
[4023] = {
name = "Full Yalaharian Addons",
addon_type = 3,
outfit = {324,325},
cost = 20000000,
items = {9141,1},
},
[4024] = {
name = "Full Wayfarer Addons",
addon_type = 3,
outfit = {367,366},
cost = 30000000,
items = {12656,1},
},
[4025] = {
name = "Full Warmaster Addons",
addon_type = 3,
outfit = {336,335},
cost = 10000000,
items = {11116,1},
},
[4026] = {
name = "Full Oriental Addons",
addon_type = 3,
outfit = {150,146},
cost = 10000000,
items = {2159,100},
},
[4027] = {
name = "Full Druid Addons",
addon_type = 3,
outfit = {148,144},
cost = 30000000,
items = {5896,100},
},
[4028] = {
name = "Full Wizard Addons",
addon_type = 3,
outfit = {149,145},
cost = 4000000,
items = {9969,1},
},
[4029] = {
name = "Full Shaman Addons",
addon_type = 3,
outfit = {158,154},
cost = 10000000,
items = {3967,1},
},


} -------- config end -------
local storage = 14000
function onUse(cid, item, fromPosition, itemEx, toPosition)
local addon, removeItems, removeMoney = config[item.actionid], 0, 0
if getPlayerStorageValue(cid, storage + item.actionid) ~= 1 then
if getPlayerMoney(cid) >= addon.cost then
removeMoney = 1
end
if #addon.items > 0 then
for i = 1, #addon.items do
if getPlayerItemCount(cid, addon.items[1]) >= addon.items[2] then
removeItems = removeItems+1
end
end
end
if removeMoney == 1 and removeItems == #addon.items then
for i = 1, #addon.items do
doPlayerRemoveItem(cid, addon.items[1], addon.items[2])
end
doPlayerRemoveMoney(cid, addon.cost)
doPlayerAddOutfit(cid, addon.outfit[1], addon.addon_type)
doPlayerAddOutfit(cid, addon.outfit[2], addon.addon_type)
setPlayerStorageValue(cid, storage + item.actionid, 1)
doPlayerSendTextMessage(cid, 20, "Now you can use the "..addon.name..".")
doSendMagicEffect(toPosition, 30)
doSendAnimatedText(getThingPos(cid), "Yeaah!", math.random(1, 255))
else
if addon.cost ~= 0 then
msg = "You no have all items or money "
else
msg = "You no have all items "
end
if #addon.items > 0 then
for i = 1, #addon.items do
msg = msg
end
end
doPlayerSendTextMessage(cid, 20, msg.."for the "..addon.name..".")
end
else
doPlayerSendTextMessage(cid, 20, "You already have the "..addon.name..".")
end
return TRUE
end
