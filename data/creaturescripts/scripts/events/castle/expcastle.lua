function onLogin(cid)
storage_guild = getGlobalStorageValue(133133)
local rate = 1.2 -- 20%
local config = {
welvip = "Você recebeu "..((rate - 1)*100).."% de exp pois sua guild esta dominando o CASTLE WAR!",
not_vip = "Bem vindo ao Fantasy! \n A guild que domina o CASTLE WAR ganha "..((rate - 1)*100).."% a mais de experiencia!",
}

if getPlayerGuildId(cid) == storage_guild then
doPlayerSetExperienceRate(cid, rate)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.welvip)
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.not_vip)
end
return TRUE
end