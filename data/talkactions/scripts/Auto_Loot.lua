function onSay(cid, words, param)
	if param == "" then
		local String = ""
		local Slot_Count = 1
		for i = 1, #AutoLoot.Storages.Slots do
			if getPlayerStorageValue(cid, AutoLoot.Storages.Slots[i]) ~= -1 then
				String = String.."{Auto-Loot} --- Slot "..Slot_Count..": "..getItemNameById(getPlayerStorageValue(cid, AutoLoot.Storages.Slots[i])).."\n"
			else
				String = String.."{Auto-Loot} --- Slot "..Slot_Count..": Empty\n"
			end
			Slot_Count = Slot_Count + 1
		end
		local Gold_Status = getPlayerStorageValue(cid, AutoLoot.Storage_On_Gold) == 1 and "on" or "off"
		local Items_Status = getPlayerStorageValue(cid, AutoLoot.Storage_On_Items) == 1 and "on" or "off"
		doPlayerPopupFYI(cid, [[
{Auto-Loot} --- Coletar dinheiro: ]].. Gold_Status ..[[. Para ligar/desligar: !autoloot gold
{Auto-Loot} --- Coletar itens �nicos: ]].. Items_Status ..[[. Para ligar/desligar: !autoloot power
{Auto-Loot} --- Configura��o dos slots:
]].. String ..[[
{Auto-Loot} --- Para adicionar um novo item aos slots: !autoloot add, <nome do item>
{Auto-Loot} --- Para retirar um item dos slots: !autoloot remove, <nome do item>
{Auto-Loot} --- Para limpar todos os slots utilize: !autoloot clear
{Auto-Loot} --- Para informa��es de quanto voc� j� fez utilizando a coleta de dinheiro, use: !autoloot goldinfo
{Auto-Loot} --- Se seu autoloot bugar use !autoloot desbug
]])
		return true
	end
	
	local CommandParam = string.explode(param, ",")
	if getPlayerLevel(cid) >= AutoLoot.Min_Level then
		if CommandParam[1] == "power" then
			local get_Items = getPlayerStorageValue(cid, AutoLoot.Storage_On_Items) == -1 and "ligou" or "desligou"
			doPlayerSetStorageValue(cid, AutoLoot.Storage_On_Items, getPlayerStorageValue(cid, AutoLoot.Storage_On_Items) == -1 and 1 or -1)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voc� "..get_Items.." o auto loot.")
		elseif CommandParam[1] == "gold" then
			local get_Gold = getPlayerStorageValue(cid, AutoLoot.Storage_On_Gold) == -1 and "ligou" or "desligou"
			doPlayerSetStorageValue(cid, AutoLoot.Storage_On_Gold, getPlayerStorageValue(cid, AutoLoot.Storage_On_Gold) == -1 and 1 or -1)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voc� "..get_Gold.." a coleta de dinheiro.")
			doPlayerSetStorageValue(cid, AutoLoot.Storages.Count_Gold, 0)
		elseif CommandParam[1] == "goldinfo" then
			local Check_Gold_Info = getPlayerStorageValue(cid, AutoLoot.Storage_On_Gold) == -1 and "O sistema de coleta de dinheiro est� desligado" or "O sistema j� coletou "..AutoLoot.getPlayerStorageZero(cid, AutoLoot.Storages.Count_Gold).." gold coins"
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, Check_Gold_Info)
		elseif CommandParam[1] == "add" then
			if CommandParam[2] ~= nil and CommandParam[2] ~= "" and AutoLoot.ExistItemByName(CommandParam[2]) then
				local Item = getItemIdByName(CommandParam[2])
				if isInArray({2160, 2148, 2152}, Item) then
					return doPlayerSendCancel(cid, "Voc� n�o pode adicionar moedas no autoloot. Para coletar dinheiro use !autoloot gold")
				end
				if getPlayerStorageValue(cid, AutoLoot.Storages.Count_Items) < (AutoLoot.Max_Slots - 1) then
					if AutoLoot.addToList(cid, CommandParam[2]) then
						doPlayerSetStorageValue(cid, AutoLoot.Storages.Count_Items, getPlayerStorageValue(cid, AutoLoot.Storages.Count_Items) + 1)
						doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, CommandParam[2].." adicionado � sua lista do auto loot! Para ver sua lista diga !autoloot list")
					else
						doPlayerSendCancel(cid, CommandParam[2].." j� est� em sua lista!")
					end
				else
					doPlayerSendCancel(cid, "Sua lista j� tem ".. AutoLoot.Max_Slots .." itens! Voc� deve remover algum antes de adicionar outro.")
				end
			else
				doPlayerSendCancel(cid, "Este item n�o existe!")
			end
		elseif CommandParam[1] == "remove" then
			if CommandParam[2] ~= nil and CommandParam[2] ~= "" and AutoLoot.ExistItemByName(CommandParam[2]) then
				if AutoLoot.removeFromList(cid, CommandParam[2]) then
					doPlayerSetStorageValue(cid, AutoLoot.Storages.Count_Items, getPlayerStorageValue(cid, AutoLoot.Storages.Count_Items) - 1)
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, CommandParam[2].." removido da sua lista do auto loot!")
				else
					doPlayerSendCancel(cid, "Este item n�o est� na sua lista!")
				end
			else
				doPlayerSendCancel(cid, "Este item n�o existe!")
			end
		elseif CommandParam[1] == "clear" then
			if getPlayerStorageValue(cid, AutoLoot.Storages.Count_Items) > -1 then
				doPlayerSetStorageValue(cid, AutoLoot.Storages.Count_Items, -1)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Lista limpa!")
				for i = 1, #AutoLoot.Storages.Slots do 
					doPlayerSetStorageValue(cid, AutoLoot.Storages.Slots[i], -1)
				end
			else
				doPlayerSendCancel(cid, "Sua lista ja esta limpa!")
			end
		elseif CommandParam[1] == "desbug" or CommandParam[1] == "desbugar" then
			doPlayerSetStorageValue(cid, AutoLoot.Storages.Count_Items, -1)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Desbugado!")
			for i = 1, #AutoLoot.Storages.Slots do 
				doPlayerSetStorageValue(cid, AutoLoot.Storages.Slots[i], -1)
			end
		elseif CommandParam[1] == "list" then
			local String = ""
			local Slot_Count = 1
			for i = 1, #AutoLoot.Storages.Slots do
				if getPlayerStorageValue(cid, AutoLoot.Storages.Slots[i]) ~= -1 then
					String = String.."Slot "..Slot_Count..": "..getItemNameById(getPlayerStorageValue(cid, AutoLoot.Storages.Slots[i])).."\n"
				else
					String = String.."Slot "..Slot_Count..": Empty\n"
				end
				Slot_Count = Slot_Count + 1
			end
			doPlayerPopupFYI(cid, [[
---------{Auto-Loot}---------
O sistema auto loot est� coletando:

]].. String ..[[
]])
		end
	else
		doPlayerSendCancel(cid, "Voc� n�o � level maior que "..AutoLoot.Min_Level.." para utilizar este comando.")
	end
	return true
end