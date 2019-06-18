local t = {
   pos = {x=537,y=79,z=6},
   level = 100
}
function onStepIn(cid, item, position, fromPosition)
        if getPlayerLevel(cid) < t.level then
        doPlayerSendCancel(cid, 'Apenas jogadores level '.. t.level ..' podem passar aqui.')
        doTeleportThing(cid, fromPosition)
		else
			doTeleportThing (cid, t.pos)
			doSendMagicEffect(getCreaturePos(cid), 10)
				doPlayerPopupFYI(cid, "Sistema de Mineração: \n\nVocê deverá usar uma PICK (comprada com o npc Minerazer) nas bordas da caverna para minerar. \n Ao conseguir você poderá encontrar pedras de mineração e trocar por Reflect Stone.\n\n Você pode trocas 100 pedras por um Reflect Stone na alavanca no andar inferior da area de mineração. \n\n Para saber sobre Reflect System utilize o comando !reflect")
            end
			return true		
		end		

