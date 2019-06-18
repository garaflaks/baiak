function onCombat(cid, target)
if isPlayer(cid) and isPlayer(target) then
if getPlayerStorageValue(cid, 12232) == 1 and getPlayerStorageValue(target, 12232) == 1 then
doPlayerSendCancel(cid, "Você não pode atacar seus companheiros de equipe.") return false
end
if getPlayerStorageValue(cid, 12233) == 1 and getPlayerStorageValue(target, 12233) == 1 then
doPlayerSendCancel(cid, "Você não pode atacar seus companheiros de equipe.") return false
end
return true
end
return true
end