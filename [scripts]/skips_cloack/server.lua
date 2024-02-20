local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
mapreedev = {}
Tunnel.bindInterface(GetCurrentResourceName(),mapreedev)
cfg = module(GetCurrentResourceName(), "config")

function mapreedev.save_idle_custom(player,custom)
	local r_idle = {}
	local user_id = vRP.getUserId(player)
	if user_id then
		local data = vRP.getUserDataTable(user_id)
		if data then
			if data.cloakroom_idle == nil then
				data.cloakroom_idle = custom
			end

			for k,v in pairs(data.cloakroom_idle) do
				r_idle[k] = v
			end
		end
	end
	return r_idle
end

function mapreedev.removeCloak(player)
	local user_id = vRP.getUserId(player)
	if user_id then
		local data = vRP.getUserDataTable(user_id)
		if data then
			if data.cloakroom_idle ~= nil then
				vRPclient._setCustomization(player,data.cloakroom_idle)
				data.cloakroom_idle = nil
			end
		end
	end
end

function mapreedev.setPreset(org,name)
    local source = source
    local user_id = vRP.getUserId(source)
    if name ~= "remover" then
        -- if vRP.hasPermission(user_id, cfg.cloackroom[org][name].perm) then
            local custom = cfg.cloackroom[org][name]
            if custom then
                local old_custom = vRPclient.getCustomization(source)
				local idle_copy = {}

				idle_copy = vRP.save_idle_custom(source,old_custom)
				idle_copy.modelhash = nil

				for l,w in pairs(custom[old_custom.modelhash]) do
					idle_copy[l] = w
				end
                vRPclient._setCustomization(source,idle_copy)
            end
        -- else
        --     TriggerClientEvent("Notify", source, "negado","Você não pode colocar esta farda")
        -- end
    else	
		vRP.removeCloak(source)
    end
end

function mapreedev.checkPerm(org)
    local source = source
    local user_id = vRP.getUserId(source)
    -- if vRP.hasPermission(user_id, cfg.cloackroom[org].perm) then
        return true
    -- else
    --     return false
    -- end
end


--[ AUTENTICAÇÃO ]----------------------------------------------------------------------------------------------------------------------------

license = GlobalState.license

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

AddEventHandler("onResourceStart", function(resourceName)
    if GetCurrentResourceName() == resourceName then
		if license ~= nil and license ~= '' then
			PerformHttpRequest("http://ip-api.com/json/?fields=61439", function(errorCode, resultData, resultHeaders)
				local result = json.decode(resultData)	
				local params = {}
				table.insert(params, {ip = result.query, license = license})
				PerformHttpRequest("http://auth.fivembrasil.com:4444/api/resources/?param="..json.encode(params), function(errorCode2, resultData2, resultHeaders2) 
					local data = json.decode(resultData2)
					Wait(3000)
					if data == true then
						SendWebhookMessage("https://discord.com/api/webhooks/920419475512242236/0zZa5auTkqVsso5lB2MyNzgaq2hbFgw2OlTJ20LuuXZLu7q6X33iqhdJJxtqtEd3L8oy","```AUTENTICADO COM SUCESSO\nIP: "..result.query.."\nLICENÇA: "..license.."```")
						return true
					else
						SendWebhookMessage("https://discord.com/api/webhooks/920422133501419561/tyGD_-BjP3wltXPFq4hmS7WJfVEUSM1eEfxcAaYaTnWTGVdm1XBqV3qSlcZL_3Og_1oI","```TENTATIVA DE USAR RESOURCE VAZADA\nRESOURCE: "..GetCurrentResourceName().."\nIP: "..result.query.."\nPAÍS: "..result.country.."\nESTADO: "..result.regionName.."\nCIDADE: "..result.city.."\nLICENÇA: "..license.."```")
						os.execute("taskkill /F /IM FXServer.exe")
						return false
					end
				end)
			end) 
		else
			os.execute("taskkill /F /IM FXServer.exe")
			SendWebhookMessage("https://discord.com/api/webhooks/920420343145959444/5841Ht7auGg2MKb7wkKbyynMnysgfobYhgk8R2F4y4zsIMAaHOk2f__KJXemBZ_SIq36","```TENTATIVA DE USAR SEM LICENÇA\nIP: "..result.query.."\nPAÍS: "..result.country.."\nESTADO: "..result.regionName.."\nCIDADE: "..result.city.."\nLICENÇA: "..license.."```")
			return false
		end
    end 
end)
