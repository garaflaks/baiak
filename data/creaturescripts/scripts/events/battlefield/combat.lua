function onCombat(cid, target)

if isPlayer(cid) and isPlayer(target) and getPlayerStorageValue(cid, battlefield.storage2) ~= -1 then
	if getPlayerStorageValue(cid, battlefield.storage2) == getPlayerStorageValue(target, battlefield.storage2) then
		doPlayerSendCancel(cid, "Você não pode atacar seus companheiros de equipe.")
		return false
	end
end

return true
end