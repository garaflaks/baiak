local function removeBattle(cid)
    doRemoveCondition(cid, CONDITION_INFIGHT)
    return false
end
function onThink(interval)
    for _, cid in ipairs(getPlayersOnline()) do
        local pos, tile = getThingPos(cid), getTileThingByPos(getThingPos(cid))
        if getTilePzInfo(pos) == true then
            removeBattle(cid)
        end
    end
return true
end