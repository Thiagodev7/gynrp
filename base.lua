local Proxy = module("lib/Proxy")
local Tunnel = module("lib/Tunnel")

local config = module("cfg/base")

vRP = {}
Proxy.addInterface("vRP",vRP)
local skips = module("config")
tvRP = {}
Tunnel.bindInterface("vRP",tvRP)
vRPclient = Tunnel.getInterface("vRP")

vRP.users = {}
vRP.rusers = {}
vRP.user_tables = {}
vRP.user_tmp_tables = {}
vRP.user_sources = {}

local db_drivers = {}
local db_driver
local cached_prepares = {}
local cached_queries = {}
local prepared_queries = {}
local db_initialized = false


local var_true = true




-----------------------------------------------------------------------------------------------------------------------------------------
--[ WEBHOOK ]----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
local logEntrada = "https://discord.com/api/webhooks/1022694500663033906/di-iAG4ryep3cb33Cbm8o34w40lCO_D155yNFfJWCuLAigz8pZI0Hlsl9WGfBjwm2YX3"
local logSaida = "https://discord.com/api/webhooks/1022694500663033906/di-iAG4ryep3cb33Cbm8o34w40lCO_D155yNFfJWCuLAigz8pZI0Hlsl9WGfBjwm2YX3"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end




function vRP.getAuthDoguinho(source)
	if var_true == true then
		return true
	else
	--	os.exit()
	end
end

function vRP.registerDBDriver(name,on_init,on_prepare,on_query)
	if not db_drivers[name] then
		db_drivers[name] = { on_init,on_prepare,on_query }

		if name == config.db.driver then
			db_driver = db_drivers[name]

			local ok = on_init(config.db)
			if ok then
				db_initialized = true
				for _,prepare in pairs(cached_prepares) do
					on_prepare(table.unpack(prepare,1,table.maxn(prepare)))
				end

				for _,query in pairs(cached_queries) do
					query[2](on_query(table.unpack(query[1],1,table.maxn(query[1]))))
				end

				cached_prepares = nil
				cached_queries = nil
			end
		end
	end
end

function vRP.format(n)
	local left,num,right = string.match(n,'^([^%d]*%d)(%d*)(.-)$')
	return left..(num:reverse():gsub('(%d%d%d)','%1.'):reverse())..right
end

function vRP.prepare(name,query)
	prepared_queries[name] = true

	if db_initialized then
		db_driver[2](name,query)
	else
		table.insert(cached_prepares,{ name,query })
	end
end

function vRP.query(name,params,mode)
	if not mode then mode = "query" end

	if db_initialized then
		return db_driver[3](name,params or {},mode)
	else
		local r = async()
		table.insert(cached_queries,{{ name,params or {},mode },r })
		return r:wait()
	end
end

function vRP.execute(name,params)
	return vRP.query(name,params,"execute")
end


vRP.prepare("vRP/create_user","INSERT INTO id_users(steam,whitelisted) VALUES(@steam,false)")
vRP.prepare("vRP/set_banned","UPDATE id_users SET banned = @banned WHERE steam = @steam")
vRP.prepare("vRP/set_whitelisted","UPDATE id_users SET whitelisted = @whitelist WHERE steam = @steam")
vRP.prepare("vRP/get_banned","SELECT banned FROM id_users WHERE steam = @steam")
vRP.prepare("vRP/get_whitelisted","SELECT whitelisted FROM id_users WHERE steam = @steam")
vRP.prepare("vRP/get_vrp_infos","SELECT * FROM id_users WHERE steam = @steam")
vRP.prepare("vRP/get_vrp_infos_id","SELECT * FROM id_users WHERE id = @id")
vRP.prepare("vRP/get_vrp_users","SELECT * FROM vrp_users WHERE id = @id")
vRP.prepare("vRP/get_vrp_registration","SELECT id FROM vrp_users WHERE registration = @registration")
vRP.prepare("vRP/get_vrp_phone","SELECT id FROM vrp_users WHERE phone = @phone")
vRP.prepare("vRP/get_characters","SELECT * FROM vrp_users WHERE steam = @steam and deleted = 0")
vRP.prepare("vRP/create_characters","INSERT INTO vrp_users(steam) VALUES(@steam)")
vRP.prepare("vRP/remove_characters","UPDATE vrp_users SET deleted = 1 WHERE id = @id")
vRP.prepare("vRP/update_characters","UPDATE vrp_user_identities SET registration = @registration, phone = @phone WHERE id = @id")
vRP.prepare("vRP/rename_characters","UPDATE vrp_user_identities SET name = @name, firstname = @name2 WHERE id = @id")
vRP.prepare("vRP/add_identifier","INSERT INTO vrp_user_ids(identifier,user_id) VALUES(@identifier,@user_id)")

