VORP = exports.vorp_inventory:vorp_inventoryApi()

local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

-- CRAFTING VODKA
RegisterServerEvent('wc_vodka')
AddEventHandler('wc_vodka', function()
    local _source = source
    local count = VORP.getItemCount(_source, "trigo")
    local count2 = VORP.getItemCount(_source, "acucar")
    local count3 = VORP.getItemCount(_source, "batata")
    local count4 = VORP.getItemCount(_source, "agua")
        
    if count >= 2 and count2 >= 1 and count3 >= 2 and count4 >= 1 then         
        VORP.subItem(_source, "trigo", 2)
        VORP.subItem(_source, "acucar", 1)
        VORP.subItem(_source, "batata", 2)
        VORP.subItem(_source, "agua", 1)        
        TriggerClientEvent("progressbar:startSaloon", _source)
        Wait(20000)
        VORP.addItem(_source, "vodka", 1)
        TriggerClientEvent("vorp:TipRight",_source,'Você preparou a vodka', 2000)
        TriggerClientEvent('stress:modify', 1)
    else
        TriggerClientEvent("vorp:TipRight",_source, 'Você precisa de 2 batatas, 1 água limpa, 2 Trigos e 1 açúcar.', 4500)
    end      
end)


-- CRAFTING WISKEY
RegisterServerEvent('wc_wiskey')
AddEventHandler('wc_wiskey', function()
    local _source = source
    local count = VORP.getItemCount(_source, "trigo")
    local count2 = VORP.getItemCount(_source, "agua")

    if count >= 2 and count2 >= 2 then
         
        VORP.subItem(_source, "trigo", 2)
        VORP.subItem(_source, "agua", 2)        
        TriggerClientEvent("progressbar:startSaloon", _source)
        Wait(20000)
        VORP.addItem(_source, "whisky", 1)
        TriggerClientEvent("vorp:TipRight",_source, 'Você preparou o uísque', 2000)
        TriggerClientEvent('stress:modify', 1)
    
    else
        TriggerClientEvent("vorp:TipRight",_source, 'Você precisa de 2 água limpa e 2 trigo.', 4500)
    end      
end)


-- CRAFTING cerveja
RegisterServerEvent('wc_cerveja')
AddEventHandler('wc_cerveja', function()
    local _source = source
    local count = VORP.getItemCount(_source, "trigo")
    local count2 = VORP.getItemCount(_source, "agua")
        
    if count >= 2 and count2 >= 2 then
         
        VORP.subItem(_source, "trigo", 2)
        VORP.subItem(_source, "agua", 2)     
        TriggerClientEvent("progressbar:startSaloon", _source)
        Wait(20000)
        VORP.addItem(_source, "cerveja", 1)
        TriggerClientEvent("vorp:TipRight",_source,'Você preparou cerveja', 2000)
        TriggerClientEvent('stress:modify', 1)
    else
        TriggerClientEvent("vorp:TipRight",_source, 'Você precisa de 2 água limpa e 2 trigo.', 4500)
    end      
end)


-- CRAFTING RHUM
RegisterServerEvent('wc_rhum')
AddEventHandler('wc_rhum', function()
    local _source = source
    local count = VORP.getItemCount(_source, "acucar")
    local count2 = VORP.getItemCount(_source, "agua")
   
    if count >= 1 and count2 >= 2 then
         
        VORP.subItem(_source, "acucar", 1)
        VORP.subItem(_source, "agua", 2)        
        TriggerClientEvent("progressbar:startSaloon", _source)
        Wait(20000)
        VORP.addItem(_source, "rum", 1)
        TriggerClientEvent("vorp:TipRight",_source, 'Você preparou Rum', 2000)
        TriggerClientEvent('stress:modify', 1)    
    else
        TriggerClientEvent("vorp:TipRight",_source, 'Você precisa de 2 água limpa e 1 açúcar.', 4500)
    end      
end)

-- CRAFTING cidra DI MELE
RegisterServerEvent('wc_cidra')
AddEventHandler('wc_cidra', function()
    local _source = source
    local count = VORP.getItemCount(_source, "acucar")
    local count2 = VORP.getItemCount(_source, "agua")
    local count3 = VORP.getItemCount(_source, "maca")
        
    if count >= 1 and count2 >= 2 and count3 >= 2 then         
        VORP.subItem(_source, "acucar", 1)
        VORP.subItem(_source, "agua", 2)
        VORP.subItem(_source, "maca", 2)        
        TriggerClientEvent("progressbar:startSaloon", _source)
        Wait(20000)
        VORP.addItem(_source, "cidra", 1)
        TriggerClientEvent("vorp:TipRight",_source, 'Você preparou a cidra de maça', 2000)
        TriggerClientEvent('stress:modify', 1)    
    else
        TriggerClientEvent("vorp:TipRight",_source, 'Você precisa de 2 água limpa, 2 maçã e 1 açúcar.', 4500)
    end      
end)

