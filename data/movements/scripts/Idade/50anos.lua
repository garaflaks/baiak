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
doPlayerPopupFYI(cid, "Você já completou essa quest rapais!") 
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE) 
doTeleportThing(cid, posicEx, true) 
end
else
doPlayerPopupFYI(cid, "Você não tem 50 anos de idade mocinho!") 
 doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE) 
 doTeleportThing(cid, posicEx, true)
end
end

function Msg91(cid)
doCreatureSay(getCreatureByName("GM Bogo"), "E não é que se tornou um sabio mesmo?! Não é só um parabéns que eu lhe devo, é muito mais!!! Muito obrigado por ficar este tempo online conosco!", TALKTYPE_PRIVATE, false, cid)
end
function Msg92(cid)
doCreatureSay(getCreatureByName("GM Bogo"), "Vou-lhe recompensar muito dessa vez, te darei uma raridade de verdade, mas como você já sabe, tem um preço. Você terá que enfrentar o ultimo e mais temivel boss!", TALKTYPE_PRIVATE, false, cid)
end
function Msg93(cid)
doCreatureSay(getCreatureByName("GM Bogo"), "Ou você pode fugir! Entre no teleport a {<- ESQUERDA PARA O BOSS} ou a {DIREITA PARA FUGIR ->}!", TALKTYPE_PRIVATE, false, cid)
end
function Msg94(cid)
doCreatureSay(getCreatureByName("GM Bogo"), "Boa Sorte amigão!", TALKTYPE_PRIVATE, false, cid)
end