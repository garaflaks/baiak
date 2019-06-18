local quest = {x=157,y=42,z=6}
function onStepIn(cid, item, position, fromPosition)
			doTeleportThing (cid, quest, TRUE)
			doSendMagicEffect(getCreaturePos(cid), 10)
				doPlayerPopupFYI(cid, "[PROMOTION QUEST]: \n\nVocê deverá clicar na porta para ter acesso a ilha sagrada. Você deve possuir uma PROMOTION KEY. \n\n\n ATENÇÃO: \n\n Use sua chave com SABEDORIA. \n Ao clicar na porta você terá 1 SEGUNDO para entrar e sua chave será removida e você não terá mais acesso à esta area.")
 
			return true		
		end		

