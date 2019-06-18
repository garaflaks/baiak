function onStepIn(cid, item, position, fromPosition)
    if getPlayerStorageValue(cid, 7605) == 1 then
		X2 = "Completo."
		else
		X2 = "Incompleto."
	end

			doSendMagicEffect(getCreaturePos(cid), 10)
			doPlayerPopupFYI(cid, "King e Queen outfits:\n\nPara conquista-los você deverá achar as estatuas do TEMPLO, ELITE QUEST e PROMOTION QUEST.\nVocê devera dar use nelas ao encontra-las. \n\nEstatua da ELITE QUEST: "..X2.."\n\nPARABÉNS você chegou até a penultima estuta. Não desista. Ainda resta concluir a ultima na promotion quest.")
 
			return true		
		end