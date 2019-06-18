-- config elton123
   local velocidade = 0.9
   local life = 0.30
   local periodo = 1.5 -- tempo em segundos
   local pos1 = {x=157, y=50, z=7}
-- config elton123

condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, periodo*1000)
setConditionFormula(condition, -velocidade, 0, -velocidade, 0)
  

function onUse(cid, item, pos, fromPos)
      if isPlayer (cid) then
   local pos0 = getCreaturePosition(cid)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Puutz, subiu a pressão.")
 		doCreatureSay(cid,"Hmmm essencia de menta.", TALKTYPE_ORANGE_1)
		doSendMagicEffect(pos0, 67)
		doSendMagicEffect(pos0, 6)
		doSendMagicEffect(pos1, 2)
            doAddCondition(cid,condition)
            doCreatureAddHealth(cid,-(getCreatureHealth(cid)*life))
      end
	
return true
end
