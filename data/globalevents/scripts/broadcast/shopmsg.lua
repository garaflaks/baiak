function onThink(interval, lastExecution)
  -- Configura��es
    local cor = 20 -- Defina a cor da mensagem (20 = Orange)
    local mensagens = {"{Mensagem} Confira nosso SHOPPING DONATE e deixe eu personagem devidamente equipado! Mais Informa��es, Acesse -> http://fantasy.com.br/?subtopic=shopsystem"} -- Defina as mensagens de propaganda
  -- Fim de Configura��es

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end