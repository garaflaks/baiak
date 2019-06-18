function onKill(cid, target)
if isPlayer(cid) and isPlayer(target) then
local temporary_level = getPlayerStorageValue(cid, ARMY_LEVEL) 
local temporary_exp = getPlayerStorageValue(cid, ARMY_EXPERIENCE)
	if (temporary_level < #ARMY) then
		if (getPlayerLevel(target) > getPlayerLevel(cid)) and not getTileInfo(getThingPos(cid)).pvp then
			if ((tonumber(temporary_exp) + tonumber(ARMY[temporary_level][1])) >= tonumber(ARMY[temporary_level][2])) then
				doPlayerAddMoney(cid, ARMY[temporary_level][4])	
				setPlayerStorageValue(cid, ARMY_LEVEL, temporary_level + 1)
				setPlayerStorageValue(cid, ARMY_EXPERIENCE, temporary_exp - tonumber(ARMY[temporary_level][2]) > 0 or 0)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "You has been gained a new patent: "..ARMY[getPlayerStorageValue(cid, ARMY_LEVEL)][3]..".")
				doSendMagicEffect(getCreaturePosition(cid), 27)
				if (getPlayerStorageValue(cid, ARMY_LEVEL) >= #ARMY) then
					doPlayerAddMoney(cid, ARMY[temporary_level][4])
					setPlayerStorageValue(cid, ARMY_EXPERIENCE, 0)
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "You receive the best patent, congratulations "..ARMY[#ARMY][3]..".")
					doSendMagicEffect(getCreaturePosition(cid), 27)
				end
			return true
			end
			setPlayerStorageValue(cid, ARMY_EXPERIENCE, (temporary_exp + ARMY[getPlayerStorageValue(cid, ARMY_LEVEL)][1]))
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "You killed "..getCreatureName(target).." and gained "..ARMY[getPlayerStorageValue(cid, ARMY_LEVEL)][1].." of "..(ARMY[getPlayerStorageValue(cid, ARMY_LEVEL)][2] - getPlayerStorageValue(cid, ARMY_EXPERIENCE)).." army points.")
			doSendMagicEffect(getCreaturePosition(cid), 13)
			db.query("UPDATE `players` SET `army_level` = " .. getPlayerStorageValue(cid, ARMY_LEVEL) .. " WHERE `id` = " .. getPlayerAccountId(cid) .. ";")
		end
	end
end
local temporary_level, temporary_exp = nil, nil
return true
end