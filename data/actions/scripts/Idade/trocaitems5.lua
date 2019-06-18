function onUse(cid, item, frompos, item2, topos)

local posicEx = {x=1001, y=432, z=7}

	if item.uid == 5824 then
	if getPlayerStorageValue(cid,5820) == -1 then
		if getPlayerItemCount(cid, 12727) >= 1 then
		doPlayerRemoveItem(cid, 12727,1)
		doPlayerAddItem(cid, 12695, 1)
			doPlayerPopupFYI(cid, "Voce trocou sua Elite Wand por uma Super Wand.")
			doTeleportThing(cid, posicEx, true)
				setPlayerStorageValue(cid,5820,1)
			else
		doPlayerPopupFYI(cid, "Você não tem uma Elite Wand!") 
		end
		else
			doPlayerPopupFYI(cid, "Voce ja fez sua troca, é permitida apenas uma.")
			 doTeleportThing(cid, posicEx, true)
		end
end
end
