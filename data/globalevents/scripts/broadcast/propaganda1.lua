function onThink(interval, lastExecution)
  -- Configura��es
    local cor = 27 -- Defina a cor da mensagem (27 = azul)
    local mensagens = {"Auto Loot: sistema de pegar loots. Para mais informa��es digite /autoloot"} -- Defina as mensagens de propaganda
  -- Fim de Configura��es 

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return true
end