-- CRAFTING STUFATO DI CARNE
RegisterServerEvent('wc_stufatodicervo')
AddEventHandler('wc_stufatodicervo', function()
    local _source = source
    local count = VORP.getItemCount(_source, "carne_cervo")
    local count2 = VORP.getItemCount(_source, "batata")
    local count3 = VORP.getItemCount(_source, "tomate")
  
    if count >= 1 and count2 >= 2 and count3 >= 2 then         
        VORP.subItem(_source, "carne_cervo", 1)
        VORP.subItem(_source, "batata", 2)
        VORP.subItem(_source, "tomate", 2)        
        TriggerClientEvent("progressbar:startSaloon", _source)
        Wait(20000)
        VORP.addItem(_source, "ensopadocarne", 3)
        TriggerClientEvent("vorp:TipRight",_source, 'Você preparou o ensopado de carne', 2000)
        TriggerClientEvent('stress:modify', 1)    
    else
        TriggerClientEvent("vorp:TipRight",_source, 'Você precisa de 1 cervos, 2 batatas e 2 tomates.', 4500)
    end      
end)

-- CRAFTING STUFATO DI PESCE
RegisterServerEvent('wc_caldodepeixe')
AddEventHandler('wc_caldodepeixe', function()
    local _source = source
    local count = VORP.getItemCount(_source, "a_c_fishrockbass_01_sm")
    local count2 = VORP.getItemCount(_source, "batata")
    local count3 = VORP.getItemCount(_source, "cenoura")
 
    if count >= 1 and count2 >= 2 and count3 >= 2 then         
        VORP.subItem(_source, "a_c_fishrockbass_01_sm", 1)
        VORP.subItem(_source, "batata", 2)
        VORP.subItem(_source, "cenoura", 2)        
        TriggerClientEvent("progressbar:startSaloon", _source)
        Wait(20000)
        VORP.addItem(_source, "caldodepeixe", 3)
        TriggerClientEvent("vorp:TipRight", _source, 'Você preparou o ensopado de peixe', 2000)
        TriggerClientEvent('stress:modify', 1)    
    else
        TriggerClientEvent("vorp:TipRight",_source, 'Você precisa de 1 Robalo (Pequeno), 2 batata e 2 cenoura.', 4500)
    end      
end)

RegisterServerEvent('wc_batatacomL')
AddEventHandler('wc_batatacomL', function()
    local _source = source
    local count = VORP.getItemCount(_source, "carne_javali")
    local count2 = VORP.getItemCount(_source, "batata")
    local count3 = VORP.getItemCount(_source, "milho")
        
    if count >= 1 and count2 >= 2 and count3 >= 2 then         
        VORP.subItem(_source, "carne_javali", 1)
        VORP.subItem(_source, "batata", 2)
        VORP.subItem(_source, "milho", 2)        
        TriggerClientEvent("progressbar:startSaloon", _source)
        Wait(20000)
        VORP.addItem(_source, "batatacomL", 2)
        TriggerClientEvent("vorp:TipRight", _source, 'Você preparou o Pure de Batata com Linguiça', 2000)
        TriggerClientEvent('stress:modify', 1)    
    else
        TriggerClientEvent("vorp:TipRight",_source, 'Você precisa de 1 carne de javali 2 batata e 2 milho.', 4500)
    end      
end)

RegisterServerEvent('bw_tortadecarne')
AddEventHandler('bw_tortadecarne', function()
    local _source = source
    local count = VORP.getItemCount(_source, "carne_alce")
    local count2 = VORP.getItemCount(_source, "trigo")
    local count3 = VORP.getItemCount(_source, "cenoura")
    local count4 = VORP.getItemCount(_source, "milho")
        
    if count >= 1 and count2 >= 2 and count3 >= 2 and count4 >= 2 then         
        VORP.subItem(_source, "carne_alce", 1)
        VORP.subItem(_source, "trigo", 2)
        VORP.subItem(_source, "cenoura", 2)
        VORP.subItem(_source, "milho", 2)        
        TriggerClientEvent("progressbar:startSaloon", _source)
        Wait(20000)
        VORP.addItem(_source, "tortadecarne", 2)
        TriggerClientEvent("vorp:TipRight", _source, 'Você preparou Torta de Carne', 2000)
        TriggerClientEvent('stress:modify', 1)    
    else
        TriggerClientEvent("vorp:TipRight",_source, 'Você precisa de 1 Carne de alce, 2 Trigo, 2 cenoura e 2 milho.', 4500)
    end      
end)

