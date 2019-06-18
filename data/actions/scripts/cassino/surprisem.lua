local list = {
{["id"] = 2164, ["name"] = "Might Ring", ["count"] = 2500, ["chance"] = 25},
{["id"] = 12695, ["name"] = "Super Wand", ["count"] = 1, ["chance"] = 25},
{["id"] = 12720, ["name"] = "Premium Card", ["count"] = 1, ["chance"] = 25},
{["id"] = 2197, ["name"] = "Stone Skin Amulet", ["count"] = 500, ["chance"] = 25},
{["id"] = 12701, ["name"] = "Double Exp Potion", ["count"] = 1, ["chance"] = 25} -- <-- Remember to delete point from last one
}
local configs = {
 [5] = { removeItem = 12730 , count = 8 } 
}
local frase1 = "O player"  -- BY KingBAIAK
local frase2 = "fez uma aposta e ganhou"  -- BY KingBAIAK

function onUse(cid, item, frompos, item2, topos)
         if(doPlayerRemoveItem(cid, configs[5].removeItem, configs[5].count)) then
            rand = math.random(1,#list)
            doPlayerAddItem(cid, list[rand].id, list[rand].count)
doCreatureSay(cid,""..frase1.." ["..getCreatureName(cid).."] "..frase2.." " .. list[rand].name .. ".", TALKTYPE_ORANGE_1)
            broadcastMessage(""..frase1.." ["..getCreatureName(cid).."] "..frase2.." " .. list[rand].name .. ".", 22)
		broadcastMessage(""..frase1.." ["..getCreatureName(cid).."] "..frase2.." " .. list[rand].name .. ".", MESSAGE_STATUS_CONSOLE_BLUE)
        else
     doCreatureSay(cid,"Você precisa de 8 Premium Points para apostar!", TALKTYPE_ORANGE_1)   
            end     
return true
end