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
    local id_moeda = 12730  ---MUITO IMPORTANTE, id da coin vip..

    if msgcontains(msg, 'depositar') then
        selfSay('Por favor, me diga quantos Premium coins voce gostaria de depositar?', cid)
        talkState[talkUser] = 1
    
    elseif msgcontains(msg, 'sacar') then
        selfSay('Por favor, me diga quantos Premium coins voce gostaria de sacar?', cid)
        talkState[talkUser] = 3

    elseif msgcontains(msg, 'saldo') then
        n = getVipBalance(cid)
        if n > 1 then
           selfSay('Voce tem '..n..' Premium coins.', cid)
        else
           selfSay('Voce tem '..n..' Premium coin.', cid)
        end
        talkState[talkUser] = 0

----------------------DEPOSITAR-------------------------------------------------------
    elseif talkState[talkUser] == 1 then
        if msgcontains(msg, 'all') then
            n = getPlayerItemCount(cid, id_moeda)
            if n < 1 then
               selfSay('Voce nao tem Premium coins para depositar.', cid)
               talkState[talkUser] = 0
               return true
            elseif n == 1 then
               selfSay('Voce quer depositar '..n..' Premium coin? diga {sim} ou {não}', cid)
            elseif n > 1 then       
               selfSay('Voce quer depositar '..n..' Premium coins? diga {sim} ou {não}', cid)
            end
            talkState[talkUser] = 2            
        else
            n = getNumber(msg)
               if n < 1 then
                  selfSay('Voce nao pode depositar valores menores que zero.', cid)
                  talkState[talkUser] = 1
                  return true
               elseif n > 9999 then
                  selfSay('Esse valor é muito alto para depositar.', cid)
                  talkState[talkUser] = 1
                  return true
               elseif n == 1 then
                  selfSay('Voce quer depositar '..n..' Premium coin? diga {sim} ou {não}', cid)
               elseif n > 1 then             
                  selfSay('Voce quer depositar '..n..' Premium coins? diga {sim} ou {não}', cid)
               end
            talkState[talkUser] = 2
        end

    elseif talkState[talkUser] == 2 then
        if msgcontains(msg, 'sim') then
            if getPlayerItemCount(cid, id_moeda) >= n then
                addVipAccount(cid, n)
                doPlayerRemoveItem(cid, id_moeda, n)            
                selfSay('Obrigado. Agora seu saldo é de ' ..getVipBalance(cid)..' Premium coins.', cid)
                talkState[talkUser] = 0
            else
                selfSay('Voce nao tem esse valor para depositar.', cid)
                talkState[talkUser] = 0
            end
        else
                selfSay('Responda Corretamente.', cid)
                talkState[talkUser] = 0
        end
    
----------------------SACAR------------------------------------------------------------------------------------------------------------------------------------    
    
    elseif talkState[talkUser] == 3 then
        if msgcontains(msg, 'all') then
           n = getVipBalance(cid)
            if n < 1 then
               selfSay('Desculpe, seu saldo é zero..', cid)
               talkState[talkUser] = 0
               return true
            elseif n == 1 then
               selfSay('Voce quer sacar '..n..' Premium coin? diga {sim} ou {não}', cid)
            elseif n > 1 then    
               selfSay('Voce quer sacar '..n..' Premium coins? diga {sim} ou {não}', cid)
            end
            talkState[talkUser] = 4            
        else
            n = getNumber(msg)
            if n < 1 then
               selfSay('Voce nao pode sacar valores menores que zero.', cid)
               talkState[talkUser] = 3
               return true
            elseif n > 99999 then
               selfSay('Esse valor é muito alto para sacar.', cid)
               talkState[talkUser] = 3
               return true
            elseif n == 1 then
               selfSay('Voce quer sacar '..n..' Premium coin? diga {sim} ou {não}', cid)
            elseif n > 1 then   
               selfSay('Voce quer sacar '..n..' Premium coins? diga {sim} ou {não}', cid)
            end
            talkState[talkUser] = 4
        end
        
    elseif talkState[talkUser] == 4 then
        if msgcontains(msg, 'sim') then
            if getVipBalance(cid) >= n then
                addVipAccount(cid, -n)
                doPlayerGiveItem(cid, id_moeda, n)
                if n == 1 then        
                   selfSay('Aqui esta, '..n..' Premium coin. Agora seu saldo é ' ..getVipBalance(cid)..' Premium coins.', cid)
                elseif n > 1 then
                   selfSay('Aqui esta, '..n..' Premium coins. Agora seu saldo é ' ..getVipBalance(cid)..' Premium coins.', cid)
                end
                talkState[talkUser] = 0
            else
                selfSay('Sua conta nao tem esse valor para sacar.', cid)
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