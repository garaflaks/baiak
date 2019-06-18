local config = {  --msg = "TEXTO QUE O TP VAI 'FALAR', cor = "COR DO TEXTO", "pos = {POSIÇÃO DO TP}, efeitos = {EFEITOS QUE VÃO APARECER EM CIMA DO TP}
[1] = {msg = "ShamanAdn", cor = 211, pos = {x=627, y=456, z=7}, efeitos = {31, 10}},
[2] = {msg = "KnightAdn", cor = 211, pos = {x = 627, y = 464, z = 7}, efeitos = {31, 10}}, 
[3] = {msg = "HunterAdn", cor = 211, pos = {x = 631, y = 464, z = 7}, efeitos = {31, 10}}, 
[4] = {msg = "YalahAdn", cor = 211, pos = {x = 631, y = 456, z = 7}, efeitos = {31, 10}}, 
[5] = {msg = "JesterAdn", cor = 211, pos = {x = 635, y = 456, z = 7}, efeitos = {31, 10}}, 
[6] = {msg = "PirateAdn", cor = 211, pos = {x = 635, y = 464, z = 7}, efeitos = {31, 10}}, 
[7] = {msg = "DH", cor = 211, pos = {x = 645, y = 423, z = 7}, efeitos = {31, 10}}, 
[8] = {msg = "POI", cor = 211, pos = {x = 645, y = 431, z = 7}, efeitos = {31, 10}}, 
[9] = {msg = "Anihi", cor = 211, pos = {x = 649, y = 423, z = 7}, efeitos = {31, 10}}, 
[10] = {msg = "GoldenBts", cor = 211, pos = {x = 649, y = 431, z = 7}, efeitos = {31, 10}}, 
[11] = {msg = "MegaHat", cor = 211, pos = {x = 654, y = 423, z = 7}, efeitos = {31, 10}}, 
[12] = {msg = "Canivete", cor = 211, pos = {x = 654, y = 431, z = 7}, efeitos = {31, 10}}, 
[13] = {msg = "MegaShield", cor = 211, pos = {x = 659, y = 423, z = 7}, efeitos = {31, 10}}, 
[14] = {msg = "WingedQuest", cor = 211, pos = {x = 659, y = 431, z = 7}, efeitos = {31, 10}}, 
[15] = {msg = "MegaLegs", cor = 211, pos = {x = 664, y = 423, z = 7}, efeitos = {31, 10}}, 
[16] = {msg = "MegaBoots", cor = 211, pos = {x = 664, y = 431, z = 7}, efeitos = {31, 10}}, 
[17] = {msg = "SuperMagia", cor = 211, pos = {x = 693, y = 431, z = 7}, efeitos = {31, 10}}, 
[18] = {msg = "Critical", cor = 211, pos = {x = 688, y = 423, z = 7}, efeitos = {31, 10}}, 
[19] = {msg = "Native", cor = 211, pos = {x = 669, y = 431, z = 7}, efeitos = {31, 10}}, 
[20] = {msg = "BestItem", cor = 211, pos = {x = 688, y = 431, z = 7}, efeitos = {31, 10}}, 
[21] = {msg = "Dodge", cor = 211, pos = {x = 693, y = 423, z = 7}, efeitos = {31, 10}}, 
[22] = {msg = "MegaArmor", cor = 211, pos = {x = 669, y = 423, z = 7}, efeitos = {31, 10}}, 
[23] = {msg = "EliteQst", cor = 211, pos = {x = 701, y = 424, z = 7}, efeitos = {31, 10}}, 
[24] = {msg = "MegaRing", cor = 211, pos = {x = 706, y = 427, z = 7}, efeitos = {31, 10}}, 
[25] = {msg = "Temple!", cor = 211, pos = {x = 624, y = 460, z = 7}, efeitos = {31, 10}}, 
[26] = {msg = "Temple!", cor = 211, pos = {x = 632, y = 427, z = 7}, efeitos = {31, 10}}, 
[27] = {msg = "Temple!", cor = 211, pos = {x = 402, y = 187, z = 7}, efeitos = {31, 10}}, 
[28] = {msg = "Temple!", cor = 211, pos = {x = 311, y = 228, z = 8}, efeitos = {31, 10}}, 
[29] = {msg = "Blessed", cor = 211, pos = {x = 682, y = 431, z = 7}, efeitos = {31, 10}}, 
[30] = {msg = "DSL Quest", cor = 211, pos = {x = 682, y = 423, z = 7}, efeitos = {31, 10}},
[31] = {msg = "Promotion", cor = 211, pos = {x = 701, y = 430, z = 7}, efeitos = {31, 10}}


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