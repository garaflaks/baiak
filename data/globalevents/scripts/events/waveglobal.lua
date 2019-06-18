local storageX = 12232
local waittime = 3
local tptemplo = {x = 151, y = 47, z = 7}
local msg1 = "[WAVE EVENT] O evento WAVE MONSTER foi inciado no templo, esperaremos 3 minutos para iniciar!"
local msg2 = "[WAVE EVENT] O evento WAVE MONSTER foi inciado no templo, restam 1 minuto para iniciar!"
local postopw = {x = 762, y = 517, z = 7}
local posdownw = {x = 772, y = 524, z = 7}

local maptop = {x = 822, y = 520, z = 7}
local mapdown = {x = 825, y = 525, z = 7}

local t_l = {x = 808, y = 506, z = 7}
local b_r = {x = 838, y = 535, z = 7}
local t_l2 = {x = 823, y = 522, z = 7}
local b_r2 = {x = 826, y = 525, z = 7}
local posX = {x = 824, y = 521, z = 7}

function onTime()
                            
                                    doBroadcastMessage(msg1, MESSAGE_STATUS_WARNING)
                                                   addEvent(msgsnow6, 2*1000*60)                            
                                            addEvent(moveToEvent6, waittime*1000*60)
                                            doCreateTeleport(1387, {x = 767, y = 520, z = 7}, tptemplo)
						
                 			   end
                   
			function msgsnow6()
                                    doBroadcastMessage(msg2, MESSAGE_STATUS_WARNING)
       				 end

  
                    function moveToEvent6()
                            for _, pid in ipairs(getPlayersOnline()) do
                                    if isInRange(getCreaturePosition(pid), postopw, posdownw) then
                                           doTeleportThing(pid, {x=math.random(t_l2.x,b_r2.x), y=math.random(t_l2.y, b_r2.y), z=math.random(t_l2.z, b_r2.z)})
                                             doPlayerSetStorageValue(pid, storageX,1)
						setGlobalStorageValue(49933, 1)

						setGlobalStorageValue(49941, 1)
						setGlobalStorageValue(49942, 1)
						setGlobalStorageValue(49943, 1)
						setGlobalStorageValue(49944, 1)
						setGlobalStorageValue(49945, 1)
						setGlobalStorageValue(49946, 1)
						setGlobalStorageValue(49947, 1)
						setGlobalStorageValue(49948, 1)
                            doPlayerSendTextMessage(pid,27,"[WAVE EVENT] Bem vindo ao evento WAVE MONSTER, sobreviva aos respawns!")
					addEvent(wave1, 1*1000*60)
					addEvent(wave2, 2*1000*60)
					addEvent(wave3, 3*1000*60)
					addEvent(wave4, 4*1000*60)
					addEvent(wave5, 5*1000*60)
					addEvent(wave6, 6*1000*60)
					addEvent(wave7, 8*1000*60)
					addEvent(wave8, 10*1000*60)
							addEvent(FimX, 13*1000*60)
							


					countDown(posX, 60, 129)
      				  doSendAnimatedText({x = 824, y = 521, z = 7}, "RESPAWN", math.random(TEXTCOLOR_RED, TEXTCOLOR_RED))
      				  doSendAnimatedText({x = 826, y = 521, z = 7}, "TIME", math.random(TEXTCOLOR_RED, TEXTCOLOR_RED))
                                    end
                            end
                            doRemoveItem(getTileItemById(tptemplo,1387).uid)
                            
                    end

   function wave1()
