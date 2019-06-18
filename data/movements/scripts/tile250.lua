local c = {
    level = 249,
    msg = "Desculpe, apenas jogadores level 250+ podem participar do evento."
}

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
    if getPlayerLevel(cid) <= c.level then
        doPlayerSendCancel(cid, c.msg)
        doTeleportThing(cid, fromPosition)
        return false
    end
    return true
end