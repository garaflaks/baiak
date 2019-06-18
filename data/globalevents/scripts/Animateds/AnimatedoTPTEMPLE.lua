local positions = {
   ["Acesso 1"] = {{x = 447, y = 33, z = 7}, 9},
   ["Acesso 2"] = {{x = 451, y = 33, z = 7}, 9},
   ["Acesso 3"] = {{x = 453, y = 31, z = 8}, 9},

}

function onThink(cid, interval, lastExecution)
   for text, v in pairs(positions) do
      doSendAnimatedText(v[1], text, math.random(1, 255))
   end

   return true
end