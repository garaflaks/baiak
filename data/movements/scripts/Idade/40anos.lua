function onStepIn(cid, item, position, fromPosition)


local idade = 40
local timetry = (idade * 60)
local posic = {x=945, y=395, z=7}

local posicEx = {x=1001, y=432, z=7}

if getPlayerStorageValue(cid, 6723) >= timetry then
if getPlayerStorageValue(cid, 6830) == -1 then
doTeleportThing(cid, posic, true)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
	  addEvent(Msg81, 1000, cid)
	  addEvent(Msg82, 4500, cid)
	  addEvent(Msg83, 7000, cid)
	  addEvent(Msg84, 10000, cid)

doSendMagicEffect(getThingPos(cid), 27)	
doSendMagicEffect({x=944, y=395, z=7}, 28)	
doSendMagicEffect({x=946, y=395, z=7}, 28)		
else
doPlayerPopupFYI(cid, "Você já completou essa quest rapais!") 
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE) 
doTeleportThing(cid, posicEx, true) 
end
else
doPlayerPopupFYI(cid, "Você não tem 40 anos de idade mocinho!") 
 doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE) 
 doTeleportThing(cid, posicEx, true)
end
end

function Msg81(cid)
doCreatureSay(getCreatureByName("GM Bogo"), "40tinha hein? Alguns dizem que está envelhecendo, eu digo que está se tornando um sabio. Parabéns pelos 40 anos!! Muito obrigado por ficar este tempo online!", TALKTYPE_PRIVATE, false, cid)
end
function Msg82(cid)
doCreatureSay(getCreatureByName("GM Bogo"), "Vou-lhe recompensar, mas você sabe que tem um preço. Você terá que enfrentar um boss!", TALKTYPE_PRIVATE, false, cid)
end
function Msg83(cid)
doCreatureSay(getCreatureByName("GM Bogo"), "Ou você pode fugir! Entre no teleport a {<- ESQUERDA PARA O BOSS} ou a {DIREITA PARA FUGIR ->}!", TALKTYPE_PRIVATE, false, cid)
end
function Msg84(cid)
doCreatureSay(getCreatureByName("GM Bogo"), "Boa Sorte amigão!", TALKTYPE_PRIVATE, false, cid)
end