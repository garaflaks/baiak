local delay = 4000
function sendVipEffect(cid)
    if isPlayer(cid) and isPremium(cid) and getPlayerGroupId(cid) < 6 then
        doSendAnimatedText(getThingPos(cid), "[VIP]", 181)
		doSendMagicEffect(getCreaturePosition(cid), 29)
        addEvent(sendVipEffect, delay, cid)
    end
end
function onLogin(cid)
    sendVipEffect(cid)
    return true
end