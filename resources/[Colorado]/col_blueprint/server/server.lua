VORP = exports.vorp_inventory:vorp_inventoryApi()

local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

RegisterServerEvent('wc_cattlemanbp')
AddEventHandler('wc_cattlemanbp', function()

    local _source = source

    local User = VorpCore.getUser(_source)
    local Character = User.getUsedCharacter
    local money = Character.money
    local count = VORP.getItemCount(source, "cattleblueprint")
    if money >= 5 and count < 5  then
        
        TriggerEvent("vorp:removeMoney", _source, 0, 5)

        VORP.addItem(_source, "cattleblueprint", 1)

        TriggerClientEvent("vorp:TipBottom", _source, 'Você comprou um projeto para revólver Cattleman.', 2000)        
    
    else
        TriggerClientEvent("vorp:TipBottom", _source, 'Você precisa de 5$ ou não pode carregar mais items', 4500)
    end      
end)

RegisterServerEvent('wc_lematbp')
AddEventHandler('wc_lematbp', function()

    local _source = source

    local User = VorpCore.getUser(_source)
    local Character = User.getUsedCharacter
    local money = Character.money
    local count = VORP.getItemCount(source, "lematblueprint")
    if money >= 5 and count < 5 then
        
        TriggerEvent("vorp:removeMoney", _source, 0, 5)

        VORP.addItem(_source, "lematblueprint", 1)

        TriggerClientEvent("vorp:TipBottom", _source, 'Você comprou um projeto para Revolver Lemat.', 2000)        
    
    else
        TriggerClientEvent("vorp:TipBottom", _source, 'Você precisa de 5$ ou não pode carregar mais items', 4500)
    end      
end)

RegisterServerEvent('wc_schofieldbp')
AddEventHandler('wc_schofieldbp', function()

    local _source = source

    local User = VorpCore.getUser(_source)
    local Character = User.getUsedCharacter
    local money = Character.money
    local count = VORP.getItemCount(source, "schofieldblueprint")
    if money >= 5 and count < 5 then
        
        TriggerEvent("vorp:removeMoney", _source, 0, 5)

        VORP.addItem(_source, "schofieldblueprint", 1)

        TriggerClientEvent("vorp:TipBottom", _source, 'Você comprou um projeto para Revolver Schofield.', 2000)        
    
    else
        TriggerClientEvent("vorp:TipBottom", _source, 'Você precisa de 5$ ou não pode carregar mais items', 4500)
    end      
end)

RegisterServerEvent('wc_m1899bp')
AddEventHandler('wc_m1899bp', function()

    local _source = source

    local User = VorpCore.getUser(_source)
    local Character = User.getUsedCharacter
    local money = Character.money
    local count = VORP.getItemCount(source, "m1899blueprint")
    if money >= 5 and count < 5 then
        
        TriggerEvent("vorp:removeMoney", _source, 0, 5)

        VORP.addItem(_source, "m1899blueprint", 1)

        TriggerClientEvent("vorp:TipBottom", _source, 'Você comprou um projeto para Pistola M1899.', 2000)        
    
    else
        TriggerClientEvent("vorp:TipBottom", _source, 'Você precisa de 5$ ou não pode carregar mais items', 4500)
    end      
end)

RegisterServerEvent('wc_semiautobp')
AddEventHandler('wc_semiautobp', function()

    local _source = source

    local User = VorpCore.getUser(_source)
    local Character = User.getUsedCharacter
    local money = Character.money
    local count = VORP.getItemCount(source, "semiautoblueprint")
    if money >= 5 and count < 5 then
        
        TriggerEvent("vorp:removeMoney", _source, 0, 5)

        VORP.addItem(_source, "semiautoblueprint", 1)

        TriggerClientEvent("vorp:TipBottom", _source, 'Você comprou um projeto para Pistola Semi Auto.', 2000)        
    
    else
        TriggerClientEvent("vorp:TipBottom", _source, 'Você precisa de 5$ ou não pode carregar mais items', 4500)
    end      
end)

RegisterServerEvent('wc_volcanicbp')
AddEventHandler('wc_volcanicbp', function()

    local _source = source

    local User = VorpCore.getUser(_source)
    local Character = User.getUsedCharacter
    local money = Character.money
    local count = VORP.getItemCount(source, "volcanicblueprint")
    if money >= 5 and count < 5 then
        
        TriggerEvent("vorp:removeMoney", _source, 0, 5)

        VORP.addItem(_source, "volcanicblueprint", 1)

        TriggerClientEvent("vorp:TipBottom", _source, 'Você comprou um projeto para Pistola Volcanic.', 2000)        
    
    else
        TriggerClientEvent("vorp:TipBottom", _source, 'Você precisa de 5$ ou não pode carregar mais items', 4500)
    end      
end)

