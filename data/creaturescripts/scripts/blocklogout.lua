local t = {
    storage = 54555
}

function onLogout(cid)
    if getPlayerStorageValue(cid, t.storage) > os.time() then
    doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Você precisa esperar "..getPlayerStorageValue(cid, t.storage) - os.time().. " segundos para deslogar.")
    return false
    end
  return true
end