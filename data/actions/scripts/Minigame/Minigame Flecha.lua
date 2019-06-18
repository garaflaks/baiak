function onUse(cid, item, fromPosition, itemEx, toPosition)
	local game
	if item.actionid == 4621 then
		game = MiniGame:new({cid = cid, playerPos = {x = 391, y = 185, z = 7}, birdPos = {x = 386, y = 185, z = 7}, fromPos = {x = 385, y = 180, z = 7}, toPos = {x = 391, y = 189, z = 7}})
		game:Start(3)
	end
	return true
end
