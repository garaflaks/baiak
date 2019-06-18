STORAGE_PLAYER_IN_ARENA = 165890
ANTIENTROSA_BLOCK_UE = 165891
ANTIENTROSA_BLOCK_RUNES = 165892
ANTIENTROSA_BLOCK_SSAMIGHTRING = 165893
ANTIENTROSA_BLOCK_SUMMONS = 165894

-- Colocar todas as áreas que não serão possiveis usar o comando - BY: KOLISAO
local block_area_entrosa = {
	{{x=9999,y=9999,z=8}, {x=9999,y=9999,z=8}} -- XXXXXXX
}
	
local config = {
	arenas = {
		[1] = {
			name = "Venore",
			bases = {
				[1] = {x = 474, y = 824, z = 7},
				[2] = {x = 472, y = 771, z = 6},
			},
		},
		[2] = {
			name = "Darashia",
			bases = {
				[1] = {x = 1189, y = 907, z = 6},
				[2] = {x = 1140, y = 879, z = 7},
			},
		},
		[3] = {
			name = "Edron",
			bases = {
				[1] = {x = 550, y = 947, z = 5},
				[2] = {x = 615, y = 942, z = 6},
			},
		},
		[4] = {
			name = "Carlin",
			bases = {
				[1] = {x = 861, y = 57, z = 7},
				[2] = {x = 889, y = 96, z = 6},
			},
		},	
		[5] = {
			name = "thais",
			bases = {
				[1] = {x = 897, y = 1030, z = 6},
				[2] = {x = 838, y = 998, z = 7},
			},			
		},
	}
}

if not AntiEntrosa then
	AntiEntrosa = { areas = { }, wars = { } }
end

AntiEntrosa.timeAvaliable = {15, 30, 45, 60, 90, 120} -- Tempos em minutos disponíveis.
AntiEntrosa.minPlayers = 5 -- Quantidade mínima de players no Anti Entrosa
AntiEntrosa.maxPlayers = 100 -- Quantidade máxima de players no Anti Entrosa

local timeToCancel = 5 -- Tempo em minutos para cancelar a War [fechar, contagem regressiva de minutos]
local timeToAccept = 1 -- Tempo para aceitar o pedido em minutos

function AntiEntrosa.enterPlayer(self, cid, arenaId)
	-- Verifica se está em uma war a guild
	local playerGuild = getPlayerGuildId(cid)
	local arenaId = AntiEntrosa:getWarIdByGuild(playerGuild)
	if not arenaId then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, "[War Anti-Entrosa] A sua guild não tem nenhuma war registrada.")
		return true
	end

	local area = self.areas[arenaId]
	if not area then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, "[War Anti-Entrosa] A sua guild não está em war no Anti-Entrosa.")
		return true
	end

	-- Verifica se está em área permitida	
	for _, block_entrosa_area in ipairs(block_area_entrosa) do
		if isInRange(getCreaturePosition(cid), block_entrosa_area[1], block_entrosa_area[2]) then
			doPlayerSendCancel(cid, "[War Anti-Entrosa] Você não pode usar esse comando nesta área.")
			return true
		end
	end
	
	-- Verifica se está em área PZ
	if not getTilePzInfo(getPlayerPosition(cid)) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, "[War Anti-Entrosa] Você precisa estar em PZ para entrar no Anti-Entrosa.")
		return true
	end

	-- Verifica se já não está dentro da Area
	if getPlayerStorageValue(cid, STORAGE_PLAYER_IN_ARENA) == 1 then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, "[War Anti-Entrosa] Você já está dentro do Anti-Entrosa.")
		return true
	end

	if area.timeToAccept ~= 0 then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, "[War Anti-Entrosa] Essa war ainda não foi aceita.")
		return true
	end

	if area.warUntil ~= 0 and area.warUntil < os.time() then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, "[War Anti-Entrosa] A war no Anti-Entrosa acabará em breve.")
		return true
	end

	-- Verifica se está PZ locked
	if isPlayerPzLocked(cid) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, "[War Anti-Entrosa] Você não pode entrar no Anti-Entrosa com PZ Locked.")
		return true
	end

	local warInfo = self:warInfo(playerGuild)
	if not warInfo then
		return true
	end

	local maxPlayers = area.maximumPlayers
	if maxPlayers == 0 then
		maxPlayers = 1000
	end
	
	local playersCountTeam = #warInfo.players
	if playersCountTeam >= maxPlayers then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, string.format('[War Anti-Entrosa] O limite de jogadores dentro do Anti-Entrosa para o seu time já foi atingido. Atualmente seu time possui %d membro%s dentro do Anti-Entrosa.', playersCountTeam, playersCountTeam ~= 1 and 's' or ''))
		return true
	end

	if area.minLevel ~= nil then
		if getPlayerLevel(cid) > area.minLevel then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "[War Anti-Entrosa] Sua guild definiu um limite máximo de level para entrar no Anti-Entrosa. Você precisa ser no máximo level ".. area.minLevel .." para entrar no Anti-Entrosa.")
			return true
		end
	end

	if not area.enableUe then
		setPlayerStorageValue(cid, ANTIENTROSA_BLOCK_UE, 1)
	end

	if not area.enableRunes then
		setPlayerStorageValue(cid, ANTIENTROSA_BLOCK_RUNES, 1)
	end

	if not area.enableSsaMightRing then
		setPlayerStorageValue(cid, ANTIENTROSA_BLOCK_SSAMIGHTRING, 1)
	end

	if not area.summonsEnabled then
		setPlayerStorageValue(cid, ANTIENTROSA_BLOCK_SUMMONS, 1)
	end

	table.insert(warInfo.players, cid)
	doTeleportThing(cid, warInfo.base)

	setPlayerStorageValue(cid, STORAGE_PLAYER_IN_ARENA, 1)
	registerCreatureEvent(cid, "AntiEntrosa")
	registerCreatureEvent(cid, "AntiEntrosa MoveItem")
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, string.format('[War Anti-Entrosa] Você entrou no Anti-Entrosa na cidade de %s.', area.cityName))
end

