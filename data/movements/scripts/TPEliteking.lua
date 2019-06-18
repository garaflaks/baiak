local pos = {
   {x = 534, y = 1130, z = 7},
   {x = 561, y = 1137, z = 7},
   {x = 532, y = 1163, z = 7},
   {x = 552, y = 1162, z = 7},
}
 
function onStepIn(cid)
   doTeleportThing(cid, pos[math.random(#pos)])
   return true
end