
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

vCLIENT = Tunnel.getInterface("vrp_guardaroupam")

vRPex = {}
Tunnel.bindInterface("vrp_guardaroupam",vRPex)

local mecanico1 = {
    [1885233650] = {
		[1] = {121,0,0},
		[2] = {30,0,0},
		[3] = {125,0,0},
		[4] = {39,1,0},
		[5] = {-1,0,0},
		[6] = {24,0,0},
		[7] = {-1,0,2},
		[8] = {88,0,2},
		[9] = {-1,0,0},
		[10] = {-1,0,0},
		[11] = {66,1,0},
		["p0"] = {-1,0,0},
		["p1"] = {-1,0,0},
		["p6"] = {-1,0},
	},
    [-1667301416] = {
		[1] = {-1,0,0},
		[2] = {14,0,0},
		[3] = {19,0,0},
		[4] = {39,1,0},
		[5] = {-1,0,0},
		[6] = {24,0,0},
		[7] = {8,0,2},
		[8] = {100,0,2},
		[9] = {-1,0,0},
		[10] = {-1,0,0},
		[11] = {60,1,0},
		["p0"] = {-1,0,0},
		["p1"] = {-1,0,0},
		["p6"] = {-1,0},
	}
}

local mecanico2 = {
    [1885233650] = {
        [1] = {121,0,0},
			[2] = {30,0,0},
			[3] = {125,0,0},
			[4] = {38,0,0},
			[5] = {-1,0,0},
			[6] = {24,0,0},
			[7] = {-1,0,2},
			[8] = {89,0,2},
			[9] = {-1,0,0},
			[10] = {-1,0,0},
			[11] = {65,0,0},
			["p0"] = {-1,0,0},
			["p1"] = {-1,0,0},
			["p6"] = {-1,0},
    },
    [-1667301416] = {
        [1] = {-1,0,0},
	[2] = {14,0,0},
	[3] = {165,0,0},
	[4] = {38,0,0},
	[5] = {-1,0,0},
	[6] = {24,0,0},
	[7] = {8,0,2},
	[8] = {99,0,2},
	[9] = {-1,0,0},
	[10] = {-1,0,0},
	[11] = {59,0,0},
	["p0"] = {-1,0,0},
	["p1"] = {-1,0,0},
	["p6"] = {-1,0},
    }
}

local mecanico3 = {
    [1885233650] = {
		[1] = {121,0,0},
		[2] = {30,0,0},
		[3] = {48,0,0},
		[4] = {45,0,0},
		[5] = {-1,0,0},
		[6] = {24,0,0},
		[7] = {-1,0,2},
		[8] = {88,0,2},
		[9] = {-1,0,0},
		[10] = {-1,0,0},
		[11] = {43,0,0},
		["p0"] = {-1,0,0},
		["p1"] = {-1,0,0},
		["p6"] = {-1,0},
    },
    [-1667301416] = {
		[1] = {-1,0,0},
			[2] = {14,0,0},
			[3] = {54,0,0},
			[4] = {47,0,0},
			[5] = {-1,0,0},
			[6] = {24,0,0},
			[7] = {54,0,2},
			[8] = {100,0,2},
			[9] = {-1,0,0},
			[10] = {-1,0,0},
			[11] = {258,0,0},
			["p0"] = {-1,0,0},
			["p1"] = {-1,0,0},
			["p6"] = {-1,0},
    }
}


RegisterServerEvent("mecanico1")
AddEventHandler("mecanico1",function()
	local source = source
    local user_id = vRP.getUserId(source)
    local custom = mecanico1
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
	else
        TriggerClientEvent("Notify",source,"negado","Você não é da organição!",5000)
    end
end)

RegisterServerEvent("mecanico2")
AddEventHandler("mecanico2",function()
	local source = source
    local user_id = vRP.getUserId(source)
    local custom = mecanico2
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
	else
        TriggerClientEvent("Notify",source,"negado","Você não é da organição!",5000)
    end
end)

RegisterServerEvent("mecanico3")
AddEventHandler("mecanico3",function()
	local source = source
    local user_id = vRP.getUserId(source)
    local custom = mecanico3
    if custom and vRP.hasPermission(user_id,"gerenteadmin.permissao") or vRP.hasPermission(user_id,"lideradmin.permissao") then
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
	else
        TriggerClientEvent("Notify",source,"negado","Você não é da organição!",5000)
    end
end)


RegisterServerEvent("off-uniformm")
AddEventHandler("off-uniformm",function()
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
    if vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id,"admin.permissao") then
        return true
	end
end
