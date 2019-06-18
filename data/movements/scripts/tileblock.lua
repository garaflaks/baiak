local c = {
    level = 8888,
    msg = "Desculpe, os castelos só abrirão em 5 dias de servidor online."
}

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
    if getPlayerLevel(cid) <= c.level then
        doPlayerSendCancel(cid, c.msg)
        doTeleportThing(cid, fromPosition)
        return false
    end
    return true
end