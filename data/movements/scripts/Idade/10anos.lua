function onStepIn(cid, item, position, fromPosition)


local idade = 10
local timetry = (idade * 60)
local posic = {x=889, y=342, z=7}

local posicEx = {x=1001, y=432, z=7}

if getPlayerStorageValue(cid, 6723) >= timetry then
if getPlayerStorageValue(cid, 6824) == -1 then
doTeleportThing(cid, posic, true)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
	  addEvent(Msg21, 1000, cid)
	  addEvent(Msg22, 4500, cid)
	  addEvent(Msg23, 7000, cid)
	  addEvent(Msg24, 10000, cid)

doSendMagicEffect(getThingPos(cid), 27)	
doSendMagicEffect({x=888, y=342, z=7}, 28)	
doSendMagicEffect({x=890, y=342, z=7}, 28)		
else
doPlayerPopupFYI(cid, "Voc� j� completou essa quest rapais!") 
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE) 
doTeleportThing(cid, posicEx, true) 
end
else
doPlayerPopupFYI(cid, "Voc� n�o tem 10 anos de idade mocinho!") 
 doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE) 
 doTeleportThing(cid, posicEx, true)
end
end

function Msg21(cid)
doCreatureSay(getCreatureByName("GM Bogo"), "Olha s� quem completou mais uns anos de idade hein, Parab�ns!! Muito obrigado por ficar este tempo online!", TALKTYPE_PRIVATE, false, cid)
end
function Msg22(cid)
doCreatureSay(getCreatureByName("GM Bogo"), "Vou-lhe recompensar, mas voc� sabe que tem um pre�o. Voc� ter� que enfrentar um boss!", TALKTYPE_PRIVATE, false, cid)
end
function Msg23(cid)
doCreatureSay(getCreatureByName("GM Bogo"), "Ou voc� pode fugir! Entre no teleport a {<- ESQUERDA PARA O BOSS} ou a {DIREITA PARA FUGIR ->}!", TALKTYPE_PRIVATE, false, cid)
end
function Msg24(cid)
doCreatureSay(getCreatureByName("GM Bogo"), "Boa Sorte amig�o!", TALKTYPE_PRIVATE, false, cid)
end