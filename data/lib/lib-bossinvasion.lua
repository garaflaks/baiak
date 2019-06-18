BossInvasion = {
	
	gateid = 9485, -- id da gate
	bossname = 'Ideal Boss', -- nome do boss
	
	positions = {
	
		gate = {x = 193, y = 81, z = 7}, -- posição da gate
		boss = {x = 193, y = 85, z = 7} -- posição de onde o boss irá nascer
	}
}


function BossInvasion:spawnBoss()
	local boss = doCreateMonster(self.bossname, self.positions.boss)
	doCreatureSetStorage(boss, 'BossInvasion', 1)

	doSetStorage('BossInvasion', os.time() + 30 * 60)
	
	local uid = getTileItemById(self.positions.gate, self.gateid).uid
	if uid > 0 then
		doRemoveItem(uid)
	end
	
	doBroadcastMessage(('[INVASÃO]: O boss %s nasceu ao sudeste da cidade! A cidade está em apuros. Mate-o e receba recompensas por salvar a cidade. TODOS OS GUERREIROS TERÃO 30 MINUTOS PARA DEROTA-LO.'):format(self.bossname), MESSAGE_EVENT_ADVANCE)
end


function BossInvasion:remove()
	for _, pid in ipairs(getMonstersOnline()) do
		if getCreatureStorage(pid, 'BossInvasion') == 1 then
		    doCreatureSay(pid, 'Adeus humanos patéticos!', TALKTYPE_MONSTER_SAY)
			doBroadcastMessage(('[INVASÃO]: O %s sumiu pois ninguém conseguiu derrotá-lo dentro de 30 minutos.'):format(self.bossname), MESSAGE_EVENT_ADVANCE)
			
			doRemoveCreature(pid)
			return true
		end
	end
	
	return false
end