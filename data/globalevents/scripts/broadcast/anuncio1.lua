function onThink(interval, lastExecution)
  -- Configura��es
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[Reporte Bugs, Pagamentos, Sugestoes e Duvidas!!
Fa�a login em nosso website e na aba da sua account, haver� uma area de ticket no final da pagina.]]
}

  -- Fim de Configura��es

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end