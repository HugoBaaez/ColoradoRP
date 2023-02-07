VORP = exports.vorp_inventory:vorp_inventoryApi()
local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)
VorpInv = exports.vorp_inventory:vorp_inventoryApi()

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    print('The resource ' .. resourceName .. ' has been started.')
end)

---------------------------------------
-- SALÁRIO
---------------------------------------
local salarios = {
    [1] = { group = "Bronze", ['nome'] = "BRONZE", ['payment'] = 5 },
    [2] = { group = "Prata", ['nome'] = "PRATA", ['payment'] = 7},
    [3] = { group = "Ouro", ['nome'] = "OURO", ['payment'] = 9},
    [4] = { group = "Diamante", ['nome'] = "DIAMANTE", ['payment'] = 12 },
    [5] = { group = "Platina", ['nome'] = "PLATINA", ['payment'] = 15 },
}

-------------------------------------------------------------------------------------
-- SALÁRIO PAGAMENTO VIP
-------------------------------------------------------------------------------------

RegisterServerEvent('salario:pagamento')
AddEventHandler('salario:pagamento', function()
    local _source = source
    local User = VorpCore.getUser(_source)
    local Character = User.getUsedCharacter
    for k,v in pairs(salarios) do
        if Character.group == v.group then
            TriggerEvent("vorp:addMoney", _source, 0, tonumber(v.payment)) 
            TriggerClientEvent('RedM:Notify', _source, 'salary',"Você recebeu o salário de " .. v.group .. ": "  .. tostring(v.payment).."$")
        end
    end
end)

---------------------------------------------------------------------------------------
-- COMANDOS IN GAME BY BASE
---------------------------------------------------------------------------------------

RegisterServerEvent("col_core:delete")
AddEventHandler("col_core:delete", function()
    local _source = source
    local Character = VorpCore.getUser(source).getUsedCharacter
    local money = Character.money
    local gold = Character.gold
    local role = Character.rol
    local tableofstuff = {}
    if Config.removeweapons then 
        TriggerEvent("vorpCore:getUserWeapons", tonumber(_source), function(getUserWeapons)
            table.insert(tableofstuff,getUserWeapons)
           for k, v in pairs (getUserWeapons) do
            local id = v.id
            VorpInv.subWeapon(_source, v.id)
            exports.oxmysql:execute("DELETE FROM loadout WHERE id=@id", { ['id'] = id})
           end
        end)
    end
    if Config.removeitems then 
        TriggerEvent("vorpCore:getUserInventory", tonumber(_source), function(getInventory)
            for k, v in pairs (getInventory) do
                table.insert(tableofstuff,{label = v.label, name = v.name, count = v.count})
                VorpInv.subItem(_source, v.name, v.count)  
            end
        end) 
    end

    if Config.removecash then 
        table.insert(tableofstuff,{cash = money})
        Character.removeCurrency(0, money)
    end
    if Config.removegold then 
        table.insert(tableofstuff,{gold = gold})
        Character.removeCurrency(1, gold)
    end
    if Config.removerole then 
        Character.removeCurrency(2, role)
    end
    Discord(tableofstuff)
end) 


function Discord(x)
    local webhook = "https://discord.com/api/webhooks/1007766531297513473/3QvynyBwPsTwrdFKWdGUn-BCOz5jdNvyzy5t3T07o2uDiZU3hTMTdNLMRlXfxYimxC0M"
    local _source = source
    local color = 15158332
    local title = "Perdeu ao Renascer"
    local Character = VorpCore.getUser(_source).getUsedCharacter
    local name        = GetPlayerName(source)
    local logs = ""
    local description = json.encode(x)
    local avatar = "https://media.discordapp.net/attachments/805495169901789194/911906312789585931/Artboard_11000.png"
    
        logs = {
            {
                ["color"] = color,
                ["title"] = title,
                ["description"] = description,
            }
          }
    
        PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({["username"] = name ,["avatar_url"] = avatar ,embeds = logs}), { ['Content-Type'] = 'application/json' })
  end