local text = {
[1] = "Bem vindo ao paraiso, entre no teleporte e tenha acesso a nosa ilha sagrada!"
}
local posit = {x=157, y=39, z=6}
 
function onStepIn(cid, item, pos, fromPos)
		if getPlayerStorageValue(cid, 29190) == -1 then
doPlayerSendTextMessage(cid, 22, text[math.random(1 , #text)])
			doSendMagicEffect(posit, 55)
			doSendMagicEffect(posit, 56)
			setPlayerStorageValue(cid, 29190, 1)
end
end