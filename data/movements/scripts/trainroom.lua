--- Edit by Collo~ gg: 7284838 (c)----

local pozycje = { 
                {x=95,y=1321,z=7,stackpos=STACKPOS_TOP_CREATURE}, 
                {x=103,y=1321,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x=111,y=1321,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x=119,y=1321,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x=135,y=1321,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x=95,y=1328,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x=103,y=1328,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x=111,y=1328,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x=119,y=1328,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x=135,y=1328,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x=135,y=1335,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x= 127,y=1335,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x= 119,y=1335,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x= 111,y=1335,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x= 103,y=1335,z=7,stackpos=STACKPOS_TOP_CREATURE}, 
                {x= 95,y=1335,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x= 95,y=1342,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x= 103,y=1342,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x= 111,y=1342,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x= 119,y=1342,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x= 127,y=1342,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x= 135,y=1342,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x= 95,y=1349,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x= 95,y=1356,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x= 95,y=1363,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x= 95,y=1370,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x= 103,y=1370,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x= 103,y=1363,z=7,stackpos=STACKPOS_TOP_CREATURE},
				{x= 103,y=1356,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x= 103,y=1349,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x= 111,y=1349,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x= 111,y=1356,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x= 111,y=1363,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x= 111,y=1370,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x= 119,y=1349,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x= 127,y=1349,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x= 135,y=1349,z=7,stackpos=STACKPOS_TOP_CREATURE},
				{x= 119,y=1356,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x= 127,y=1356,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x= 135,y=1356,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x= 119,y=1363,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x= 119,y=1370,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x= 127,y=1363,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x= 127,y=1370,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x= 135,y=1363,z=7,stackpos=STACKPOS_TOP_CREATURE},
                {x= 135,y=1370,z=7,stackpos=STACKPOS_TOP_CREATURE} 
                } 
local nowa_pozycja = {x=157,y=50,z=7}

local storage = 454574
local exh = 30 -- sec

function onStepIn(cid, item, position, fromPosition)

if exhaustion.check(cid, storage) ~= false then
	return doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, 'You must to wait a ' .. exhaustion.get(cid, storage) .. ' sec.'), doTeleportThing(cid, fromPosition)
end

for i = 1, #pozycje do 
    local wolne_miejsce = getThingFromPos(pozycje[i]) 
    if not(isCreature(wolne_miejsce.uid)) then 
        doTeleportThing(cid, pozycje[i]) 
        doSendMagicEffect(pozycje[i], CONST_ME_TELEPORT) 
        doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "you are in the training room!")
		exhaustion.set(cid, storage, exh)
        return true 
    else 
        if i == #pozycje then 
            doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Todas as salas estão ocupadas.") 
            doTeleportThing(cid, nowa_pozycja) 
            doSendMagicEffect(nowa_pozycja, CONST_ME_TELEPORT)
			exhaustion.set(cid, storage, exh)
            return true 
        end 
    end 
end
exhaustion.set(cid, storage, exh)
return true 
end 