function AntiEntrosa.arenaExists(self, arenaName)
	local found = false
	for arenaId, info in pairs(config.arenas) do
		if info.name:lower() == arenaName:lower() then
			found = arenaId
			break
		end
	end

	return found
end

function AntiEntrosa.arenaIsFree(self, arenaId)
	local area = self.areas[arenaId]
	if area then
		return false
	end

	return true
end

function AntiEntrosa.removePlayersOutside(self, cid, message, teleportToTemple)
    if teleportToTemple then
        doTeleportThing(cid, getTownTemplePosition(1))
    end

    unregisterCreatureEvent(cid, "AntiEntrosa")
    unregisterCreatureEvent(cid, "AntiEntrosa MoveItem")

    -- Remove as Storages
    local blockValues = { STORAGE_PLAYER_IN_ARENA, ANTIENTROSA_BLOCK_UE, ANTIENTROSA_BLOCK_RUNES, ANTIENTROSA_BLOCK_SSAMIGHTRING, ANTIENTROSA_BLOCK_SUMMONS }

    for i = 1, #blockValues do
        local storage = blockValues[i]
        if getPlayerStorageValue(cid, storage) >= 1 then
            setPlayerStorageValue(cid, storage, -1)
        end
    end

    if message then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, message)
    end

    local playerGuild = getPlayerGuildId(cid)

    local warInfo = self:warInfo(playerGuild)
    if not warInfo then
        return false
    end

    local infoPlayers = warInfo.players
    for i = 1, #infoPlayers do
        if infoPlayers[i] == cid then
            table.remove(warInfo.players, i)
            break
        end
    end

    return true
end

function AntiEntrosa.cancelTime(self, time, arenaId, canceledByGuildId, againstGuildId)
	local area = self.areas[arenaId]
	if not area then
		return
	end

	if time == 0 then
		self:finishAntiEntrosa(arenaId)
		return
	end

	local whoCanceled = getGuildNameById(canceledByGuildId)
	local enemyGuild = getGuildNameById(againstGuildId)

	local str = ''
	if time == timeToCancel then
		str = string.format('[War Anti-Entrosa] A guild %s cancelou a War no Anti-Entrosa contra a Guild %s. A War se encerará em %d minuto%s.', whoCanceled, enemyGuild, timeToCancel, timeToCancel ~= 1 and 's' or '')
	--else
	--	str = string.format('[War Anti Entrosa] A guild %s cancelou a War no Anti Entrosa contra a Guild %s e ela se encerará em %d minuto%s.', whoCanceled, enemyGuild, time, time ~= 1 and 's' or '')
	end

	area.closingArea = area.closingArea - 5
	time = time - 5
	addEvent(
		function(self, time, arenaId, canceledByGuildId, againstGuildId) 
			self:cancelTime(time, arenaId, canceledByGuildId, againstGuildId) 
		end, 5 * 60000, self, time, arenaId, canceledByGuildId, againstGuildId
	)

	doBroadcastMessage(str, MESSAGE_EVENT_ADVANCE)
end

