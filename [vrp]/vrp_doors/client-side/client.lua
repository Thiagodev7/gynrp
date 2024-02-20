-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- STATUS SEND DOORS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('vrpdoorsystem:statusSend')
AddEventHandler('vrpdoorsystem:statusSend',function(i,status)
	if i ~= nil and status ~= nil then
		doors[i].lock = status
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STATUS SEND GATES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('vrpgatesystem:statusSend')
AddEventHandler('vrpgatesystem:statusSend',function(i,status)
	if i ~= nil and status ~= nil then
		gates[i].lock = status
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREAD DOORS/GATES CLICK E
-----------------------------------------------------------------------------------------------------------------------------------------
--[[ Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if IsControlJustPressed(0,38) and IsInputDisabled(0) then
			if not vRP.isHandcuffed() then
				local id = searchIdDoor()
				if id ~= 0 then
					vRP._playAnim(true,{{"veh@mower@base","start_engine"}},false)
				    Citizen.Wait(2200)
					TriggerServerEvent("vrpdoorsystem:open",id)
				end
			end
		end

		 if IsControlJustPressed(0,38) and IsInputDisabled(0) then
			if not vRP.isHandcuffed() then
				local id = searchIdgate()
				if id ~= 0 then
					vRP._playAnim(true,{{"veh@mower@base","start_engine"}},false)
				Citizen.Wait(2200)
					TriggerServerEvent("vrpgatesystem:open",id)
				end
			end
		end 
	end
end) ]]

RegisterCommand('vrp_doors:porta', function()
	if not vRP.isHandcuffed() then
		local id = searchIdDoor()
		if id ~= 0 then
			vRP._playAnim(true,{{"veh@mower@base","start_engine"}},false)
			Citizen.Wait(2200)
			TriggerServerEvent("vrpdoorsystem:open",id)
		end
	end
end, false)


RegisterKeyMapping("vrp_doors:porta","Abrir Portas","keyboard","E")
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREAD DOORS/GATES
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local idle = 1000
		local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
		for k,v in pairs(doors) do
			if GetDistanceBetweenCoords(x,y,z,v.x,v.y,v.z,true) <= 5 then
				idle = 1
				local door = GetClosestObjectOfType(v.x,v.y,v.z,1.0,v.hash,false,false,false)
				if door ~= 0 then
					SetEntityCanBeDamaged(door,false)
					if v.lock == false then
						if v.text then
							DrawText3Ds(v.x,v.y,v.z+0.2,"~y~[E] ~w~   🔓 ",370)
						end
						NetworkRequestControlOfEntity(door)
						FreezeEntityPosition(door,false)
					else
						local lock,heading = GetStateOfClosestDoorOfType(v.hash,v.x,v.y,v.z,lock,heading)
						if heading > -0.02 and heading < 0.02 then
							if v.text then
								DrawText3Ds(v.x,v.y,v.z+0.2,"~y~[E] ~w~  🔒 ",370)
							end
							NetworkRequestControlOfEntity(door)
							FreezeEntityPosition(door,true)
						end
					end
				end
			end
		end

		for k,v in pairs(gates) do
			if GetDistanceBetweenCoords(x,y,z,v.x,v.y,v.z,true) <= 15 then
				idle = 1
				local gate = GetClosestObjectOfType(v.x,v.y,v.z,1.0,v.hash,false,false,false)
				if gate ~= 0 then
					SetEntityCanBeDamaged(gate,false)
					if v.lock == false then
						if v.text then
							DrawText3Ds(v.x,v.y,v.z+0.2,"~g~[E] ~w~   🔓 ",370)
						end
						NetworkRequestControlOfEntity(gate)
						FreezeEntityPosition(gate,false)
					else
						local lock,heading = GetStateOfClosestDoorOfType(v.hash,v.x,v.y,v.z,lock,heading)
						if heading > -0.02 and heading < 0.02 then
							if v.text then
								DrawText3Ds(v.x,v.y,v.z+0.2,"~g~[E] ~w~  🔒",370)
							end
							NetworkRequestControlOfEntity(gate)
							FreezeEntityPosition(gate,true)
						end
					end
				end
			end
		end
		Citizen.Wait(idle)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SEARCH ID DOORS
-----------------------------------------------------------------------------------------------------------------------------------------
function searchIdDoor()
	local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
	for k,v in pairs(doors) do
		if GetDistanceBetweenCoords(x,y,z,v.x,v.y,v.z,true) <= 1.5 then
			return k
		end
	end
	return 0
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SEARCH ID GATES
-----------------------------------------------------------------------------------------------------------------------------------------
function searchIdgate()
	local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
	for k,v in pairs(gates) do
		if GetDistanceBetweenCoords(x,y,z,v.x,v.y,v.z,true) <= 15 then
			return k
		end
	end
	return 0
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRAWTEXT3D
-----------------------------------------------------------------------------------------------------------------------------------------
function DrawText3Ds(x,y,z,text,size)
	local onScreen,_x,_y = World3dToScreen2d(x,y,z)
	SetTextFont(4)
	SetTextScale(0.35,0.35)
	SetTextColour(255,255,255,150)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text))/size
--	DrawRect(_x,_y+0.0125,0.01+factor,0.03,0,0,0,80)
end