function onThink(interval, lastExecution)
  -- Configurações
    local cor = 20 -- Defina a cor da mensagem (20 = Orange)
    local mensagens = {"{Mensagem} Confira nosso SHOPPING DONATE e deixe eu personagem devidamente equipado! Mais Informações, Acesse -> http://fantasy.com.br/?subtopic=shopsystem"} -- Defina as mensagens de propaganda
  -- Fim de Configurações

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end