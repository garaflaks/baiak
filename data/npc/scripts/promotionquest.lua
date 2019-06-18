local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
 
 
-- OTServ event handling functions start
function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                         npcHandler:onThink() end
-- OTServ event handling functions end
 
 
-- Don't forget npcHandler = npcHandler in the parameters. It is required for all StdModule functions!
local travelNode = keywordHandler:addKeyword({'Quest Promotion'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Sobre isso você vei até mim? Irei resumir a historia! Estamos em grande perigo, LUCIFER está vindo do inferno para invadir o céu e nossa unica chance é você. Terá que descer até o inferno e ir por caminhos sombrios até o fim e matar lucifer para selar a paz, e em recompensa {Deus} lhe tornará mais forte!! Para provar que você é um grande guerreiro eu cobrarei 25kk para lhe teletransportar para o inicio deste caminho! Você deseja iniciar agora?'})
    travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 500, cost = 25000000, destination = {x=1739, y=43, z=4} })
    travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Tenha cuidado.'})
keywordHandler:addKeyword({'Quest Promotion'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Você quer nos ajudar? Eu irei cobrar 25kk'})
 
-- Makes sure the npc reacts when you say hi, bye etc.
npcHandler:addModule(FocusModule:new())
