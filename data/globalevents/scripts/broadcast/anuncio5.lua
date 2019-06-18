function onThink(interval, lastExecution)
  -- Configurações
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[Não esqueça de pagar o ALUGUEL da sua casa.
Para paga-lo você deve deixar o dinheiro no banco com o npc Oswaldo (SUBSOLO DO TEMPLO).
Para saber comandos de house acesse http://fantasy.com.br/?subtopic=Commands]]
}

  -- Fim de Configurações

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end