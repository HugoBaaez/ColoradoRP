RegisterServerEvent("ricx_train_robbery:log_event", function(dat)
	local _source = dat.source 
	local item = dat.item 
	local amount = dat.amount 
	print("Player (Source ID ".._source.." robbed "..item.." amount: "..dat.amount)
end)

RegisterServerEvent("ricx_train_robbery:train_spawned", function(coords, ent)
	local _source = source 
	print("Source ".._source.." spawned train ("..ent..") at "..coords.."")
end)