RegisterServerEvent('rd_peixebtt')
AddEventHandler('rd_peixebtt', function()
    local _source = source
    local count = VORP.getItemCount(_source, "a_c_fishrockbass_01_sm")
    local count2 = VORP.getItemCount(_source, "trigo")
    local count3 = VORP.getItemCount(_source, "batata")
        
    if count >= 1 and count2 >= 2 and count3 >= 2 then         
        VORP.subItem(_source, "a_c_fishrockbass_01_sm", 1)
        VORP.subItem(_source, "trigo", 2)
        VORP.subItem(_source, "batata", 2)        
        TriggerClientEvent("progressbar:startSaloon", _source)
        Wait(20000)
        VORP.addItem(_source, "peixebtt", 2)
        TriggerClientEvent("vorp:TipRight", _source, 'Você preparou Peixe com Batatas', 2000)        
        TriggerClientEvent('stress:modify', 1)
    else
        TriggerClientEvent("vorp:TipRight",_source, 'Você precisa de 1 Robalo (Pequeno), 2 Trigo, 2 batatas.', 4500)
    end      
end)

RegisterServerEvent('rd_cha')
AddEventHandler('rd_cha', function()
    local _source = source
    local count = VORP.getItemCount(_source, "ginseng_americano")
    local count2 = VORP.getItemCount(_source, "acucar")
    local count3 = VORP.getItemCount(_source, "ginseng_alaska")
    local count4 = VORP.getItemCount(_source, "agua")
        
    if count >= 2 and count2 >= 1 and count3 >= 2 and count4 >= 1 then         
        VORP.subItem(_source, "ginseng_americano", 2)
        VORP.subItem(_source, "acucar", 1)
        VORP.subItem(_source, "ginseng_alaska", 2)
        VORP.subItem(_source, "agua", 1)        
        TriggerClientEvent("progressbar:startSaloon", _source)
        Wait(20000)
        VORP.addItem(_source, "cha", 2)
        TriggerClientEvent("vorp:TipRight",_source,'Você preparou chá', 2000)
        TriggerClientEvent('stress:modify', 1)
    else
        TriggerClientEvent("vorp:TipRight",_source, 'Você precisa de 2 Ginseng Americano, 1 água limpa, 2 Ginseng Alaska e 1 açúcar.', 4500)
    end      
end)


-- CRAFTING DAIQUIRI
RegisterServerEvent('bd_daiquiri')
AddEventHandler('bd_daiquiri', function()
    local _source = source
    local count = VORP.getItemCount(_source, "rum")
    local count2 = VORP.getItemCount(_source, "acucar")
      
    if count >= 1 and count2 >= 1 then         
        VORP.subItem(_source, "rum", 1)
        VORP.subItem(_source, "acucar", 1)        
        TriggerClientEvent("progressbar:startSaloon", _source)
        Wait(20000)
        VORP.addItem(_source, "daiquiri", 2)
        TriggerClientEvent("vorp:TipBottom", _source, 'Você preparou um Daiquiri', 2000)   
        TriggerClientEvent('stress:modify', 1)
    else
        TriggerClientEvent("vorp:TipBottom", _source, 'Você precisa de 1 rum e 1 açúcar.', 4500)
    end      
end)

-- CRAFTING OLD FASHIODEN
RegisterServerEvent('bd_old')
AddEventHandler('bd_old', function()
    local _source = source
    local count = VORP.getItemCount(_source, "whisky")
    local count2 = VORP.getItemCount(_source, "acucar")
      
    if count >= 1 and count2 >= 1 then         
        VORP.subItem(_source, "whisky", 1)
        VORP.subItem(_source, "acucar", 1)        
        TriggerClientEvent("progressbar:startSaloon",_source)
        Wait(20000)
        VORP.addItem(_source, "oldfashioned", 2)
        TriggerClientEvent("vorp:TipBottom",_source, 'Você preparou um à moda antiga', 2000)  
        TriggerClientEvent('stress:modify', 1)
    else
        TriggerClientEvent("vorp:TipBottom",_source,'Você precisa de 1 Whiskey e 1 açúcar.', 4500)
    end      
end)

-- CRAFTING PLANTER'S PUNCH
RegisterServerEvent('bd_planter')
AddEventHandler('bd_planter', function()
    local _source = source
    local count = VORP.getItemCount(_source, "rum")
    local count2 = VORP.getItemCount(_source, "acucar")
    local count3 = VORP.getItemCount(_source, "pessego")
       
    if count >= 1 and count2 >= 1 and count3 >= 1 then         
        VORP.subItem(_source, "rum", 1)
        VORP.subItem(_source, "acucar", 1)
        VORP.subItem(_source, "pessego", 1)        
        TriggerClientEvent("progressbar:startSaloon", _source)
        Wait(20000)
        VORP.addItem(_source, "planterspunch", 2)
        TriggerClientEvent("vorp:TipBottom", _source, 'Você preparou um Planter\'s Punch', 2000) 
        TriggerClientEvent('stress:modify', 1)
    else
        TriggerClientEvent("vorp:TipBottom", _source, 'Você precisa de 1 rum, 1 açúcar e 1 pessego.', 4500)
    end      
end)

