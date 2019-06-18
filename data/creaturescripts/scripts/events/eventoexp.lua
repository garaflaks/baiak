function onKill(cid, target)
  if (getGlobalStorageValue(cid, 49777)) == 1 then
    if isPlayer(cid) and isPlayer(target) then
if getPlayerGuildId(cid) == 0 then
 guild = 1
else
 guild = getPlayerGuildId(cid)
end

if getPlayerGuildId(target) == 0 then
 guild2 = 2
else
 guild2 = getPlayerGuildId(target)
end
local ip1 = getPlayerIp(cid)
local ip2 = getPlayerIp(target)


    local exp1 = (getPlayerLevel(target) * getPlayerLevel(target) * 25)
        if getPlayerLevel(cid) <= 2550 then
local config2 = {
msgWelcome = "Você ganhou "..exp1.." de experiencia ao matar o player "..getCreatureName(target)..", pois o evento PVPENFORCED está ativo até as 22horas!"
}

if ip1 ~= ip2 then
if guild1 ~= guild2 then
if not isInParty(cid) then
doPlayerAddExp(cid, exp1)    
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, config2.msgWelcome)
doCreatureSay(cid, ""..getCreatureName(cid).." ganhou "..exp1.." de experiencia por matar o player "..getCreatureName(target)..".", TALKTYPE_ORANGE_1)
            end
        end
end
end
end
end
   return true
end