if getGlobalStorageValue(49941) == 1 then
	doSummonCreature("Morgaroth", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Morgaroth", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Morgaroth", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Morgaroth", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Morgaroth", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Ice Evil", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Ice Evil", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Ice Evil", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Ice Evil", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Ice Evil", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 

	countDown(posX, 60, 129)
      				  doSendAnimatedText({x = 824, y = 521, z = 7}, "RESPAWN", math.random(TEXTCOLOR_RED, TEXTCOLOR_RED))
      				  doSendAnimatedText({x = 826, y = 521, z = 7}, "TIME", math.random(TEXTCOLOR_RED, TEXTCOLOR_RED))
setGlobalStorageValue(49941, -1)
end
return true
end

   function wave2()
if getGlobalStorageValue(49942) == 1 then
	doSummonCreature("Magician Mage", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Magician Mage", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Magician Mage", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Magician Mage", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Magician Mage", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Magician Mage", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Morgaroth", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Morgaroth", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Morgaroth", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Morgaroth", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Ice Evil", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Ice Evil", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Ice Evil", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Ice Evil", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Aracna", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Aracna", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Aracna", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Aracna", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Aracna", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 

	countDown(posX, 60, 129)
      				  doSendAnimatedText({x = 824, y = 521, z = 7}, "RESPAWN", math.random(TEXTCOLOR_RED, TEXTCOLOR_RED))
      				  doSendAnimatedText({x = 826, y = 521, z = 7}, "TIME", math.random(TEXTCOLOR_RED, TEXTCOLOR_RED))
setGlobalStorageValue(49942, -1)
end
return true
end


   function wave3()
if getGlobalStorageValue(49943) == 1 then
	doSummonCreature("Magician Mage", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Magician Mage", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Magician Mage", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Magician Mage", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Magician Mage", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Magician Mage", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Morgaroth", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Morgaroth", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Morgaroth", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Morgaroth", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Ice Evil", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Ice Evil", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Ice Evil", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Ice Evil", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Aracna", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Aracna", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Aracna", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Aracna", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Bad Soul", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Bad Soul", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Bad Soul", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Bad Soul", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Bad Soul", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Bad Soul", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 

	countDown(posX, 60, 129)
      				  doSendAnimatedText({x = 824, y = 521, z = 7}, "RESPAWN", math.random(TEXTCOLOR_RED, TEXTCOLOR_RED))
      				  doSendAnimatedText({x = 826, y = 521, z = 7}, "TIME", math.random(TEXTCOLOR_RED, TEXTCOLOR_RED))
setGlobalStorageValue(49943, -1)
end
return true
end

   function wave4()
if getGlobalStorageValue(49944) == 1 then
	doSummonCreature("Magician Mage", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Magician Mage", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Magician Mage", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Magician Mage", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Magician Mage", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Magician Mage", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Morgaroth", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Morgaroth", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Morgaroth", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Hammerstrom", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Hammerstrom", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Hammerstrom", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Hammerstrom", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Hammerstrom", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("The Walking Dead", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("The Walking Dead", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("The Walking Dead", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("The Walking Dead", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Bad Soul", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Bad Soul", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Bad Soul", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Bad Soul", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Bad Soul", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Bad Soul", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 

	countDown(posX, 60, 129)
      				  doSendAnimatedText({x = 824, y = 521, z = 7}, "RESPAWN", math.random(TEXTCOLOR_RED, TEXTCOLOR_RED))
      				  doSendAnimatedText({x = 826, y = 521, z = 7}, "TIME", math.random(TEXTCOLOR_RED, TEXTCOLOR_RED))
setGlobalStorageValue(49944, -1)
end
return true
end

   function wave5()
if getGlobalStorageValue(49945) == 1 then
	doSummonCreature("Golden Demon", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Golden Demon", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Golden Demon", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Golden Demon", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Golden Demon", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Golden Demon", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Morgaroth", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Morgaroth", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Morgaroth", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Hammerstrom", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Hammerstrom", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Hammerstrom", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Hammerstrom", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Hammerstrom", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("The Walking Dead", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("The Walking Dead", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("The Walking Dead", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("The Walking Dead", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Bad Soul", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Bad Soul", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Bad Soul", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Bad Soul", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Bad Soul", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Bad Soul", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 

	countDown(posX, 60, 129)
      				  doSendAnimatedText({x = 824, y = 521, z = 7}, "RESPAWN", math.random(TEXTCOLOR_RED, TEXTCOLOR_RED))
      				  doSendAnimatedText({x = 826, y = 521, z = 7}, "TIME", math.random(TEXTCOLOR_RED, TEXTCOLOR_RED))
setGlobalStorageValue(49945, -1)
end
return true
end

   function wave6()
if getGlobalStorageValue(49946) == 1 then
	doSummonCreature("Golden Demon", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Golden Demon", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Golden Demon", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Golden Demon", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Golden Demon", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Golden Demon", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Indefinido", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Indefinido", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Indefinido", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Hammerstrom", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Hammerstrom", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Hammerstrom", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Hammerstrom", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Hammerstrom", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Lord Snake", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Lord Snake", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Lord Snake", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Lord Snake", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Bad Soul", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Bad Soul", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Bad Soul", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Bad Soul", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Bad Soul", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Bad Soul", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	
	countDown(posX, 120, 129)
      				  doSendAnimatedText({x = 824, y = 521, z = 7}, "RESPAWN", math.random(TEXTCOLOR_RED, TEXTCOLOR_RED))
      				  doSendAnimatedText({x = 826, y = 521, z = 7}, "TIME", math.random(TEXTCOLOR_RED, TEXTCOLOR_RED))
setGlobalStorageValue(49946, -1)
end
return true
end


   function wave7()
if getGlobalStorageValue(49947) == 1 then
	doSummonCreature("Golden Demon", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Golden Demon", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Golden Demon", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Golden Demon", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Golden Demon", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Golden Demon", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Indefinido", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Indefinido", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Indefinido", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Cryxalis", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Cryxalis", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Cryxalis", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Cryxalis", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Cryxalis", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Lord Snake", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Lord Snake", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Lord Snake", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Lord Snake", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Bad Soul", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Bad Soul", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Bad Soul", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Bad Soul", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Bad Soul", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Bad Soul", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	
	countDown(posX, 120, 129)
      				  doSendAnimatedText({x = 824, y = 521, z = 7}, "RESPAWN", math.random(TEXTCOLOR_RED, TEXTCOLOR_RED))
      				  doSendAnimatedText({x = 826, y = 521, z = 7}, "TIME", math.random(TEXTCOLOR_RED, TEXTCOLOR_RED))
setGlobalStorageValue(49947, -1)
end
return true
end


   function wave8()
if getGlobalStorageValue(49948) == 1 then
	doSummonCreature("Golden Demon", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Golden Demon", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Golden Demon", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Golden Demon", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Golden Demon", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Golden Demon", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Indefinido", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Indefinido", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Indefinido", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Cryxalis", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Cryxalis", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Cryxalis", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Lord Snake", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Lord Snake", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Bad Soul", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Bad Soul", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Bad Soul", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Demon Of Lucifer", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Demon Of Lucifer", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)}) 
	doSummonCreature("Demon Of Lucifer", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)})
	doSummonCreature("Demon Of Lucifer", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)})
	doSummonCreature("Demon Of Lucifer", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)})
	doSummonCreature("Demon Of Lucifer", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)})
	doSummonCreature("Demon Of Lucifer", {x=math.random(t_l.x,b_r.x), y=math.random(t_l.y, b_r.y), z=math.random(t_l.z, b_r.z)})

	countDown(posX, 180, 129)
      				  doSendAnimatedText({x = 824, y = 521, z = 7}, "FINISH", math.random(TEXTCOLOR_RED, TEXTCOLOR_RED))
      				  doSendAnimatedText({x = 826, y = 521, z = 7}, "TIME", math.random(TEXTCOLOR_RED, TEXTCOLOR_RED))