function AntiEntrosa.finishAntiEntrosa(self, arenaId)
	local area = self.areas[arenaId]
	if not area then
		return
	end

	local guildId = area.invitedGuild
	local enemyGuild = area.enemyGuild
	for _, pid in ipairs(getPlayersOnline()) do
		local playerGuild = getPlayerGuildId(pid)
		if playerGuild > 0 then
			if playerGuild == guildId or playerGuild == enemyGuild then
				if getPlayerStorageValue(pid, STORAGE_PLAYER_IN_ARENA) == 1 then
					self:removePlayersOutside(pid, nil, true)
				end
			end
		end
	end

	local enemyGuild = getGuildNameById(area.enemyGuild)
	local invitedGuild = getGuildNameById(area.invitedGuild)
	doBroadcastMessage(string.format('[War Anti-Entrosa] A War no Anti-Entrosa da Guild %s vs %s na cidade de %s acabou!', enemyGuild, invitedGuild, area.cityName), MESSAGE_EVENT_ADVANCE)
	self:cleanTable(arenaId)
end

function AntiEntrosa.getCityNameById(self, arenaId)
	local found = false
	for tmpArenaId, info in pairs(config.arenas) do
		if tmpArenaId == arenaId then
			found = info.name
			break
		end
	end

	return found
end

function AntiEntrosa.warInfo(self, guildId)
	if next(self.wars) == nil then
		return false
	end

	for warId, table in pairs(self.wars) do
		for tmpGuildId, info in pairs(table) do
			if tmpGuildId == guildId then
				return info
			end
		end
	end

	return false
end

function AntiEntrosa.warInfoById(self, id)
	local area = self.areas[id]
	if area then
		return area
	end

	return false
end

function AntiEntrosa.sendInvitation(self, cid, arenaId, playerGuild, enemyGuildId, timeWar, minLevel, enableUe, enableRunes, ssaMightRing, summonsEnabled, maximumPlayers)
	local cityAvaliable = self:arenaIsFree(arenaId)
	if not cityAvaliable then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, "[War Anti-Entrosa] Essa cidade não está disponível atualmente para war.")
		return true
	end

	local cityName = self:getCityNameById(arenaId)
	local guildName = getGuildNameById(playerGuild)
	local enemyGuildName = getGuildNameById(enemyGuildId)
	local amountPlayersString = maximumPlayers == 0 and 'quantidade ilimitada de jogadores' or 'limite de '.. maximumPlayers ..' jogador'.. ((maximumPlayers > 1) and 'es' or '')
	local levelString = minLevel and string.format('O level máximo é %s', minLevel) or ''
	local ueString = string.format('a ue está %s', enableUe and 'ativada' or 'desativada')
	local runesString = string.format('as runas estão %s', enableRunes and 'ativadas' or 'desativadas')
	local ssaString = string.format('ssa e might ring estão %s', ssaMightRing and 'ativados' or 'desativados')
	local summonString = string.format('summons estão %s', summonsEnabled and 'ativados' or 'desativados')

	doBroadcastMessage(string.format('[War Anti-Entrosa] A Guild %s convidou a Guild %s para uma War em %s. Essa War tem a duração de %d minuto%s com %s. %s, %s, %s, %s, %s. A guild %s possui %d minuto%s para aceitar o pedido.', guildName, enemyGuildName, cityName, timeWar, timeWar ~= 1 and 's' or '', amountPlayersString, levelString, ueString, runesString, ssaString, summonString, enemyGuildName, timeToAccept, timeToAccept ~= 1 and 's' or ''), MESSAGE_EVENT_ADVANCE)

	-- Adiciona a War
	local warId = #self.wars + 1
	self.wars[warId] = { }

	self.wars[warId][playerGuild] = { players = { }, base = config.arenas[arenaId].bases[1]}
	self.wars[warId][enemyGuildId] = { players = { }, base = config.arenas[arenaId].bases[2]}
	
	self.areas[arenaId] = {
		invitedGuild = playerGuild,
		enemyGuild = enemyGuildId,
		warId = warId,
		minLevel = tonumber(minLevel),
		enableUe = enableUe,
		enableRunes = enableRunes,
		enableSsaMightRing = ssaMightRing,
		summonsEnabled = summonsEnabled,
		cityName = cityName,
		maximumPlayers = tonumber(maximumPlayers),
		timeToAccept = os.time() + (timeToAccept * 60),
		timeWar = tonumber(timeWar),
		warUntil = tonumber(timeWar),
		closingArea = 0,
	}

	addEvent(
		function(self, arenaId, cityName, enemyGuild, invitedGuild, timeToAccept)
			local area = self.areas[arenaId]
			if not area then
				return
			end

			if area.timeToAccept ~= 0 then
				doBroadcastMessage(string.format('[War Anti-Entrosa] O convite de War no Anti-Entrosa na cidade de %s da Guild %s vs a Guild %s foi expirado devido a ter passado %d minuto%s.', cityName, invitedGuild, enemyGuild, timeToAccept, timeToAccept ~= 1 and 's' or ''), MESSAGE_EVENT_ADVANCE)
				self:cleanTable(arenaId)
			end
		end, timeToAccept * 60000, self, arenaId, cityName, enemyGuildName, guildName, timeToAccept
	)
