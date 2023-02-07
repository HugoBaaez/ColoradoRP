local VORP = exports.vorp_inventory:vorp_inventoryApi()
local wbhk = "https://discord.com/api/webhooks/992364227937435781/NIVVr7ZMx0UUxWxyN5SDa_noXNdu9SAJSMeiCRzE6RM7BeyNTQ1foFiUdR1rULiz0PQQ"
local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

RegisterServerEvent('lto_headbucket:PutBucket')
AddEventHandler('lto_headbucket:PutBucket', function(player, amount)
    local _source = source
    local Character = VorpCore.getUser(_source).getUsedCharacter
    local group = Character.job
    local playername = Character.firstname.. ' ' ..Character.lastname
    local User = VorpCore.getUser(player).getUsedCharacter
    local player2 = User.firstname.. ' ' ..User.lastname
    local time_m = tostring(amount)
    local amount = amount * 60
    if group == "Herbalista" then
	    TriggerClientEvent('lto_headbucket:BucketActif',player, amount)
        SendWebhookMessage(wbhk,"```prolog\n[BRUXAS]: ".. playername .." \n Usou cegar no player "..player2.. " " ..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	end
end)

function getTime ()
    return os.time(os.date("!*t"))
end

RegisterServerEvent("bruxas:getjob")
AddEventHandler("bruxas:getjob", function()
  local _source = source
  local User = VorpCore.getUser(_source)
  local Character = User.getUsedCharacter
  local identifier = Character.identifier
  local charidentifier = Character.charIdentifier
  local job = Character.job
  local rank = Character.jobGrade
  TriggerClientEvent("bruxas:findjob", _source,job,rank)
end)

RegisterServerEvent('ginsengA')
AddEventHandler('ginsengA', function()
    local _source = source
    local User = VorpCore.getUser(_source) 
    local Character = User.getUsedCharacter
    local money = Character.money
  
    if money >= 0.05 then
        TriggerEvent("vorp:removeMoney", _source, 0, 0.05) 
        VORP.addItem(_source, "ginseng_alaska", 2)

        TriggerClientEvent("vorp:TipRight",_source, 'Você comprou 2X ginseng do alaska!', 2000)
    else
        TriggerClientEvent("vorp:TipRight",_source, 'Você precisa de $0.05.', 4500)
    end      
end)

RegisterServerEvent('ginsengUSA')
AddEventHandler('ginsengUSA', function()
    local _source = source
    local User = VorpCore.getUser(_source) 
    local Character = User.getUsedCharacter
    local money = Character.money
  
    if money >= 0.05 then
        TriggerEvent("vorp:removeMoney", _source, 0, 0.05) 
        VORP.addItem(_source, "ginseng_americano", 2)

        TriggerClientEvent("vorp:TipRight",_source, 'Você comprou 2X ginseng americano!', 2000)
    else
        TriggerClientEvent("vorp:TipRight",_source, 'Você precisa de $0.05.', 4500)
    end      
end)

RegisterServerEvent('caldodegalinhaenvenenado')
AddEventHandler('caldodegalinhaenvenenado', function()
    local _source = source
    local count = VORP.getItemCount(_source, "agua")
    local count2 = VORP.getItemCount(_source, "veleno_s")
    local count3 = VORP.getItemCount(_source, "carne_peru")
    local count4 = VORP.getItemCount(_source, "milho")
  
    if count >= 2 and count2 >= 1 and count3 >= 1 and count4 >= 2 then
         
        VORP.subItem(_source, "agua", 2)
        VORP.subItem(_source, "veleno_s", 1)
        VORP.subItem(_source, "carne_peru", 1)
        VORP.subItem(_source, "milho", 2)

        TriggerClientEvent("progressbar:startBRuxas", _source)
        Wait(20000)
        VORP.addItem(_source, "caldodegalinhaenvenenado", 2)

        TriggerClientEvent("vorp:TipRight",_source, 'Você preparou o Caldo de Galinha envenenado!', 2000)
    else
        TriggerClientEvent("vorp:TipRight",_source, 'Você precisa de 2 agua, 1 Extrato de veneno, 1 Frango Cru e 2 Milhos.', 4500)
    end      
end)

RegisterServerEvent('caldodegalinha')
AddEventHandler('caldodegalinha', function()
    local _source = source
    local count = VORP.getItemCount(_source, "agua")
    local count3 = VORP.getItemCount(_source, "carne_peru")
    local count4 = VORP.getItemCount(_source, "milho")
  
    if count >= 2 and count3 >= 1 and count4 >= 2 then
         
        VORP.subItem(_source, "agua", 2)
        VORP.subItem(_source, "carne_peru", 1)
        VORP.subItem(_source, "milho", 2)
        
        TriggerClientEvent("progressbar:startBRuxas", _source)

        Wait(20000)

        VORP.addItem(_source, "caldodegalinha", 2)

        TriggerClientEvent("vorp:TipRight",_source, 'Você preparou o Caldo de Galinha!', 2000)
    
    else
        TriggerClientEvent("vorp:TipRight",_source, 'Você precisa de 2 agua, 1 Frango Cru e 2 Milhos.', 4500)
    end      
end)

RegisterServerEvent('antipoison')
AddEventHandler('antipoison', function()
    local _source = source
    local count = VORP.getItemCount(_source, "agua")
    local count2 = VORP.getItemCount(_source, "veleno_s")
    local count3 = VORP.getItemCount(_source, "snakepoison")
  
    if count >= 2 and count2 >= 2 and count3 >= 2 then
         
        VORP.subItem(_source, "agua", 2)
        VORP.subItem(_source, "veleno_s", 2)
        VORP.subItem(_source, "snakepoison", 2)

        
        TriggerClientEvent("progressbar:startBRuxas", _source)

        Wait(20000)

        VORP.addItem(_source, "antipoison", 1)

        TriggerClientEvent("vorp:TipRight",_source, 'Você preparou o Antidoto para envenenamento', 2000)
        
    
    else
        TriggerClientEvent("vorp:TipRight",_source, 'Você precisa de 2 agua, 2 Extrato de veneno e 2 Veneno de cobra.', 4500)
    end      
end)
----------------------------------------------------------
RegisterServerEvent('antiveneno')
AddEventHandler('antiveneno', function()
    local _source = source
    local count = VORP.getItemCount(_source, "agua")
    local count2 = VORP.getItemCount(_source, "veleno_s")
    local count3 = VORP.getItemCount(_source, "snakepoison")
  
    if count >= 2 and count2 >= 1 and count3 >= 1 then
         
        VORP.subItem(_source, "agua", 2)
        VORP.subItem(_source, "veleno_s", 1)
        VORP.subItem(_source, "snakepoison", 1)

        
        TriggerClientEvent("progressbar:startBRuxas", _source)

        Wait(20000)

        VORP.addItem(_source, "antipoison2", 2)

        TriggerClientEvent("vorp:TipRight",_source, 'Você preparou o atidoto contra cobras', 2000)    
    else
        TriggerClientEvent("vorp:TipRight",_source, 'Você precisa de 2 agua, 2 Extrato de veneno e 2 Veneno de cobra.', 4500)
    end      
end)

RegisterServerEvent('extrato')
AddEventHandler('extrato', function()
    local _source = source
    local count = VORP.getItemCount(_source, "agua")
    local count2 = VORP.getItemCount(_source, "Burdock_Root")
    local count3 = VORP.getItemCount(_source, "snakepoison")
  
    if count >= 2 and count2 >= 2 and count3 >= 1 then
         
        VORP.subItem(_source, "agua", 2)
        VORP.subItem(_source, "Burdock_Root", 2)
        VORP.subItem(_source, "snakepoison", 1)

        
        TriggerClientEvent("progressbar:startBRuxas", _source)

        Wait(20000)

        VORP.addItem(_source, "veleno_s", 2)

        TriggerClientEvent("vorp:TipRight",_source, 'Você preparou o Extrato de veneno', 2000)
        
    
    else
        TriggerClientEvent("vorp:TipRight",_source, 'Você precisa de 2 agua, 2 Erva Medicinal e 2 Veneno de cobra.', 4500)
    end      
end)
---------------------------------------------

VORP.RegisterUsableItem("antipoison", function(data)
	VORP.CloseInv(data.source)
    VORP.subItem(data.source, "antipoison", 1)
	TriggerClientEvent("Perry_Poison:UseAntidote", data.source)
end)
VORP.RegisterUsableItem("caldodegalinha", function(data)
	VORP.CloseInv(data.source)
    VORP.subItem(data.source, "caldodegalinha", 1)
    local valor = 50
    local valor2 = 30
    TriggerClientEvent('metabolism:Ensopado', data.source, valor, valor2)
end)
VORP.RegisterUsableItem("caldodegalinhaenvenenado", function(data)
	VORP.CloseInv(data.source)
    VORP.subItem(data.source, "caldodegalinhaenvenenado", 1)
    local valor = 50
    local valor2 = 30
    TriggerClientEvent('metabolism:Ensopado', data.source, valor, valor2)
    Citizen.Wait(120000)
    TriggerClientEvent('Perry_Poison:UsefoodPoisoned', data.source)
end)
