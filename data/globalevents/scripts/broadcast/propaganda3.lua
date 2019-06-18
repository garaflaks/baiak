function onThink(interval, lastExecution)
  -- Configurações
    local cor = 27 -- Defina a cor da mensagem (27 = azul)
    local mensagens = {"Curta nossa pagina no facebook e fique por dentro dos sorteios, promoções e updates! https://www.facebook.com/tibiafantasy"} -- Defina as mensagens de propaganda
  -- Fim de Configurações 

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return true
end