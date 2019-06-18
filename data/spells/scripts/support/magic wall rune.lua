local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
setCombatParam(combat, COMBAT_PARAM_CREATEITEM, ITEM_MAGIC_WALL)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
function onCastSpell(cid, var)
if BlockRunesInArea(cid) then
doPlayerSendCancel(cid, "você não pode jogar runas nesta area.") return false
end
return doCombat(cid, combat, var) 
end