function onStepIn(cid, item, position, fromPosition)
if isPlayer(cid) then
if vip.hasVip(cid) == TRUE then
            doPlayerSendTextMessage(cid, 22, "Sua Free VIP acaba em "..os.date("%d %B %Y %X ",vip.getVip(cid)))
else
dir = getPlayerLookDir(cid)
pos = getCreaturePosition(cid)


doTeleportThing(cid, fromPosition, FALSE)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Somente jogadores com Free VIP podem entrar nesta �rea. Compre a sua permiss�o no andar debaixo.")
end
end
end