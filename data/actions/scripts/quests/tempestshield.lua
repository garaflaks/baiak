function onUse(cid, item, frompos, item2, topos)

if getPlayerLevel(cid) >= 100 then

    if item.uid == 2542 then
     queststatus = getPlayerStorageValue(cid,22542)
     if queststatus == -1 then
   doPlayerSendTextMessage(cid,22,"You found Tempest Shield")
   doPlayerAddItem(cid,2542,1)
   setPlayerStorageValue(cid,2542,1)
     else
      doPlayerSendTextMessage(cid,22,"This Chest is empty.")
     end
    
 else
  return 0
    end
else
doPlayerSendTextMessage(cid, 22, "Você Precisa ser level 100 para fazer está quest!")
end
    return 1
end