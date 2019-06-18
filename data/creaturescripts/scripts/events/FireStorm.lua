function onStatsChange(cid, attacker, type, combat, value)
	if type == 1 and getCreatureHealth(cid) <= value then
		if isInRange(getThingPos(cid), {x=522,y=655,z=7}, {x=564,y=676,z=7}) then
			doCreatureAddMana(cid, - getCreatureMana(cid))
			doItemSetAttribute(doCreateItem(3058, 1, getPlayerPosition(cid)), "Descrição", "Você reconhece " .. getCreatureName(cid) .. "? Foi morto pelo fogo.")
			doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ORANGE, 'VOCÊ PERDEU.')
			return false
		end
	end
	return true
end