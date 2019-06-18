local vocations = {4,8} -- Vocs
local entermsg = "Welcome" -- Msg se puder passar
local failmsg = "Sorry, only knights here." -- Msg se não tiver voc certa


function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
if isPlayer(cid) then
if isInArray(vocations,getPlayerVocation(cid)) then
doPlayerSendTextMessage(cid,25,entermsg)
doSendAnimatedText(getCreaturePosition(cid), "Enjoy!", TEXTCOLOR_RED)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREWORK_RED)
else
doTeleportThing(cid,fromPosition)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
doPlayerSendTextMessage(cid,25,failmsg)
end
return true
end
end