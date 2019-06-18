local lvldodge = 11903
local percent = 0.7


function onStatsChange(cid, attacker, type, combat, value)
if isPlayer(cid) and isPlayer(attacker) then
if type == STATSCHANGE_HEALTHLOSS or type == STATSCHANGE_MANALOSS and isCreature(attacker) then
if (getPlayerStorageValue(cid, lvldodge)*2) >= math.random (0,1000) then
value = math.ceil(value*(percent))
doTargetCombatHealth(cid, attacker, combat, -value, -value, 255)
doSendAnimatedText(getCreaturePos(cid), "REFLECT", 16)
return true
end
end
end
return true
end