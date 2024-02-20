function stores_addInventoryItem(user_id,item,amount)
    vRP.giveInventoryItem(user_id,item,amount)
end

function beforeBuyItem(source,key,user_id,item_id,amount)
    if vRP.getInventoryWeight(user_id) + (vRP.getItemWeight(item_id) * amount) <= vRP.getInventoryMaxWeight(user_id) then
        return true
    else
        TriggerClientEvent("Notify",source,"negado",Lang[Config.lang]['cant_carry_item'])
        return false
    end
end

function beforeBuyMarket(source,key,user_id)
    -- Here you can do any verification when a player is buying a market, like if player has the permission to that or anything else you want to check before buy the market. return true or false
    return true
end

function afterBuyItem(source,market_id,user_id,item_id,amount,total_price,account)
    -- Here you can run any code just after the player purchased any item, like government taxes or anything else
end

function MySQL_Sync_execute(sql,params)
    MySQL.Sync.execute(sql, params)
end

function MySQL_Sync_fetchAll(sql,params)
    return MySQL.Sync.fetchAll(sql, params)
end

function getOnlinePlayers()
    local users = vRP.getUsers()
    local players  = {}
    for user_id,source in pairs(users) do
        table.insert(players, {
            source     = source,
            identifier = user_id,
            name       = getPlayerName(user_id)
        })
    end
    return players
end

function getPlayerName(user_id)
	local identity = vRP.getUserIdentity(user_id)
	if identity then
		return identity.name.." "..identity.firstname
	else
		return false
	end
end