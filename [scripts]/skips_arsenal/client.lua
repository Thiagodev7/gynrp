----------------------------------------------------------------
---------------------EDIT BY: SkipS#1234
----------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
client = {}
Tunnel.bindInterface("skips_arsenal",client)

inMenu = true
local Menu = true

local arsenal = {
	{ -1106.64, -826.22, 14.29 },
	{-1759.27, -792.94, 17.04},
	{-949.37, -2045.89, 9.41},
	{281.08, -350.54, 49.63},
	{2610.1, 5346.23, 47.57},
}



Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		sleep = 1000
		
		for _,lugares in pairs(arsenal) do
		local x,y,z = table.unpack(lugares)
		local distance = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),x,y,z,true)
        

		if distance <= 3 then
			sleep = 5
			DrawMarker(41, x,y,z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,88, 179, 252,50,0,0,0,1)
			if distance <= 1.2 then
				if IsControlJustPressed(0,38) then
					TriggerServerEvent('ndk:permissao')				
				end
			end
		end

		end
	Wait(sleep)
	end
	inMenu = false
      SetNuiFocus(false)
      SendNUIMessage({type = 'close'})
end)


function client.PertoArsenal()
	local posPed = GetEntityCoords(PlayerPedId())
	for _, lugares in pairs(arsenal) do
		local x,y,z = table.unpack(lugares)
		if GetDistanceBetweenCoords(x,y,z, posPed) < 5 then
			return true 
		end
	end
end


RegisterNetEvent('ndk:permissao')
AddEventHandler('ndk:permissao',function()
	inMenu = true
	SetNuiFocus(true, true)
	SendNUIMessage({showMenu = true})
end)


RegisterNUICallback('NUIFocusOff', function()
	print('toguro')
    SetNuiFocus(false,false)
	TransitionFromBlurred(1000)
    SetCursorPosition(0.0,false)
	print('felas')
end)
----------------------
RegisterNUICallback('m4a1', function()
	local ped = PlayerPedId()
	TriggerServerEvent('ndk:permissao')
	SetPedAmmo(ped,GetHashKey("WEAPON_SPECIALCARBINE"),0)
	RemoveWeaponFromPed(ped,GetHashKey("WEAPON_SPECIALCARBINE"))
	GiveWeaponToPed(ped,GetHashKey("WEAPON_CARBINERIFLE"),200,0,1)
end)

RegisterNUICallback('m4a4', function()
	local ped = PlayerPedId()
	TriggerServerEvent('ndk:permissao')
	SetPedAmmo(ped,GetHashKey("WEAPON_SPECIALCARBINE"),0)
	RemoveWeaponFromPed(ped,GetHashKey("WEAPON_CARBINERIFLE"))
	GiveWeaponToPed(ped,GetHashKey("WEAPON_SPECIALCARBINE"),200,0,1)
end)
-------------------
RegisterNUICallback('mp5', function()
	local ped = PlayerPedId()
	TriggerServerEvent('ndk:permissao')
	SetPedAmmo(ped,GetHashKey("WEAPON_SMG"),0)
	RemoveWeaponFromPed(ped,GetHashKey("WEAPON_COMBATPDW"))
	GiveWeaponToPed(ped,GetHashKey("WEAPON_SMG"),200,0,1)
end)

RegisterNUICallback('mpx', function()
	local ped = PlayerPedId()
	TriggerServerEvent('ndk:permissao')
	SetPedAmmo(ped,GetHashKey("WEAPON_COMBATPDW"),0)
	RemoveWeaponFromPed(ped,GetHashKey("WEAPON_SMG"))
	GiveWeaponToPed(ped,GetHashKey("WEAPON_COMBATPDW"),200,0,1)
end)
-------------------
RegisterNUICallback('shot45', function()
	local ped = PlayerPedId()
	TriggerServerEvent('ndk:permissao')
	SetPedAmmo(ped,GetHashKey("WEAPON_PUMPSHOTGUN_MK2"),0)
	GiveWeaponToPed(ped,GetHashKey("WEAPON_PUMPSHOTGUN_MK2"),100,0,1)
end)
---------------------
RegisterNUICallback('fiveseven', function()
	local ped = PlayerPedId()
	TriggerServerEvent('ndk:permissao')
	SetPedAmmo(ped,GetHashKey("WEAPON_PISTOL_MK2"),0)
	RemoveWeaponFromPed(ped,GetHashKey("WEAPON_COMBATPISTOL"))
	GiveWeaponToPed(ped,GetHashKey("WEAPON_PISTOL_MK2"),250,0,1)
end)

RegisterNUICallback('glock18', function()
	local ped = PlayerPedId()
	TriggerServerEvent('ndk:permissao')
	SetPedAmmo(ped,GetHashKey("WEAPON_COMBATPISTOL"),0)
	RemoveWeaponFromPed(ped,GetHashKey("WEAPON_PISTOL_MK2"))
	GiveWeaponToPed(ped,GetHashKey("WEAPON_COMBATPISTOL"),250,0,1)
end)
------------------
RegisterNUICallback('KITBASICO', function()
	local ped = PlayerPedId()
	TriggerServerEvent('ndk:permissao')
	GiveWeaponToPed(ped,GetHashKey("WEAPON_NIGHTSTICK"),0,0,0)
	GiveWeaponToPed(ped,GetHashKey("WEAPON_KNIFE"),0,0,1)
	GiveWeaponToPed(ped,GetHashKey("WEAPON_STUNGUN"),0,0,0)
	TriggerServerEvent('skips_arsenal:colete')
	GiveWeaponToPed(ped,GetHashKey("WEAPON_FLASHLIGHT"),0,0,0)
end)
---------------

RegisterNUICallback('Taser', function()
	local ped = PlayerPedId()
	TriggerServerEvent('ndk:permissao')
	GiveWeaponToPed(ped,GetHashKey("WEAPON_STUNGUN"),0,0,1)
end)
RegisterNUICallback('Lanterna', function()
	local ped = PlayerPedId()
	TriggerServerEvent('ndk:permissao')
	GiveWeaponToPed(ped,GetHashKey("WEAPON_FLASHLIGHT"),0,0,1)
end)
RegisterNUICallback('KCT', function()
	local ped = PlayerPedId()
	TriggerServerEvent('ndk:permissao')
	GiveWeaponToPed(ped,GetHashKey("WEAPON_NIGHTSTICK"),0,0,1)
end)
RegisterNUICallback('Faca', function()
	local ped = PlayerPedId()
	TriggerServerEvent('ndk:permissao')
	GiveWeaponToPed(ped,GetHashKey("WEAPON_KNIFE"),0,0,1)
end)

RegisterNUICallback('colete', function()
	local ped = PlayerPedId()
	TriggerServerEvent('ndk:permissao')
	TriggerServerEvent('skips_arsenal:colete')
end)

RegisterNUICallback('Limpar', function()
	local ped = PlayerPedId()
	TriggerServerEvent('ndk:permissao')
	RemoveAllPedWeapons(ped,true)
end)