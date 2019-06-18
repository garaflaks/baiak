local c = {
    level = 1,
    msg = "Event Off."
}

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
    if getPlayerLevel(cid) >= c.level then
        doPlayerSendCancel(cid, c.msg)
        doTeleportThing(cid, fromPosition)
        return false
    end
    return true
end