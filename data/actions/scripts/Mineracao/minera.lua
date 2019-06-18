 terra = {5634,5631,5635,5632,5636,5638,5633,5637}

local config = {
storage = 19333,
chance = 1, --- chance de achar um item ou não
k = 2, --- constante de level.. quanto maior, mais fácil é upar. (a fórmula é level ao quadrado dividido pela constante)
experience = 19334
}

local list = {
{["id"] = 12543, ["name"] = "1 PEDRA!", ["count"] = 1, ["chance"] = 50},
{["id"] = 12543, ["name"] = "1 PEDRA!", ["count"] = 1, ["chance"] = 10},
{["id"] = 12543, ["name"] = "1 PEDRA!", ["count"] = 1, ["chance"] = 5},
{["id"] = 12543, ["name"] = "1 PEDRA!", ["count"] = 1, ["chance"] = 35}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
if getCreaturePosition(cid).z == 7 then 
if isInArray(terra, itemEx.itemid) then
if config.chance >= math.random(1,30) then
            rand = math.random(1,#list)
            doPlayerAddItem(cid, list[rand].id, list[rand].count)
doCreatureSay(cid," " .. list[rand].name .. "", TALKTYPE_ORANGE_1)
doSendAnimatedText(toPosition, "Nice!", math.random(TEXTCOLOR_LIGHTBLUE, TEXTCOLOR_LIGHTBLUE))
doSendMagicEffect(toPosition, 3)
doSendMagicEffect(getPlayerPosition(cid), 30)
else
doSendMagicEffect(getPlayerPosition(cid), 2)
doSendMagicEffect(toPosition, 2)
doSendAnimatedText(toPosition, "Fail!", math.random(TEXTCOLOR_DARKRED, TEXTCOLOR_DARKRED))
return true
end
end
end
end