function onStepIn(cid, item, position, fromPosition)
    if getPlayerStorageValue(cid, 7606) == 1 then
		X3 = "Completo."
		else
		X3 = "Incompleto."
	end

			doSendMagicEffect(getCreaturePos(cid), 10)
            doPlayerPopupFYI(cid, "King e Queen outfits:\n\nPara conquista-los voc� dever� achar as estatuas do TEMPLO, ELITE QUEST e PROMOTION QUEST.\nVoc� devera dar use nelas ao encontra-las. \n\nEstatua da PROMOTION QUEST: "..X3.."\n\nPARAB�NS voc� chegou at� a ultima estuta. Clique nela e receba sua outfit.")
			
			return true		
		end