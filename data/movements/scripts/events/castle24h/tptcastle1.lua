local quest = {x=529,y=174,z=7}
function onStepIn(cid, item, position, fromPosition)
			doTeleportThing (cid, quest, TRUE)
			doSendMagicEffect(getCreaturePos(cid), 10)
			setPlayerStorageValue(cid, 9952, -1)
			doCreatureSay ( cid, "Welcome to castle!", TALKTYPE_ORANGE_1 )	
			return true		
		end		