function onLook(cid, thing, position, lookDistance)
local quests = {13967,5924,5925,5926,5927,19141,12494,2493,10544,10545,10546,10547,10549,10550,10559,10548,2466,2646,17458,18766,18765,17497,11259,17464,12358,16095,12508,8887,2523,12713,10137,12718,12263,12761,12711,12724,10502}
local completed = {}
        if isPlayer(thing.uid) then
                for i = 1, #quests do
                        if getPlayerStorageValue(thing.uid, quests[i]) > 0 then
                                table.insert(completed, 1)
                        end
                end
                doPlayerSetSpecialDescription(thing.uid, (getPlayerSex(thing.uid) == 0 and ".\nShe" or ".\nHe") .. " has completed ".. #completed .. "/" .. #quests .. " quests")
                doPlayerSendTextMessage(cid, 27, getPlayerName(thing.uid) .. " has completed " .. #completed .. "/" .. #quests .. " quests.")
        end
return true
end