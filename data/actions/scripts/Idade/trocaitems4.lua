function onUse(cid, item, frompos, item2, topos)

local posicEx = {x=1001, y=432, z=7}

	if item.uid == 5823 then
	if getPlayerStorageValue(cid,5820) == -1 then
		if getPlayerItemCount(cid, 12721) >= 1 then
		doPlayerRemoveItem(cid, 12721,1)
		doPlayerAddItem(cid, 12719, 1)
			doPlayerPopupFYI(cid, "Voce trocou seu Elite Club por um Super Club.")
			doTeleportThing(cid, posicEx, true)
				setPlayerStorageValue(cid,5820,1)
			else
		doPlayerPopupFYI(cid, "Você não tem um Elite Club!") 

		end
		else
			doPlayerPopupFYI(cid, "Voce ja fez sua troca, é permitida apenas uma.")
			 doTeleportThing(cid, posicEx, true)
		end
end
end
