
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPserver = Tunnel.getInterface("vRP","skips_craft")

src = {}
Tunnel.bindInterface("skips_craft",src)
vSERVER = Tunnel.getInterface("skips_craft")

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
config = {}
config_server = {}

config.imgDir = "http://191.96.225.113/skips/itens/" -- DIRETORIO DE SUAS IMAGENS
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TRADUÇOES
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
config.lang = {
    notPermiss = function() TriggerEvent("nyo_notify","negado","Você não possui permissão para isso.", 5) end,
}

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- OUTRAS CONFIG
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
config.marker = function(tipo, coords) -- CONFIG DA MARCAÇÃO DO BLIP
	local innerTable = {}
    if tipo == "craft" then
		
     --   DrawText3D(coords[1],coords[2],coords[3], "Pressione ~g~ E ~w~ para abrir a bancada.")

	  DrawMarker(27,coords[1],coords[2],coords[3]-0.97,0,0,0,0,0,0,1.0,1.0,0.5,255, 200, 0,150,0,0,0,1)
  	  DrawMarker(21,coords[1],coords[2],coords[3]-0.97,0,0,0,0,0,0,1.0,1.0,0.5,255, 200, 0,155,0,0,0,1)
	table.insert(innerTable,{ coords[1],coords[2],coords[3],1.50,"E","Pressione","para abrir a bancada." })
	TriggerEvent("hoverfy:insertTable",innerTable)	
elseif tipo == "armazem" then
		DrawText3D(coords[1],coords[2],coords[3], "[~b~ARMAZEM~w~] ~g~ E ~w~ para ver ~g~ G ~w~ para guardar.")
    end

	
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
src.playAnim = function(anim)
	vRP.playAnim(false,{{anim[1], anim[2]}},true)
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function DrawText3D(x,y,z,text)
	local onScreen,_x,_y = World3dToScreen2d(x,y,z)
	SetTextFont(4)
	SetTextScale(0.35,0.35)
	SetTextColour(255,255,255,100)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text)) / 400
	DrawRect(_x,_y+0.0125,0.01+factor,0.03,0,0,0,140)
end