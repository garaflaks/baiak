local cfg = {
	bless = { 1, 2, 3, 4, 5 },
	cost = 1000000
}

function onSay(cid, words, param, channel)
local lvl = getPlayerLevel(cid)
--local new_cost = (lvl * cfg.cost) / 500
local new_cost = cfg.cost
local target = getPlayerGUID(cid)

    for i = 1, table.maxn(cfg.bless) do
        if(getPlayerBlessing(cid, cfg.bless[i])) then
            doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
            doCreatureSay(cid, "You have already been blessed.", TALKTYPE_ORANGE_1)
            return true
        end
    end
	if (getPlayerMoney(cid) < new_cost) then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		doSendAnimatedText(getCreaturePosition(cid), "$$$", TEXTCOLOR_WHITE)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You need "..new_cost.." to buy blessings.")
    elseif(doPlayerRemoveMoney(cid, new_cost) == TRUE) then
        for i = 1, table.maxn(cfg.bless) do
            doPlayerAddBlessing(cid, cfg.bless[i])
        end
        doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYAREA)
        doSendAnimatedText(getCreaturePosition(cid), "BLESSED!", TEXTCOLOR_RED)
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You have been blessed by the gods.")
    end
    return true
end