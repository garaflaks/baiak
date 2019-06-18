local Configs = {
	Storages = {134154, 34321, 133133},
}

local condition = createConditionObject(CONDITION_OUTFIT)
setConditionParam(condition, CONDITION_PARAM_TICKS, -1)
addOutfitCondition(condition, {lookTypeEx = 9242, lookType = 0, lookHead = 0, lookBody = 0, lookLegs = 0, lookFeet = 0})

function onStepIn(cid, item, fromPosition, itemEx, toPosition) 
	if isPlayer(cid) then
		doAddCondition(cid, condition)
		if getPlayerGuildId(cid) ~= 0 then
			local PlayerGuildID = getPlayerGuildId(cid)
			local DomainGUILD = getGlobalStorageValue(Configs.Storages[3])
			if PlayerGuildID ~= DomainGUILD then
				setPlayerStorageValue(cid, DomainGUILD, PlayerGuildID)
				if getPlayerStorageValue(cid, Configs.Storages[1]) == -1 then
					setPlayerStorageValue(cid, Configs.Storages[1],0)
				end                  
				setGlobalStorageValue(Configs.Storages[3], getPlayerGuildId(cid))
				doBroadcastMessage("A guild \"".. getPlayerGuildName(cid) .."\" acabou de roubar o trono do Castle War. Se ninguem conseguir roubar o titulo, a guild dele reinará até o proximo evento!", 22)
				doCreatureSay(cid, "Castelo ownado by \"".. getPlayerGuildName(cid) .."\", defenda até o fim do evento!", TALKTYPE_ORANGE_1)
				doSendMagicEffect(getThingPos(cid), 39)
				db.executeQuery("DELETE FROM `castle_war` WHERE `id` = 1;")
				db.executeQuery("INSERT INTO `castle_war` (`id`, `guild_id`, `name`) VALUES (1, " .. getPlayerGuildId(cid) .. ", '" .. getPlayerGuildName(cid) .. "');")
			else
				doPlayerSendCancel(cid, "Este castelo ja foi conquistado pela sua guild!")
				doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
			end
		else
			doPlayerSendCancel(cid, "É nescessario ter guild para dominar o castelo!")
			doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
		end
	end
	return true
end

function onStepOut(cid, item, position, fromPosition)
	if isPlayer(cid) then
		doRemoveCondition(cid, CONDITION_OUTFIT)
	end
	return true
end