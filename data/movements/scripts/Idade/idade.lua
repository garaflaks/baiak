local quest = {x=1001,y=432,z=7}
function onStepIn(cid, item, position, fromPosition)
			doTeleportThing (cid, quest, TRUE)
			doSendMagicEffect(getCreaturePos(cid), 10)
				doPlayerPopupFYI(cid, "Sistema de idades:\nAo ficar online no servidor você vai ficando mais velho e\nao atingir certa idade você terá direito a recompensas!\nAs idades são:\n- 5 anos \n- 10 anos \n- 15 anos \n- 20 anos \n- 25 anos \n- 30 anos \n- 35 anos \n- 40 anos \n- 50 anos\n\nBasta ficar online!\n\nOBS: Para saber sua idade dê look em você mesmo!")
 
			return true		
		end		

