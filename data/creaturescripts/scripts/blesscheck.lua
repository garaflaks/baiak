local freeBlessMaxLevel = 150
 
function onLogin(cid)
	if(getPlayerLevel(cid) <= freeBlessMaxLevel and getPlayerGroupId(cid) < 6 and not getPlayerBlessing(cid,1)) then
		for b=1, 5 do
			doPlayerAddBlessing(cid, b)
		end
		doCreatureSay(cid, 'Voc� tem bless gratuita, porque seu level � menor que 150', TALKTYPE_ORANGE_1)
		doSendMagicEffect(getThingPosition(cid), CONST_ME_HOLYDAMAGE)
		elseif(getPlayerBlessing(cid,1) and getPlayerGroupId(cid) < 6) then
	doCreatureSay(cid, 'Voc� j� tem bless!', TALKTYPE_ORANGE_1)
	elseif (getPlayerGroupId(cid) < 6) then
	doCreatureSay(cid, 'Voc� n�o tem bless. Digite !bless cuidado pode dar exausted', TALKTYPE_ORANGE_1)
	end
	return true
end