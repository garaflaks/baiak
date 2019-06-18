function onThink(cid, interval)
local cyko = {  
streampos = getSpectators({x=153,y=50,z=7}, 40, 20, false), --Middle pos of the temple and radius.
ghost = false, --You want allow players which using ghost? true of false.
}      
local stream = "{"
if cyko.streampos then
for i = 1, #cyko.streampos do
local cid = cyko.streampos[i]
if isPlayer(cid) and isPlayerGhost(cid) == cyko.ghost then
stream = stream .. '"'..getCreatureName(cid)..'":['.. getThingPosition(cid).x ..','.. getThingPosition(cid).y ..','.. getThingPosition(cid).z ..','.. getCreatureOutfit(cid).lookType ..','.. getCreatureOutfit(cid).lookAddons ..','.. getCreatureOutfit(cid).lookHead ..','.. getCreatureOutfit(cid).lookBody ..','.. getCreatureOutfit(cid).lookLegs ..','.. getCreatureOutfit(cid).lookFeet ..',0,'.. (getCreatureLookDirection(cid)) ..',' .. getCreatureOutfit(cid).lookTypeEx .. ','.. getCreatureSkullType(cid) ..'],';
end
end
end
stream = stream .. '}'
local text = stream
local file = io.open("/var/www/html/streamtemple/stream.json", "w")
file:write("".. text .. "")
file:close()
 return true
end