function onStepIn(cid, item, position, fromPosition)


local idade = 15
local timetry = (idade * 60)
local posic = {x=921, y=343, z=7}

local posicEx = {x=1001, y=432, z=7}

if getPlayerStorageValue(cid, 6723) >= timetry then
if getPlayerStorageValue(cid, 6825) == -1 then
doTeleportThing(cid, posic, true)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
	  addEvent(Msg31, 1000, cid)
	  addEvent(Msg32, 4500, cid)
	  addEvent(Msg33, 7000, cid)
	  addEvent(Msg34, 10000, cid)

doSendMagicEffect(getThingPos(cid), 27)	
doSendMagicEffect({x=920, y=343, z=7}, 28)	
doSendMagicEffect({x=922, y=343, z=7}, 28)		
else
doPlayerPopupFYI(cid, "Voc� j� completou essa quest rapais!") 
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE) 
doTeleportThing(cid, posicEx, true) 
end
else
doPlayerPopupFYI(cid, "Voc� n�o tem 15 anos de idade mocinho!") 
 doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE) 
 doTeleportThing(cid, posicEx, true)
end
end

function Msg31(cid)
doCreatureSay(getCreatureByName("GM Bogo"), "Mas olha s�, j� � um adolescente, Parab�ns!! Muito obrigado por ficar este tempo online!", TALKTYPE_PRIVATE, false, cid)
end
function Msg32(cid)
doCreatureSay(getCreatureByName("GM Bogo"), "Vou-lhe recompensar, mas voc� sabe que tem um pre�o. Voc� ter� que enfrentar um boss!", TALKTYPE_PRIVATE, false, cid)
end
function Msg33(cid)
doCreatureSay(getCreatureByName("GM Bogo"), "Ou voc� pode fugir! Entre no teleport a {<- ESQUERDA PARA O BOSS} ou a {DIREITA PARA FUGIR ->}!", TALKTYPE_PRIVATE, false, cid)
end
function Msg34(cid)
doCreatureSay(getCreatureByName("GM Bogo"), "Boa Sorte amig�o!", TALKTYPE_PRIVATE, false, cid)
end