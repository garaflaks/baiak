function onUse(cid, item, frompos, item2, topos)
  local pausa = 60*60*1000 -- (1000 = 1 segundos) Tempo que o script durar�
  local exp = 2 -- O quanto que voc� quer que dobre sua experiencia, por exemplo 2 � 2x as rates do seu server.
  expfinal = 1 --N�o mude, isso � para a experiencia voltar ao normal.
  local texto = "Voce esta recebendo " .. exp .. "x de XP ao matar um monstro por " .. pausa/120/1000 .. " minutos." -- Texto que ir� receber ao usar a potion.
  textofinal = "Fim do tempo de " .. exp .. "x de XP" -- Texto que ir� receber quando o efeito da potion acabar.
  if item.itemid == 12701 then
      doRemoveItem(item.uid,1)
      doPlayerSetExperienceRate(cid,exp)
      doSendMagicEffect(frompos,13)
      doPlayerSendTextMessage(cid,22,texto)
      addEvent(potion,pausa,cid)
    end
end

function potion(pos, cid)
  doPlayerSetExperienceRate(pos,expfinal)
  doPlayerSendTextMessage(pos,22,textofinal)
end