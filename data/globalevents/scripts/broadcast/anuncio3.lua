function onThink(interval, lastExecution)
  -- Configurações
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[Apos obter Event coins, você deve deposita-los no npc Event Bank no segundo andar do templo.
Apos deposita-los eles erão estar disponiveis no EVENT SHOP. ACESSE O SITE: http://fantasy.com.br/?subtopic=eventshop]]
}

  -- Fim de Configurações

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end