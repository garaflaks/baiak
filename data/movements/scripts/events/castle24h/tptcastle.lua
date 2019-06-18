local quest = {x=157,y=50,z=7}
function onStepIn(cid, item, position, fromPosition)
			doTeleportThing (cid, quest, TRUE)
			doSendMagicEffect(getCreaturePos(cid), 10)
			setPlayerStorageValue(cid, 9952, -1)
			doCreatureSay ( cid, "Welcome to temple!", TALKTYPE_ORANGE_1 )	
			return true		
		end		