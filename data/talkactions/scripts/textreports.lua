function onSay(cid, words, param, channel)
		if getPlayerLevel(cid) >= 8 then
		doPlayerSendTextMessage(cid, 18, "Sistema desativado, para reportar um bug use o link no site 'Report Bugs'.")
		--db.executeQuery("INSERT INTO `server_reports` ( `id` , `world_id` , `player_id` , `posx` , `posy` , `posz` , `timestamp` , `report` ) VALUES (NULL , "..getConfigValue("worldId")..", "..getPlayerGUID(cid)..", ".. getThingPos(cid).x ..", ".. getThingPos(cid).y ..", ".. getThingPos(cid).z ..", "..os.time()..", '"..param.."');")
		--db.executeQuery("INSERT INTO `z_helpdesk` ( `account` , `type` , `status` , `text` , `id` , `subject` , `priority` , `reply`, who, uid,  ) VALUES (NULL , "..getConfigValue("worldId")..", "..getPlayerGUID(cid)..", ".. getThingPos(cid).x ..", ".. getThingPos(cid).y ..", ".. getThingPos(cid).z ..", "..os.time()..", '"..param.."');")
		
		end
	return true
end