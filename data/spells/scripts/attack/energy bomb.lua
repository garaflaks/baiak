local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGYBALL)
setCombatParam(combat, COMBAT_PARAM_CREATEITEM, 1495)

local area = createCombatArea(AREA_SQUARE1X1)
setCombatArea(combat, area)

function onCastSpell(cid, var)
if BlockRunesInArea(cid) then
doPlayerSendCancel(cid, "voc� n�o pode jogar runas nesta area.") return false
end
	return doCombat(cid, combat, var)
end