function onThink(interval, lastExecution)
  -- Configura��es
    local cor = 27 -- Defina a cor da mensagem (27 = azul)
    local mensagens = {"Dodge System / Critical System / Reflect System: Para mais informa��es, digite !dodge / !critical / !reflect."} -- Defina as mensagens de propaganda
  -- Fim de Configura��es 

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return true
end