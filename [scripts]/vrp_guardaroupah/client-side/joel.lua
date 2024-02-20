

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

vRPex = Tunnel.getInterface("vrp_guardaroupah")

RPex = {}
Tunnel.bindInterface("vrp_guardaroupah",RPex)

local menuactive = false
function ToggleActionMenu()
	menuactive = not menuactive
	if menuactive then
		SetNuiFocus(true,true)
		TransitionToBlurred(1000)
		SendNUIMessage({ showmenu = true })
		TriggerEvent("hideHud")
	else
		SetNuiFocus(false)
		TransitionFromBlurred(1000)
		SendNUIMessage({ hidemenu = true })
		TriggerEvent("showHud")
	end
end

function RPex.closeMenu()
	ToggleActionMenu()
end

RegisterNUICallback("ButtonClick",function(data,cb)
	if data == "cirurgiao" then
		TriggerServerEvent("cirurgiao")
	
	elseif data == "doutor" then
		TriggerServerEvent("doutor")

	elseif data == "socorrista" then
		TriggerServerEvent("socorrista")

	elseif data == "retirar-uniform" then
		TriggerServerEvent("retirar-uniform")

	elseif data == "fechar" then
		ToggleActionMenu()
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ LOCAIS ]-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
local cloak = {
	{ ['x'] = -443.5, ['y'] = -310.09, ['z'] = 34.91 }
}



-----------------------------------------------------------------------------------------------------------------------------------------
--[ MENU ]-------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		local sleep = 1000

		for k,v in pairs(cloak) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)
			local cloak = cloak[k]

			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), cloak.x, cloak.y, cloak.z, true ) <= 2 then
				sleep = 5
				DrawText3D(cloak.x, cloak.y, cloak.z, "[~g~E~w~] Para ~g~ABRIR~w~ o armário.")
			end
			
			if distance <= 5 then
				sleep = 5
				DrawMarker(30, cloak.x, cloak.y, cloak.z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,0,0,90,0,0,0,1)
				if distance <= 1.2 then
					if IsControlJustPressed(0,38) and vRPex.checkOfficer() then
						ToggleActionMenu()
					end
				end
			end
		end
		Citizen.Wait(sleep)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ FUNÇÃO ]-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.40, 0.40)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
end

