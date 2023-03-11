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
		local type = "Bestiario"
		TriggerClientEvent('lto_newspaper:open', data.source, type)
	--	VORP.subItem(data.source, "diario", 1)
	end)
	VORP.RegisterUsableItem("dcarterslade", function(data)
		local _source = source
		local type = "DCarterSlade"
		TriggerClientEvent('lto_newspaper:open', data.source, type)
	--	VORP.subItem(data.source, "diario", 1)
	end)
	VORP.RegisterUsableItem("livroinfantil", function(data)
		local _source = source
		local type = "livroinfantil"
		TriggerClientEvent('lto_newspaper:open', data.source, type)
	--	VORP.subItem(data.source, "diario", 1)
	end)
	VORP.RegisterUsableItem("tratado", function(data)
		local _source = source
		local type = "Tratado"
		TriggerClientEvent('lto_newspaper:open', data.source, type)
	--	VORP.subItem(data.source, "diario", 1)
	end)
	VORP.RegisterUsableItem("licenca12", function(data)
		local _source = source
		local type = "Carteira12"
		TriggerClientEvent('lto_newspaper:open', data.source, type)
	--	VORP.subItem(data.source, "diario", 1)
	end)
	VORP.RegisterUsableItem("casamento", function(data)
		local _source = source
		local type = "Ccasamento"
		TriggerClientEvent('lto_newspaper:open', data.source, type)
	--	VORP.subItem(data.source, "diario", 1)
	end)
	VORP.RegisterUsableItem("livrolemoyne", function(data)
		local _source = source
		local type = "livrolemoyne"
		TriggerClientEvent('lto_newspaper:open', data.source, type)
	--	VORP.subItem(data.source, "diario", 1)
	end)
end)

RegisterServerEvent('newspaper:checkjornal')
AddEventHandler('newspaper:checkjornal', function(source)
	local _source = source
	local jornal = VORP.getItem(_source, "newspaper")
	local type = "OpenBookGui"
	if jornal ~= nil then
		local meta =  jornal["metadata"]
		if next(meta) == nil then 
			VORP.subItem(_source, "newspaper", 1,{})
			VORP.addItem(_source, "newspaper", 1,{description = "Leituras = 3",durability = 3})
			TriggerClientEvent('lto_newspaper:open', _source, type)
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
					TriggerClientEvent('lto_newspaper:open', _source, type)
				end
			else
				VORP.addItem(_source, "newspaper", 1,{description = description..durability,durability = durability})
				TriggerClientEvent('lto_newspaper:open', _source, type)
			end
		end
	end
end)

RegisterCommand('addjornal', function(source,rawCommand)
	local _source = source
	local User = VorpCore.getUser(source).getUsedCharacter        
	if User.job == "newspaper" then
		VORP.addItem(_source, 'newspaper', 5, {description = "Leituras = 3",durability = 3})
	end
end)