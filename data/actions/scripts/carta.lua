function onUse(cid, item, fromPosition, itemEx, toPosition)

local tempo = 1440 * 60  -- aqui voc� coloca o tempo, lembrando que � minutos * segundos


local stg = getPlayerStorageValue(cid, 123541)
if (stg == -1) then
stg = 0
end
if getPlayerStorageValue(cid, 123540) - os.time() <= 0 then
        doPlayerAddItem(cid, 12765, 1)
time = os.time() + tempo
setPlayerStorageValue(cid, 123540, time)
setPlayerStorageValue(cid, 123541, stg+1)
local stg = getPlayerStorageValue(cid, 123541)
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voc� recebeu uma carta, voce pode enviar uma mensagem direta aos admins quando terminar coloque na mailbox.")
    else
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voc� deve esperar 24 horas para pegar outra carta. Proxima carta estar� disponivel amanha as: " .. os.date("%H:%M:%S", getPlayerStorageValue(cid, 123540)) .. ".")
end
return true
end