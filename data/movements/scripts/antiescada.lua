local velocidade = 0.9
local life = 0.30
local periodo = 1.5 -- tempo em segundos

condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, periodo*1000)
setConditionFormula(condition, -velocidade, 0, -velocidade, 0)

function onStepIn(cid, item, pos, fromPos)
	if isPlayer (cid) then		
			if isPlayerPzLocked(cid) then
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Você perdeu 25% de life e levou paralyze por utilizar a escada com pz.")
				doAddCondition(cid,condition)
				doCreatureAddHealth(cid,-(getCreatureHealth(cid)*life))
			end
		end
	return true
end