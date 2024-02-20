

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

vRPex = Tunnel.getInterface("vrp_guardaroupap")

RPex = {}
Tunnel.bindInterface("vrp_guardaroupap",RPex)

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
	if data == "rpm1curta" then
		TriggerServerEvent("rpm1curta")
	
	elseif data == "rpm1longa" then
		TriggerServerEvent("rpm1longa")

	elseif data == "rpm2curta" then
		TriggerServerEvent("rpm2curta")

	elseif data == "rpm2longa" then
		TriggerServerEvent("rpm2longa")

	elseif data == "got1curta" then
		TriggerServerEvent("got1curta")

	elseif data == "got1longa" then
		TriggerServerEvent("got1longa")

	elseif data == "got2curta" then
		TriggerServerEvent("got2curta")

	elseif data == "got2longa" then
		TriggerServerEvent("got2longa")

	elseif data == "gottatica" then
		TriggerServerEvent("gottatica")
		
	elseif data == "gotcamuflado" then
		TriggerServerEvent("gotcamuflado")

	elseif data == "gotspeed" then
		TriggerServerEvent("gotspeed")

	elseif data == "gtm" then
		TriggerServerEvent("gtm")

	elseif data == "gsa1" then
		TriggerServerEvent("gsa1")

	elseif data == "gsa2" then
		TriggerServerEvent("gsa2")

	elseif data == "gic1" then
		TriggerServerEvent("gic1")

	elseif data == "gic2" then
		TriggerServerEvent("gic2")

	elseif data == "gic3" then
		TriggerServerEvent("gic3")

	elseif data == "aluno" then
		TriggerServerEvent("aluno")

	elseif data == "instrutor" then
		TriggerServerEvent("instrutor")

	elseif data == "comando" then
		TriggerServerEvent("comando")

	elseif data == "off-uniform" then
		TriggerServerEvent("off-uniform")

	elseif data == "fechar" then
		ToggleActionMenu()
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ LOCAIS ]-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
local cloak = {
	{ ['x'] = -1100.64, ['y'] = -821.975, ['z'] = 14.282 }, -- -1100.6494140625,-821.97534179688,14.28279876709


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
				DrawMarker(30, cloak.x, cloak.y, cloak.z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,0,140,255,90,0,0,0,1)
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