vRP.prepare("vRP/userid_byidentifier","SELECT id FROM vrp_users WHERE steam = @identifier")
vRP.prepare("vRP/identifier_byuserid","SELECT steam FROM vrp_users WHERE id = @id")

vRP.prepare("vRP/set_userdata","REPLACE INTO vrp_user_data(user_id,dkey,dvalue) VALUES(@user_id,@key,@value)")
vRP.prepare("vRP/get_userdata","SELECT dvalue FROM vrp_user_data WHERE user_id = @user_id AND dkey = @key")
vRP.prepare("vRP/set_srvdata","REPLACE INTO vrp_srv_data(dkey,dvalue) VALUES(@key,@value)")
vRP.prepare("vRP/get_srvdata","SELECT dvalue FROM vrp_srv_data WHERE dkey = @key")
vRP.prepare("vRP/init_user_identity","INSERT IGNORE INTO vrp_user_identities(user_id,registration,phone,firstname,name,age) VALUES(@user_id,@registration,@phone,@firstname,@name,@age)")

vRP.prepare("creative/get_vehicle","SELECT * FROM vrp_user_vehicles WHERE user_id = @user_id")
vRP.prepare("creative/rem_vehicle","DELETE FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")
vRP.prepare("creative/get_vehicles","SELECT * FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")
vRP.prepare("creative/set_update_vehicles","UPDATE vrp_user_vehicles SET engine = @engine, body = @body, fuel = @fuel WHERE user_id = @user_id AND vehicle = @vehicle")
vRP.prepare("creative/set_detido","UPDATE vrp_user_vehicles SET detido = @detido, time = @time WHERE user_id = @user_id AND vehicle = @vehicle")
vRP.prepare("creative/set_ipva","UPDATE vrp_user_vehicles SET ipva = @ipva WHERE user_id = @user_id AND vehicle = @vehicle")
vRP.prepare("creative/move_vehicle","UPDATE vrp_user_vehicles SET user_id = @nuser_id WHERE user_id = @user_id AND vehicle = @vehicle")
vRP.prepare("creative/add_vehicle","INSERT IGNORE INTO vrp_user_vehicles(user_id,vehicle,ipva) VALUES(@user_id,@vehicle,@ipva)")
vRP.prepare("creative/con_maxvehs","SELECT COUNT(vehicle) as qtd FROM vrp_user_vehicles WHERE user_id = @user_id")
vRP.prepare("creative/rem_srv_data","DELETE FROM vrp_srv_data WHERE dkey = @dkey")
vRP.prepare("creative/get_estoque","SELECT * FROM vrp_estoque WHERE vehicle = @vehicle")
vRP.prepare("creative/set_estoque","UPDATE vrp_estoque SET quantidade = @quantidade WHERE vehicle = @vehicle")

vRP.prepare("vRP/update_ip","UPDATE vrp_users SET ip = @ip WHERE id = @uid")
vRP.prepare("vRP/update_login","UPDATE vrp_users SET last_login = @ll WHERE id = @uid")

vRP.prepare("vRP/getExistChest","SELECT * FROM vrp_chests WHERE name = @name")
vRP.prepare("vRP/get_alltable","SELECT * FROM vrp_chests")
vRP.prepare("vRP/addChest","INSERT INTO vrp_chests (permiss,name,x,y,z,weight,webhook) VALUES (@permiss,@name,@x,@y,@z,@weight,@webhook)")

vRP.prepare('SkS/multarSKS', 'UPDATE vrp_user_identities SET user_id=@user_id,multas=@multas WHERE user_id=@user_id')
vRP.prepare('SkS/selectMultas', 'SELECT multas FROM vrp_user_identities WHERE  user_id=@user_id;')

function vRP.getUserIdByIdentifier(ids)
	local rows = vRP.query("vRP/userid_byidentifier",{ identifier = ids})
	if #rows > 0 then
		return rows[1].id
	else
		return -1
	end
end