setGlobalStorageValue(49948, -1)
end
return true
end

function FimX(cid)
local players,str = {},""
for _, cid in pairs(getPlayersOnline()) do
if getGlobalStorageValue(49933) == 1 then
if getPlayerStorageValue(cid, 12232) == 1 then
table.insert(players, cid)
end
end
end
for i = 1, #players do
local players2 = #players 
doBroadcastMessage("[WAVE EVENT] O evento wave acabou, " .. players2 .. " players ficaram vivos e ganharam: \n 10kk, 1 potion exp, 5 event coins.", 21)
doTeleportThing(players[i], getTownTemplePosition(getPlayerTown(players[i])))
		 doPlayerAddItem(players[i], 12715, 1, true)
		 doPlayerAddItem(players[i], 12701, 1, true)
		 doPlayerAddItem(players[i], 12734, 5, true)
setPlayerStorageValue(players[i], 12232, -1)
setGlobalStorageValue(49933, -1)
local area = {{x=797,y=499,z=7},{x=848,y=544,z=7}}
local topos = {x = 157, y = 50, z = 7}
local remove, clean = true, true
for x = area[1].x - 1, area[2].x + 1 do
for y = area[1].y - 1, area[2].y + 1 do
local pos = {x=x, y=y, z=area[1].z}
local m = getTopCreature(pos).uid
if remove ~= false and m ~= 0 and isMonster(m) then doRemoveCreature(m) end
if clean ~= false then doCleanTile(pos, false) end
if m ~= 0 and isPlayer(m) then doTeleportThing(m, topos) end
end
end
end
return true
end