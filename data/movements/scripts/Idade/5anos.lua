function onStepIn(cid, item, position, fromPosition)


local idade = 5
local timetry = (idade * 60)
local posic = {x=857, y=341, z=7}

local posicEx = {x=1001, y=432, z=7}

if getPlayerStorageValue(cid, 6723) >= timetry then
if getPlayerStorageValue(cid, 6823) == -1 then
doTeleportThing(cid, posic, true)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
	  addEvent(Msg1, 1000, cid)
	  addEvent(Msg2, 4500, cid)
	  addEvent(Msg3, 7000, cid)
	  addEvent(Msg4, 10000, cid)

doSendMagicEffect(getThingPos(cid), 27)	
doSendMagicEffect({x=856, y=341, z=7}, 28)	
doSendMagicEffect({x=858, y=341, z=7}, 28)		
else
doPlayerPopupFYI(cid, "Você já completou essa quest rapais!") 
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE) 
doTeleportThing(cid, posicEx, true) 
end
else
doPlayerPopupFYI(cid, "Você não tem 5 anos de idade mocinho!") 
 doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE) 
 doTeleportThing(cid, posicEx, true)
end
end

function Msg1()
doCreatureSay(getCreatureByName("GM Bogo"), "Opa, você chegou a 5 anos de idade, Parabéns!! Muito obrigado por ficar este tempo online!", TALKTYPE_PRIVATE, false, cid)
end
function Msg2()
doCreatureSay(getCreatureByName("GM Bogo"), "Vou-lhe recompensar, mas você sabe que tem um preço. Você terá que enfrentar um boss!", TALKTYPE_PRIVATE, false, cid)
end
function Msg3()
doCreatureSay(getCreatureByName("GM Bogo"), "Ou você pode fugir! Entre no teleport a {<- ESQUERDA PARA O BOSS} ou a {DIREITA PARA FUGIR ->}!", TALKTYPE_PRIVATE, false, cid)
end
function Msg4()
doCreatureSay(getCreatureByName("GM Bogo"), "Boa Sorte amigão!", TALKTYPE_PRIVATE, false, cid)
end