function vRP.getIdentifierByUserId(id)
	local rows = vRP.query("vRP/identifier_byuserid",{ id = id })
	if #rows > 0 then
		return rows[1].steam
	else
		return -1
	end
end

function vRP.getUserIdByIdentifiers(ids)
	if ids and #ids then
		for i=1,#ids do
			if (string.find(ids[i],"ip:") == nil) then
				local rows = vRP.query("vRP/userid_byidentifier",{ identifier = ids[i] })
				if #rows > 0 then
					return rows[1].id
				end
			end
		end

		--[[local rows,affected = vRP.query("vRP/create_user",{})

		if #rows > 0 then
			local user_id = rows[1].id
			for l,w in pairs(ids) do
				if (string.find(w,"ip:") == nil) then
					vRP.execute("vRP/add_identifier",{ user_id = user_id, identifier = w })
				end
			end
			return user_id
		end]]
	end
end

function vRP.getPlayerEndpoint(player)
	return GetPlayerEP(player) or "0.0.0.0"
end

function vRP.isBanned(steam, cbr)
	local rows = vRP.query("vRP/get_banned",{ steam = steam })
	if #rows > 0 then
		return rows[1].banned
	else
		return false
	end
end

function vRP.setBanned(data,banned)
	if tonumber(data) then 
		local steam = vRP.getIdentifierByUserId(parseInt(data))
		vRP.execute("vRP/set_banned",{ steam = steam, banned = banned })
		if banned then 
		--	print('[ BASE ] Banido '..data..' com steam '..steam..'.')
		else 
		--	print('[ BASE ] Desbanido '..data..' com steam '..steam..'.')
		end 
	elseif type(data) == 'string' then 
		vRP.execute("vRP/set_banned",{ steam = data, banned = banned })
		if banned then 
		--	print('[ BASE ] Banido steam '..steam..'.')
		else 
		--	print('[ BASE ] Desbanido steam '..steam..'.')
		end 
	end
end

function vRP.isWhitelisted(steam, cbr)
	local rows = vRP.query("vRP/get_whitelisted",{ steam = steam })
	if #rows > 0 then
		return rows[1].whitelisted
	else
		return false
	end
end

function vRP.setWhitelisted(data,whitelisted)
	if tonumber(data) then 
		local consult = vRP.query('vRP/get_vrp_infos_id', {id = parseInt(data)})[1]
		if consult then 
			vRP.execute("vRP/set_whitelisted",{ steam = consult.steam, whitelist = whitelisted })
		end
	elseif type(data) == 'string' then 
		vRP.execute("vRP/set_whitelisted",{ steam = steam, whitelist = whitelisted })
	end
end

function vRP.setUData(user_id,key,value)
	vRP.execute("vRP/set_userdata",{ user_id = user_id, key = key, value = value })
end

function vRP.getUData(user_id,key,cbr)
	local rows = vRP.query("vRP/get_userdata",{ user_id = user_id, key = key })
	if #rows > 0 then
		return rows[1].dvalue
	else
		return ""
	end
end

function vRP.setSData(key,value)
	vRP.execute("vRP/set_srvdata",{ key = key, value = value })
end

function vRP.getSData(key, cbr)
	local rows = vRP.query("vRP/get_srvdata",{ key = key })
	if #rows > 0 then
		return rows[1].dvalue
	else
		return ""
	end
end

function vRP.getUserDataTable(user_id)
	return vRP.user_tables[user_id]
end

function vRP.getUserTmpTable(user_id)
	return vRP.user_tmp_tables[user_id]
end

function vRP.getUserId(source)
		if source ~= nil then
			local ids = GetPlayerIdentifiers(source)
			if ids ~= nil and #ids > 0 then
				return vRP.users[vRP.getSteam(source)]
			end
		end
	return nil
end




function vRP.getUsers()
	local users = {}
	for k,v in pairs(vRP.user_sources) do
		users[k] = v
	end
	return users
end

function vRP.getUserSource(user_id)
	return vRP.user_sources[user_id]
end

function vRP.getSourceTables()
	return vRP.user_sources
end


function vRP.kick(source,reason)
	DropPlayer(source,reason)
end

