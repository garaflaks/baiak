local efeito = {27,28, 29,79}

function onUse(cid, item, frompos, item2, topos)
	if getPlayerStorageValue(cid, 89210) == 1 then
		doPlayerSendTextMessage(cid,22,"You already used this book!")
	else
		doPlayerSendTextMessage(cid,22,"Congratulations! From now, you will be blessed automatically.")
			setPlayerStorageValue(cid, 89210, 1)
				doRemoveItem(item.uid, 1)
					doSendMagicEffect(getThingPos(cid), efeito[math.random(#efeito)])
	end
end