local spell = "Meteor Fall"
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if not getPlayerLearnedInstantSpell(cid, spell) then
		doPlayerLearnInstantSpell(cid, spell)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have learned spell " .. spell .. "!")
		doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
	else
		doCreatureSay(cid, "You already know this spell!", TALKTYPE_ORANGE_1, nil, cid, getThingPos(cid))
	end
	doRemoveItem(item.uid, 1)
	return true
end

