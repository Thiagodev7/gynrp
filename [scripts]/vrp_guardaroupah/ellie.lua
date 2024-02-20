
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

vCLIENT = Tunnel.getInterface("vrp_guardaroupah")

vRPex = {}
Tunnel.bindInterface("vrp_guardaroupah",vRPex)

local cirurgiao = {
    [1885233650] = {
		[1] = { 0,0 },
		[2] = { 30,0 },
		[3] = { 88,1 },
		[4] = { 96,0 },
		[6] = { 7,1 },
		[7] = { 5,0 },
		[8] = { 96,0 },
		[9] = { 30,0 },
		[10] = { -1,0 },
		[11] = { 9,0 },
		["p0"] = { -1,0 },
		["p1"] = { 0,0 },
		["p2"] = { -1,0 },
		["p6"] = { 3,0 },
    },
    [-1667301416] = {
        [1] = { 0,0 },
		[2] = { 7,0 },
		[3] = { 85,0 },
		[4] = { 99,0 },
        [5] = { 30,0 },
		[6] = { 42,0 },
		[7] = { 6,4 },
		[8] = { 101,0 },
		[9] = { 0,0 },
		[10] = { -1,0 },
		[11] = { 9,0 },
		["p0"] = { -1,0 },
		["p1"] = { -1,0 },
		["p2"] = { -1,0 },
		["p6"] = { -1,0 },
    }
}

local doutor = {
    [1885233650] = {
		[1] = { -1,0 },
        [5] = { -1,0 },
        [7] = { 126,0 },
        [3] = { 4,0 },
        [4] = { 25,5 },
        [8] = { 31,4 },
        [6] = { 21,9 },
        [11] = { 31,7 },
        [9] = { -1,0 },
        [10] = { -1,0 },
        ["p0"] = { -1,0 },
        ["p1"] = { -1,0 },
        ["p2"] = { -1,0 },
        ["p6"] = { -1,0 },
    },
    [-1667301416] = {
        [1] = { 0,0 },
		[2] = { 7,0 },
		[3] = { 9,0 },
		[4] = { 37,5 },
        [5] = { 30,0 },
		[6] = { 42,0 },
		[7] = { 96,0 },
		[8] = { 64,1 },
		[9] = { -1,1 },
		[10] = { -1,0 },
		[11] = { 57,7 },
		["p0"] = { -1,0 },
		["p1"] = { -1,0 },
		["p2"] = { -1,0 },
		["p6"] = { -1,0 },
    }
}

local socorrista = {
    [1885233650] = {
		[1] = { 0,0 },
		[2] = { 30,0 },
		[3] = { 85,1 },
		[4] = { 96,0 },
		[6] = { 42,0 },
        [7] = { 5,0 },
        [8] = { 57,0 },
        [9] = { 0,0 },
        [10] = { 0,0 },
        [11] = { 250,0 },
        ["p0"] = { 122,0 },
        ["p1"] = { -1,0 },
        ["p2"] = { -1,0 },
        ["p6"] = { -1,0 },
    },
    [-1667301416] = {
        [1] = { 0,0 },
		[2] = { 7,0 },
		[3] = { 109,1 },
		[4] = { 99,0 },
        [5] = { 30,0 },
		[6] = { 80,0 },
		[7] = { 6,4 },
		[8] = { 65,1 },
		[9] = { -1,1 },
		[10] = { -1,0 },
		[11] = { 258,0 },
		["p0"] = { -1,0 },
		["p1"] = { -1,0 },
		["p2"] = { -1,0 },
		["p6"] = { -1,0 },
    }
}




RegisterServerEvent("cirurgiao")
AddEventHandler("cirurgiao",function()
	local source = source
    local user_id = vRP.getUserId(source)
    local custom = cirurgiao
    if custom and vRP.hasPermission(user_id,"admin.permissao") then
		TriggerClientEvent("progress",source,5000,"vestindo")
		vCLIENT.closeMenu(source)
		TriggerClientEvent('cancelando',source,true)
		vRPclient._playAnim(source,false,{{"clothingshirt","try_shirt_positive_d"}},true)
		SetTimeout(5000,function()

			vRPclient._stopAnim(source,false)
			TriggerClientEvent('cancelando',source,false)
			local old_custom = vRPclient.getCustomization(source)
			local idle_copy = {}

			idle_copy = vRP.save_idle_custom(source,old_custom)
			idle_copy.modelhash = nil

			for k,v in pairs(custom[old_custom.modelhash]) do
				idle_copy[k] = v
			end
			vRPclient._setCustomization(source,idle_copy)
        end)
        
    end
end)

RegisterServerEvent("doutor")
AddEventHandler("doutor",function()
	local source = source
    local user_id = vRP.getUserId(source)
    local custom = doutor
    if custom and vRP.hasPermission(user_id,"admin.permissao") then
		TriggerClientEvent("progress",source,5000,"vestindo")
		vCLIENT.closeMenu(source)
		TriggerClientEvent('cancelando',source,true)
		vRPclient._playAnim(source,false,{{"clothingshirt","try_shirt_positive_d"}},true)
		SetTimeout(5000,function()

			vRPclient._stopAnim(source,false)
			TriggerClientEvent('cancelando',source,false)
			local old_custom = vRPclient.getCustomization(source)
			local idle_copy = {}

			idle_copy = vRP.save_idle_custom(source,old_custom)
			idle_copy.modelhash = nil

			for k,v in pairs(custom[old_custom.modelhash]) do
				idle_copy[k] = v
			end
			vRPclient._setCustomization(source,idle_copy)
        end)
        
    end
end)

RegisterServerEvent("socorrista")
AddEventHandler("socorrista",function()
	local source = source
    local user_id = vRP.getUserId(source)
    local custom = socorrista
	if custom and vRP.hasPermission(user_id,"admin.permissao") then
		TriggerClientEvent("progress",source,5000,"vestindo")
		vCLIENT.closeMenu(source)
		TriggerClientEvent('cancelando',source,true)
		vRPclient._playAnim(source,false,{{"clothingshirt","try_shirt_positive_d"}},true)
		SetTimeout(5000,function()

			vRPclient._stopAnim(source,false)
			TriggerClientEvent('cancelando',source,false)
			local old_custom = vRPclient.getCustomization(source)
			local idle_copy = {}

			idle_copy = vRP.save_idle_custom(source,old_custom)
			idle_copy.modelhash = nil

			for k,v in pairs(custom[old_custom.modelhash]) do
				idle_copy[k] = v
			end
			vRPclient._setCustomization(source,idle_copy)
        end)
        
    end
end)


RegisterServerEvent("retirar-uniform")
AddEventHandler("retirar-uniform",function()
	local source = source
	local user_id = vRP.getUserId(source)
	TriggerClientEvent("progress",source,2000,"Retirando")
	vCLIENT.closeMenu(source)
	TriggerClientEvent('cancelando',source,true)
	vRPclient._playAnim(source,false,{{"clothingshirt","try_shirt_positive_d"}},true)
	SetTimeout(2000,function()
		TriggerClientEvent('cancelando',source,false)
		vRPclient._stopAnim(source,false)
		vRP.removeCloak(source)
	end)
end)

function vRPex.checkOfficer()
	local source = source
	local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"paramedico.permissao") or vRP.hasPermission(user_id,"admin.permissao") then
        return true
	end
end