-- CRAFTING VODKA MARTINI
RegisterServerEvent('bd_vodkam')
AddEventHandler('bd_vodkam', function()
    local _source = source
    local count = VORP.getItemCount(_source, "vodka")      
    if count >= 1 then         
        VORP.subItem(_source, "vodka", 1)        
        TriggerClientEvent("progressbar:startSaloon", _source)
        Wait(20000)
        VORP.addItem(_source, "vodkamartini", 2)
        TriggerClientEvent("vorp:TipBottom", _source, 'Você preparou uma Vodka Martini', 2000) 
        TriggerClientEvent('stress:modify', 1)       
    else
        TriggerClientEvent("vorp:TipBottom", _source, 'Você precisa 1 vodka.', 4500)
    end      
end)

-- CRAFTING MOJITO
RegisterServerEvent('bd_mojito')
AddEventHandler('bd_mojito', function()
    local _source = source
    local count = VORP.getItemCount(_source, "rum")
    local count2 = VORP.getItemCount(_source, "acucar")
       
    if count >= 1 and count2 >= 1 then         
        VORP.subItem(_source, "rum", 1)
        VORP.subItem(_source, "acucar", 1)        
        TriggerClientEvent("progressbar:startSaloon", _source)
        Wait(20000)
        VORP.addItem(_source, "mojito", 2)
        TriggerClientEvent("vorp:TipBottom", _source, 'Você preparou um Mojito', 2000)
        TriggerClientEvent('stress:modify', 1)
    else
        TriggerClientEvent("vorp:TipBottom", _source, 'Você precisa de 1 rum e 1 açúcar.', 4500)
    end      
end)

-- CRAFTING BISTECA COM MILHO
RegisterServerEvent('wc_bistecaCMilho')
AddEventHandler('wc_bistecaCMilho', function()
    local _source = source
    local count = VORP.getItemCount(_source, "carne_javali")
    local count2 = VORP.getItemCount(_source, "milho")
    local count3 = VORP.getItemCount(_source, "milk")
    local count4 = VORP.getItemCount(_source, "agua")
       
    if count >= 1 and count2 >= 1 and count3 >= 2 and count4 >= 1 then         
        VORP.subItem(_source, "carne_javali", 1)
        VORP.subItem(_source, "milho", 2)    
        VORP.subItem(_source, "agua", 1) 
        VORP.subItem(_source, "milk", 1)     
        TriggerClientEvent("progressbar:startSaloon", _source)
        Wait(20000)
        VORP.addItem(_source, "bistecaMilho", 1)
        TriggerClientEvent("vorp:TipBottom", _source, 'Você preparou Bisteca ao Creme de Milho', 2000)
        TriggerClientEvent('stress:modify', 1)
    else
        TriggerClientEvent("vorp:TipBottom", _source, 'Você precisa de 1 Carne de Javali, 2 Milhos, 1 Agua purificada, 1 Leite!', 4500)
    end      
end)

