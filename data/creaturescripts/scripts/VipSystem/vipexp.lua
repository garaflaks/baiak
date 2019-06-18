function onLogin(cid)

local rate = 1.3 -- 30%
local config = {
welvip = "Voce possui "..((rate - 1)*100).."% de exp bonus por ser VIP!",
not_vip = "Compre Account VIP e ganhe "..((rate - 1)*100).."% a mais de experiencia entre outras facilidades!",
vip = isPremium(cid) 
}

if (config.vip == TRUE) then
doPlayerSetExperienceRate(cid, rate)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, config.welvip)
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, config.not_vip)
end
return TRUE
end