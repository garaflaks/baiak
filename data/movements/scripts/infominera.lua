local text = {
[1] = "Bem vindo a mineração, para minerar você deve usar um pick nas bordas, como no exemplo da seta!"
}
local posit = {x=534, y=77, z=7}
 
function onStepIn(cid, item, pos, fromPos)
		if getPlayerStorageValue(cid, 29189) == -1 then
doPlayerSendTextMessage(cid, 22, text[math.random(1 , #text)])
			doSendMagicEffect(posit, 55)
			doSendMagicEffect(posit, 56)
			setPlayerStorageValue(cid, 29189, 1)
end
end