local acombat = createCombatObject()
local arr = {
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}
}
local area = createCombatArea(arr)
setCombatArea(acombat, area)
local c = createCombatObject()
setCombatParam(c, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(c, COMBAT_PARAM_EFFECT, 52)
setCombatFormula(c, COMBAT_FORMULA_LEVELMAGIC,-9.5,-67, -9.8, 70)


local arr1 = {
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}
}

local area1 = createCombatArea(arr1)
setCombatArea(c, area1)

function combat(pp)
cid = pp.cid
c = pp.c
var = pp.var
doCombat(cid, c, var)
end
function onTargetTile(cid, pos)
npos = {x = pos.x, y = pos.y, z = pos.z}
npos.x = npos.x - 3
npos.y = npos.y - 3
doSendDistanceShoot(npos, pos, 12)
end

setCombatCallback(acombat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

function onCastSpell(cid, var)
pp = {cid = cid, c = c, var = var}
addEvent(combat, 300, pp)
return doCombat(cid, acombat, var)
end