RegisterServerEvent('saloon:checkgroup')
AddEventHandler('saloon:checkgroup', function()
    local _source = source
    local User = VorpCore.getUser(_source) 
    local Character = User.getUsedCharacter        
    if Character.job == "valsaloon" then
        TriggerClientEvent("saloon:valentine", _source)
    elseif Character.job == "armsaloon" then
        TriggerClientEvent("saloon:armadillo", _source)
    elseif Character.job == "bastille" then 
        TriggerClientEvent("saloon:sd", _source)
    elseif Character.job == "rhodessaloon" then
        TriggerClientEvent("saloon:rhodes", _source)
    elseif Character.job == "bwsaloon" then
        TriggerClientEvent("saloon:bw", _source)
    elseif Character.job == "hotel" then
        TriggerClientEvent("saloon:sd", _source)
    elseif Character.job == "tabernaVL" then
        TriggerClientEvent("saloon:sd", _source)
    elseif Character.job == "tabernaSD" then
        TriggerClientEvent("saloon:sd", _source)
    elseif Character.job == "tabernaVH" then
        TriggerClientEvent("saloon:sd", _source)
    end
  
end)
RegisterServerEvent('saloon:checkcomidas')
AddEventHandler('saloon:checkcomidas', function()
    local _source = source
    local User = VorpCore.getUser(_source) 
    local Character = User.getUsedCharacter        
    if Character.job == "valsaloon" then
        TriggerClientEvent("comidas:check", _source)
    elseif Character.job == "armsaloon" then
        TriggerClientEvent("comidas:check", _source)
    elseif Character.job == "bastille" then 
        TriggerClientEvent("vorp:TipRight", _source, "Você não pode fabricar nada deste tipo!", 5000)
    elseif Character.job == "tabernaVL" then 
        TriggerClientEvent("vorp:TipRight", _source, "Você não pode fabricar nada deste tipo!", 5000)
    elseif Character.job == "rhodessaloon" then
        TriggerClientEvent("comidas:check", _source)
    elseif Character.job == "bwsaloon" then
        TriggerClientEvent("comidas:check", _source)
    elseif Character.job == "hotel" then 
        TriggerClientEvent("vorp:TipRight", _source, "Você não pode fabricar nada deste tipo!", 5000)
    elseif Character.job == "tabernaSD" then 
        TriggerClientEvent("vorp:TipRight", _source, "Você não pode fabricar nada deste tipo!", 5000)
    elseif Character.job == "tabernaVH" then 
        TriggerClientEvent("vorp:TipRight", _source, "Você não pode fabricar nada deste tipo!", 5000)
    end
  
end)
RegisterServerEvent('saloon:checkbebidas')
AddEventHandler('saloon:checkbebidas', function()
    local _source = source
    local User = VorpCore.getUser(_source) 
    local Character = User.getUsedCharacter        
    if Character.job == "valsaloon" then
        TriggerClientEvent("bebidas:check", _source)
    elseif Character.job == "armsaloon" then
        TriggerClientEvent("bebidas:check", _source)
    elseif Character.job == "bastille" then 
        TriggerClientEvent("vorp:TipRight", _source, "Você não pode fabricar nada deste tipo!", 5000)
    elseif Character.job == "rhodessaloon" then
        TriggerClientEvent("bebidas:check", _source)
    elseif Character.job == "bwsaloon" then
        TriggerClientEvent("bebidas:check", _source)
    elseif Character.job == "hotel" then 
        TriggerClientEvent("vorp:TipRight", _source, "Você não pode fabricar nada deste tipo!", 5000)
    elseif Character.job == "tabernaSD" then
        TriggerClientEvent("bebidas:check", _source)
    elseif Character.job == "tabernaVH" then
        TriggerClientEvent("bebidas:check", _source)
    elseif Character.job == "tabernaVL" then
        TriggerClientEvent("bebidas:check", _source)
    end
  
end)


------------
RegisterServerEvent("saloon:getJob")
AddEventHandler("saloon:getJob", function()
    local _source = source
    local User = VorpCore.getUser(_source)
    local Character = User.getUsedCharacter
    local job = Character.job

    TriggerClientEvent("saloon:findjob", _source, job)

end)

---------------------------------------------------------------------------
----------------------------------    DOCERIA E PADARIA      --------------
---------------------------------------------------------------------------
RegisterServerEvent('doceria:checkbebidas')
AddEventHandler('doceria:checkbebidas', function()
    local _source = source
    local User = VorpCore.getUser(_source)
    local Character = User.getUsedCharacter
    local job = Character.job
    if job == "Padeiro" then 
        TriggerClientEvent('padaria:menuBebidas', _source)
    else
        TriggerClientEvent('RedM:Notification', _source, 'notify', 'Você não sabe fazer bebidas!')
    end
end)

RegisterServerEvent('doceria:checkcomidas')
AddEventHandler('doceria:checkcomidas', function()
    local _source = source
    local User = VorpCore.getUser(_source)
    local Character = User.getUsedCharacter
    
    if Character.job == 'Confeiteiro' then
        TriggerClientEvent('doceria:menuComidas', _source)
    elseif Character.job == "Padeiro" then 
        TriggerClientEvent('padaria:menuComidas', _source)
    else
        TriggerClientEvent('RedM:Notification', _source, 'notify', 'Você não sabe fazer comidas!')
    end
end)
------------------------ PADARIA
RegisterServerEvent('padaria:checkbebidas')
AddEventHandler('padaria:checkbebidas', function()
    local _source = source
    local User = VorpCore.getUser(source)
    local Character = User.getUsedCharacter
    local job = Character.job

    if job == 'Padeiro' then
        TriggerClientEvent('padaria:menuBebidas', _source)
    else
        TriggerClientEvent('RedM:Notification', _source, 'notify', 'Você não sabe fazer bebidas!')
    end
end)

