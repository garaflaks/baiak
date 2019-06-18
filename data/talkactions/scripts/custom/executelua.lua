function onSay(cid, words, param)
    local player = Player(cid)
    local time = 5
    if exhaustion.check(cid, 30017) then
    doPlayerSendCancel(cid, "Exhaustion Please Wait "..exhaustion.get(cid,30017).."")
return true
end
    if param == "emote" and doPlayergetStorageValue(cid, 30019) < 1 then
        doPlayerSetStorageValue(cid,30019, 1)
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have enabled emoted spells.")
        exhaustion.set(cid, 30017,time)
    elseif param == "normal" and doPlayergetStorageValue(cid, 30019) == 1 then
        doPlayerSetStorageValue(cid, 30019, 0)
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have disabled emoted spells.")
    end
    return false
end