local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)
VorpInv = exports.vorp_inventory:vorp_inventoryApi()

RegisterServerEvent('shop:compra')
AddEventHandler('shop:compra', function(valor, item) 

    local _source = source
    local User = VorpCore.getUser(_source)
    local Character = User.getUsedCharacter
    local money = Character.money

    if money >= valor  then 
        TriggerEvent("vorp:removeMoney", _source, 0, valor)
        VorpInv.addItem(_source, item, 1)

        TriggerClientEvent("vorp:TipRight", _source, 'Você comprou '..item..'!', 5000)

    else
        TriggerClientEvent("vorp:TipRight", _source, 'O Item custa '..valor..'$!', 5000)
    end

end)