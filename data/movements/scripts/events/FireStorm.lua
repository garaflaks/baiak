function onStepIn(cid, item, position, fromPosition)
	if getPlayerAccess(cid) < 4 then
		setGlobalStorageValue(17, getGlobalStorageValue(17)+1)
		doRemoveCondition(cid, CONDITION_POISON)
		doRemoveCondition(cid, CONDITION_FIRE)
		doPlayerPopupFYI(cid, "OBJETIVO: Você deve desviar dos fogos que caem do céu, quem sobreviver ganhará.")
	end
	return true
end