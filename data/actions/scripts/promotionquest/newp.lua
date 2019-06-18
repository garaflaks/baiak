function onUse(cid, item, frompos, itemEx, topos)
    
local pose = getPlayerPosition(cid)
local porm = (getPlayerPromotionLevel(cid) + 1)
local voc = (getPlayerVocation(cid) + 4)
    if getPlayerVocation(cid) < 9 then
        if getPlayerVocation(cid) < 5 then
            doPlayerSendCancel(cid,"Voce precisa ter promotion donate para ser promovido.")
        else
        doPlayerSetPromotionLevel(cid, getPlayerPromotionLevel(cid) + 1)
              doCreatureSay(cid, "Você foi promovido.", TALKTYPE_ORANGE_1)
                doSendMagicEffect(pose, 49)
        setPlayerStorageValue(cid, 17902, 1) 
        doPlayerSendTextMessage(cid,22,"Parabens, voce foi promovido!")
        doPlayerAddItem(cid, 10127)
                
        end
    else
            doPlayerSendCancel(cid,"Voce ja ganhou sua promoção.")
    end
    
    return true
end