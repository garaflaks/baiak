ping = {
     _VERSION = "1.0";
	 pinger = function()
	   if not getPlayerLastPong then
	       print('Error!')
		          return false
		   else
		          return true
		       end
		   end,
		   CONST_WATING_RESPONSE = -3,
		   CONST_DISCONECTED = -2,
		   
		   }
 
		function ping.CheckPing(cid)
	local c = getPlayerLastPong(cid)
	local l = getPlayerLastPing(cid)
	local ping = math.floor((c-l))
		return ping
end
 
function ping.loop(cid,storage,f,...)
	if not isPlayer(cid) then
		return false
	end
	local p_ing = ping.CheckPing(cid)
	if p_ing ~= CONST_WATING_RESPONSE then
		if not tonumber(p_ing) then
			doPlayerSetStorageValue(cid,storage,ping.CONST_DISCONECTED)
			return
		else 
			doPlayerSetStorageValue(cid,storage,p_ing)
                        f(cid,storage,p_ing,...)
			return
		end
	end
	addEvent(ping.loop,100,cid,storage,f,...)
end
 
function ping.getPing(cid,storage,f,...)
	if ping.test() then
		doPlayerSetStorageValue(cid,storage,ping.CONST_WATING_RESPONSE)
		doPlayerSendPing(cid)
		ping.loop(cid,storage,f,...)
		end
end