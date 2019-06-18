function onThink(interval)
   if #getPlayersOnline() >= 1 then
     for i = 1,#getPlayersOnline() do
       doPlayerSetStorageValue(getPlayersOnline()[i],6723, getPlayerStorageValue(getPlayersOnline()[i],6723) + 1)
     end
   end

   return true
end