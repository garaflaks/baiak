local pos = {
              minx = 515,
              maxx = 561,
              miny = 524,
              maxy = 562
}
               
function onSay(cid, words, param, channel)
    if getThingPos(cid).x >= pos.minx and getThingPos(cid).x <= pos.maxx and getThingPos(cid).y >= pos.miny and getThingPos(cid).y <= pos.maxy then
        doPlayerSendCancel(cid,"You cant use this spell inside the Zombie Event!")
           return true
    end
end