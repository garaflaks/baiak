local dodge = 11903
function onSay(cid)
if getPlayerStorageValue(cid, dodge) >= 1 then
doPlayerPopupFYI(cid, "Reflect System:\n\n O sistema consiste em devolver 30% do hit tomado.\n Quanto maior o seu level, maior a chance! \n Ou seja, se um player for causar 1.000 \n em você, ele leva 300 de volta. \n\n Para obter Reflect Stones, você deve minerar ou fazer as quests de idades. \n\n Level: ["..getPlayerStorageValue(cid, dodge).."/100]")
else
doPlayerPopupFYI(cid,"Reflect System:\n\n O sistema consiste em refletir 30% do hit tomado.\n Quanto maior o seu level, maior a chance! \n Ou seja, se um player for causar 1.000 \n em você, ele leva 300 de volta. \n\n Para obter Reflect Stones, você deve minerar ou fazer as quests de idades. \n\n Level: [0/100]")
end
return 1
end