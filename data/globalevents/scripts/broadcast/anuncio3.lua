function onThink(interval, lastExecution)
  -- Configura��es
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[Apos obter Event coins, voc� deve deposita-los no npc Event Bank no segundo andar do templo.
Apos deposita-los eles er�o estar disponiveis no EVENT SHOP. ACESSE O SITE: http://fantasy.com.br/?subtopic=eventshop]]
}

  -- Fim de Configura��es

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end