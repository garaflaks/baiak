local save = {}
function saveRepeat(cid)
if not isPlayer(cid) then return true end
doPlayerSave(cid)
doPlayerSendTextMessage(cid,19, 'Your character\'s progress is saved.')
doSendMagicEffect(getThingPos(cid), 3)
save[cid] = addEvent(saveRepeat, math.random(1,1) *600*1000, cid)
end
function onLogin(cid)
save[cid] = addEvent(saveRepeat, math.random(1,1)*600*1000, cid)
return true
end
function onLogout(cid)
stopEvent(save[cid])
return true
end