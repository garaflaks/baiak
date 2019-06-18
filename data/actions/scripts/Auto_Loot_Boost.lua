--[[
	Auto Loot System by Danyel Varejão
]]

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if AutoLoot.Boost(cid) then
		doPlayerSendCancel(cid, "Você já está com o BOOST ativado!")
		return true
	end
    if doRemoveItem(item.uid) then
    	doPlayerSetStorageValue(cid, AutoLoot.Storage_Boost, os.time() + 3600 * 24)
    	doSendMagicEffect(getThingPos(cid), 49)
    	doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Você ativou o Auto Loot BOOST por 24 horas. Durante esse tempo os itens coletados serão vendidos automaticamente e o dinheiro será depositado no seu banco.")
    end
    return true
end