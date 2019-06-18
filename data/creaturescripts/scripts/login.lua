local config = {
	loginMessage = getConfigValue('loginMessage'),
	useFragHandler = getBooleanFromString(getConfigValue('useFragHandler'))
}

function onLogin(cid)
	if(getBooleanFromString(getConfigValue('accountManager')) == false) then
		if (getCreatureName(cid) == "Account Manager") then
			return doRemoveCreature(cid, true)
		end
	end

	local loss = getConfigValue('deathLostPercent')
	if(loss ~= nil) then
		doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, loss * 10)
	end

	local accountManager = getPlayerAccountManager(cid)
	if(accountManager == MANAGER_NONE) then
		local lastLogin, str = getPlayerLastLoginSaved(cid), config.loginMessage
		if(lastLogin > 0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
			str = "Your last visit was on " .. os.date("%a %b %d %X %Y", lastLogin) .. "."
		else
			str = str .. " Please choose your outfit."
			doPlayerSendOutfitWindow(cid)
		end

		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
	elseif(accountManager == MANAGER_NAMELOCK) then
		addEvent(valid(doCreatureSay), 500, cid, "Hello, it appears that your character has been locked for name violating rules, what new name would you like to have?", TALKTYPE_PRIVATE_NP, true, cid)
	elseif(accountManager == MANAGER_ACCOUNT) then
		addEvent(valid(doCreatureSay), 500, cid, "Hello, type {account} to manage your account. If you would like to start over, type {cancel} anywhere.", TALKTYPE_PRIVATE_NP, true, cid)
	else
		addEvent(valid(doCreatureSay), 500, cid, "Hello, type {account} to create an account or {recover} to recover an account.", TALKTYPE_PRIVATE_NP, true, cid)
	end

	if(not isPlayerGhost(cid)) then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end
	
	if getPlayerStorageValue(cid, 49689) == 1 then
	setPlayerStorageValue(cid, 49689, -1)
	doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
	end

	registerCreatureEvent(cid, "Idle")
	registerCreatureEvent(cid, "Mail")
	if(getPlayerOperatingSystem(cid) >= CLIENTOS_OTCLIENT_LINUX) then
		registerCreatureEvent(cid, "ExtendedOpcode")
	end

	registerCreatureEvent(cid, "ReportBug")
	if(config.useFragHandler) then
		registerCreatureEvent(cid, "SkullCheck")
	end
	
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Bem Vindo!")
	registerCreatureEvent(cid, "dodge")
	if getPlayerStorageValue(cid, 48902) == -1 then
		setPlayerStorageValue(cid, 48902, 0)
	end

	registerCreatureEvent(cid, "critical")
	if getPlayerStorageValue(cid, 48913) == -1 then
		setPlayerStorageValue(cid, 48913, 0) 
	end

	-- VIP System --
	registerCreatureEvent(cid, "ExpVip")
	registerCreatureEvent(cid, "FimVip")
	registerCreatureEvent(cid, "VIPEffect")	
	
	--- Elite King Quest --
	registerCreatureEvent(cid, "Lucifer")
	registerCreatureEvent(cid, "Hades")
	registerCreatureEvent(cid, "Mister")	
	
	--- Zombie --
	registerCreatureEvent(cid, "ZombieAttack")
	registerCreatureEvent(cid, "VocNot")
	
	--- FireStorm --
	registerCreatureEvent(cid, "FireStorm")
	registerCreatureEvent(cid, "FireStorm2")
	
	-- Patentes heroicas --
	registerCreatureEvent(cid, "ArmyKill")
	registerCreatureEvent(cid, "fraglook")
	registerCreatureEvent(cid, "fraglook_register")
	
	-- Desert War --
	registerCreatureEvent(cid, "DesertDeath")
 	registerCreatureEvent(cid, "DesertCombat")
	
	-- Teleports open killing monster --
	registerCreatureEvent(cid, "shaman")
	registerCreatureEvent(cid, "yalahari")
	
	-- Idade System --
	 registerCreatureEvent(cid, "5anos")
     registerCreatureEvent(cid, "15anos")
     registerCreatureEvent(cid, "25anos")
     registerCreatureEvent(cid, "35anos")
     registerCreatureEvent(cid, "10anos")
     registerCreatureEvent(cid, "20anos")
     registerCreatureEvent(cid, "30anos")
     registerCreatureEvent(cid, "40anos")
     registerCreatureEvent(cid, "50anos")
	
	-- PROMOTION QUEST --
	registerCreatureEvent(cid, "lucifer")
    registerCreatureEvent(cid, "lucifer2")

	registerCreatureEvent(cid, "colecionador")
	registerCreatureEvent(cid, "blesscheck")
	registerCreatureEvent(cid, "LevelItem")
	registerCreatureEvent(cid, "Auto Loot")
	registerCreatureEvent(cid, "showKD")
	registerCreatureEvent(cid, "EventoExp")
	registerCreatureEvent(cid, "guildW")
	registerCreatureEvent(cid, "anunciomortes")
	registerCreatureEvent(cid, "questday")
	registerCreatureEvent(cid, "onlinebonus")
	registerCreatureEvent(cid, "weekendexp")
	registerCreatureEvent(cid, "questlook")
	registerCreatureEvent(cid, "PushPlayerThere2")
	registerCreatureEvent(cid, "Auto_Loot_Login")
	registerCreatureEvent(cid, "Auto_Loot_Kill")
	registerCreatureEvent(cid, "wave")
	registerCreatureEvent(cid, "GuildEvents")
	registerCreatureEvent(cid, "FullHpMana")
	registerCreatureEvent(cid, "AdvanceSave")
	registerCreatureEvent(cid, "recordIp")
	registerCreatureEvent(cid, "partyAndGuildProtection")
	registerCreatureEvent(cid, "KillingInTheNameOf")
	registerCreatureEvent(cid, "Anti Entrosa Login")
    registerCreatureEvent(cid, "Anti Entrosa Logout")
	registerCreatureEvent(cid, "KillTask")
	registerCreatureEvent(cid, "TaskLook")
	
	--	REFLECT SYSTEM --
	registerCreatureEvent(cid, "REFLECT")
	
	--	Advanced level --
	registerCreatureEvent(cid, "Advancelvl")
	
	--	Events --
	registerCreatureEvent(cid, "BattlefieldP")
	registerCreatureEvent(cid, "BattlefieldC")
	registerCreatureEvent(cid, "ctf")
	registerCreatureEvent(cid, "castleexp")
	registerCreatureEvent(cid, "expcastle")
	registerCreatureEvent(cid, "IOE")
	registerCreatureEvent(cid, "savePlayer")
    registerCreatureEvent(cid, "savePlayer_L")
	
	-- Vip System --
	registerCreatureEvent(cid, "VipLogin")
	registerCreatureEvent(cid, "FimVip")
----------------------------------------------------------------------------------------------------------
	
	if getPlayerName(cid) == "Account Manager" and #getPlayersByIp(getPlayerIp(cid)) > 10 then
		return false
	end

if getPlayerSlotItem(cid, 2).itemid == 7889 then
		doPlayerAddBlessing(cid, 1)
		doPlayerAddBlessing(cid, 2)
		doPlayerAddBlessing(cid, 3)
		doPlayerAddBlessing(cid, 4)
		doPlayerAddBlessing(cid, 5)
		doSendMagicEffect(getPlayerPosition(cid), 49)
	else
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)	
	end
 
    doPlayerOpenChannel(cid, 4)
	doPlayerOpenChannel(cid, 6)
	doPlayerOpenChannel(cid, 9)
	
	local txt = [[
[ONLINE BONUS]

A cada 1 hora online, você ganhara 1 online points.
Quando chegar à 30 points você ganhará 1 dia de PREMIUM ACCOUNT.

OBS: Seus pontos atuais aparecem na janela DEFAULT ao logar ingame.

A Equipe Tibia Fantasy, deja a você um Bom jogo!
]]
doPlayerPopupFYI(cid, txt)
 return true
end