RegisterServerEvent('padaria:checkcomidas')
AddEventHandler('padaria:checkcomidas', function()
    local _source = source
    local User = VorpCore.getUser(source)
    local Character = User.getUsedCharacter
    local job = Character.job

    if job == 'Padeiro' then
        TriggerClientEvent('padaria:menuComidas', _source)
    else
        TriggerClientEvent('RedM:Notification', _source, 'notify', 'Você não sabe fazer comidas!')
    end
end)
--------------------------------------- DOCERIA
RegisterServerEvent('doceria:chocolate')
AddEventHandler('doceria:chocolate', function()
    local _source = source
    local User = VorpCore.getUser(source)
    local Character = User.getUsedCharacter
    local item1 = VORP.getItemCount(_source, 'acucar')
    local item2 = VORP.getItemCount(_source, 'farinha')
    local item3 = VORP.getItemCount(_source, 'eggs')
    local item4 = VORP.getItemCount(_source, 'milk')
    local item5 = VORP.getItemCount(_source, 'cacau')

    if item1 >= 1 and item2 >= 1 and item3 >= 2 and item4 >= 2 and item5 >= 2 then 
        TriggerClientEvent('doceria:animação', _source)
        VORP.subItem(_source, 'acucar', 1)
        VORP.subItem(_source, 'farinha', 1)
        VORP.subItem(_source, 'eggs', 2)
        VORP.subItem(_source, 'milk', 2)
        VORP.subItem(_source, 'cacau', 2)
        Wait(20000)
        VORP.addItem(_source,'bolochocolate', 1)
    else
        TriggerClientEvent('vorp:Tip', _source, 'Receita: 1 Açucar, 1 Farinha de Trigo, 2 ovos, 2 Leites, 2 Cacau!', 4000)
    end
end)

RegisterServerEvent('doceria:cenoura')
AddEventHandler('doceria:cenoura', function()
    local _source = source
    local User = VorpCore.getUser(source)
    local Character = User.getUsedCharacter
    local item1 = VORP.getItemCount(_source, 'acucar')
    local item2 = VORP.getItemCount(_source, 'farinha')
    local item3 = VORP.getItemCount(_source, 'eggs')
    local item4 = VORP.getItemCount(_source, 'milk')
    local item5 = VORP.getItemCount(_source, 'cacau')
    local item6 = VORP.getItemCount(_source, 'cenoura')

    if item1 >= 1 and item2 >= 1 and item3 >= 2 and item4 >= 2 and item5 >= 2 and item6 >= 2 then 
        TriggerClientEvent('doceria:animação', _source)
        VORP.subItem(_source, 'acucar', 1)
        VORP.subItem(_source, 'farinha', 1)
        VORP.subItem(_source, 'eggs', 2)
        VORP.subItem(_source, 'milk', 2)
        VORP.subItem(_source, 'cacau', 2)
        VORP.subItem(_source, 'cenoura', 2)
        Wait(20000)
        VORP.addItem(_source,'bolocenoura', 1)
    else
        TriggerClientEvent('vorp:Tip', _source, 'Receita: 1 Açucar, 1 Farinha de Trigo, 2 ovos, 2 Leites, 2 Cacau e 2 Cenouras!', 4000)
    end
end)

RegisterServerEvent('doceria:amora')
AddEventHandler('doceria:amora', function()
    local _source = source
    local User = VorpCore.getUser(source)
    local Character = User.getUsedCharacter
    local item1 = VORP.getItemCount(_source, 'acucar')
    local item2 = VORP.getItemCount(_source, 'agua')
    local item3 = VORP.getItemCount(_source, 'Black_Berry')


    if item1 >= 1 and item2 >= 1 and item3 >= 2  then 
        TriggerClientEvent('doceria:animação', _source)
        VORP.subItem(_source, 'acucar', 1)
        VORP.subItem(_source, 'agua', 1)
        VORP.subItem(_source, 'Black_Berry', 2)
        Wait(20000)
        VORP.addItem(_source,'doceamora', 1)
    else
        TriggerClientEvent('vorp:Tip', _source, 'Receita: 1 Açucar, 1 Água purificada, 2 Amoras Pretas!', 4000)
    end
end)

RegisterServerEvent('doceria:pirulito')
AddEventHandler('doceria:pirulito', function()
    local _source = source
    local User = VorpCore.getUser(source)
    local Character = User.getUsedCharacter
    local item1 = VORP.getItemCount(_source, 'acucar')
    local item2 = VORP.getItemCount(_source, 'agua')
    local item3 = VORP.getItemCount(_source, 'maca')


    if item1 >= 1 and item2 >= 1 and item3 >= 2  then 
        TriggerClientEvent('doceria:animação', _source)
        VORP.subItem(_source, 'acucar', 1)
        VORP.subItem(_source, 'agua', 1)
        VORP.subItem(_source, 'maca', 2)
        Wait(20000)
        VORP.addItem(_source,'pirulito', 1)
    else
        TriggerClientEvent('vorp:Tip', _source, 'Receita: 1 Açucar, 1 Água purificada, 2 Maçã!', 4000)
    end
end)
----------------------------------------------------------------------
RegisterServerEvent('padaria:CroassantP')
AddEventHandler('padaria:CroassantP', function()
    local _source = source
    local User = VorpCore.getUser(source)
    local Character = User.getUsedCharacter
    local item1 = VORP.getItemCount(_source, 'farinha')
    local item2 = VORP.getItemCount(_source, 'milk')
    local item3 = VORP.getItemCount(_source, 'eggs')
    local item4 = VORP.getItemCount(_source, 'fermento')
    local item5 = VORP.getItemCount(_source, 'carne_javali')


    if item1 >= 1 and item2 >= 1 and item3 >= 3 and item4 >= 1 and item5 >= 2 then 
        TriggerClientEvent('doceria:animação', _source)
        VORP.subItem(_source, 'farinha', 1)
        VORP.subItem(_source, 'milk', 1)
        VORP.subItem(_source, 'eggs', 3)
        VORP.subItem(_source, 'fermento', 1)
        VORP.subItem(_source, 'carne_javali', 2)
        Wait(20000)
        VORP.addItem(_source,'croa-pork', 1)
    else
        TriggerClientEvent('vorp:Tip', _source, 'Receita: 1 Farinha, 1 Leite, 3 ovos, 1 Fermento e 2 Carne de porco!', 4000)
    end
end)

