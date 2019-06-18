--[[
        Name: Vip System by Account
        Version: 1.0
        Author: Kydrai
        Forum: http://www.xtibia.com/forum/topic/136543-vip-system-by-account-v10/
        
        [Functions]
                -- Install
                installVip()
                
                -- By Account
                doTeleportPlayersByAccount(acc, topos)
                getvip_timeByAccount(acc)
                setvip_timeByAccount(acc, time)
                getVipDaysByAccount(acc)
                isVipAccount(acc)
                addVipDaysByAccount(acc, days)
                doRemoveVipDaysByAccount(acc, days)
                getVipDateByAccount(acc)
                
                -- By Player
                doTeleportPlayers(cid, topos)
                getvip_time(cid)
                setvip_time(cid, time)
                getVipDays(cid)
                isVip(cid)
                addVipDays(cid, days)
                doRemoveVipDays(cid, days)
                getVipDate(cid)
]]--

-- Install
function installVip()
        if db.executeQuery("ALTER TABLE `accounts` ADD vip_time INT(15) NOT NULL DEFAULT 0;") then
                print("[Vip System] Vip System instalado com sucesso!")
                return TRUE
        end
        print("[Vip System] Não foi possível instalar o Vip System!")
        return FALSE
end

-- By Account
function doTeleportPlayersByAccount(acc, topos)
        if db.executeQuery("UPDATE `players` SET `posx` = "..topos.x..", `posy` = "..topos.y..", `posz` = "..topos.z.." WHERE `account_id` = "..acc..";") then
                return TRUE
        end
        return FALSE
end

function getvip_timeByAccount(acc)
        local vip = db.getResult("SELECT `vip_time` FROM `accounts` WHERE `id` = "..acc..";")
        if vip:getID() == -1 then
                print("[Vip System] Account not found!")
                return FALSE
        end
        return vip:getDataInt("vip_time")
end

function setvip_timeByAccount(acc, time)
        if db.executeQuery("UPDATE `accounts` SET `vip_time` = "..time.." WHERE `id` = "..acc..";") then
                return TRUE
        end
        return FALSE
end

function getVipDaysByAccount(acc)
        local vip_time = getvip_timeByAccount(acc)
        local timeNow = os.time()
        local days = math.ceil((vip_time - timeNow)/(24 * 60 * 60))
        return days <= 0 and 0 or days
end

function isVipAccount(acc)
        return getVipDaysByAccount(acc) > 0 and TRUE or FALSE
end

function addVipDaysByAccount(acc, days)
        if days > 0 then
                local daysValue = days * 24 * 60 * 60
                local vip_time = getvip_timeByAccount(acc)
                local timeNow = os.time()
                local time = getVipDaysByAccount(acc) == 0 and (timeNow + daysValue) or (vip_time + daysValue)
                setvip_timeByAccount(acc, time)
                return TRUE
        end
        return FALSE
end

function doRemoveVipDaysByAccount(acc, days)
        if days > 0 then
                local daysValue = days * 24 * 60 * 60
                local vip_time = getvip_timeByAccount(acc)
                local time = vip_time - daysValue
                setvip_timeByAccount(acc, (time <= 0 and 1 or time))
                return TRUE
        end
        return FALSE
end

function getVipDateByAccount(acc)
        if isVipAccount(acc) then
                local vip_time = getvip_timeByAccount(acc)
                return os.date("%d/%m/%y %X", vip_time)
        end
        return FALSE
end

-- By Player
function doTeleportPlayers(cid, topos)
        doTeleportPlayersByAccount(getPlayerAccountId(cid), topos)
end

function getvip_time(cid)
        return getvip_timeByAccount(getPlayerAccountId(cid))
end

function setvip_time(cid, time)
        return setvip_timeByAccount(getPlayerAccountId(cid), time)
end

function getVipDays(cid)
        return getVipDaysByAccount(getPlayerAccountId(cid))
end

function isVip(cid)
        return isVipAccount(getPlayerAccountId(cid))
end

function addVipDays(cid, days)
        return addVipDaysByAccount(getPlayerAccountId(cid), days)
end

function doRemoveVipDays(cid, days)
        return doRemoveVipDaysByAccount(getPlayerAccountId(cid), days)
end

function getVipDate(cid)
        return getVipDateByAccount(getPlayerAccountId(cid))
end