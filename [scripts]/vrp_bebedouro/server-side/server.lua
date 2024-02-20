-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("vrp_bebedouro",cRP)
vCLIENT = Tunnel.getInterface("vrp_bebedouro")

vTASKBAR = Tunnel.getInterface("taskbar")

-----------------------------------------------------------------------------------------------------------------------------------------
-- CONFIGS
-----------------------------------------------------------------------------------------------------------------------------------------
configS = {
    enableRats = true
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- SEARCHTRASH
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.searchTrash()
    local source = source
    local user_id = vRP.getUserId(source)
    local taskResult = vTASKBAR.taskLockpick(source)
    if taskResult then
        if vRP.tryGetInventoryItem(user_id,"garrafavazia",1) then
            vRP.giveInventoryItem(user_id,"agua",1)
            TriggerClientEvent("Notify","sucesso","Voce Encheu a Garrafa")
            cRP.anim()
        else
            TriggerClientEvent("Notify",source,"negado","Voce nao tem <b>Garrafas Vazias</b>",300)
        end
    end
end

function cRP.anim()
    vRPclient._playAnim(source,true,{{"mp_common","givetake1_a"}},false)
end