RegisterServerEvent('doceria:barrachocolate')
AddEventHandler('doceria:barrachocolate', function()
    local _source = source
    local User = VorpCore.getUser(source)
    local Character = User.getUsedCharacter
    local item1 = VORP.getItemCount(_source, 'acucar')
    local item2 = VORP.getItemCount(_source, 'milk')
    local item3 = VORP.getItemCount(_source, 'cacau')

    if item1 >= 1 and item2 >= 1 and item3 >= 3 then 
        TriggerClientEvent('doceria:animação', _source)
        VORP.subItem(_source, 'acucar', 1)
        VORP.subItem(_source, 'milk', 1)
        VORP.subItem(_source, 'cacau', 3)
        Wait(20000)
        VORP.addItem(_source,'bchocolate', 1)
    else
        TriggerClientEvent('vorp:Tip', _source, 'Receita: 1 Acucar, 1 Leite, 3 Cacau!', 4000)
    end
end)
RegisterServerEvent('doceria:sorvHortela')
AddEventHandler('doceria:sorvHortela', function()
    local _source = source
    local User = VorpCore.getUser(source)
    local Character = User.getUsedCharacter
    local item1 = VORP.getItemCount(_source, 'acucar')
    local item2 = VORP.getItemCount(_source, 'milk')
    local item3 = VORP.getItemCount(_source, 'agua')
    local item4 = VORP.getItemCount(_source, "Wild_Mint")

    if item1 >= 1 and item2 >= 1 and item3 >= 2 and item4 >= 2 then 
        TriggerClientEvent('doceria:animação', _source)
        VORP.subItem(_source, 'acucar', 1)
        VORP.subItem(_source, 'milk', 1)
        VORP.subItem(_source, 'agua', 2)
        VORP.subItem(_source, 'Wild_Mint', 2)
        Wait(20000)
        VORP.addItem(_source,'sorvHotela', 1)
    else
        TriggerClientEvent('vorp:Tip', _source, 'Receita: 1 Acucar, 1 Leite, 2 Agua Purificada e 2 Hortelãs!', 4000)
    end
end)

RegisterServerEvent('padaria:CroassantA')
AddEventHandler('padaria:CroassantA', function()
    local _source = source
    local User = VorpCore.getUser(source)
    local Character = User.getUsedCharacter
    local item1 = VORP.getItemCount(_source, 'farinha')
    local item2 = VORP.getItemCount(_source, 'milk')
    local item3 = VORP.getItemCount(_source, 'eggs')
    local item4 = VORP.getItemCount(_source, 'fermento')
    local item5 = VORP.getItemCount(_source, 'meat')


    if item1 >= 1 and item2 >= 1 and item3 >= 3 and item4 >= 1 and item5 >= 2 then 
        TriggerClientEvent('doceria:animação', _source)
        VORP.subItem(_source, 'farinha', 1)
        VORP.subItem(_source, 'milk', 1)
        VORP.subItem(_source, 'eggs', 3)
        VORP.subItem(_source, 'fermento', 1)
        VORP.subItem(_source, 'meat', 2)
        Wait(20000)
        VORP.addItem(_source,'croa-meat', 1)
    else
        TriggerClientEvent('vorp:Tip', _source, 'Receita: 1 Farinha, 1 Leite, 3 ovos, 1 Fermento e 2 Carne animal!', 4000)
    end
end)

