local quest = {x=649,y=380,z=7}
function onStepIn(cid, item, position, fromPosition)
			doTeleportThing (cid, quest, TRUE)
			doSendMagicEffect(getCreaturePos(cid), 10)
				doPlayerPopupFYI(cid, "[QUEST DIARIA]: \n\nVoc� dever� enfrentar o poderoso boss para conquistar uma boa recompensa. \n Caso voc� nao consiga completar a quest de primeira, voc� tera outras chances at� obter sucesso. \n\n\n OBS: Voc� ter� direito de completar a quest, todos os dias apos as 07:00 ou se caso enventualmente o servidor reinicie.")
 
			return true		
		end		