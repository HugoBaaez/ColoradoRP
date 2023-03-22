
local panninglocations = Config.PanningLocations

VorpInv = exports.vorp_inventory:vorp_inventoryApi()


TriggerEvent("getCore",function(core)
    VorpCore = core
end)

RegisterServerEvent("cercaoro:requestconfig")
AddEventHandler("cercaoro:requestconfig", function() 
	local _source = source
	TriggerClientEvent("cercaoro:saveconfig", _source, Config)
end)

RegisterServerEvent('vorp_goldpanning:successGiveGold')
AddEventHandler('vorp_goldpanning:successGiveGold', function(currentZone)
	local _source = source
	math.randomseed(os.time())
	if currentZone ~= nil then
		math.randomseed(os.time())
		local tmpProb = math.random (1,10000)
		if tmpProb < Config.Probability then

			local User = VorpCore.getUser(_source)
			local Character = User.getUsedCharacter

			local loot = panninglocations[currentZone]["loot"]
			local gold = tonumber(math.abs(math.random(1, loot)))
			VorpInv.addItem(source, "goldnugget", gold)
			TriggerClientEvent("vorp:NotifyLeft", _source, "~o~Peneira", Config.Found(gold), "generic_textures", "stamp_gold", 3000)
		else
			TriggerClientEvent("vorp:NotifyLeft", _source, "~e~Peneira", Config.GoldNotFound, "menu_textures", "cross", 3000)
		end
	end
end)

RegisterServerEvent('vorp_goldpanning:checkPan')
AddEventHandler('vorp_goldpanning:checkPan', function()
	local User = VorpCore.getUser(source)
	local Character = User.getUsedCharacter	
	local panAmount = VorpInv.getItemCount(source, "goldpan")	
	if panAmount > 0 then
		TriggerClientEvent("vorp_goldpanning:panPresent", source)
	else
        TriggerClientEvent("vorp:NotifyLeft", _source, "~e~Peneira", Config.PanNotFound, "menu_textures", "cross", 3000)
	end
			
	
end)

Citizen.CreateThread(function() 
	Wait(2000)
	VorpInv.RegisterUsableItem("goldpan", function(data) 
		local _source = data.source
		TriggerClientEvent('col_ouro:checkZone', _source)
	end)
end)

RegisterServerEvent('gold:vender')
AddEventHandler('gold:vender', function ()
    local User = VorpCore.getUser(source)
    local Character = User.getUsedCharacter
    local _src   = source
    local _price = 1
    local _model = 'goldnugget'
	local _mens  = 'Você trocou as pepitas por 1 barra de ouro'
	
	local inv_count = VorpInv.getItemCount(_src, _model)
	
    if inv_count < 15 then
        TriggerClientEvent('RedM:Notification', _src, 'notify', 'Você não possui a quantidade necessária!' )
        return
    end

	VorpInv.subItem(_src, _model, 15)
	Character.removeCurrency(0, 5)
	Character.addCurrency(1, _price)
	
	TriggerClientEvent('RedM:Notification', _src, 'notify', _mens )
	
end)