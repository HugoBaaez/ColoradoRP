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

Citizen.CreateThread(function()
	Citizen.Wait(2000)
  VORP.RegisterUsableItem("tonico_aug", function(data)
    TriggerClientEvent('awaria-deadeye:use', data.source)
    local _source = data.source
    local Character = VorpCore.getUser(_source).getUsedCharacter
    local group = Character.job
    local playername = Character.firstname.. ' ' ..Character.lastname
    local time_m = tostring(amount)
    SendWebhookMessage(wbhk,"```prolog\n[INDIOS]: ".. playername .." \n Usou item Olho da morte as" ..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
  end)
end)

RegisterServerEvent('awaria-deadeye:takeitem')
AddEventHandler('awaria-deadeye:takeitem', function()
  local _source = source 

  VORP.subItem(_source, "tonico_aug", 1)


end)