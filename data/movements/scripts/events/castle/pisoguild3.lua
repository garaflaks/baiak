function onStepIn(cid, item, position, fromPosition)



local n, g = getCreatureName(cid), getPlayerGuildName(cid)



if getPlayerGuildId(cid) == 0 then

doPlayerSendCancel(cid, "Apenas Jogadores Com Guild Pode Entrar Nessa Zona.")

doTeleportThing(cid, fromPosition, false) return true

end



if getPlayerStorageValue(cid, 9952) - os.time() < 1 then





setPlayerStorageValue(cid, 9952, os.time() + 250 * 1000)




end

return true

end