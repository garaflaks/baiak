function onStepIn(cid, item, position, fromPosition)


local idade = 25
local timetry = (idade * 60)
local posic = {x=855, y=393, z=7}

local posicEx = {x=1001, y=432, z=7}

if getPlayerStorageValue(cid, 6723) >= timetry then
if getPlayerStorageValue(cid, 6827) == -1 then
doTeleportThing(cid, posic, true)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
	  addEvent(Msg51, 1000, cid)
	  addEvent(Msg52, 4500, cid)
	  addEvent(Msg53, 7000, cid)
	  addEvent(Msg54, 10000, cid)

doSendMagicEffect(getThingPos(cid), 27)	
doSendMagicEffect({x=854, y=393, z=7}, 28)	
doSendMagicEffect({x=856, y=393, z=7}, 28)		
else
doPlayerPopupFYI(cid, "Voc� j� completou essa quest rapais!") 
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE) 
doTeleportThing(cid, posicEx, true) 
end
else
doPlayerPopupFYI(cid, "Voc� n�o tem 25 anos de idade mocinho!") 
 doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE) 
 doTeleportThing(cid, posicEx, true)
end
end

function Msg51(cid)
doCreatureSay(getCreatureByName("GM Bogo"), "T� mais responsavel agora ou ainda ca�ando noobs? T� de olho em voc�! Parab�ns pelos 25 anos!! Muito obrigado por ficar este tempo online!", TALKTYPE_PRIVATE, false, cid)
end
function Msg52(cid)
doCreatureSay(getCreatureByName("GM Bogo"), "Vou-lhe recompensar, mas voc� sabe que tem um pre�o. Voc� ter� que enfrentar um boss!", TALKTYPE_PRIVATE, false, cid)
end
function Msg53(cid)
doCreatureSay(getCreatureByName("GM Bogo"), "Ou voc� pode fugir! Entre no teleport a {<- ESQUERDA PARA O BOSS} ou a {DIREITA PARA FUGIR ->}!", TALKTYPE_PRIVATE, false, cid)
end
function Msg54(cid)
doCreatureSay(getCreatureByName("GM Bogo"), "Boa Sorte amig�o!", TALKTYPE_PRIVATE, false, cid)
end