function onStepIn(cid, item, position, fromPosition)


local idade = 50
local timetry = (idade * 60)
local posic = {x=920, y=443, z=7}

local posicEx = {x=1001, y=432, z=7}

if getPlayerStorageValue(cid, 6723) >= timetry then
if getPlayerStorageValue(cid, 5820) == -1 then
doTeleportThing(cid, posic, true)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
	  addEvent(Msg91, 1000, cid)
	  addEvent(Msg92, 4500, cid)
	  addEvent(Msg93, 7000, cid)
	  addEvent(Msg94, 10000, cid)

doSendMagicEffect(getThingPos(cid), 27)	
doSendMagicEffect({x=919, y=443, z=7}, 28)	
doSendMagicEffect({x=921, y=443, z=7}, 28)		
else
doPlayerPopupFYI(cid, "Voc� j� completou essa quest rapais!") 
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE) 
doTeleportThing(cid, posicEx, true) 
end
else
doPlayerPopupFYI(cid, "Voc� n�o tem 50 anos de idade mocinho!") 
 doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE) 
 doTeleportThing(cid, posicEx, true)
end
end

function Msg91(cid)
doCreatureSay(getCreatureByName("GM Bogo"), "E n�o � que se tornou um sabio mesmo?! N�o � s� um parab�ns que eu lhe devo, � muito mais!!! Muito obrigado por ficar este tempo online conosco!", TALKTYPE_PRIVATE, false, cid)
end
function Msg92(cid)
doCreatureSay(getCreatureByName("GM Bogo"), "Vou-lhe recompensar muito dessa vez, te darei uma raridade de verdade, mas como voc� j� sabe, tem um pre�o. Voc� ter� que enfrentar o ultimo e mais temivel boss!", TALKTYPE_PRIVATE, false, cid)
end
function Msg93(cid)
doCreatureSay(getCreatureByName("GM Bogo"), "Ou voc� pode fugir! Entre no teleport a {<- ESQUERDA PARA O BOSS} ou a {DIREITA PARA FUGIR ->}!", TALKTYPE_PRIVATE, false, cid)
end
function Msg94(cid)
doCreatureSay(getCreatureByName("GM Bogo"), "Boa Sorte amig�o!", TALKTYPE_PRIVATE, false, cid)
end