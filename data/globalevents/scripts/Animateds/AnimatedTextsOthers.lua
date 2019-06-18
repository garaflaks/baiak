local config = {  --msg = "TEXTO QUE O TP VAI 'FALAR', cor = "COR DO TEXTO", "pos = {POSIÇÃO DO TP}, efeitos = {EFEITOS QUE VÃO APARECER EM CIMA DO TP}
[1] = {msg = "CRITICAL", cor = 181, pos = {x = 147, y = 38, z = 8}}, 
[2] = {msg = "DODGE", cor = 181, pos = {x = 149, y = 38, z = 8}}, 
[3] = {msg = "RMVSKULL", cor = 181, pos = {x = 151, y = 38, z = 8}},
[4] = {msg = "STAMINA", cor = 181, pos = {x = 153, y = 38, z = 8}},
[5] = {msg = "ADDONDOLL", cor = 181, pos = {x = 155, y = 38, z = 8}},
[6] = {msg = "30kk", cor = 211, pos = {x = 147, y = 39, z = 8}}, 
[7] = {msg = "20kk", cor = 211, pos = {x = 149, y = 39, z = 8}},
[8] = {msg = "60kk", cor = 211, pos = {x = 151, y = 39, z = 8}},
[9] = {msg = "10kk", cor = 211, pos = {x = 153, y = 39, z = 8}},
[10] = {msg = "150kk", cor = 211, pos = {x = 155, y = 39, z = 8}},
[11] = {msg = "10kk", cor = 211, pos = {x = 448, y = 29, z = 7}},
[12] = {msg = "25kk", cor = 211, pos = {x = 450, y = 29, z = 7}},
[13] = {msg = "DRUID", cor = 181, pos = {x = 289, y = 115, z = 8}},
[14] = {msg = "SORCERER", cor = 181, pos = {x = 287, y = 115, z = 8}},
[15] = {msg = "PALADIN", cor = 181, pos = {x = 293, y = 115, z = 8}},
[16] = {msg = "KNIGHT", cor = 181, pos = {x = 291, y = 115, z = 8}},
[17] = {msg = "MAGE", cor = 181, pos = {x = 470, y = 1232, z = 7}},
[18] = {msg = "KNIGHT", cor = 181, pos = {x = 468, y = 1232, z = 7}},
[19] = {msg = "KNIGHT", cor = 181, pos = {x = 466, y = 1232, z = 7}},
[20] = {msg = "KNIGHT", cor = 181, pos = {x = 464, y = 1232, z = 7}},
[21] = {msg = "PALADIN", cor = 181, pos = {x = 472, y = 1232, z = 7}},
[22] = {msg = "20 Event coins", cor = 211, pos = {x = 451, y = 28, z = 8}},
[23] = {msg = "KNIGHT", cor = 181, pos = {x = 805, y = 434, z = 8}},
[24] = {msg = "PALADIN", cor = 181, pos = {x = 810, y = 434, z = 8}},
[25] = {msg = "DRUID", cor = 181, pos = {x = 815, y = 434, z = 8}},
[26] = {msg = "SORCERER", cor = 181, pos = {x = 820, y = 434, z = 8}},
[27] = {msg = "CHANGESEX", cor = 181, pos = {x = 157, y = 38, z = 8}},
[28] = {msg = "40kk", cor = 211, pos = {x = 157, y = 39, z = 8}},
[29] = {msg = "TP SCROLL", cor = 181, pos = {x = 159, y = 38, z = 8}},
[30] = {msg = "60kk", cor = 211, pos = {x = 159, y = 39, z = 8}},


}

function onThink(interval, lastExecution)
	for _, v in pairs(config) do
		doSendAnimatedText(v.pos, v.msg, v.cor)
	end
	return true
end