function vRP.dropPlayer(source)
	local source = source
	local user_id = vRP.getUserId(source)
	vRPclient._removePlayer(-1,source)
	if user_id then
		local identity = vRP.getUserIdentity(user_id)
		if user_id and source and identity then
			TriggerEvent("vRP:playerLeave",user_id,source)
			
		end
		vRP.setUData(user_id,"vRP:datatable",json.encode(vRP.getUserDataTable(user_id)))
		vRP.users[vRP.rusers[user_id]] = nil
		vRP.rusers[user_id] = nil
		vRP.user_tables[user_id] = nil
		vRP.user_tmp_tables[user_id] = nil
		vRP.user_sources[user_id] = nil
	end
end

function task_save_datatables()
	SetTimeout(60000,task_save_datatables)
	TriggerEvent("vRP:save")
	for k,v in pairs(vRP.user_tables) do
		vRP.setUData(k,"vRP:datatable",json.encode(v))
	end
end

async(function()
	task_save_datatables()
end)

function vRP.getInfos(steam)
	return vRP.query("vRP/get_vrp_infos",{ steam = steam })
end

function vRP.getViceIdentifier(source)
	local identifiers = GetPlayerIdentifiers(source)
	achoudiscord = false
	achoulicense = false
	for k,v in ipairs(identifiers) do
		if string.sub(v,1,7) == "discord" then
			id = string.sub(v,9,string.len(v))
			if (string.len(id) % 2 == 0) then
				discordid = string.sub(id,1,string.len(id)/2)
			else
				discordid = string.sub(id,1,math.floor(string.len(id)/2))
			end
			achoudiscord = true
		end
		if string.sub(v,1,8) == "license:" then
			id = string.sub(v,9,string.len(v))
			if (string.len(id) % 2 == 0) then
				licenseid = string.sub(id,1,string.len(id)/2)
			else
				licenseid = string.sub(id,1,math.floor(string.len(id)/2))
			end
			achoulicense = true
		end
	end
	if achoudiscord and achoulicense then
		viceid = "base:"..discordid..licenseid
		return viceid
	end
end

--[[function vRP.getSteam(source)
	local identifiers = GetPlayerIdentifiers(source)
	for k,v in ipairs(identifiers) do
		if string.sub(v,1,7) == "discord" then
			return v
		end
	end
end]]

function vRP.getSteam(source)
	local identifiers = GetPlayerIdentifiers(source)
	for k,v in ipairs(identifiers) do
		if string.sub(v,1,5) == "steam" then
			return v
		end
	end
end


