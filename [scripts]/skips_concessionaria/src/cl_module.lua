
local Tunnel = module("vrp", "lib/Tunnel")

Passos = Tunnel.getInterface("skips_concessionaria")

local ultimo_veh
local perto = false
local build2060 = nil
local hash_list = {}
local vehs_list = {}
local object = {}
local rgb_color = { R = 255, G = 255, B = 255 }
local rgb_color2 = { R = 255, G = 255, B = 255 }
local localizacoes = { vector3(119.58, -140.36, 54.85) }
local blip 

Citizen.CreateThread(function()
    while true do
        skips = 1000
        local ped = PlayerPedId()
        for i = 1, #localizacoes do
        local cds = localizacoes[i]
        local dist = #(cds - GetEntityCoords(ped))
         -- DisplayRadar(false)
            if dist <= 5 then          
                skips = 1          
                DrawText3Ds(cds.x, cds.y, cds.z, "Pressione ~y~[E]~w~ para abrir a concessionária")
                DrawMarker(27,cds.x, cds.y, cds.z-0.97,0,0,0,0,0,0,1.0,1.0,0.5,255, 255, 0,150,0,0,0,1)
                if dist <= 2.5 then
                    if IsControlJustPressed(0, 38) then
                        openNui()

                    end
                end
            end
        end
        Wait(skips)
    end
end)

--[[ Citizen.CreateThread(function ()
    for i = 1, #localizacoes do    
        local cds = localizacoes[i]
        blip = AddBlipForCoord(cds.x, cds.y, cds.z)

        SetBlipSprite (blip, 326)
        SetBlipDisplay(blip, 4)
        SetBlipScale  (blip, 0.8)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Concessionária")
        EndTextCommandSetBlipName(blip)
    end
end) ]]

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(0.32, 0.32)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 500
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 80)
end

function openNui() 
    perto = true
    local ped = PlayerPedId()
    local nome,dinheiro = Passos.returnValues()
    TriggerServerEvent("vehs:show")
    Citizen.Wait(1000)
    SendNUIMessage({ data = vehs_list, type = "display", playerName = nome, playerMoney = dinheiro })
    SetNuiFocus(true, true)
    RequestCollisionAtCoord(x, y, z)          
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", -39.59, -1056.91, -42.5, 56.36, 0.00, 0.00, 80.00, false, 0)
    PointCamAtCoord(cam, -35.26872,-1052.309,-44.373)  
    SetCamActive(cam, true)
    RenderScriptCams(true, true, 1, true, true)
    SetFocusPosAndVel(-46.88, -1054.97, -41.86, 0.0, 0.0, 0.0) 
    DisplayHud(false)
    DisplayRadar(false)
    TriggerEvent("hud:setShow", false)
    while perto do
        Citizen.Wait(0)        
    end

    if ultimo_veh ~= nil then
        DeleteEntity(ultimo_veh)
    end
end

function rotation(dir)
    local entityRot = GetEntityHeading(ultimo_veh) + dir
    SetEntityHeading(ultimo_veh, entityRot % 360)
end

function att_veh(model)
    local hash = GetHashKey(model)
    if not HasModelLoaded(hash) then
        RequestModel(hash)
        while not HasModelLoaded(hash) do
            Citizen.Wait(10)
        end
    end
    if ultimo_veh ~= nil then
        DeleteEntity(ultimo_veh)
    end
    ultimo_veh = CreateVehicle(hash, -37.26872,-1054.309,-43.37314, 32.1, 0, 1)
    SetEntityHeading(ultimo_veh, 226.18) --  
end

function closeNui()
    SendNUIMessage({ type = "hide" })
    SetNuiFocus(false, false)
    if perto then
        if ultimo_veh ~= nil then
            DeleteEntity(ultimo_veh)
        end
        local ped = PlayerPedId()  
        RenderScriptCams(false)
        DestroyAllCams(true)
        ClearFocus()
        DisplayHud(true)
        TriggerEvent("hud:setShow", true)
        DisplayRadar(false)
    end
    perto = false
end

RegisterNetEvent('vehs:notify')
AddEventHandler('vehs:notify', function(type, message)    
    SendNUIMessage({ type = "notify", typenotify = type, message = message, }) 
end)

RegisterNetEvent('vehs:show_vehs')
AddEventHandler('vehs:show_vehs', function(consulta)      

    for _,value in pairs(consulta) do
        vehs_list[value.category] = {}
    end

    for _,value in pairs(consulta) do

        local modelo = GetHashKey(value.model)
        local marca

        if build2060 then
            marca = GetLabelText(Citizen.InvokeNative(0xF7AF4F159FF99F97, modelo, Citizen.ResultAsString()))    
        else
            marca = nil
        end

        if marca == nil then
            marca = 'Veiculo'
        end    

        local nome_veh   

        if GetLabelText(value.model) == "NULL" then
            nome_veh = value.model:gsub("^%l", string.upper)
        else 
            nome_veh = GetLabelText(value.model)
        end

        object = 
        {
            brand = marca,
            name = nome_veh,
            handling = 'none',
            topspeed = math.ceil(GetVehicleModelEstimatedMaxSpeed(modelo)*3.605936),
            power = math.ceil(GetVehicleModelAcceleration(modelo)*1000),
            price = value.price,
            model = value.model,
            qtd = value.stock
        }
        table.insert(vehs_list[value.category], object)
    end
end)

RegisterNUICallback("rotate",function(data, cb)
    if (data["key"] == "left") then
        rotation(2)
    else
        rotation(-2)
    end
    cb("ok")
end)

RegisterNUICallback("SpawnVehicle", function(data, cb)
    att_veh(data.modelcar)
end)

RegisterNUICallback("RGBVehicle",function(data, cb)
    if data.primary then
        rgb_color = data
        SetVehicleCustomPrimaryColour(ultimo_veh, data.R, data.G, data.B)
    else
        rgb_color2 = data
        SetVehicleCustomSecondaryColour(ultimo_veh, data.R, data.G, data.B)
    end
end)

RegisterNUICallback("Buy",function(data, cb)
    TriggerServerEvent("vehs:comprar", data.modelcar, data.sale*1000, data.name)
end)

RegisterNUICallback("menuSelected",function(data, cb)
    local categoryVehicles
    local playerIdx = GetPlayerFromServerId(source)
    local ped = GetPlayerPed(playerIdx)
    if data.menuId ~= 'all' then
        categoryVehicles = vehs_list[data.menuId]
    else
        SendNUIMessage({ data = vehs_list, type = "display", playerName = GetPlayerName(ped) })
        return
    end
    SendNUIMessage({ data = categoryVehicles, type = "menu"})
end)


RegisterNUICallback("Close",function(data, cb)
    closeNui()       
end)

AddEventHandler("onResourceStop", function(resourceName)
    if resourceName == GetCurrentResourceName() then
        closeNui()
        TriggerEvent("hud:setShow", true)
        RemoveBlip(blip)
    end
end)
