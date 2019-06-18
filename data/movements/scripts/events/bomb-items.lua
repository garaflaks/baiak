function onStepIn(cid, item, pos, fromPos)
	if isInRange(pos, bomb_config.from, bomb_config.to) then
		if item.itemid == 8304 then
			local n = getPlayerStorageValue(cid, bomb_config.storage.max)
			if n < 3 then
				setPlayerStorageValue(cid, bomb_config.storage.max, n + 1)
				doRemoveItem(item.uid)
				doSendMagicEffect(pos, CONST_ME_FIREATTACK)
			end
		elseif item.itemid == 8310 then
			local n = getPlayerStorageValue(cid, bomb_config.storage.radius)
			if n < 4 then
				setPlayerStorageValue(cid, bomb_config.storage.radius, n)
				doRemoveItem(item.uid)
				doSendMagicEffect(pos, CONST_ME_GROUNDSHAKER)
			end
		end
	end
end