------SCRIPT ORIGINALMENTE CRIADO PELO TFS, E ADPTADO POR Mirto, MiltonHit -------------
    local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)            npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)            npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                    npcHandler:onThink()                    end

function creatureSayCallback(cid, type, msg)
    if(not npcHandler:isFocused(cid)) then
        return false
    end

    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

--------------------MESSAGES------------------------------------------------------------------------------
    local id_moeda = 12734  ---MUITO IMPORTANTE, id da coin vip..

    if msgcontains(msg, 'depositar') then
        selfSay('Por favor me diga quantos Event coins voc� gostaria de depositar.', cid)
        talkState[talkUser] = 1
    
    elseif msgcontains(msg, 'sacar') then
        selfSay('Por favor me diga quantos Event coins voc� gostaria de sacar.', cid)
        talkState[talkUser] = 3

    elseif msgcontains(msg, 'saldo') then
        n = geteventBalance(cid)
        if n > 1 then
           selfSay('Seu saldo � de '..n..' Event coins.', cid)
        else
           selfSay('Seu saldo � de '..n..' Event coin.', cid)
        end
        talkState[talkUser] = 0

----------------------DEPOSITAR-------------------------------------------------------
    elseif talkState[talkUser] == 1 then
        if msgcontains(msg, 'all') then
            n = getPlayerItemCount(cid, id_moeda)
            if n < 1 then
               selfSay('Voc� n�o tem Event coins para depositar.', cid)
               talkState[talkUser] = 0
               return true
            elseif n == 1 then
               selfSay('Voc� quer depositar '..n..' Event coin? diga {sim} ou {n�o}', cid)
            elseif n > 1 then       
               selfSay('Voc� quer depositar '..n..' Event coins? diga {sim} ou {n�o}', cid)
            end
            talkState[talkUser] = 2            
        else
            n = getNumber(msg)
               if n < 1 then
                  selfSay('Voc� n�o pode depositar valores menores que zero.', cid)
                  talkState[talkUser] = 1
                  return true
               elseif n > 9999 then
                  selfSay('Este valor � muito alto para depositar.', cid)
                  talkState[talkUser] = 1
                  return true
               elseif n == 1 then
                  selfSay('Voc� quer depositar '..n..' Event coin? diga {sim} ou {n�o}', cid)
               elseif n > 1 then             
                  selfSay('Voc� quer depositar '..n..' Event coins? diga {sim} ou {n�o}', cid)
               end
            talkState[talkUser] = 2
        end

    elseif talkState[talkUser] == 2 then
        if msgcontains(msg, 'sim') then
            if getPlayerItemCount(cid, id_moeda) >= n then
                addeventAccount(cid, n)
                doPlayerRemoveItem(cid, id_moeda, n)            
                selfSay('Obrigado. Agora seu saldo � ' ..geteventBalance(cid)..' Event coins.', cid)
                talkState[talkUser] = 0
            else
                selfSay('Voc� nao tem essa quantidade para depositar.', cid)
                talkState[talkUser] = 0
            end
        else
                selfSay('Responda Corretamente.', cid)
                talkState[talkUser] = 0
        end
    
----------------------SACAR------------------------------------------------------------------------------------------------------------------------------------    
    
    elseif talkState[talkUser] == 3 then
        if msgcontains(msg, 'all') then
           n = geteventBalance(cid)
            if n < 1 then
               selfSay('Desculpa, seu saldo � zero.', cid)
               talkState[talkUser] = 0
               return true
            elseif n == 1 then
               selfSay('Voc� quer sacar '..n..' Event coin? diga {sim} ou {n�o}', cid)
            elseif n > 1 then    
               selfSay('Voc� quer sacar '..n..' Event coins? diga {sim} ou {n�o}', cid)
            end
            talkState[talkUser] = 4            
        else
            n = getNumber(msg)
            if n < 1 then
               selfSay('Voc� n�o pode sacar valores menores que zero.', cid)
               talkState[talkUser] = 3
               return true
            elseif n > 99999 then
               selfSay('Este valor � muito alto para sacar.', cid)
               talkState[talkUser] = 3
               return true
            elseif n == 1 then
               selfSay('Voc� quer sacar '..n..' Event coin? diga {sim} ou {n�o}', cid)
            elseif n > 1 then   
               selfSay('Voc� quer sacar '..n..' Event coins? diga {sim} ou {n�o}', cid)
            end
            talkState[talkUser] = 4
        end
        
    elseif talkState[talkUser] == 4 then
        if msgcontains(msg, 'sim') then
            if geteventBalance(cid) >= n then
                addeventAccount(cid, -n)
                doPlayerGiveItem(cid, id_moeda, n)
                if n == 1 then        
                   selfSay('Aqui est�, '..n..' Event coin. Agora seu saldo � ' ..geteventBalance(cid)..' Event coins.', cid)
                elseif n > 1 then
                   selfSay('Aqui est�, '..n..' Event coins. Agora seu saldo � ' ..geteventBalance(cid)..' Event coins.', cid)
                end
                talkState[talkUser] = 0
            else
                selfSay('Sua conta n�o tem esse valor para sacar.', cid)
                talkState[talkUser] = 0
            end
        else
                selfSay('Responda Corretamente.', cid)
                talkState[talkUser] = 0
        end
    end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())