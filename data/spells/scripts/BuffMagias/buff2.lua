local tempo = 60 -- tempo em segundos.
local effecX = {13} -- effect no player, caso queira apenas 1, basta remover os outros numeros.

local ml = 30 -- quantos ira aumentar o skill de ML
local skillfist = 0 -- quantos ira aumentar o skill de Fist
local skillsword = 0 -- quantos ira aumentar o skill de Sword
local skillaxe = 0 -- quantos ira aumentar o skill de Axe
local skillclub = 0 -- quantos ira aumentar o skill de Club
local skilldistance = 0 -- quantos ira aumentar o skill de Distance
local skillshield = 0 -- quantos ira aumentar o skill de Shield
local health = 0 -- A cada 1 segundo quantos aumentar de vida
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICLEVEL, ml)
setConditionParam(condition, CONDITION_PARAM_SKILL_FIST, skillfist)
setConditionParam(condition, CONDITION_PARAM_SKILL_SWORD, skillsword)
setConditionParam(condition, CONDITION_PARAM_SKILL_AXE, skillaxe)
setConditionParam(condition, CONDITION_PARAM_SKILL_CLUB, skillclub)
setConditionParam(condition, CONDITION_PARAM_SKILL_DISTANCE, skilldistance)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, skillshield)
setConditionParam(condition, CONDITION_PARAM_OUTFIT, outfit)
setCombatCondition(combat, condition)

local condition = createConditionObject(CONDITION_REGENERATION)
setConditionParam(condition, CONDITION_PARAM_SUBID, 1)
setConditionParam(condition, CONDITION_PARAM_BUFF, TRUE)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
setConditionParam(condition, CONDITION_PARAM_HEALTHGAIN, health)
setConditionParam(condition, CONDITION_PARAM_HEALTHTICKS, 1000)
setCombatCondition(combat, condition)

function magicEffect2(tempo2,tempo3,cid)
if (isCreature(cid)) then
if getPlayerStorageValue(cid, 102053) > 0 and getCreatureCondition(cid, CONDITION_REGENERATION, 1) then
for i=1, #effecX do
local position = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
doSendMagicEffect(position, effecX[i])
end
end
end
end


function onCastSpell(cid, var)
local position127 = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
if getPlayerStorageValue(cid, 102053) ~= 1 or getCreatureCondition(cid, CONDITION_REGENERATION, 1) == false then
doCombat(cid, combat, var)
tempo2 = 0
while (tempo2 ~= (tempo*1000)) do
addEvent(magicEffect2, tempo2, tempo2, tempo*1000, cid)
tempo2 = tempo2 + 300
end
setPlayerStorageValue(cid, 102053,1) -- storage verifica transformado, quando = 1 player esta transformado.
doCreatureSay(cid, "Buff Magic", TALKTYPE_MONSTER)
doSendMagicEffect(position127, 3)
else
doPlayerSendCancel(cid, "Sorry, you already buffed.")
end
end