local config = {
storage = 19400, -- storage em que ser� salvo o tempo
cor = "green", -- de acordo com o constant.lua da lib
tempo = 1, -- em minutos
price = 500000, -- pre�o pra usar o broadcast
level = 200 -- level pra poder utilizar o broadcast
}


function onSay(cid, words, param, channel)
if(param == '') then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "escreva !bc (digte sua mensagem aqui.)")
return true
end


if getPlayerLevel(cid) >= config.level then
if getPlayerStorageValue(cid, config.storage) - os.time() <= 0 then
if doPlayerRemoveMoney(cid, config.price) then
setPlayerStorageValue(cid, config.storage, os.time() + (config.tempo*60)) 
doBroadcastMessage("[MEGA FONE] "..getCreatureName(cid)..": "..param.."", config.cor)
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Voc� j� enviou uma mensagem. Agora voc� deve esperar " ..config.tempo.. " minuto para enviar outra mensagem ao servidor.")
return false
else
doPlayerSendCancel(cid, "Voc� n�o tem " ..config.price.. " gp's para enviar a sua mensagem.")
return false
end
else
doPlayerSendCancel(cid, "Voc� tem que esperar " ..(getPlayerStorageValue(cid, config.storage) - os.time()).. " segundos para enviar novamente outra mensagem para o servidor.")
return false
end
else
doPlayerSendCancel(cid, "Voc� precisa ser level " ..config.level.. " ou mais para enviar mensagens ao servidor.")
end
end