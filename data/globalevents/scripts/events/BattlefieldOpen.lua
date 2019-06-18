function onTime()
	setGlobalStorageValue(battlefield.storage, battlefield.Max_Players)
	doBroadcastMessage("[BATTLEFIELD] o evento começa em 3 minutos, nos estamos esperando ".. battlefield.Max_Players .." Jogadores, com um minimo de 2 para começar! Time dividido em ".. battlefield.Max_Players / 2 .." VS ".. battlefield.Max_Players / 2 .. ".")
	doItemSetAttribute(doCreateItem(1387, 1, battlefield.tpPos), "aid", battlefield.TeleportAID)
	addEvent(startBattlefield, battlefield.Time_To_Start_Event * 60 * 1000)
	return true
end