local acombat = createCombatObject()

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, 1)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 255)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -5.6,-400, -35.5, 350)

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

function onTargetTile(cid, pos)
rand = math.random(1 ,8)
if rand == 1 then
npos = {x = pos.x + 1, y = pos.y, z = pos.z}
elseif rand == 2 then
npos = {x = pos.x - 1, y = pos.y, z = pos.z}
elseif rand == 3 then
npos = {x = pos.x, y = pos.y + 1, z = pos.z}
elseif rand == 4 then
npos = {x = pos.x, y = pos.y - 1, z = pos.z}
elseif rand == 5 then
npos = {x = pos.x - 1, y = pos.y + 1, z = pos.z}
elseif rand == 6 then
npos = {x = pos.x + 1, y = pos.y + 1, z = pos.z}
elseif rand == 7 then
npos = {x = pos.x - 1, y = pos.y - 1, z = pos.z}
elseif rand == 8 then
npos = {x = pos.x + 1, y = pos.y - 1, z = pos.z}
end
doSendDistanceShoot(npos, pos, 27)
doCombat(cid,combat,positionToVariant(pos))
end

setCombatCallback(acombat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

function onCastSpell(cid, var)
return doCombat(cid, acombat, var)
end