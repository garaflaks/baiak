function onUse(cid, item, frompos, item2, topos)

local posicEx = {x=1001, y=432, z=7}

	if item.uid == 5821 then
	if getPlayerStorageValue(cid,5820) == -1 then
		if getPlayerItemCount(cid, 12677) >= 1 then
		doPlayerRemoveItem(cid, 12677,1)
		doPlayerAddItem(cid, 12725, 1)
			doPlayerPopupFYI(cid, "Voce trocou seu Elite Axe por um Super Axe.")
			doTeleportThing(cid, posicEx, true)
				setPlayerStorageValue(cid,5820,1)
			else
		doPlayerPopupFYI(cid, "Você não tem um Elite Axe!") 
		end
		else
			doPlayerPopupFYI(cid, "Voce ja fez sua troca, é permitida apenas uma.")
			 doTeleportThing(cid, posicEx, true)
		end
end
end
