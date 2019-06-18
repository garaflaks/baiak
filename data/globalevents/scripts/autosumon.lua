local summon = {"Boss Goblin", {x=858, y=366, z=7}}
local summon2 = {"Boss Dwarf", {x=890, y=367, z=7}}
local summon3 = {"Boss Orc", {x=922, y=368, z=7}}
local summon4 = {"Boss Raider", {x=952, y=367, z=7}}
local summon5 = {"Boss Marid", {x=856, y=418, z=7}}
local summon6 = {"Boss Infernalist", {x=887, y=418, z=7}}
local summon7 = {"Boss Obelisco", {x=916, y=417, z=7}}
local summon8 = {"Boss Water Elemental", {x=946, y=419, z=7}}
local summon9 = {"Boss Morte", {x=921, y=465, z=7}}
local summon10 = {"Lucifer", {x=1591, y=350, z=12}}
local summon11 = {"King Hades", {x=420, y=1199, z=7}}
local summon12 = {"The King Mister", {x=458, y=1199, z=7}}
local summon13 = {"Elite Lucifer", {x=461, y=1012, z=4}}
local summon14 = {"Queen Shaman", {x=267, y=79, z=8}}
local summon15 = {"Yalahari", {x=1521, y=1867, z=4}}

function onStartup()
	doSummonCreature(summon[1], summon[2])
	doSummonCreature(summon2[1], summon2[2])
	doSummonCreature(summon3[1], summon3[2])
	doSummonCreature(summon4[1], summon4[2])
	doSummonCreature(summon5[1], summon5[2])
	doSummonCreature(summon6[1], summon6[2])
	doSummonCreature(summon7[1], summon7[2])
	doSummonCreature(summon8[1], summon8[2])
	doSummonCreature(summon9[1], summon9[2])
	doSummonCreature(summon10[1], summon10[2])
	doSummonCreature(summon11[1], summon11[2])
	doSummonCreature(summon12[1], summon12[2])
	doSummonCreature(summon13[1], summon13[2])
	doSummonCreature(summon14[1], summon14[2])
	doSummonCreature(summon15[1], summon15[2])
	return true
end