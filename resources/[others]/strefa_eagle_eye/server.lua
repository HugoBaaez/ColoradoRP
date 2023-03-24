VORP = exports.vorp_inventory:vorp_inventoryApi()



Citizen.CreateThread(function()
	Citizen.Wait(2000)
  VORP.RegisterUsableItem("tonico_aug", function(data)

    TriggerClientEvent('awaria-deadeye:use', data.source)
    
  end)
end)

RegisterServerEvent('awaria-deadeye:takeitem')
AddEventHandler('awaria-deadeye:takeitem', function()
  local _source = source 

  VORP.subItem(_source, "tonico_aug", 1)


end)