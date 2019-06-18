  local config = {
   effectonuse = 14,
   levelsdodge = 100,
   storagedodge = 48902
 }

 function onUse(cid, item, frompos, item2, topos)
 	if getPlayerStorageValue(cid, config.storagedodge) < config.levelsdodge then
 		doRemoveItem(item.uid, 1)
 		doSendMagicEffect(topos,config.effectonuse)
 		doPlayerSendTextMessage(cid,22,"Voc� aumentou seu Dodge Skill para ["..(getPlayerStorageValue(cid, config.storagedodge)+1).."/100].")
 		setPlayerStorageValue(cid, config.storagedodge, getPlayerStorageValue(cid, config.storagedodge)+1)
 		elseif getPlayerStorageValue(cid, config.storagedodge) >= config.levelsdodge then
 			doPlayerSendTextMessage(cid,22,"Voc� j� alcan�ou o level maximo de Dodge Skill.\nParab�ns!!!!")
 			return 0
 		end
 		return 1
 	end