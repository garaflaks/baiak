local quest = {x=1049,y=1298,z=7}
function onStepIn(cid, item, position, fromPosition)
			doTeleportThing (cid, quest, TRUE)
			doSendMagicEffect(getCreaturePos(cid), 10)
			setPlayerStorageValue(cid, 49689, -1)
			doCreatureSay ( cid, "Welcome to CastleWar!", TALKTYPE_ORANGE_1 )	
			return true		
		end		