end

function AntiEntrosa.hasInvitation(self, playerGuild, enemyGuild)
	local found = false
	for arenaId, info in pairs(self.areas) do
		if info.timeToAccept ~= 0 then
			if info.invitedGuild == enemyGuild and info.enemyGuild == playerGuild then
				found = true
				break
			end
		end
	end

	return found
end

function AntiEntrosa.canCancelInvitation(self, playerGuild)
	local found = false
	for arenaId, info in pairs(self.areas) do
		if info.invitedGuild == playerGuild or info.enemyGuild == playerGuild then
			if info.timeToAccept == 0 and info.warUntil > os.time() then
				found = true
				break
			end
		end
	end

	return found
end

function AntiEntrosa.getWarIdByGuild(self, guildId)
	local found = false
	for arenaId, info in pairs(self.areas) do
		if info.invitedGuild == guildId or info.enemyGuild == guildId then
			found = arenaId
			break
		end
	end

	return found
end

function AntiEntrosa.confirmInvitation(self, cid, arenaId)
	local area = self.areas[arenaId]
	if not area then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, "[War Anti-Entrosa] Essa War não existe.")
		return true
	end

	local guildName = getGuildNameById(area.enemyGuild)
	local enemyGuildName = getGuildNameById(area.invitedGuild)
	local hasInvitation = AntiEntrosa:hasInvitation(area.enemyGuild, area.invitedGuild)
	if not hasInvitation then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, string.format("[War Anti-Entrosa] Não existe nenhum convite de War da Guild %s.", enemyGuildName))
		return true
	end

	local cityName = area.cityName
	local amountPlayers = area.maximumPlayers

	local timeWar = area.warUntil
	local amountPlayersString = amountPlayers == 0 and 'quantidade ilimitada de jogadores' or 'limite de '.. amountPlayers .. ' jogador'.. ((amountPlayers > 1) and 'es' or '')
	doBroadcastMessage(string.format('[War Anti-Entrosa] A Guild %s aceitou o pedido de War da Guild %s no Anti-Entrosa para uma War em %s com %s por %d minuto%s.', guildName, enemyGuildName, cityName, amountPlayersString, timeWar, timeWar ~= 1 and 's' or ''), MESSAGE_EVENT_ADVANCE)

	area.timeToAccept = 0
	local timeMs = area.warUntil * 60000
	area.warUntil = os.time() + (area.warUntil * 60)

	addEvent(
		function(self, arenaId)
			local area = self.areas[arenaId]
			if not area then
				return
			end

			if area.warUntil ~= 0 and area.timeToAccept == 0 then
				self:finishAntiEntrosa(arenaId)
			end
		end, timeMs, self, arenaId
	)
end

function AntiEntrosa.cancelInvitation(self, cid, arenaId)
	local area = self.areas[arenaId]
	if not area then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, "[War Anti-Entrosa] Essa War não existe.")
		return
	end

	if area.warUntil ~= 0 then
		if os.time() + (timeToCancel * 60) > area.warUntil then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, string.format("[War Anti-Entrosa] Essa War acabará em menos de %d minuto%s. Aguarde ela ser finalizada.", timeToCancel, timeToCancel ~= 1 and 's' or ''))
			return
		end
	end

	if area.closingArea ~= 0 then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "[War Anti-Entrosa] Já foi requesitado o fechando da área. Aguarde.")
		return true
	end

	area.closingArea = timeToCancel

	local canceledByGuildId = getPlayerGuildId(cid)
	local againstGuildId = area.enemyGuild == canceledByGuildId and area.enemyGuild or canceledByGuildId
	self:cancelTime(area.closingArea, arenaId, canceledByGuildId, againstGuildId)
end

function AntiEntrosa.rejectInvitation(self, arenaId)
	local area = self.areas[arenaId]
	if not area then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, "[War Anti-Entrosa] Essa War não existe")
		return true
	end

	local guildName = getGuildNameById(area.enemyGuild)
	local enemyGuildName = getGuildNameById(area.invitedGuild)
	local hasInvitation = AntiEntrosa:hasInvitation(area.enemyGuild, area.invitedGuild)
	if not hasInvitation then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, string.format("[War Anti-Entrosa] Não existe nenhum convite de War da Guild %s.", guildName))
		return true
	end

	doBroadcastMessage(string.format('[War Anti-Entrosa] A Guild %s rejeitou o pedido de War da Guild %s.', guildName, enemyGuildName), MESSAGE_EVENT_ADVANCE)
	self:cleanTable(arenaId)
end

function AntiEntrosa.cleanTable(self, arenaId)
	local area = self.areas[arenaId]
	if area then
		self.wars[area.warId] = nil
		self.areas[arenaId] = nil
	end
end