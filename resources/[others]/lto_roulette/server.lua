TriggerEvent("getCore",function(core)
    VorpCore = core
end)

VORP = exports.vorp_inventory:vorp_inventoryApi()


local wbhk = "https://discord.com/api/webhooks/1050527122353033357/CckNz1BcqJAsMFv7teG9Wj-pVuxhqjpUXgvxX2R9Oc8ln4blHHwxWB96D3kVgRv-Y_cd"
RegisterServerEvent("lto_roulette:Bets")
AddEventHandler("lto_roulette:Bets", function(u_money)
	local _source = source 
    TriggerEvent('vorp:getCharacter', _source, function(user)
    u_money = user.money
        if u_money >= 10 then -- minimum money to open the UI of the Game but it dont change the minium bet you need to edit the index.html for that.
            TriggerClientEvent("lto_roulette:start", _source, u_money)
            else
			TriggerClientEvent("vorp:TipBottom", _source, Config.Language.nomoney, 3000)
        end
    end)
end)

RegisterServerEvent('lto_roulette:removemoney')
AddEventHandler('lto_roulette:removemoney', function(amount)
	local amount = amount
	local _source = source
	TriggerEvent("vorp:removeMoney", source, 0, amount)
end)

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
function getTime ()
    return os.time(os.date("!*t"))
end

RegisterServerEvent('lto_roulette:givemoney')
AddEventHandler('lto_roulette:givemoney', function(action, amount)
	local action = action
	local amount = amount
	local _source = source
    local player = VorpCore.getUser(_source).getUsedCharacter
    local playername = player.firstname.. ' ' ..player.lastname
	if action == 'Black' or action == 'Red' then
		local win = amount*1.2
        TriggerEvent("vorp:addMoney", source, 0, win)
        SendWebhookMessage(wbhk,"```prolog\n[ROLETA]: ".. action .." \n[ "..playername.. " ganhou " ..win.."] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```") 
	elseif action == 'Green' then
		local win = amount*14
        TriggerEvent("vorp:addMoney", source, 0, win)
        SendWebhookMessage(wbhk,"```prolog\n[ROLETA]: ".. action .." \n[ "..playername.. " ganhou " ..win.."] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```") 
	else
	end
end)

RegisterServerEvent('InteractSound_SV:PlayOnSource')
AddEventHandler('InteractSound_SV:PlayOnSource', function(soundFile, soundVolume)
    TriggerClientEvent('InteractSound_CL:PlayOnOne', source, soundFile, soundVolume)
end)

-- TP from St-Denis to the Boat for 10$
RegisterServerEvent('lto_roulette:BoatMoney')
AddEventHandler('lto_roulette:BoatMoney', function()
	local _source = source 
    TriggerEvent('vorp:getCharacter', _source, function(user)
        argent = user.money
    end)
    if argent <= 10 then -- change price to travel
	    TriggerClientEvent("vorp:TipBottom", _source, Config.Language.nomoney, 3000)
        return
    end
	TriggerClientEvent('lto_roulette:Teleport', _source)
    TriggerEvent("vorp:removeMoney", _source, 0, 10) -- change price to travel
end)