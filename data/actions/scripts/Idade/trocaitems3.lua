function onUse(cid, item, frompos, item2, topos)

local posicEx = {x=1001, y=432, z=7}


	if item.uid == 5822 then
	if getPlayerStorageValue(cid,5820) == -1 then
		if getPlayerItemCount(cid, 12724) >= 1 then
		doPlayerRemoveItem(cid, 12724,1)
		doPlayerAddItem(cid, 12723, 1)
			doPlayerPopupFYI(cid, "Voce trocou sua Elite Sword por uma Super Sword.")
			doTeleportThing(cid, posicEx, true)
				setPlayerStorageValue(cid,5820,1)
			else
		doPlayerPopupFYI(cid, "Voc� n�o tem uma Elite Sword!") 

		end
		else
			doPlayerPopupFYI(cid, "Voce ja fez sua troca, � permitida apenas uma.")
			 doTeleportThing(cid, posicEx, true)
		end
end
end