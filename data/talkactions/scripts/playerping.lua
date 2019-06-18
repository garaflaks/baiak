	function onSay(cid, words, param, channel)

local mystical = ping.CheckPing(cid)
	doPlayerSendTextMessage(cid,22,"Ping aproximado --> ["..mystical.."].")
	return true
end