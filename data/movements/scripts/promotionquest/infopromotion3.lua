local quest = {x=1838,y=46,z=7}
function onStepIn(cid, item, position, fromPosition)
			doTeleportThing (cid, quest, TRUE)
			doSendMagicEffect(getCreaturePos(cid), 10)
				doPlayerPopupFYI(cid, "[PROMOTION QUEST]: \n\nVocê deverá clicar na fonte sagrada que está a sua frente para OBTER sua promoção. \n\n\n ATENÇÃO: \n\n Ao deixar está ilha você não tera mais acesso.")
 
			return true		
		end		

