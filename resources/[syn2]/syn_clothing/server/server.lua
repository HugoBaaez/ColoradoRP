



TriggerEvent("getCore",function(core)
    VorpCore = core
end)

VorpInv = exports.vorp_inventory:vorp_inventoryApi()


RegisterServerEvent('syn_clothing:getinfo')
AddEventHandler('syn_clothing:getinfo', function()
    local _source = source
    local User = VorpCore.getUser(_source)
    if User == nil then 
        return 
    end
    local Character = User.getUsedCharacter
    local u_identifier = Character.identifier
    local u_charid = Character.charIdentifier
    exports.oxmysql:execute('SELECT skinPlayer FROM characters WHERE identifier=@identifier AND charidentifier = @charidentifier', {['identifier'] = u_identifier, ['charidentifier'] = u_charid}, function(result)
        local playeroutfits = {}
        if result[1] ~= nil then           
          skin        = result[1].skinPlayer
          TriggerClientEvent("syn_clothing:recinfo", _source, skin)
        
        end
    end)
end)
RegisterServerEvent('syn_clothing:loadClothes')
AddEventHandler('syn_clothing:loadClothes', function()
    local _source = source
    local User = VorpCore.getUser(_source)
    if User == nil then 
        return 
    end
    local Character = User.getUsedCharacter
    local u_identifier = Character.identifier
    local u_charid = Character.charIdentifier
    exports.oxmysql:execute('SELECT compPlayer FROM characters WHERE identifier=@identifier AND charidentifier = @charidentifier', {['identifier'] = u_identifier, ['charidentifier'] = u_charid}, function(result)
        local playeroutfits = {}
        if result[1] ~= nil then           
            _clothes        = result[1].compPlayer
          TriggerClientEvent("syn_clothing:OpenClothingMenu", _source, _clothes)
        end
    end)
end)


RegisterServerEvent("syn_clothing:setoutfit")
AddEventHandler("syn_clothing:setoutfit", function(jsonCloths)
    local _source = source
    local User = VorpCore.getUser(source)
    local Character = User.getUsedCharacter
    local u_identifier = Character.identifier
    local u_charid = Character.charIdentifier
    local compPlayer = jsonCloths
    local Parameters = { ['identifier'] = u_identifier, ['charidentifier'] = u_charid , ['compPlayer'] = compPlayer}
    exports.oxmysql:execute("UPDATE characters Set compPlayer=@compPlayer WHERE identifier=@identifier AND charidentifier = @charidentifier", Parameters)
end)

RegisterServerEvent("syn_clothing:DeleteOutfit")
AddEventHandler("syn_clothing:DeleteOutfit", function(jsonCloths)
    local id = jsonCloths.desc
    local _source = source
    exports.oxmysql:execute("DELETE FROM outfits WHERE id=@id", {["id"] = id})
end)

RegisterServerEvent("syn_clothing:buyoutfit")
AddEventHandler("syn_clothing:buyoutfit", function(jsonCloths,namex)
    local _source = source
    local price = Config.Price
    local User = VorpCore.getUser(source)
    local Character = User.getUsedCharacter
    local u_identifier = Character.identifier
    local u_charid = Character.charIdentifier
    local playercash = Character.money
	local total =  Character.money - price
	if total >= 0 then 
        TriggerClientEvent("syn_clothing:successfulpayment",_source,jsonCloths)
        Character.removeCurrency(0, price)
        local Parameters = { ['identifier'] = u_identifier, ['charidentifier'] = u_charid , ['title'] = namex, ['comps'] = jsonCloths}
        exports.oxmysql:execute("INSERT INTO outfits ( `identifier`, `charidentifier`, `title`, `comps`) VALUES ( @identifier, @charidentifier, @title, @comps)", Parameters)
    else
        TriggerClientEvent("vorp:TipRight", _source, "Not Enough Money $ "..price, 10000) 
    end
end)

RegisterServerEvent("syn_clothing:getOutfits")
AddEventHandler("syn_clothing:getOutfits", function()
    local _source = source
    local User = VorpCore.getUser(source)
    local Character = User.getUsedCharacter
    local u_identifier = Character.identifier
    local u_charid = Character.charIdentifier
    exports.oxmysql:execute('SELECT * FROM outfits WHERE identifier=@identifier AND charidentifier = @charidentifier', {['identifier'] = u_identifier, ['charidentifier'] = u_charid}, function(result)
        local playeroutfits = {}
        if result[1] ~= nil then 
            for i=1, #result, 1 do
            table.insert(playeroutfits, {
                title        = result[i].title,
                comps  = result[i].comps,
                id  = result[i].id,
            })
            TriggerClientEvent("syn_clothing:putInTable", _source, playeroutfits)
            end
        else
            playeroutfits = 0
            TriggerClientEvent("syn_clothing:putInTable", _source, playeroutfits)
        end
    end)
end)
