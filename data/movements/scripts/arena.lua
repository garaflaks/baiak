function onStepIn(cid, item, pos)

local pozycja = {x=141, y=16, z=6}
local level = 1

    if isCreature(cid) == TRUE then
        if getPlayerLevel(cid) > level then
            doTeleportThing(cid, pozycja)
            doSendMagicEffect(getPlayerPosition(cid), 10)
        else
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Dziekujemy za Walke na Arenie.")
            return 0
        end
    else
        return 0
    end
return true
end