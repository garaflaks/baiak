function onStepIn(cid, item, position, fromPosition)
    if getPlayerStorageValue(cid, 7605) == 1 then
		X2 = "Completo."
		else
		X2 = "Incompleto."
	end

			doSendMagicEffect(getCreaturePos(cid), 10)
			doPlayerPopupFYI(cid, "King e Queen outfits:\n\nPara conquista-los voc� dever� achar as estatuas do TEMPLO, ELITE QUEST e PROMOTION QUEST.\nVoc� devera dar use nelas ao encontra-las. \n\nEstatua da ELITE QUEST: "..X2.."\n\nPARAB�NS voc� chegou at� a penultima estuta. N�o desista. Ainda resta concluir a ultima na promotion quest.")
 
			return true		
		end