local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid

    if Task[msg] then
        if getPlayerStorageValue(cid, Task[msg].storage) == -1 then
            if getPlayerStorageValue(cid, Task[msg].storagecount) == Task[msg].count then
                local esperiencia = Task[msg].exp > 0 and "" ..Task[msg].exp.. " exp e " or ""
                local dineiro = Task[msg].money > 0 and "" .. Task[msg].money .. " gold coins e " or ""
                selfSay("Voce conseguiu completar a task de ".. msg .. ", parabens! Eu vou te dar " .. esperiencia .. "" .. dineiro .."alguns itens como recompensa.", cid)
                doPlayerAddExperience(cid, Task[msg].exp)
                doPlayerAddMoney(cid, Task[msg].money)
                doPlayerSetStorageValue(cid, Task[msg].storage, 1)
                for juba, prize in pairs(Task[msg].premios) do
                    doPlayerAddItem(cid, prize[1], prize[2])
                end
            else
                selfSay("Desculpe, mas voce ainda nao matou todos os " .. msg .. "s. Voce so matou " .. taskKills(cid, Task[msg].storagecount) .. " de " .. Task[msg].count .. " " .. msg .. "s.", cid)
            end
        else
            selfSay("Voce so pode recber uma vez o premio de cada task.", cid)
        end
    else
        selfSay("O que?", cid)
    end
    return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())