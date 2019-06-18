	local vocations = {5,6,7,8,9,10,11,12} 
function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
local posq = {x=1740,y=39,z=3}
	if isInArray(vocations,getPlayerVocation(cid)) and getPlayerLevel(cid) >= 500 then
		doTeleportThing(cid,posq)
	else
		doTeleportThing(cid,lastPosition)
                doCreatureSay(cid, "[PROMOTION QUEST] Voce precisa ser (promotion donate) e ter level 500!", TALKTYPE_ORANGE_1)
		doSendMagicEffect(getPlayerPosition(cid),6)
	end

	return true
end