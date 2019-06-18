function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.actionid == 4830) then  
       doTeleportThing(getTopCreature({x=513,y=492,z=6}).uid, {x=321,y=1150,z=7})
	   doSendMagicEffect(getPlayerPosition(cid), 5)
	elseif (item.actionid == 4831) then
		doTeleportThing(getTopCreature({x=267,y=84,z=8}).uid, {x = 267, y = 80, z = 8})
	elseif (item.actionid == 4832) then
		doTeleportThing(getTopCreature({x=1521,y=1874,z=7}).uid, {x=1521,y=1871,z=7})
	elseif (item.actionid == 4833) then
		doTeleportThing(getTopCreature({x=33061,y=31527,z=10}).uid, {x=32993,y=31547,z=4})
	end
	return true
end