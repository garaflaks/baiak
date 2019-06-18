-- Ids das vocations separadas por vírgulas (nesse exemplo 2 - druid e 6 - elder druid)
local vocation_ids = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}
 -- nome dos monstros que não poderão ser atacados, separados por vírgulas e entre aspas
local monsterNames = {"zombie event"}

function onCombat(cid, target)
	if not isPlayer(cid) or not isMonster(target) then
		return true
	end
	if isInArray(vocation_ids, getPlayerVocation(cid)) and isInArray(monsterNames, getCreatureName(target):lower()) then
		return false
	end
	return true
end