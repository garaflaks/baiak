function onThink(interval, lastExecution)
  -- Configurações
    local cor = 27 -- Defina a cor da mensagem (27 = azul)
    local mensagens = {"Dodge System / Critical System / Reflect System: Para mais informações, digite !dodge / !critical / !reflect."} -- Defina as mensagens de propaganda
  -- Fim de Configurações 

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return true
end