local config = {  --msg = "TEXTO QUE O TP VAI 'FALAR', cor = "COR DO TEXTO", "pos = {POSIÇÃO DO TP}, efeitos = {EFEITOS QUE VÃO APARECER EM CIMA DO TP}
[1] = {msg = "STAFF", cor = 181, pos = {x=153, y=48, z=8}},
[2] = {msg = "AXE", cor = 181, pos = {x = 154, y = 48, z = 8}},
[3] = {msg = "CLUB", cor = 181, pos = {x = 155, y = 48, z = 8}}, 
[4] = {msg = "SWORD", cor = 181, pos = {x = 156, y = 48, z = 8}}, 
[5] = {msg = "SPEAR", cor = 181, pos = {x = 157, y = 48, z = 8}},
[6] = {msg = "10kk", cor = 211, pos = {x = 153, y = 49, z = 8}}, 
[7] = {msg = "10kk", cor = 211, pos = {x = 154, y = 49, z = 8}},
[8] = {msg = "10kk", cor = 211, pos = {x = 155, y = 49, z = 8}}, 
[9] = {msg = "10kk", cor = 211, pos = {x = 156, y = 49, z = 8}},
[10] = {msg = "10kk", cor = 211, pos = {x = 157, y = 49, z = 8}},


}

function onThink(interval, lastExecution)
	for _, v in pairs(config) do
		doSendAnimatedText(v.pos, v.msg, v.cor)
	end
	return true
end
