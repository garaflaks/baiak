local pos = {
   {x = 2288, y = 1685, z = 9},
   {x = 2290, y = 1664, z = 9},
}
 
function onStepIn(cid)
   doTeleportThing(cid, pos[math.random(#pos)])
   return true
end