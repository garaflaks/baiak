function onThink(interval, lastExecution)
  -- Configurações
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[Reporte Bugs, Pagamentos, Sugestoes e Duvidas!!
Faça login em nosso website e na aba da sua account, haverá uma area de ticket no final da pagina.]]
}

  -- Fim de Configurações

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end