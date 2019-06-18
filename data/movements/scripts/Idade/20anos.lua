function onStepIn(cid, item, position, fromPosition)


local idade = 20
local timetry = (idade * 60)
local posic = {x=950, y=342, z=7}

local posicEx = {x=1001, y=432, z=7}

if getPlayerStorageValue(cid, 6723) >= timetry then
if getPlayerStorageValue(cid, 6826) == -1 then
doTeleportThing(cid, posic, true)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
	  addEvent(Msg41, 1000, cid)
	  addEvent(Msg42, 4500, cid)
	  addEvent(Msg43, 7000, cid)
	  addEvent(Msg44, 10000, cid)

doSendMagicEffect(getThingPos(cid), 27)	
doSendMagicEffect({x=949, y=342, z=7}, 28)	
doSendMagicEffect({x=951, y=342, z=7}, 28)		
else
doPlayerPopupFYI(cid, "Você já completou essa quest rapais!") 
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE) 
doTeleportThing(cid, posicEx, true) 
end
else
doPlayerPopupFYI(cid, "Você não tem 20 anos de idade mocinho!") 
 doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE) 
 doTeleportThing(cid, posicEx, true)
end
end

function Msg41(cid)
doCreatureSay(getCreatureByName("GM Bogo"), "Um novo adulto no servidor, Parabéns pelos 20 anos!! Muito obrigado por ficar este tempo online!", TALKTYPE_PRIVATE, false, cid)
end
function Msg42(cid)
doCreatureSay(getCreatureByName("GM Bogo"), "Vou-lhe recompensar, mas você sabe que tem um preço. Você terá que enfrentar um boss!", TALKTYPE_PRIVATE, false, cid)
end
function Msg43(cid)
doCreatureSay(getCreatureByName("GM Bogo"), "Ou você pode fugir! Entre no teleport a {<- ESQUERDA PARA O BOSS} ou a {DIREITA PARA FUGIR ->}!", TALKTYPE_PRIVATE, false, cid)
end
function Msg44(cid)
doCreatureSay(getCreatureByName("GM Bogo"), "Boa Sorte amigão!", TALKTYPE_PRIVATE, false, cid)
end