local FOODS, MAX_FOOD = {
	[6574] = {60, "Mmmm."}}, 1200

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 6280) then
		if(fromPosition.x == CONTAINER_POSITION) then
			fromPosition = getThingPosition(cid)
		end

		doCreatureSay(cid, getPlayerName(cid) .. " blew out the candle.", TALKTYPE_MONSTER)
		doTransformItem(item.uid, item.itemid - 1)

		doSendMagicEffect(fromPosition, CONST_ME_POFF)
		return true
	end

	local food = FOODS[item.itemid]
	if(food == nil) then
		return false
	end

	local size = food[1]
	if(getPlayerFood(cid) + size > MAX_FOOD) then
		doPlayerSendCancel(cid, "You are full.")
		return true
	end

	doPlayerFeed(cid, size)

	doCreatureSay(cid, food[2], TALKTYPE_MONSTER)
	return true
end
