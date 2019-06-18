function onDeath(cid)
	 setZombiesToSpawnCount(getZombiesToSpawnCount() + 2)
	 doCreatureSay(cid, "Eu irei voltar!", 19)
	 return true
end