local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
inProgress = {}

src = {}
Tunnel.bindInterface("ph_munifac", src)

local itemName = {
	{ item = "ahk" },
	{ item = "ahkk" },
	{ item = "mfive" },
	{ item = "mmfive" },
	{ item = "mtec9" },
	{ item = "mmtec9" },
	{ item = "muzi" },
	{ item = "mmuzi" },
	{ item = "mfamas" },
	{ item = "mmfamas" },
	{ item = "mak47" },
	{ item = "mmak47" },
	{ item = "makm" },
	{ item = "mmakm" },
	{ item = "mg36" },
	{ item = "mmg36" }
}

-- DEVENVOLVIDO  BY  PH NEVES

RegisterServerEvent("ph_munifac:weaponfactory")
AddEventHandler("ph_munifac:weaponfactory",function(item)
	local src = source
	local user_id = vRP.getUserId(src)
	if user_id then
		for e,g in pairs(itemName) do
			if item == g.item then
				if not inProgress[src] then
					if item == "ahk" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|WEAPON_SNSPISTOL") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"polvora") >= 20 then
								if vRP.getInventoryItemAmount(user_id,"ferro") >= 20 then
									if vRP.getInventoryItemAmount(user_id,"capsula") >= 20 then
											if vRP.tryGetInventoryItem(user_id,"polvora",20) and vRP.tryGetInventoryItem(user_id,"ferro",20) and vRP.tryGetInventoryItem(user_id,"capsula",20) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(2000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wammo|WEAPON_SNSPISTOL",40)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou <b>40 Munição De AHK</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Pólvora</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Ferro</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Capsula</b> o suficiente.")
								end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES

					elseif item == "ahkk" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|WEAPON_SNSPISTOL") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"polvora") >= 40 then
								if vRP.getInventoryItemAmount(user_id,"ferro") >= 40 then
									if vRP.getInventoryItemAmount(user_id,"capsula") >= 40 then
											if vRP.tryGetInventoryItem(user_id,"polvora",40) and vRP.tryGetInventoryItem(user_id,"ferro",40) and vRP.tryGetInventoryItem(user_id,"capsula",40) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(2000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wammo|WEAPON_SNSPISTOL",80)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou <b>80 Munição De AHK</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Pólvora</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Ferro</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Capsula</b> o suficiente.")
								end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES
						
					elseif item == "mfive" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|WEAPON_PISTOL_MK2") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"polvora") >= 25 then
								if vRP.getInventoryItemAmount(user_id,"ferro") >= 25 then
									if vRP.getInventoryItemAmount(user_id,"capsula") >= 25 then
											if vRP.tryGetInventoryItem(user_id,"polvora",25) and vRP.tryGetInventoryItem(user_id,"ferro",25) and vRP.tryGetInventoryItem(user_id,"capsula",25) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(2000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wammo|WEAPON_PISTOL_MK2",40)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou <b>40 Munição De Five</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Pólvora</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Ferro</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Capsula</b> o suficiente.")
								end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES
						
					elseif item == "mmfive" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|WEAPON_PISTOL_MK2") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"polvora") >= 50 then
								if vRP.getInventoryItemAmount(user_id,"ferro") >= 50 then
									if vRP.getInventoryItemAmount(user_id,"capsula") >= 50 then
											if vRP.tryGetInventoryItem(user_id,"polvora",50) and vRP.tryGetInventoryItem(user_id,"ferro",50) and vRP.tryGetInventoryItem(user_id,"capsula",50) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(3000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wammo|WEAPON_PISTOL_MK2",80)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou <b>80 Munição De Five</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Pólvora</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Ferro</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Capsula</b> o suficiente.")
								end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES

					elseif item == "mtec9" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|WEAPON_MACHINEPISTOL") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"polvora") >= 30 then
								if vRP.getInventoryItemAmount(user_id,"ferro") >= 30 then
									if vRP.getInventoryItemAmount(user_id,"capsula") >= 30 then
											if vRP.tryGetInventoryItem(user_id,"polvora",30) and vRP.tryGetInventoryItem(user_id,"ferro",30) and vRP.tryGetInventoryItem(user_id,"capsula",30) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(3000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wammo|WEAPON_MACHINEPISTOL",40)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou <b>40 Munição De TEC-9</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Pólvora</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Ferro</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Capsula</b> o suficiente.")
								end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES

					elseif item == "mmtec9" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|WEAPON_MACHINEPISTOL") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"polvora") >= 60 then
								if vRP.getInventoryItemAmount(user_id,"ferro") >= 60 then
									if vRP.getInventoryItemAmount(user_id,"capsula") >= 60 then
											if vRP.tryGetInventoryItem(user_id,"polvora",60) and vRP.tryGetInventoryItem(user_id,"ferro",60) and vRP.tryGetInventoryItem(user_id,"polvora",60) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(3000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wammo|WEAPON_MACHINEPISTOL",80)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou <b>80 Munição De TEC-9</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Pólvora</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Ferro</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Capsula</b> o suficiente.")
								end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES
						
					elseif item == "muzi" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|WEAPON_MICROSMG") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"polvora") >= 35 then
								if vRP.getInventoryItemAmount(user_id,"ferro") >= 35 then
									if vRP.getInventoryItemAmount(user_id,"capsula") >= 35 then
											if vRP.tryGetInventoryItem(user_id,"polvora",35) and vRP.tryGetInventoryItem(user_id,"ferro",35) and vRP.tryGetInventoryItem(user_id,"capsula",35) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(3000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wammo|WEAPON_MICROSMG",40)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou <b>40 Munição De Uzi</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Pólvora</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Ferro</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Capsula</b> o suficiente.")
								end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES

					elseif item == "mmuzi" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|WEAPON_MICROSMG") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"polvora") >= 70 then
								if vRP.getInventoryItemAmount(user_id,"ferro") >= 70 then
									if vRP.getInventoryItemAmount(user_id,"capsula") >= 70 then
											if vRP.tryGetInventoryItem(user_id,"polvora",70) and vRP.tryGetInventoryItem(user_id,"ferro",70) and vRP.tryGetInventoryItem(user_id,"capsula",70) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(3000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wammo|WEAPON_MICROSMG",80)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou <b>80 Munição De Uzi</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Pólvora</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Ferro</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Capsula</b> o suficiente.")
								end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES
						
					elseif item == "mfamas" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|WEAPON_BULLPUPRIFLE") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"polvora") >= 35 then
								if vRP.getInventoryItemAmount(user_id,"ferro") >= 35 then
									if vRP.getInventoryItemAmount(user_id,"capsula") >= 35 then
											if vRP.tryGetInventoryItem(user_id,"polvora",35) and vRP.tryGetInventoryItem(user_id,"ferro",35) and vRP.tryGetInventoryItem(user_id,"capsula",35) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(4000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wammo|WEAPON_BULLPUPRIFLE",40)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou <b>40 Munição De Famas</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Pólvora</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Ferro</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Capsula</b> o suficiente.")
								end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES
						
					elseif item == "mmfamas" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|WEAPON_BULLPUPRIFLE") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"polvora") >= 70 then
								if vRP.getInventoryItemAmount(user_id,"ferro") >= 70 then
									if vRP.getInventoryItemAmount(user_id,"capsula") >= 70 then
											if vRP.tryGetInventoryItem(user_id,"polvora",70) and vRP.tryGetInventoryItem(user_id,"ferro",70) and vRP.tryGetInventoryItem(user_id,"capsula",70) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(4000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wammo|WEAPON_BULLPUPRIFLE",80)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou <b>80 Munição De Famas</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Pólvora</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Ferro</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Capsula</b> o suficiente.")
								end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES
						
					elseif item == "mak47" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|WEAPON_ASSAULTRIFLE") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"polvora") >= 45 then
								if vRP.getInventoryItemAmount(user_id,"ferro") >= 45 then
									if vRP.getInventoryItemAmount(user_id,"capsula") >= 45 then
											if vRP.tryGetInventoryItem(user_id,"polvora",45) and vRP.tryGetInventoryItem(user_id,"ferro",45) and vRP.tryGetInventoryItem(user_id,"capsula",45) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(5000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wammo|WEAPON_ASSAULTRIFLE",40)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou <b>40 Munição De AK47</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Pólvora</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Ferro</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Capsula</b> o suficiente.")
								end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES
					
					elseif item == "mmak47" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|WEAPON_ASSAULTRIFLE") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"polvora") >= 90 then
								if vRP.getInventoryItemAmount(user_id,"ferro") >= 90 then
									if vRP.getInventoryItemAmount(user_id,"capsula") >= 90 then
											if vRP.tryGetInventoryItem(user_id,"polvora",90) and vRP.tryGetInventoryItem(user_id,"ferro",90) and vRP.tryGetInventoryItem(user_id,"capsula",90) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(5000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wammo|WEAPON_ASSAULTRIFLE",80)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou <b>80 Munição De AK47</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Pólvora</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Ferro</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Capsula</b> o suficiente.")
								end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES

					elseif item == "makm" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|WEAPON_ASSAULTRIFLE_MK2") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"polvora") >= 50 then
								if vRP.getInventoryItemAmount(user_id,"ferro") >= 50 then
									if vRP.getInventoryItemAmount(user_id,"capsula") >= 50 then
											if vRP.tryGetInventoryItem(user_id,"polvora",50) and vRP.tryGetInventoryItem(user_id,"ferro",50) and vRP.tryGetInventoryItem(user_id,"capsula",50) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(5000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wammo|WEAPON_ASSAULTRIFLE_MK2",40)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou <b>40 Munição De AKM</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Pólvora</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Ferro</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Capsula</b> o suficiente.")
								end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES

					elseif item == "mmakm" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|WEAPON_ASSAULTRIFLE_MK2") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"polvora") >= 100 then
								if vRP.getInventoryItemAmount(user_id,"ferro") >= 100 then
									if vRP.getInventoryItemAmount(user_id,"capsula") >= 100 then
											if vRP.tryGetInventoryItem(user_id,"polvora",100) and vRP.tryGetInventoryItem(user_id,"ferro",100) and vRP.tryGetInventoryItem(user_id,"capsula",100) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(5000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wammo|WEAPON_ASSAULTRIFLE_MK2",80)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou <b>80 Munição De AKM</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Pólvora</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Ferro</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Capsula</b> o suficiente.")
								end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES

					elseif item == "mg36" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|WEAPON_SPECIALCARBINE") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"polvora") >= 60 then
								if vRP.getInventoryItemAmount(user_id,"ferro") >= 60 then
									if vRP.getInventoryItemAmount(user_id,"capsula") >= 60 then
											if vRP.tryGetInventoryItem(user_id,"polvora",60) and vRP.tryGetInventoryItem(user_id,"ferro",60) and vRP.tryGetInventoryItem(user_id,"capsula",60) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(5000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wammo|WEAPON_SPECIALCARBINE",40)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou <b>40 Munição De G36</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Pólvora</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Ferro</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Capsula</b> o suficiente.")
								end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES

					elseif item == "mmg36" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|WEAPON_SPECIALCARBINE") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"polvora") >= 120 then
								if vRP.getInventoryItemAmount(user_id,"ferro") >= 120 then
									if vRP.getInventoryItemAmount(user_id,"capsula") >= 120 then
											if vRP.tryGetInventoryItem(user_id,"polvora",120) and vRP.tryGetInventoryItem(user_id,"ferro",120) and vRP.tryGetInventoryItem(user_id,"capsula",120) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(5000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wammo|WEAPON_SPECIALCARBINE",80)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou <b>80 Munição De G36</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Pólvora</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Ferro</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Capsula</b> o suficiente.")
								end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end
					end
				else
					TriggerClientEvent("Notify",src,"negado","Termine a produção em progresso para iniciar outra.")
				end
			end
		end
	end
end)

-- DEVENVOLVIDO  BY  PH NEVES

function src.checkPermission()
	local source = source
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") then
		return true
	end
end