function onPrepareDeath(cid, corpse, lastHitKiller, mostDamageKiller)

if getPlayerStorageValue(cid, battlefield.storage2) ~= -1 then
	local team = getPlayerStorageValue(cid, battlefield.storage2) == 1 and battlefield.team1Name or battlefield.team2Name
	setPlayerStorageValue(cid, battlefield.storage2, -1)
	doRemoveCondition(cid, CONDITION_OUTFIT)
	doBroadCastBattle(23,"[BATTLEFIELD] o lutador " .. getCreatureName(cid) .. " do time " .. team .. " morreu.") 
end

return true
end