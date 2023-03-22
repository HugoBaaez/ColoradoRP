VORP = exports.vorp_inventory:vorp_inventoryApi()

data = {}
TriggerEvent("vorp_inventory:getData",function(call)
    data = call
end)
local BankName
local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)
local wbhk = "https://discord.com/api/webhooks/1077328470750797884/aNcJZzhB-MJWZ902aq-tu72oXeevCvhgBjjq9uflNN_16kLle2hVHFQkaZHfELZzyeOH"
function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

local hasBeenRobbed = false

RegisterServerEvent("robbery:startrobbery")
AddEventHandler("robbery:startrobbery", function(nome)
    local _source = source
    local player = VorpCore.getUser(_source).getUsedCharacter
    local playername = player.firstname.. ' ' ..player.lastname
    local checkPD = checkPDreq()
    BankName = nome

    -- verifica se o banco já foi roubado
    if hasBeenRobbed then
        TriggerClientEvent('vorp:TipRight', _source, 'Este banco já foi roubado!', 5000)
        return
    end

    -- executa o evento
    if checkPD == 1 then
        if nome == "Saint Denis" then
            TriggerEvent('robbery:talk', _source)
        elseif nome == "Valentine" then
            TriggerEvent('robbery:talk', _source)
        elseif nome == "Rhodes" then
            TriggerEvent('robbery:talk', _source)
        end
        SendWebhookMessage(wbhk,"```prolog\n[BANCOS]: ".. playername .." \nINICIOU ROUBO AO BANCO DE "..nome..""..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
    elseif checkPD == 0 then
        TriggerClientEvent('vorp:TipRight', _source, 'Não há policiais suficientes', 5000)
    end
end)

RegisterServerEvent("robbery:startrobberyArmadillo")
AddEventHandler("robbery:startrobberyArmadillo", function(nome)
    local _source = source
    local player = VorpCore.getUser(_source).getUsedCharacter
    local playername = player.firstname.. ' ' ..player.lastname
    local checkPD = checkGuerrilha()
    BankName = nome

    -- verifica se o banco já foi roubado
    if hasBeenRobbed then
        TriggerClientEvent('vorp:TipRight', _source, 'Este banco já foi roubado!', 5000)
        return
    end

    -- executa o evento
    if checkPD == 1 then
        if nome == "Armadillo" then
            TriggerEvent('robbery:talk', _source)
        end
        SendWebhookMessage(wbhk,"```prolog\n[BANCOS]: ".. playername .." \nINICIOU ROUBO AO BANCO DE "..nome..""..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
    elseif checkPD == 0 then
        TriggerClientEvent('vorp:TipRight', _source, 'Não há policiais suficientes', 5000)
    end
end)

function checkPDreq()
    local users = GetPlayers()
    local coponline = 0

    for _k,_v in pairs(users) do
        local users = VorpCore.getUser(_v)
        local character = users.getUsedCharacter
        
        if character.job == "police" then
            coponline = coponline + 1
        end   
    end
    
    if coponline < 6 then
        return(0)
    end
    return(1)

end
function checkGuerrilha()
    local users = GetPlayers()
    local guerrilhaon = 0

    for _k,_v in pairs(users) do
        local users = VorpCore.getUser(_v)
        local character = users.getUsedCharacter
        
        if character.job == "guerrilha" then
            guerrilhaon = guerrilhaon + 1
        end   
    end
    
    if guerrilhaon < 6 then
        return(0)
    end
    return(1)
end
RegisterServerEvent('robbery:talk')
AddEventHandler('robbery:talk', function(source)
    local _source = source
    local Character = VorpCore.getUser(_source).getUsedCharacter
    TriggerClientEvent("vorp:TipBottom", _source, "ABRA O COFRE COM UMA LOCKPICK ", 5000)
end)

RegisterNetEvent("robbery:dynamite")
AddEventHandler("robbery:dynamite", function(coords)
    local _source = source
    local Character = VorpCore.getUser(source).getUsedCharacter
    local count = VORP.getItemCount(_source, "dynamite")
    print(count)
    if count >= 1 then      
        VORP.subItem(_source,"dynamite", 1)  
        TriggerClientEvent('robbery:startAnimation3', _source, coords, BankName)
        TriggerClientEvent("vorp:TipBottom", _source, "As autoridades foram alertadas",6000)
    else   
        TriggerClientEvent("vorp:TipBottom", _source, "Você não tem dinamite", 6000)
    end     
end)
RegisterServerEvent('robbery:loot')
AddEventHandler('robbery:loot', function(Blowedynamite, coords, BankName)
    local _source = source
    local Character = VorpCore.getUser(_source).getUsedCharacter
    TriggerClientEvent('robbery:loot2', _source, coords, BankName)    
end)

RegisterNetEvent("robbery:payout")
AddEventHandler("robbery:payout", function(name)
    TriggerEvent('vorp:getCharacter', source, function(user)
        local _source = source
        local _user = user
        local Character = VorpCore.getUser(_source).getUsedCharacter
        local playername = Character.firstname.. ' ' ..Character.lastname

        exports["ghmattimysql"]:execute("SELECT * FROM bank_users WHERE name = @name", {["@name"] = name}, function(result)
            local banco = {}
            local quantidade_total = 0
            for i, row in ipairs(result) do
                local id = row.charidentifier
                local money = row.money
                quantidade_total = quantidade_total + money
                banco[id] = {quantidade = money}
            end
            local Dinheiroroubado = quantidade_total * 0.1
            Character.addCurrency(0, Dinheiroroubado)
            -- Remove 2.5% do valor de cada ID no banco
            for id, data in pairs(result) do
                if data.money >= 1000 then
                    data.money2 = data.money * 0.975
                    exports["ghmattimysql"]:execute("UPDATE bank_users SET money = @money WHERE name = @name AND charidentifier = @charidentifier", {["@money"] = data.money2, ["@name"] = data.name, ["@charidentifier"] = data.charidentifier})
                end
            end
            SendWebhookMessage(wbhk,"```prolog\n[BANCOS]: ".. playername .." \nCONCLUIU O ROUBO AO BANCO DE "..name.." E PEGOU UMA QUANTIDADE DE "..Dinheiroroubado.." DÓLARES "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
            hasBeenRobbed = true -- atualiza a flag de roubo
        end)
        
    end)
end)