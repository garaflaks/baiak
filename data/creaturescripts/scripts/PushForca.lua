function isPosInArray(array, pos)

   for _, v in pairs(array) do

          if v.x == pos.x and v.y == pos.y and v.z == pos.z then

                 return true

          end

   end

   return false

end

local pos = {
   {x = 194, y = 100, z = 6},
   {x = 193, y = 100, z = 6},
   {x = 192, y = 100, z = 6},
   {x = 191, y = 100, z = 6},
   {x = 190, y = 100, z = 6},
}

function onPush(cid, target)

   if isPlayer(target) and isPosInArray(pos, getThingPos(target)) then

          doPlayerSendCancel(cid, "Você não pode empurrar players neste local.")

          return false

   end

   return true

end