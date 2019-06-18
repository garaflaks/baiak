local players_on_arena_count = 40


DiasonZ = {
["Monday"] = {
["10:00"] = {players = 2},
["16:00"] = {players = 2}
},
["Tuesday"] = {
["10:00"] = {players = 2},
["16:00"] = {players = 2}
},
["Wednesday"] = {
["10:00"] = {players = 2},
["16:00"] = {players = 2}
},
["Thursday"] = {
["10:00"] = {players = 2},
["16:00"] = {players = 2}
},
["Friday"] = {
["10:00"] = {players = 2},
["16:00"] = {players = 2}
},
["Saturday"] = {
["10:00"] = {players = 2},
["16:00"] = {players = 2}
},
["Sunday"] = {
["10:00"] = {players = 2},
["16:00"] = {players = 2}
}
}



function onThink(interval, lastExecution)
if DiasonZ[os.date("%A")] then
hours = tostring(os.date("%X")):sub(1, 5)
tb = DiasonZ[os.date("%A")][hours]
if tb and (tb.players % 2 == 0) then
doSetStorage(ZE_STATUS, 1)
	 setZombiesEventPlayersLimit(players_on_arena_count )
	doBroadcastMessage("[ZOMBIE EVENT] O evento foi iniciado. Estamos esperando " .. players_on_arena_count .. " players ou 2 players no minimo. 5 minutos para iniciar o evento, corra para o teleport.", 21)
	                addEvent(zombievent, 300*1000, more)
	        end
		
        return TRUE
end
end


function zombievent(more)
if(getStorage(ZE_STATUS) == 1) then
local players_on_arena_count = #getZombiesEventPlayers()
if(players_on_arena_count > 0) then
	 setZombiesEventPlayersLimit(players_on_arena_count )
	 doSetStorage(ZE_STATUS, 2)
	 doBroadcastMessage("[ZOMBIE EVENT] O evento começou.")
	 doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[ZOMBIE EVENT] Zombies invadindo.")
else
	 doBroadcastMessage("[ZOMBIE EVENT] Não é possivel começar o evento. Não existe players na area.", 21)
	 doSetStorage(ZE_STATUS, 0)
end
end
end