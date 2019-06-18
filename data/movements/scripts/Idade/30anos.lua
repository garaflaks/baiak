function onStepIn(cid, item, position, fromPosition)


local idade = 30
local timetry = (idade * 60)
local posic = {x=885, y=393, z=7}

local posicEx = {x=1001, y=432, z=7}

if getPlayerStorageValue(cid, 6723) >= timetry then
if getPlayerStorageValue(cid, 6828) == -1 then
doTeleportThing(cid, posic, true)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
	  addEvent(Msg61, 1000, cid)
	  addEvent(Msg62, 4500, cid)
	  addEvent(Msg63, 7000, cid)
	  addEvent(Msg64, 10000, cid)

doSendMagicEffect(getThingPos(cid), 27)	
doSendMagicEffect({x=884, y=393, z=7}, 28)	
doSendMagicEffect({x=886, y=393, z=7}, 28)		
else
doPlayerPopupFYI(cid, "Você já completou essa quest rapais!") 
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE) 
doTeleportThing(cid, posicEx, true) 
end
else
doPlayerPopupFYI(cid, "Você não tem 30 anos de idade mocinho!") 
 doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE) 
 doTeleportThing(cid, posicEx, true)
end
end

function Msg61(cid)
doCreatureSay(getCreatureByName("GM Bogo"), "Dizem que a melhor idade é os 30, mas acho que nesse mundo é 50 viu?! Parabéns pelos 30 anos!! Muito obrigado por ficar este tempo online!", TALKTYPE_PRIVATE, false, cid)
end
function Msg62(cid)
doCreatureSay(getCreatureByName("GM Bogo"), "Vou-lhe recompensar, mas você sabe que tem um preço. Você terá que enfrentar um boss!", TALKTYPE_PRIVATE, false, cid)
end
function Msg63(cid)
doCreatureSay(getCreatureByName("GM Bogo"), "Ou você pode fugir! Entre no teleport a {<- ESQUERDA PARA O BOSS} ou a {DIREITA PARA FUGIR ->}!", TALKTYPE_PRIVATE, false, cid)
end
function Msg64(cid)
doCreatureSay(getCreatureByName("GM Bogo"), "Boa Sorte amigão!", TALKTYPE_PRIVATE, false, cid)
end