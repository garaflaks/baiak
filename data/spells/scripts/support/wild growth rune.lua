local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EARTH)
setCombatParam(combat, COMBAT_PARAM_CREATEITEM, 1499)
function onCastSpell(cid, var)
if BlockRunesInArea(cid) then
doPlayerSendCancel(cid, "você não pode jogar runas nesta area.") return false
end
return doCombat(cid, combat, var) 
end