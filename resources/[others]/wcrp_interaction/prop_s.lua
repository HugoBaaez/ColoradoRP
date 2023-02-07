VORP = exports.vorp_inventory:vorp_inventoryApi()
local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

VORP.RegisterUsableItem("cigarro", function(data)
	VORP.subItem(data.source, "cigarro", 1)
	local _source = source
	TriggerClientEvent('prop:cigarettes', data.source)
end)

VORP.RegisterUsableItem("hairpomade", function(data)
	VORP.subItem(data.source, "hairpomade", 1)
	TriggerClientEvent('prop:hairpomade', data.source)
end)


VORP.RegisterUsableItem("charuto", function(data)
	VORP.subItem(data.source, "charuto", 1)
	local _source = source
	TriggerClientEvent('prop:cigar', data.source)
end)


VORP.RegisterUsableItem("pocket_watch", function(data)
	TriggerClientEvent('prop:watch', data.source)
end)

VORP.RegisterUsableItem("pipe", function(data)
	TriggerClientEvent('prop:pipe', data.source)
end)

VORP.RegisterUsableItem("tabacomascar", function(data)
	VORP.subItem(data.source, "tabacomascar", 1)
	TriggerClientEvent('prop:chewingtobacco', data.source)
end)

--Prova
VORP.RegisterUsableItem("fan", function(data)
	TriggerClientEvent('prop:fan', data.source)
end)

VORP.RegisterUsableItem("book", function(data)
	TriggerClientEvent('prop:book', data.source)
end)

VORP.RegisterUsableItem("ledger", function(data)
	TriggerClientEvent('prop:ledger', data.source)
end)

VORP.RegisterUsableItem("orologio", function(data)
	TriggerClientEvent('prop:orologio', data.source)
end)

VORP.RegisterUsableItem("parasol", function(data)
	TriggerClientEvent('prop:parasol', data.source,"parasol")
end)

VORP.RegisterUsableItem("cane", function(data)
	TriggerClientEvent('prop:cane', data.source)
end)

VORP.RegisterUsableItem("unique_bouquet", function(data)
	TriggerClientEvent('prop:unique_bouquet', data.source)
end)

VORP.RegisterUsableItem("unique_guitar_special", function(data)
	TriggerClientEvent('prop:unique_guitar_special', data.source)
end)
