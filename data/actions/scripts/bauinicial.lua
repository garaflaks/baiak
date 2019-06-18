local Configs = {
	Only_Group_ID_Receive = 1,
	Storage_Received = 30001,
	ArrayVocations = {
		[1] = {
			BagID = 5927,
			Items = {
				{ItemID = 12682, Count = 1},
			},
		},
		[2] = {
			BagID = 5927,
			Items = {
				{ItemID = 12682, Count = 1},
			},
		},
		[3] = {
			BagID = 5927,
			Items = {
				{ItemID = 12682, Count = 1},
			},
		},
		[4] = {
			BagID = 5927,
			Items = {
				{ItemID = 12682, Count = 1},
			},
		},
	}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local Chest = Configs.ArrayVocations[getPlayerVocation(cid)]
	if Chest then
		if getPlayerGroupId(cid) == Configs.Only_Group_ID_Receive and getPlayerStorageValue(cid, Configs.Storage_Received) == -1 then
			local Bag = doPlayerAddItem(cid, Chest.BagID, 1)
			for i = 1, #Chest.Items do
				doAddContainerItem(Bag, Chest.Items[i].ItemID, Chest.Items[i].Count)
			end
			setPlayerStorageValue(cid, Configs.Storage_Received, 1)
		else
			doPlayerSendCancel(cid, "It's empty.")
		end
	end
	return true
end