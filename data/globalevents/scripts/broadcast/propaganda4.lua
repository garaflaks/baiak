function onThink(interval, lastExecution)
  -- Configura��es
    local cor = 27 -- Defina a cor da mensagem (27 = azul)
    local mensagens = {"use o comando !eject na frente da porta de alguma casa e torne-se dono. Para saber quais casas estao disponiveis http://fantasy.com.br/?subtopic=Inactives_Houses"} -- Defina as mensagens de propaganda
  -- Fim de Configura��es 

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return true
end