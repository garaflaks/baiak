local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 37)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 35)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0, -450, 0, -570)

function onUseWeapon(cid, var)
return doCombat(cid, combat, var)
end