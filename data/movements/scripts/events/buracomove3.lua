local quest = {x=157,y=50,z=7}
function onStepIn(cid, item, position, fromPosition)
			doPlayerSetStorageValue(cid, 12532,-1)
			doTeleportThing (cid, quest, TRUE)
			doSendMagicEffect(getCreaturePos(cid), 6)
			doCreatureSay(cid, "[BURACO X] Você perdeu!", TALKTYPE_ORANGE_1 )	
		 doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[BURACO X] Você perdeu!")
local players,str = {},""
for _, cid in pairs(getPlayersOnline()) do
if getPlayerStorageValue(cid, 12532) == 1 then
table.insert(players, cid)
end
end
for i = 1, #players do
if(#players <= 1) then
	 local winner = players[1]
	 if(winner) then
		  doPlayerAddItem(winner, 12669, 1, true)
		 doPlayerAddItem(winner, 12715, 1, true)
		 doPlayerAddItem(winner, 12701, 1, true)
		 doPlayerAddItem(winner, 12734, 5, true)
		 doPlayerSendTextMessage(winner, MESSAGE_STATUS_CONSOLE_BLUE, "[BURACO X] Você ganhou o evento buraco x.")
		 doBroadcastMessage("[BURACO X] O player " .. getCreatureName(winner) .. " ganhou nosso evento exclusivo buraco x! \n Recompensa: 2 day VIP, 20kk, 1 potion exp, 10 event coins.")
			doPlayerSetStorageValue(winner, 12532,-1)
		 doTeleportThing(winner, getTownTemplePosition(1))
	 else
		 doBroadcastMessage("[BURACO X] O evento acabou, ninguem ganhou! ninguem ganhou?!?!?! WTF!")
	 end
	 end
end
end