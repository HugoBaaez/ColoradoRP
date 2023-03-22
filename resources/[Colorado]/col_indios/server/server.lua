VORP = exports.vorp_inventory:vorp_inventoryApi()

local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

local wbhk = "https://discord.com/api/webhooks/1086785174248898630/Eww2AhaZGDvbAQr6sqzSEZvvHOFV2dCXVtWzeiIWuav1wGTJgQ8Zgx1YHTfxcJ1gEV9T"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

RegisterServerEvent('indios:webhook')
AddEventHandler('indios:webhook', function(tipo)
    local _source = source
    local Character = VorpCore.getUser(_source).getUsedCharacter
    local group = Character.job
    local playername = Character.firstname.. ' ' ..Character.lastname
    local time_m = tostring(amount)
    SendWebhookMessage(wbhk,"```prolog\n[INDIOS]: ".. playername .." \n Se transformou em "..tipo.. " " ..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
end)
-- CRAFTING TONICO INDIANI
RegisterServerEvent('wc_tonico_aug')
AddEventHandler('wc_tonico_aug', function()
    local _source = source
    local count = VORP.getItemCount(_source, "agua")
    local count2 = VORP.getItemCount(_source, "groselha")
    local count4 = VORP.getItemCount(_source, "ginseng_americano")
    local count3 = VORP.getItemCount(_source, "p_belladonna")
        
    if count >= 4 and count2 >= 5 and count3 >= 4 and count4 >= 4 then
         
        VORP.subItem(_source, "agua", 4)
        VORP.subItem(_source, "groselha", 5)
        VORP.subItem(_source, "ginseng_americano", 4)
        VORP.subItem(_source, "p_belladonna", 4)

        
        TriggerClientEvent("progressbar:startIndiani", _source)

        Wait(27000)

        VORP.addItem(_source, "tonico_aug", 1)

        TriggerClientEvent("vorp:TipBottom", _source, 'Você preparou Elixir de Caça.', 2000)
    
    else
        TriggerClientEvent("vorp:TipBottom", _source, 'Você precisa de 4 água, 5 groselha, 4  Ginseng Americano 4 Belladonna. ', 4500)
    end      
end)

RegisterServerEvent("indios:getjob")
AddEventHandler("indios:getjob", function()
  local _source = source
  local User = VorpCore.getUser(_source)
  local Character = User.getUsedCharacter
  local identifier = Character.identifier
  local charidentifier = Character.charIdentifier
  local job = Character.job
  local rank = Character.jobGrade
  TriggerClientEvent("indios:findjob", _source,job,rank)
end)