function onThink()
	if getStorage('BossInvasion') > os.time() then
		return true
	end
	
	if BossInvasion:remove() then
		local uid = getTileItemById(BossInvasion.positions.gate, BossInvasion.gateid).uid
		
		if uid == 0 then
			doCreateItem(BossInvasion.gateid, 1, BossInvasion.positions.gate)
		end
	end
	
	return true
end

function onTime()
	
	BossInvasion:spawnBoss()
	return true
end