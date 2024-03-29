local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 
npcHandler:onThink() 
doCreatureSetLookDirection(getNpcId(), (2))
end

function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end

local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

if(msgcontains(msg, 'repair') or msgcontains(msg, 'soft')) then
selfSay('Voce deseja reparar a sua soft boots por 20k?', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
if(getPlayerItemCount(cid, 10021) >= 1) then
if(doPlayerRemoveMoney(cid, 20000) == TRUE) then
doPlayerRemoveItem(cid, 10021, 1)
doPlayerAddItem(cid, 2640)
selfSay('Aqui esta.', cid)
else
selfSay('Desculpe, mas voce nao tem dinheiro.', cid)
end
else
selfSay('Desculpe, mas voce nao possui um pair of worn soft boots.', cid)
end
talkState[talkUser] = 0
elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser]) == TRUE) then
talkState[talkUser] = 0
selfSay('Ok, obrigado.', cid)
end

return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())