RegisterServerEvent("baseModule:idLoaded")
AddEventHandler("baseModule:idLoaded",function(source,user_id,model,name,firstname,age)
	local source = source
	if vRP.rusers[user_id] == nil then

		local steam = vRP.getSteam(source)

		-- [TABELAS TEMPORARIAS BASE] --

		vRP.user_tables[user_id] = {}
		vRP.user_tmp_tables[user_id] = {}
		vRP.user_sources[user_id] = source
		vRP.initModuleGroup(user_id,source)
		vRP.initMoney(user_id)


		-- [PEGAR DO BANCO OS DADOS] --

		local sdata = vRP.getUData(user_id,"vRP:datatable")
		if sdata then
			local data = json.decode(sdata)
			if type(data) == "table" then vRP.user_tables[user_id] = data end

		end

		-- [CASO ESTEJA CRIANDO] --

		if model ~= nil then
			vRP.user_tables[user_id].position = { x = tonumber(-1033.67), y = tonumber(-2733.15), z = tonumber(13.76) }
			vRP.user_tables[user_id].weapons = {}
			vRP.user_tables[user_id].colete = 0
			vRP.user_tables[user_id].customization = {}
			vRP.user_tables[user_id].customization.modelhash = GetHashKey(model)
			vRP.user_tables[user_id].thirst = -100
			vRP.user_tables[user_id].hunger = -100
			vRP.user_tables[user_id].health = 400
			vRP.user_tables[user_id].inventory = {}
			vRP.user_tables[user_id].groups = {}
			vRP.user_tables[user_id].skin = GetHashKey(model)
		end
		
		tvRP.initPlayerStatus(user_id,source,true)

		for k,v in pairs(vRP.user_sources) do
			vRPclient._addPlayer(source,v)
		end

		vRPclient._addPlayer(-1,source)

		if steam then
			vRP.users[steam] = user_id
			vRP.rusers[user_id] = steam
		end
		if name ~= nil and firstname ~= nil then
			vRP.execute("vRP/init_user_identity", { user_id = user_id, registration = vRP.generateRegistrationNumber(), phone = vRP.generatePhoneNumber(),firstname = firstname, name = name, age = age })
			-- vRP.execute("vRP/update_characters",{ id = parseInt(user_id), registration = vRP.generateRegistrationNumber(), phone = vRP.generatePhoneNumber() })
			vRP.giveInventoryItem(user_id,"identidade",1)
			vRP.giveInventoryItem(user_id,"dinheiro",skips.moneyWallet)
		end
		TriggerEvent("vRP:playerSpawn",user_id,source, true)
	--	print("[ BASE ] { ID } "..user_id.." acabou de logar no servidor! { IP } "..GetPlayerEndpoint(source))
		SendWebhookMessage(logEntrada,"```prolog\n[ID]: "..user_id.." \n[IP]: "..GetPlayerEndpoint(source).." \n[========= ENTROU NA CIDADE =========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")

	--	vRP.addUserGroup(1, "admin")

		if user_id == 1 then
			vRP.addUserGroup(user_id, "admin")
		end

				--Concessionaria
		vRP.removeUserGroup(user_id,"ConcessionariaPaycheck")
		vRP.removeUserGroup(user_id,"DONOConcessionariaPaycheck")
		--Policia
		vRP.removeUserGroup(user_id,"COMANDANTEPaycheck")
		vRP.removeUserGroup(user_id,"SUBCOMANDANTEPaycheck")

		vRP.removeUserGroup(user_id,"ROCAM1Paycheck")
		vRP.removeUserGroup(user_id,"ROCAM2Paycheck")
		vRP.removeUserGroup(user_id,"ROCAM3Paycheck")
		vRP.removeUserGroup(user_id,"ROCAM4Paycheck")
		vRP.removeUserGroup(user_id,"ROCAM5Paycheck")
		vRP.removeUserGroup(user_id,"ROCAM6Paycheck")
		vRP.removeUserGroup(user_id,"ROCAM7Paycheck")

		vRP.removeUserGroup(user_id,"GRPAE1Paycheck")
		vRP.removeUserGroup(user_id,"GRPAE2Paycheck")
		vRP.removeUserGroup(user_id,"GRPAE3Paycheck")

		vRP.removeUserGroup(user_id,"PM1Paycheck")
		vRP.removeUserGroup(user_id,"PM2Paycheck")
		vRP.removeUserGroup(user_id,"PM3Paycheck")
		vRP.removeUserGroup(user_id,"PM4Paycheck")
		vRP.removeUserGroup(user_id,"PM5Paycheck")
		vRP.removeUserGroup(user_id,"PM6Paycheck")
		vRP.removeUserGroup(user_id,"PM7Paycheck")
		vRP.removeUserGroup(user_id,"PM8Paycheck")
		vRP.removeUserGroup(user_id,"PM9Paycheck")

		vRP.removeUserGroup(user_id,"PC1Paycheck")
		vRP.removeUserGroup(user_id,"PC2Paycheck")
		vRP.removeUserGroup(user_id,"PC3Paycheck")
		vRP.removeUserGroup(user_id,"PC4Paycheck")

		vRP.removeUserGroup(user_id,"PRF1Paycheck")
		vRP.removeUserGroup(user_id,"PRF2Paycheck")
		vRP.removeUserGroup(user_id,"PRF3Paycheck")
		vRP.removeUserGroup(user_id,"PRF4Paycheck")

		vRP.removeUserGroup(user_id,"FT1Paycheck")
		vRP.removeUserGroup(user_id,"FT2Paycheck")
		vRP.removeUserGroup(user_id,"FT3Paycheck")
		vRP.removeUserGroup(user_id,"FT4Paycheck")
		vRP.removeUserGroup(user_id,"FT5Paycheck")
		vRP.removeUserGroup(user_id,"FT6Paycheck")
		vRP.removeUserGroup(user_id,"FT7Paycheck")
		vRP.removeUserGroup(user_id,"FT8Paycheck")
		vRP.removeUserGroup(user_id,"FT9Paycheck")

		vRP.removeUserGroup(user_id,"BAEP1Paycheck")
		vRP.removeUserGroup(user_id,"BAEP2Paycheck")
		vRP.removeUserGroup(user_id,"BAEP3Paycheck")
		vRP.removeUserGroup(user_id,"BAEP4Paycheck")
		vRP.removeUserGroup(user_id,"BAEP5Paycheck")
		vRP.removeUserGroup(user_id,"BAEP6Paycheck")
		vRP.removeUserGroup(user_id,"BAEP7Paycheck")
		vRP.removeUserGroup(user_id,"BAEP8Paycheck")
		vRP.removeUserGroup(user_id,"BAEP9Paycheck")

		vRP.removeUserGroup(user_id,"rotam1Paycheck")
		vRP.removeUserGroup(user_id,"rotam2Paycheck")
		vRP.removeUserGroup(user_id,"rotam3Paycheck")
		vRP.removeUserGroup(user_id,"rotam4Paycheck")
		vRP.removeUserGroup(user_id,"rotam5Paycheck")
		vRP.removeUserGroup(user_id,"rotam6Paycheck")
		vRP.removeUserGroup(user_id,"rotam7Paycheck")
		vRP.removeUserGroup(user_id,"rotam8Paycheck")
		vRP.removeUserGroup(user_id,"rotam9Paycheck")

		vRP.removeUserGroup(user_id,"EB1Paycheck")
		vRP.removeUserGroup(user_id,"EB2Paycheck")
		vRP.removeUserGroup(user_id,"EB3Paycheck")
		vRP.removeUserGroup(user_id,"EB4Paycheck")
		vRP.removeUserGroup(user_id,"EB5Paycheck")
		vRP.removeUserGroup(user_id,"EB6Paycheck")
		vRP.removeUserGroup(user_id,"EB7Paycheck")
		vRP.removeUserGroup(user_id,"EB8Paycheck")

		--Hospital
		vRP.removeUserGroup(user_id,"Hospital1Paycheck")
		vRP.removeUserGroup(user_id,"Hospital2Paycheck")
		vRP.removeUserGroup(user_id,"Hospital3Paycheck")
		vRP.removeUserGroup(user_id,"Hospital4Paycheck")
		vRP.removeUserGroup(user_id,"Hospital5Paycheck")
		vRP.removeUserGroup(user_id,"Hospital6Paycheck")
		--Bombeiros
		vRP.removeUserGroup(user_id,"Bombeiro1Paycheck")
		vRP.removeUserGroup(user_id,"Bombeiro2Paycheck")
		vRP.removeUserGroup(user_id,"Bombeiro3Paycheck")
		vRP.removeUserGroup(user_id,"Bombeiro4Paycheck")
		vRP.removeUserGroup(user_id,"Bombeiro5Paycheck")
		vRP.removeUserGroup(user_id,"Bombeiro6Paycheck")
		--Mecanica
		vRP.removeUserGroup(user_id,"Lider-MecanicoPaycheck")
		vRP.removeUserGroup(user_id,"MecanicoPaycheck2")
		vRP.removeUserGroup(user_id,"MecanicoPaycheck1")

		vRP.removeUserGroup(user_id,"BurguerShot1Paycheck")
		vRP.removeUserGroup(user_id,"BurguerShot2Paycheck")
		vRP.removeUserGroup(user_id,"BurguerShot3Paycheck")

		vRP.removeUserGroup(user_id,"TaxistaPaycheck")
		vRP.removeUserGroup(user_id,"Lider-TaxistaPaycheck")

		vRP.removeUserGroup(user_id,"AdvogadoPaycheck")
		vRP.removeUserGroup(user_id,"JuizPaycheck")

	end
end)