RegisterServerEvent('wc_henrybp')
AddEventHandler('wc_henrybp', function()

    local _source = source

    local User = VorpCore.getUser(_source)
    local Character = User.getUsedCharacter
    local money = Character.money
    local count = VORP.getItemCount(source, "henryblueprint")
    if money >= 5 and count < 5 then
        
        TriggerEvent("vorp:removeMoney", _source, 0, 5)

        VORP.addItem(_source, "henryblueprint", 1)

        TriggerClientEvent("vorp:TipBottom", _source, 'Você comprou um projeto para Henry.', 2000)        
    
    else
        TriggerClientEvent("vorp:TipBottom", _source, 'Você precisa de 5$ ou não pode carregar mais items', 4500)
    end      
end)

RegisterServerEvent('wc_carabinebp')
AddEventHandler('wc_carabinebp', function()

    local _source = source

    local User = VorpCore.getUser(_source)
    local Character = User.getUsedCharacter
    local money = Character.money
    local count = VORP.getItemCount(source, "carabineblueprint")
    if money >= 5 and count < 5 then
        
        TriggerEvent("vorp:removeMoney", _source, 0, 5)

        VORP.addItem(_source, "carabineblueprint", 1)

        TriggerClientEvent("vorp:TipBottom", _source, 'Você comprou um projeto para Carabina.', 2000)        
    
    else
        TriggerClientEvent("vorp:TipBottom", _source, 'Você precisa de 5$ ou não pode carregar mais items', 4500)
    end      
end)

RegisterServerEvent('wc_winchesterbp')
AddEventHandler('wc_winchesterbp', function()

    local _source = source

    local User = VorpCore.getUser(_source)
    local Character = User.getUsedCharacter
    local money = Character.money
    local count = VORP.getItemCount(source, "winchesterblueprint")
    if money >= 20 and count < 5 then
        
        TriggerEvent("vorp:removeMoney", _source, 0, 20)

        VORP.addItem(_source, "winchesterblueprint", 1)

        TriggerClientEvent("vorp:TipBottom", _source, 'Você comprou um projeto para Winchester.', 2000)        
    
    else
        TriggerClientEvent("vorp:TipBottom", _source, 'Você precisa de 20$ ou não pode carregar mais items', 4500)
    end      
end)

RegisterServerEvent('wc_boltbp')
AddEventHandler('wc_boltbp', function()

    local _source = source

    local User = VorpCore.getUser(_source)
    local Character = User.getUsedCharacter
    local money = Character.money
    local count = VORP.getItemCount(source, "boltblueprint")
    if money >= 35 and count < 5 then
        
        TriggerEvent("vorp:removeMoney", _source, 0, 35)

        VORP.addItem(_source, "boltblueprint", 1)

        TriggerClientEvent("vorp:TipBottom", _source, 'Você comprou um projeto para Rifle de Ferrolho.', 2000)        
    
    else
        TriggerClientEvent("vorp:TipBottom", _source, 'Você precisa de 35$ ou não pode carregar mais items', 4500)
    end      
end)

RegisterServerEvent('wc_shotgunbp')
AddEventHandler('wc_shotgunbp', function()

    local _source = source

    local User = VorpCore.getUser(_source)
    local Character = User.getUsedCharacter
    local money = Character.money
    local count = VORP.getItemCount(source, "shotgunblueprint")
    if money >= 20 and count < 5 then
        
        TriggerEvent("vorp:removeMoney", _source, 0, 20)

        VORP.addItem(_source, "shotgunblueprint", 1)

        TriggerClientEvent("vorp:TipBottom", _source, 'Você comprou um projeto para Shotgun.', 2000)        
    
    else
        TriggerClientEvent("vorp:TipBottom", _source, 'Você precisa de 20$ ou não pode carregar mais items', 4500)
    end      
end)

RegisterServerEvent('wc_olioarmi')
AddEventHandler('wc_olioarmi', function()

    local _source = source

    local User = VorpCore.getUser(_source)
    local Character = User.getUsedCharacter
    local money = Character.money
   
    if money >= 0.5 then
        
        TriggerEvent("vorp:removeMoney", _source, 0, 0.5)

        VORP.addItem(_source, "cleanshort", 1)

        TriggerClientEvent("vorp:TipBottom", _source, 'Você comprou óleo de armas.', 2000)        
    
    else
        TriggerClientEvent("vorp:TipBottom", _source, 'Você precisa de 0,5$.', 4500)
    end      
end)

RegisterServerEvent('blueprint:checkgroup')
AddEventHandler('blueprint:checkgroup', function()
    local _source = source
    local User = VorpCore.getUser(_source) 
    local Character = User.getUsedCharacter 
--    print(Character.job)       
    if Character.job == "armariaValentine" or Character.job == "armariaSaintDenis" or Character.job == "rdguns" or Character.job == "armaria" or Character.job == "Bwguns" then
        TriggerClientEvent('blueprint:checkgroupcl', _source)
    end
  
end)