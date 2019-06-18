function onThink(interval, lastExecution)
  -- Configurações
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[Zombie: 10h e 16h 
FireStorm: 14h e 02:30h 
CTF: 15h
DesertWar: 17h
Snowball: 18h
Battlefield: 19h
Defend The Tower: 20h
PvpEnfoced: 22h~23h
Castle War: 22:00
IOE: 23h
WAVE EVENT: 13:30h e 19:30
BURACO X: 20:30h]]
}

  -- Fim de Configurações

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end