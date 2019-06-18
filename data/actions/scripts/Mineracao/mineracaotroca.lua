function onUse(cid, item, frompos, item2, topos)

	if item.uid == 5982 then
		if getPlayerItemCount(cid, 12543) >= 100 then
		doPlayerRemoveItem(cid, 12543,100)
		doPlayerAddItem(cid, 2319, 1)
	  	addEvent(magic1, 500, cid)
	  	addEvent(CUZAO, 1500, cid)
	  	addEvent(XOTA, 1000, cid)
			doPlayerPopupFYI(cid, "Você trocou 100 pedras de mineração \npor 1 Reflect Stone.") 
		else
		doPlayerPopupFYI(cid, "Você não tem 100 pedras de mineração!") 
		doSendMagicEffect(getPlayerPosition(cid), 2)
		end
end
end

function magic1(cid)
local posx1 = {x=530, y=71, z=7}
		doSendMagicEffect(posx1, 44)
end

function XOTA(cid)
local posx2 = {x=531, y=71, z=7}
		doSendMagicEffect(posx2, 26)
end

function CUZAO(cid)
local posx3 = {x=532, y=71, z=7}
		doSendMagicEffect(posx3, 12)
end