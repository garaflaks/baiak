function onStepIn(cid, item, position, fromPosition)

local tileConfig = {
        kickPos = fromPosition,
        kickEffect = CONST_ME_POFF,
        kickMsg = "Você precisa ser VIP ACCOUNT para entrar nesta area. Você pode adquirir sua vida entrando no nosso site (SHOP).",
        enterMsg = "Seja bem-vindo a area VIP!",
        enterEffect = CONST_ME_MAGIC_RED,
}
	if isPremium(cid) == TRUE and item.actionid == 13500 then
        doPlayerSendTextMessage(cid, 22, tileConfig.enterMsg)
        doSendMagicEffect(position, tileConfig.enterEffect)

        return
    end

        doTeleportThing(cid, tileConfig.kickPos)
        doSendMagicEffect(tileConfig.kickPos, tileConfig.kickEffect)
        doPlayerSendCancel(cid, tileConfig.kickMsg)
        return true
end