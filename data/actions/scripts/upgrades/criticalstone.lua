local config = {
	effectonuse = 14,
	levelscrit = 100,
	storagecrit = 48913
}

function onUse(cid, item, frompos, item2, topos)
	if getPlayerStorageValue(cid, config.storagecrit) < config.levelscrit then
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(topos,config.effectonuse)
		doPlayerSendTextMessage(cid,22,"Você aumentou seu Critical Skill para ["..(getPlayerStorageValue(cid, config.storagecrit)+1).."/"..config.levelscrit.."].")
		setPlayerStorageValue(cid, config.storagecrit, getPlayerStorageValue(cid, config.storagecrit)+1)
		elseif getPlayerStorageValue(cid, config.storagecrit) >= config.levelscrit then
			doPlayerSendTextMessage(cid,22,"Você já alcançou o level maximo de Critical Skill.\nParabéns!!!!")
			return 0
		end
		return 1
	end