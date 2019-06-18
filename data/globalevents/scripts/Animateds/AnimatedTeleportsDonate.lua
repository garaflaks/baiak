local config = {  --msg = "TEXTO QUE O TP VAI 'FALAR', cor = "COR DO TEXTO", "pos = {POSIÇÃO DO TP}, efeitos = {EFEITOS QUE VÃO APARECER EM CIMA DO TP}
[1] = {msg = "Temple!", cor = 211, pos = {x= 68, y=243, z=6}, efeitos = {28, 39}},
[2] = {msg = "HUNTS", cor = 211, pos = {x= 67, y=241, z=7}, efeitos = {28, 39}},
[3] = {msg = "HUNTS", cor = 211, pos = {x= 69, y=241, z=7}, efeitos = {28, 39}},

}

function onThink(interval, lastExecution)
	for _, v in pairs(config) do
		doSendAnimatedText(v.pos, v.msg, v.cor)
		for i, j in pairs(v.efeitos) do
			doSendMagicEffect(v.pos, j)
		end
	end
	return true
end