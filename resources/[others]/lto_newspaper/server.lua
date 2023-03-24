VORP = exports.vorp_inventory:vorp_inventoryApi()
local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)
Citizen.CreateThread(function()
	Citizen.Wait(2000)
	VORP.RegisterUsableItem("newspaper", function(data)
		local _source = source
		TriggerEvent('newspaper:checkjornal', data.source)
	--	VORP.subItem(data.source, "newspaper", 1)
	end)
	VORP.RegisterUsableItem("bestiario", function(data)
		local _source = source
		TriggerClientEvent('lto_newspaper:open2', data.source)
	--	VORP.subItem(data.source, "diario", 1)
	end)
	VORP.RegisterUsableItem("dcarterslade", function(data)
		local _source = source
		TriggerClientEvent('lto_newspaper:open3', data.source)
	--	VORP.subItem(data.source, "diario", 1)
	end)
	VORP.RegisterUsableItem("livroinfantil", function(data)
		local _source = source
		TriggerClientEvent('lto_newspaper:open4', data.source)
	--	VORP.subItem(data.source, "diario", 1)
	end)
	VORP.RegisterUsableItem("tratado", function(data)
		local _source = source
		TriggerClientEvent('lto_newspaper:open5', data.source)
	--	VORP.subItem(data.source, "diario", 1)
	end)
	VORP.RegisterUsableItem("licenca12", function(data)
		local _source = source
		TriggerClientEvent('lto_newspaper:open6', data.source)
	--	VORP.subItem(data.source, "diario", 1)
	end)
end)

RegisterServerEvent('newspaper:checkjornal')
AddEventHandler('newspaper:checkjornal', function(source)
	local _source = source
	local jornal = VORP.getItem(_source, "newspaper")
	if jornal ~= nil then
		local meta =  jornal["metadata"]
		if next(meta) == nil then 
			VORP.subItem(_source, "newspaper", 1,{})
			VORP.addItem(_source, "newspaper", 1,{description = "Leituras = 5",durability = 5})
			TriggerClientEvent('lto_newspaper:open', _source)
		else
			local durability = meta.durability - 1
			local description = "Leituras = "
			VORP.subItem(_source, "newspaper", 1,meta)
			if 0 >= durability then 
				local random = math.random(1,2)
				if random == 1 then 
					TriggerClientEvent("vorp:TipRight", _source, "Você leu todo o jornal!", 2000)
				else
					VORP.addItem(_source, "newspaper", 1,{description = description.."1",durability = 1})
					TriggerClientEvent('lto_newspaper:open', _source)
				end
			else
				VORP.addItem(_source, "newspaper", 1,{description = description..durability,durability = durability})
				TriggerClientEvent('lto_newspaper:open', _source)
			end
		end
	end
end)

RegisterServerEvent("jornal:addjornal")
AddEventHandler("jornal:addjornal", function()
    local _source = source 
    local playerinv = VORP.getUserInventory(_source) 
    local count = VORP.getItemCount(_source, 'newspaper') 
    
    VORP.addItem(_source, 'newspaper', 10) 
end)

RegisterServerEvent("Checkjob:jornal")
AddEventHandler("Checkjob:jornal", function ()
	local _source = source
	local User = VorpCore.getUser(_source) 
	local Character = User.getUsedCharacter        
	if Character.job == "newspaper" then
		TriggerClientEvent("jornalista:onduty", _source, true)
	end
end)