bomb_config = {
	-- Arena Bomberman 
	from = {x=909, y=623, z=7}, -- topo esquerdo
	to = {x=923, y=633, z=7}, -- baixo direito
	
	temple = {x=157, y=50, z=7}, -- posicao onde os jogadores serao enviados ao morrer

	center_room = {x=916, y=628, z=7}, -- centro da sala de bombas

	boots_haste = 2195, -- bota que vai dar haste

	pos_lever = {
		{x=915, y=655, z=7},
		{x=916, y=655, z=7},
		{x=917, y=655, z=7},
		{x=918, y=655, z=7}
	}, 

	go_lever = {
		{x=909, y=623, z=7}, -- alavanca para onde leva 1
		{x=909, y=633, z=7}, -- alavanca para onde leva 2
		{x=923, y=633, z=7}, -- alavanca para onde leva 3
		{x=923, y=623, z=7}  -- alavanca para onde leva 4
	},
	
	exceptions = {
		{x=909, y=623, z=7},
		{x=910, y=623, z=7},
		{x=909, y=624, z=7},
		{x=909, y=633, z=7},
		{x=910, y=633, z=7},
		{x=909, y=632, z=7},
		{x=923, y=633, z=7},
		{x=922, y=633, z=7},
		{x=923, y=632, z=7},
		{x=923, y=623, z=7},
		{x=923, y=624, z=7},
		{x=922, y=623, z=7}
		
	},

	-- Nao mexa ---
	storage = {
		placed = 10001,
		max = 10002,
		radius = 10003
	},

	delay = 3000,
	bombID = 10571,
	effect = CONST_ME_FIREAREA,
	blockID = 9468,
	text = "BOOM!",

}