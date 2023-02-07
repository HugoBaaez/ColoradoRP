VorpInv = exports.vorp_inventory:vorp_inventoryApi()


local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

RegisterServerEvent('def_cookfood:pork')
AddEventHandler("def_cookfood:pork", function()
    local _source = source
    local count = VorpInv.getItemCount(_source, "carne_javali")
    if count >= 1 then
    
        VorpInv.subItem(_source,"carne_javali", 1)
        
        TriggerClientEvent('def_cookfood:cookmeat', _source)
        
        Citizen.Wait(26000)
        
        VorpInv.addItem(_source,"javali_consumivel", 1)
        TriggerClientEvent("vorp:NotifyLeft", _source, "~t6~Cozinhou!", "Você cozinhou a carne!", "generic_textures", "tick", 3000)
    else
        TriggerClientEvent("vorp:NotifyLeft", _source, "~e~Erro!", "Você precisa da carne crua", "menu_textures", "cross", 3000)
    end
end)

RegisterServerEvent('def_cookfood:tacchino')
AddEventHandler("def_cookfood:tacchino", function()
    local _source = source
    local count = VorpInv.getItemCount(_source, "carne_peru")
    if count >= 1 then
    
        VorpInv.subItem(_source,"carne_peru", 1)
        
        TriggerClientEvent('def_cookfood:cookmeat', _source)
        
        Citizen.Wait(26000)
        
        VorpInv.addItem(_source,"peru_consumivel", 1)
        TriggerClientEvent("vorp:NotifyLeft", _source, "~t6~Cozinhou!", "Você cozinhou a carne!", "generic_textures", "tick", 3000)
    else
        TriggerClientEvent("vorp:NotifyLeft", _source, "~e~Erro!", "Você precisa da carne crua", "menu_textures", "cross", 3000)
    end
end)

RegisterServerEvent('def_cookfood:alce')
AddEventHandler("def_cookfood:alce", function()
    local _source = source
    local count = VorpInv.getItemCount(_source, "carne_alce")
    if count >= 1 then
    
        VorpInv.subItem(_source,"carne_alce", 1)
        
        TriggerClientEvent('def_cookfood:cookmeat', _source)
        
        Citizen.Wait(26000)
        
        VorpInv.addItem(_source,"alce_consumivel", 1)
        TriggerClientEvent("vorp:NotifyLeft", _source, "~t6~Cozinhou!", "Você cozinhou a carne!", "generic_textures", "tick", 3000)
    else
        TriggerClientEvent("vorp:NotifyLeft", _source, "~e~Erro!", "Você precisa da carne crua", "menu_textures", "cross", 3000)
    end
end)

    RegisterServerEvent('def_cookfood:veado')
AddEventHandler("def_cookfood:veado", function()
    local _source = tonumber(source)
    local count = VorpInv.getItemCount(_source, "carne_cervo")
    if count >= 1 then
    
        VorpInv.subItem(_source,"carne_cervo", 1)
        
        TriggerClientEvent('def_cookfood:cookmeat', _source)
        
        Citizen.Wait(26000)
        
        VorpInv.addItem(_source,"cervo_consumivel", 1)
        TriggerClientEvent("vorp:NotifyLeft", _source, "~t6~Cozinhou!", "Você cozinhou a carne!", "generic_textures", "tick", 3000)
    else
        TriggerClientEvent("vorp:NotifyLeft", _source, "~e~Erro!", "Você precisa da carne crua", "menu_textures", "cross", 3000)
    end
end)

RegisterServerEvent('def_cookfood:bluegill')
AddEventHandler("def_cookfood:bluegill", function()
    local _source = source
    local count = VorpInv.getItemCount(_source, "a_c_fishbluegil_01_sm")
    if count >= 1 then
    
        VorpInv.subItem(_source,"a_c_fishbluegil_01_sm", 1)
        
        TriggerClientEvent('def_cookfood:cookmeat', _source)
        
        Citizen.Wait(26000)
        
        VorpInv.addItem(_source,"bluegill_consumivel", 1)
        TriggerClientEvent("vorp:NotifyLeft", _source, "~t6~Cozinhou!", "Você cozinhou a carne!", "generic_textures", "tick", 3000)
    else
        TriggerClientEvent("vorp:NotifyLeft", _source, "~e~Erro!", "Você precisa da carne crua", "menu_textures", "cross", 3000)
    end
end)
---------------------------------------AGUA--------------------------------------------------

RegisterServerEvent('def_cookfood:getwater')
AddEventHandler("def_cookfood:getwater", function()
    local _source = source
    local count = VorpInv.getItemCount(_source, "aguasuja")

    if count >= 1 and VorpInv.getItemCount(_source, "agua") + 1 <= 15 then
    
        VorpInv.subItem(_source,"aguasuja", count)
        
        TriggerClientEvent('def_cookfood:clean', _source)
        
        Citizen.Wait(28000)
        
        VorpInv.addItem(_source,"agua", count)
        TriggerClientEvent("vorp:NotifyLeft", _source, "~t6~Purificado!", "Você purificou a água!", "generic_textures", "tick", 3000)
    else
        TriggerClientEvent("vorp:NotifyLeft", _source, "~e~Erro!", "Você precisa de água suja", "menu_textures", "cross", 3000)
    end
end)

VorpInv.RegisterUsableItem("garrafavazia", function(data)
    VorpInv.CloseInv(data.source)
    TriggerClientEvent('ml_camping:Getwater', data.source)
end)

RegisterServerEvent("collect")
AddEventHandler("collect", function()
    local _source = source
    local count = VorpInv.getItemCount(_source, "garrafavazia")

    if count > 0 and VorpInv.getItemCount(_source, "aguasuja") + 1 <= 15 then
        VorpInv.subItem(_source,"garrafavazia", count)
        TriggerClientEvent("vorp:NotifyLeft", _source, "~t6~Excelente!", "Você coletou água suja!", "generic_textures", "tick", 3000)
        VorpInv.addItem(_source,"aguasuja", count)
    else
        TriggerClientEvent("vorp:NotifyLeft", _source, "~t6~Erro!", "Você não tem uma garrafa vazia!", "generic_textures", "tick", 3000)
    end
end)