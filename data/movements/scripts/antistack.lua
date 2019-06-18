local positions = {
{x = 156, y = 49, z = 7}, -- aqui vc coloca a posição pra onde ele vão
{x = 156, y = 50, z = 7}, 
{x = 156, y = 51, z = 7},
{x = 157, y = 51, z = 7},
{x = 158, y = 51, z = 7}, 
{x = 158, y = 50, z = 7},
{x = 158, y = 49, z = 7}
}

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
doTeleportThing(cid, positions[math.random(1, #positions)])
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_GREEN)
return true
end