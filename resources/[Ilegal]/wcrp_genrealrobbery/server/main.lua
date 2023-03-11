VORP = exports.vorp_inventory:vorp_inventoryApi()

local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)
local wbhk = "https://discord.com/api/webhooks/1051238855996612690/M0Q6yp0SuNkutaOXUk23SVZTiLPCHjH2Da2huPQIhG_3OybRpH-urHFYg7gneMgtlHvN"


Locations = {
    vector3(-324.26, 804.1, 117.93),
    vector3(2825.2976074219, -1320.1049804688, 45.755676269531),
    vector3(1328.03, -1293.70, 77.07),
    vector3( 2639.933,-1227.69,53.380),
    vector3(1338.929,-1375.34,80.480),
    vector3(-313.376,804.9757,118.98),

}

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

RegisterNetEvent("wcrp_robbery:startToRob")
AddEventHandler("wcrp_robbery:startToRob", function()
    local _source = source
    local Character = VorpCore.getUser(source).getUsedCharacter  
    local playername = Character.firstname.. ' ' ..Character.lastname       
    local count = VORP.getItemCount(_source,"lockpick")
    
    if count >= 1 then 
    VORP.subItem(_source,"lockpick", 1)   
    TriggerClientEvent("wcrp:sendPlayersToserver", _source)
    SendWebhookMessage(wbhk,"```prolog\n[Roubo a Loja]: ".. playername.." \n Iniciou um roubo a Lojinha"..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
 --   print('333')
    else
        TriggerClientEvent("vorp:TipBottom", _source, "Você precisa de um lockpick", 6000)
    end  
end)


RegisterNetEvent("wcrp_robbery:payout")
AddEventHandler("wcrp_robbery:payout", function()
    TriggerEvent('vorp:getCharacter', source, function(user)
        local _source = source
        local _user = user 
        local playername = user.firstname.. ' ' ..user.lastname
        randommoney = math.random(180,320)
    --    ritem = math.random(10,15)
    --    local randomitempull = math.random(1, #Config.Items)
    --    local itemName = Config.Items[randomitempull]
        TriggerEvent("vorp:addMoney", _source, 0, randommoney)
        SendWebhookMessage(wbhk,"```prolog\n[Roubo a Loja]: ".. playername.." \n Finalizou o roubo a loja e pegou $"..randommoney.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
    end)
        --TriggerClientEvent("vorp:TipBottom", _source, 'You got goldnuggets', 5000)
end)

RegisterServerEvent("startanim")
AddEventHandler("startanim",function()
    local _source = source
    TriggerClientEvent('wcrp_robbery:startAnimation',_source)
end)

RegisterServerEvent("wcrp:countsceriffi")
AddEventHandler("wcrp:countsceriffi", function()
    local _source = source
    local Sceriffi = 0
    local players = GetPlayers()
    for k,v in pairs(players) do
        local User = VorpCore.getUser(v)
        local Character = User.getUsedCharacter
        if Character.job == "police" then 
            Sceriffi = Sceriffi + 1
            
        end
    end

    if Sceriffi >= 2 then
        TriggerClientEvent("wcrp:robOk", _source)
    else
        TriggerClientEvent("vorp:TipRight", _source, 'Não há policiais suficientes', 5000)
    end

end)     
      

