--- CRITICAL System by Night Wolf
   
  local config = {
   effectonuse = 68, -- efeito que sai
   levelscrit = 100,  --- leveis que ter�o
   storagecrit = 11903 -- storage que ser� verificado
   }
function onUse(cid, item, frompos, item2, topos)

    if getPlayerStorageValue(cid, config.storagecrit) < config.levelscrit then
   doRemoveItem(item.uid, 1)
doSendMagicEffect(topos,config.effectonuse)
doPlayerSendTextMessage(cid,22,"Voc� aumentou seu REFLECT SKILL para ["..(getPlayerStorageValue(cid, config.storagecrit)+1).."/"..config.levelscrit.."].")
setPlayerStorageValue(cid, config.storagecrit, getPlayerStorageValue(cid, config.storagecrit)+1)
elseif getPlayerStorageValue(cid, config.storagecrit) >= config.levelscrit then
doPlayerSendTextMessage(cid,22,"Voc� ja alcan�ou o nivel maximo de REFLECT SKILL.\nParab�ns!!!!")
    return 0
    end
return 1
end
