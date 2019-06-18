function onDeath(cid, corpse, deathList)
	if getCreatureStorage(cid, 'BossInvasion') == 1 then
		local uid = getTileItemById(BossInvasion.positions.gate, BossInvasion.gateid).uid
		
		if uid == 0 then
			doCreateItem(BossInvasion.gateid, 1, BossInvasion.positions.gate)
		end
	end
	
	local killer = deathList[1]
	
	if isPlayer(killer) then
		doBroadcastMessage(('[INVASÃO]: O aventureiro %s conseguiu derrotar o %s. Temos um novo herói na cidade!'):format(getCreatureName(killer), BossInvasion.bossname))
	end
	
	return true
end