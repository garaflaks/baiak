local quest = {x=157,y=42,z=6}
function onStepIn(cid, item, position, fromPosition)
			doTeleportThing (cid, quest, TRUE)
			doSendMagicEffect(getCreaturePos(cid), 10)
				doPlayerPopupFYI(cid, "[PROMOTION QUEST]: \n\nVoc� dever� clicar na porta para ter acesso a ilha sagrada. Voc� deve possuir uma PROMOTION KEY. \n\n\n ATEN��O: \n\n Use sua chave com SABEDORIA. \n Ao clicar na porta voc� ter� 1 SEGUNDO para entrar e sua chave ser� removida e voc� n�o ter� mais acesso � esta area.")
 
			return true		
		end		

