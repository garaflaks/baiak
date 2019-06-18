function onStepIn(cid, item, position, fromPosition)
	if getPlayerStorageValue(cid, 7604) == 1 then
		X1 = "Completo."
		else
		X1 = "Incompleto."
	end

			doSendMagicEffect(getCreaturePos(cid), 10)
			doPlayerPopupFYI(cid, "King e Queen outfits:\n\nPara conquista-los você deverá achar as estatuas do TEMPLO, ELITE QUEST e PROMOTION QUEST.\nVocê devera dar use nelas ao encontra-las. Começamos com um exemplo na sua frente!\nUse-a para completar a primeira estatua!\n\nEstatua do TEMPLO: "..X1.."\n\nOBS: Você deverá completas pela ordem certa. Boa Sorte!")
 
			return true		
		end