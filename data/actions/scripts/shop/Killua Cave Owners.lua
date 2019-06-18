local function filtrateString(str)
	if type(str) ~= "string" then
		return false
	end
	local first, last = 0, 0
	local second, final = 0, #str
	for i = 1, #str do
		if string.byte(str:sub(i,i)) == string.byte('a') then
			first = i + 2
			for t = first, #str do
				if string.byte(str:sub(t,t)) == string.byte(' ') then
					last = t - 1
					break
				end
			end
		end
		if string.byte(str:sub(i,i)) == string.byte('b') then
			second = i + 2
		end
	end
	return {str:sub(first, last), str:sub(second, final)}
end


function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerLevel(cid) > 600 then
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voce e maior que level 600, porem nao pode usar a cave exclusiva.")
	return false
	end
    	if tonumber(filtrateString(getGlobalStorageValue(822081))[2]) < os.time() then
		doRemoveItem(item.uid)
		setGlobalStorageValue(822081, "a "..getPlayerAccountId(cid).." b ".. os.time() + (3600 * 6))
		doPlayerSendTextMessage(cid, 25, "Agora você é o dono da cave 1 e pode upar lá por 6 horas.")
	elseif tonumber(filtrateString(getGlobalStorageValue(822082))[2]) < os.time() then
		doRemoveItem(item.uid)
		setGlobalStorageValue(822082, "a "..getPlayerAccountId(cid).." b ".. os.time() + (3600 * 6))
		doPlayerSendTextMessage(cid, 25, "Agora você é o dono da cave 2 e pode upar lá por 6 horas.")
	elseif tonumber(filtrateString(getGlobalStorageValue(822083))[2]) < os.time() then
		doRemoveItem(item.uid)
		setGlobalStorageValue(822083, "a "..getPlayerAccountId(cid).." b ".. os.time() + (3600 * 6))
		doPlayerSendTextMessage(cid, 25, "Agora você é o dono da cave 3 e pode upar lá por 6 horas.")
	elseif tonumber(filtrateString(getGlobalStorageValue(822084))[2]) < os.time() then
		doRemoveItem(item.uid)
		setGlobalStorageValue(822084, "a "..getPlayerAccountId(cid).." b ".. os.time() + (3600 * 6))
		doPlayerSendTextMessage(cid, 25, "Agora você é o dono da cave 4 e pode upar lá por 6 horas.")
	elseif tonumber(filtrateString(getGlobalStorageValue(822085))[2]) < os.time() then
		doRemoveItem(item.uid)
		setGlobalStorageValue(822085, "a "..getPlayerAccountId(cid).." b ".. os.time() + (3600 * 6))
		doPlayerSendTextMessage(cid, 25, "Agora você é o dono da cave 5 e pode upar lá por 6 horas.")
	
	else
		doPlayerSendCancel(cid, "Todas as caves já estão com dono no momento. Tente mais tarde.")
	end
	return true
end

