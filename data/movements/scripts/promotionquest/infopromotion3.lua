local quest = {x=1838,y=46,z=7}
function onStepIn(cid, item, position, fromPosition)
			doTeleportThing (cid, quest, TRUE)
			doSendMagicEffect(getCreaturePos(cid), 10)
				doPlayerPopupFYI(cid, "[PROMOTION QUEST]: \n\nVoc� dever� clicar na fonte sagrada que est� a sua frente para OBTER sua promo��o. \n\n\n ATEN��O: \n\n Ao deixar est� ilha voc� n�o tera mais acesso.")
 
			return true		
		end		

