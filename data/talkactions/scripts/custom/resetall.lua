local time = 30 -- tempo em segundos para permitir o login(coloque um pouco mais do tempo de um Server Game do seu mapa)

function onSay()
    doSetGameState(GAMESTATE_CLOSED)
    db.query("UPDATE `players` SET `level` = '8', `health` = '180', `healthmax` = '180', `experience` = '4200',`maglevel` = '0', `mana` = '50', `manamax` = '50', `cap` = '700' ;")
    db.query("UPDATE `player_skills` SET `value` = '10' ;")
    db.query("TRUNCATE TABLE  `player_depotitems`;")
    db.query("TRUNCATE TABLE  `guilds`;")
    db.query("TRUNCATE TABLE  `houses`;")
    db.query("TRUNCATE TABLE  `tile_items`;")
    db.query("TRUNCATE TABLE  `tile_store`;")
    db.query("TRUNCATE TABLE  `tile_store`;")
    db.query("TRUNCATE TABLE  `player_items`;")
    db.query("TRUNCATE TABLE  `player_storage`;")
    db.query("TRUNCATE TABLE  `global_storage`;")
    db.query("UPDATE players SET posx = 157, posy = 50, posz = 7;")
    return addEvent(doSetGameState, 1000 * time, GAMESTATE_NORMAL)
end

