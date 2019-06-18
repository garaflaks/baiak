local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HITBYFIRE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)
setCombatParam(combat, COMBAT_PARAM_CREATEITEM, 1492)

function onCastSpell(cid, var)
if BlockRunesInArea(cid) then
doPlayerSendCancel(cid, "você não pode jogar runas nesta area.") return false
end
	return doCombat(cid, combat, var)
end
