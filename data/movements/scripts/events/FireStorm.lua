function onStepIn(cid, item, position, fromPosition)
	if getPlayerAccess(cid) < 4 then
		setGlobalStorageValue(17, getGlobalStorageValue(17)+1)
		doRemoveCondition(cid, CONDITION_POISON)
		doRemoveCondition(cid, CONDITION_FIRE)
		doPlayerPopupFYI(cid, "OBJETIVO: Voc� deve desviar dos fogos que caem do c�u, quem sobreviver ganhar�.")
	end
	return true
end