RegisterServerEvent('padaria:hotdog')
AddEventHandler('padaria:hotdog', function()
    local _source = source
    local User = VorpCore.getUser(source)
    local Character = User.getUsedCharacter
    local item1 = VORP.getItemCount(_source, 'pao')
    local item2 = VORP.getItemCount(_source, 'salsicha')
    local item3 = VORP.getItemCount(_source, 'tomate')
    local item4 = VORP.getItemCount(_source, 'batata')


    if item1 >= 1 and item2 >= 1 and item3 >= 3 and item4 >= 2  then 
        TriggerClientEvent('doceria:animação', _source)
        VORP.subItem(_source, 'pao', 1)
        VORP.subItem(_source, 'salsicha', 1)
        VORP.subItem(_source, 'tomate', 3)
        VORP.subItem(_source, 'batata', 2)
        Wait(20000)
        VORP.addItem(_source,'hotdog', 1)
    else
        TriggerClientEvent('vorp:Tip', _source, 'Receita: 1 Pão, 1 Salsicha, 3 Tomates, 2 Batatas!', 4000)
    end
end)
--BEBIDAS
RegisterServerEvent('padaria:MSgroselha')
AddEventHandler('padaria:MSgroselha', function()
    local _source = source
    local User = VorpCore.getUser(source)
    local Character = User.getUsedCharacter
    local item1 = VORP.getItemCount(_source, 'milk')
    local item2 = VORP.getItemCount(_source, 'baunilha')
    local item3 = VORP.getItemCount(_source, 'groselha')
    local item4 = VORP.getItemCount(_source, 'acucar')

    if item1 >= 1 and item2 >= 2 and item3 >= 2 and item4 >= 2  then 
        TriggerClientEvent('doceria:animação', _source)
        VORP.subItem(_source, 'milk', 1)
        VORP.subItem(_source, 'baunilha', 2)
        VORP.subItem(_source, 'groselha', 2)
        VORP.subItem(_source, 'acucar', 2)
        Wait(20000)
        VORP.addItem(_source,'shakeGroselha', 1)
    else
        TriggerClientEvent('vorp:Tip', _source, 'Receita: 1 Leite, 2 Baunilhas, 2 Groselhas, 2 Açucares!', 4000)
    end
end)

RegisterServerEvent('padaria:MSbeterraba')
AddEventHandler('padaria:MSbeterraba', function()
    local _source = source
    local User = VorpCore.getUser(source)
    local Character = User.getUsedCharacter
    local item1 = VORP.getItemCount(_source, 'milk')
    local item2 = VORP.getItemCount(_source, 'baunilha')
    local item3 = VORP.getItemCount(_source, 'barbabietole')
    local item4 = VORP.getItemCount(_source, 'acucar')

    if item1 >= 1 and item2 >= 2 and item3 >= 2 and item4 >= 2  then 
        TriggerClientEvent('doceria:animação', _source)
        VORP.subItem(_source, 'milk', 1)
        VORP.subItem(_source, 'baunilha', 2)
        VORP.subItem(_source, 'barbabietole', 2)
        VORP.subItem(_source, 'acucar', 2)
        Wait(20000)
        VORP.addItem(_source,'shakeBeterraba', 1)
    else
        TriggerClientEvent('vorp:Tip', _source, 'Receita: 1 Leite, 2 Baunilhas, 2 beterrabas, 2 Açucares!', 4000)
    end
end)

RegisterServerEvent('padaria:sucoHortela')
AddEventHandler('padaria:sucoHortela', function()
    local _source = source
    local User = VorpCore.getUser(source)
    local Character = User.getUsedCharacter
    local item1 = VORP.getItemCount(_source, 'agua')
    local item2 = VORP.getItemCount(_source, 'Wild_Mint')
    local item3 = VORP.getItemCount(_source, 'garrafavazia')

    if item1 >= 2 and item2 >= 2 and item3 >= 1   then 
        TriggerClientEvent('doceria:animação', _source)
        VORP.subItem(_source, 'agua', 2)
        VORP.subItem(_source, 'Wild_Mint', 2)
        VORP.subItem(_source, 'garrafavazia', 1)
        Wait(20000)
        VORP.addItem(_source,'sucoHortela', 1)
    else
        TriggerClientEvent('vorp:Tip', _source, 'Receita: 1 Garrafa Vazia, 2 Hortelã, 2 Água purificada!', 4000)
    end
end)

RegisterServerEvent('padaria:sucoAmora')
AddEventHandler('padaria:sucoAmora', function()
    local _source = source
    local User = VorpCore.getUser(source)
    local Character = User.getUsedCharacter
    local item1 = VORP.getItemCount(_source, 'agua')
    local item2 = VORP.getItemCount(_source, 'groselha')
    local item3 = VORP.getItemCount(_source, 'garrafavazia')

    if item1 >= 2 and item2 >= 2 and item3 >= 1   then 
        TriggerClientEvent('doceria:animação', _source)
        VORP.subItem(_source, 'agua', 2)
        VORP.subItem(_source, 'groselha', 2)
        VORP.subItem(_source, 'garrafavazia', 1)
        Wait(20000)
        VORP.addItem(_source,'sucoAmora', 1)
    else
        TriggerClientEvent('vorp:Tip', _source, 'Receita: 1 Garrafa Vazia, 2 Groselha, 2 Água purificada!', 4000)
    end
end)
