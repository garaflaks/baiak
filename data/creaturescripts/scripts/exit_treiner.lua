config_exit_treiner = {
	Warning = "[TRAINER SYSTEM] Favor trocar seu char de direção para evitar que ele seja kikado.", -- mensagem
	time = 3, -- a cada 3 minutos irá checar
	roudsKick = 3, -- se ele estiver parado na mesma direção por 3 checagem seguidas será kikado
	storages = {879780,879781}, -- n edite
	treiners = {"Trainer"} -- coloque aqui os Treiners do seu ot
}





--[[Functions List]]--


function doAddRoundExitTreiner(cid)
	if not isCreature(cid) then return LUA_ERROR end
	setPlayerStorageValue(cid, config_exit_treiner.storages[1], getPlayerStorageValue(cid, config_exit_treiner.storages[1]) < 0 and 1 or getPlayerStorageValue(cid, config_exit_treiner.storages[1])+1)
	if getRoundExitTreiner(cid) >= config_exit_treiner.roudsKick then
		doKickExitTreiner(cid)
	end	
end
function getRoundExitTreiner(cid)
	if not isCreature(cid) then return LUA_ERROR end
	return getPlayerStorageValue(cid, config_exit_treiner.storages[1]) < 0 and 1 or getPlayerStorageValue(cid, config_exit_treiner.storages[1])
end
function doResetExitTreiner(cid)
	if not isCreature(cid) then return LUA_ERROR end
	return setPlayerStorageValue(cid, config_exit_treiner.storages[1], 0)
end
function doKickExitTreiner(cid)
	if not isCreature(cid) then return LUA_ERROR end
	if getTileInfo(getCreaturePosition(cid)).protection or not getTreinerSpectators(cid) then
		doResetExitTreiner(cid)
		setPlayerStorageValue(cid, config_exit_treiner.storages[2], 0)
	else		
		doResetExitTreiner(cid)
		doRemoveCreature(cid)
	end
end
function getTreinerSpectators(cid)
	local t = getSpectators(getCreaturePosition(cid), 2, 2, false)
	if t then
		for _, cid in ipairs(t) do
			if isMonster(cid) and isInArray(config_exit_treiner.treiners, getCreatureName(cid)) then
				return true
			end
		end
	end
	return false
end
function doCheckLookDirExitTreiner(cid, r)
	if not isCreature(cid) then return LUA_ERROR end
	if getTreinerSpectators(cid) then
		local new = getCreatureLookDirection(cid)
		if r == new then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, config_exit_treiner.Warning) 
			doAddRoundExitTreiner(cid)
		else
			doResetExitTreiner(cid)
		end
		addEvent(doCheckLookDirExitTreiner,config_exit_treiner.time*60*1000, cid, new)
	else
		setPlayerStorageValue(cid, config_exit_treiner.storages[2], 0)
		doResetExitTreiner(cid)
	end 
end


--[[Script System]]--


function onLogin(cid)
    	doResetExitTreiner(cid)
	setPlayerStorageValue(cid, config_exit_treiner.storages[2], 0)
	registerCreatureEvent(cid, "NewExitTreiner")
	return true
end
function onCombat(cid, target)
	if not isCreature(cid) or not isPlayer(cid) then
		return true
	end
	if getPlayerStorageValue(cid, config_exit_treiner.storages[2]) - os.time() > 0 then
		return true
	end	
	if not isMonster(target) then
		return true
	end
	if isMonster(target) and not isInArray(config_exit_treiner.treiners, getCreatureName(target)) and getRoundExitTreiner(cid) > 0 then
		setPlayerStorageValue(cid, config_exit_treiner.storages[2], 0)
		doResetExitTreiner(cid) return true
	end
	if isMonster(target) and isInArray(config_exit_treiner.treiners, getCreatureName(target)) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, config_exit_treiner.Warning) 
		addEvent(doCheckLookDirExitTreiner, config_exit_treiner.time*60*1000, cid, getCreatureLookDirection(cid))
		setPlayerStorageValue(cid, config_exit_treiner.storages[2], os.time()+5*60)
	end 	
	return true
end