function vRP.updateSelectSkin(user_id,skin)
	vRP.user_tables[user_id].skin = skin
end

local nsource = vRP.getUserSource(user_id)
if(nsource~=nil)then
  if(GetPlayerName(nsource)~=nil)then
    deferrals.done("Você está bugado, reinicie o fivem!")
    TriggerEvent("queue:playerConnectingRemoveQueues",ids)
    return
  end
end

AddEventHandler("queue:playerConnecting",function(source,ids,name,setKickReason,deferrals)
	deferrals.defer()
	local source = source
	local steam = vRP.getSteam(source)
	if steam then
	

		-- if(#ids<=2)then
		-- 	PerformHttpRequest("", function(err, text, headers) end, 'POST', json.encode({content = "[MQCU] ENTRADA BLOQUEADA, Identifiers insuficientes para o login   user_id:"..user_id}), { ['Content-Type'] = 'application/json' })
		-- 	deferrals.done("[MQCU] Ocorreu um problema com seus identifiers!")
		-- 	TriggerEvent("queue:playerConnectingRemoveQueues",ids)                
		-- 	return
		-- end

		local user_id = vRP.getUserIdByIdentifier(steam)
		local nsource = vRP.getUserSource(user_id)
		if(vRP.user_sources[user_id]~=nil)then
			if(GetPlayerName(vRP.user_sources[user_id])~=nil)then
				deferrals.done("[MQCU] Você está bugado, reinicie o fivem!")
				TriggerEvent("queue:playerConnectingRemoveQueues",ids)
				return
			end
		end
		if not vRP.isBanned(steam) then
			if vRP.isWhitelisted(steam) then
				deferrals.done()
			else
				local newUser = vRP.getInfos(steam)
				local id = false
				if newUser[1] == nil then
					local consult = vRP.execute("vRP/create_user",{ steam = steam })
					if consult.insertId then 
						id = tonumber(consult.insertId)
					end 
				end
				
				deferrals.done(skips['msg_wl']..tostring(id or tonumber(newUser[1].id) or steam))
				TriggerEvent("queue:playerConnectingRemoveQueues",ids)
			end
		else
			deferrals.done(skips['msg_banido'])
			TriggerEvent("queue:playerConnectingRemoveQueues",ids)
		end
	else
		deferrals.done(skips['msg_steam'])
		TriggerEvent("queue:playerConnectingRemoveQueues",ids)
	end
end)

function vRP.rejoinServer(source)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local identity = vRP.getUserIdentity(user_id)
		if identity then
			--[[TriggerEvent("vRP:playerLeave",user_id,source)
			vRP.setUData(user_id,"vRP:datatable",json.encode(vRP.user_tables[user_id]))
			vRP.user_tables[user_id] = nil
			vRP.user_tmp_tables[user_id] = nil
			vRP.user_sources[user_id] = nil]]
			TriggerEvent("changeFirstspawn",user_id,true)
			vRP.dropPlayer(source)
		end
	end
end

function vRP.getImageURL()
	return base.imagesurl
end

AddEventHandler("playerDropped",function(reason)
	local source = source
	vRP.dropPlayer(source)
end)


RegisterServerEvent("vRPcli:playerSpawned")
AddEventHandler("vRPcli:playerSpawned",function()

	if first_spawn then
		for k,v in pairs(vRP.user_sources) do
			vRPclient._addPlayer(source,v)
		end
		vRPclient._addPlayer(-1,source)
		Tunnel.setDestDelay(source,0)
	end

	TriggerClientEvent("spawn:setupChars",source)

end)

function vRP.getDayHours(seconds)
    local days = math.floor(seconds/86400)
    seconds = seconds - days * 86400
    local hours = math.floor(seconds/3600)

    if days > 0 then
        return string.format("<b>%d Dias</b> e <b>%d Horas</b>",days,hours)
    else
        return string.format("<b>%d Horas</b>",hours)
    end
end

function vRP.getMinSecs(seconds)
    local days = math.floor(seconds/86400)
    seconds = seconds - days * 86400
    local hours = math.floor(seconds/3600)
    seconds = seconds - hours * 3600
    local minutes = math.floor(seconds/60)
    seconds = seconds - minutes * 60

    if minutes > 0 then
        return string.format("<b>%d Minutos</b> e <b>%d Segundos</b>",minutes,seconds)
    else
        return string.format("<b>%d Segundos</b>",seconds)
    end
end


-----------------------------------------------------------------------------------------------------------------------------------------
-- GETINVENTORY
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.getInventory(user_id)
	local data = vRP.user_tables[user_id]
	if data then
		return data.inventory
	end
	return false
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- GETBACKPACK
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.getBackpack(user_id)
	local data = vRP.getUserDataTable(user_id)
	if data.backpack == nil then
		data.backpack = 5
	end

	return data.backpack
end
function vRP.getInventoryMaxWeight(user_id)
	local data = vRP.getUserDataTable(user_id)
	if data.backpack == nil then
		data.backpack = 5
	end

	return data.backpack
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETBACKPACK
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.setBackpack(user_id,amount)
	local data = vRP.getUserDataTable(user_id)
	if data then
		data.backpack = amount
	end
end





AddEventHandler("playerDropped", function(reason) 
	local user_id = vRP.getUserId(source)

	SendWebhookMessage(logSaida,"```prolog\n[ID]: "..user_id.." \n[IP]: "..GetPlayerEndpoint(source).." \n[========= SAIU DA CIDADE =========]"..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")

 end)






