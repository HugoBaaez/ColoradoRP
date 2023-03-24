----------------------------VORP EVENT----------------------------
local VorpCore
local VorpInv
TriggerEvent("getCore",function(core)
    VorpCore = core
end)

VorpInv = exports.vorp_inventory:vorp_inventoryApi()
----------------------------END VORP----------------------------
local TEXTURES = Config.Textures
--------------------------------------------------------


RegisterCommand("callbird", function(source, args)
    TriggerClientEvent("huntingbirds:callowneds",source)
end)

local SellPoints = {}

RegisterServerEvent("ricx_huntingbirds:deleteped_s")
AddEventHandler("ricx_huntingbirds:deleteped_s", function(ent)
    TriggerClientEvent("ricx_huntingbirds:deleteped_c",-1, ent)
end)

----------------------------EVENTS----------------------------
AddEventHandler('playerDropped', function()
    local _source = source
    for i,v in pairs(SellPoints) do
        if v.owner == _source then
            TriggerClientEvent("huntingbirds:sell:updatepoints", -1, nil, i, tonumber(v.pedid))
            SellPoints[i] = nil
        end
    end
end)
--------------------------------------------------------
RegisterServerEvent("huntingbirds:buybird")
AddEventHandler("huntingbirds:buybird", function(model, price, xp, preset, name)
	local _source = source
    local _model = tonumber(model)
    local _price = tonumber(price)
    local _xp = tonumber(xp)
    local _preset = tonumber(preset)
    local _name = tostring(name)
    local Character = VorpCore.getUser(_source).getUsedCharacter
    local u_identifier = Character.identifier
    local u_charid = Character.charIdentifier
    local u_money = Character.money
    if u_money < _price then
        --TriggerClientEvent("Notification:left_huntbirds", _source, Config.Texts.ShopTitle, Config.Texts.ShopNoMoney, TEXTURES.locked[1], TEXTURES.locked[2], 2000)
        TriggerClientEvent("vorp:TipRight", _source, Config.Texts.ShopNoMoney, 10000) 
        return
    else
        Character.removeCurrency(0, _price)
        local Parameters = { 
            ['identifier'] = u_identifier, 
            ['charid'] = u_charid, 
            ['model'] = _model, 
            ['name'] = _name, 
            ['preset'] = preset,
            ['xp'] = _xp,
            ['price'] = _price,
        }
    
        exports.oxmysql:execute("INSERT INTO birds ( `identifier`, `charid`, `model`, `name`, `preset`, `xp`, `price`) VALUES ( @identifier, @charid, @model, @name, @preset, @xp, @price)", Parameters,function(result)
            while result ~= 1 do
                Citizen.Wait(1)
            end
        end)
        TriggerClientEvent("vorp:TipRight", _source, Config.Texts.BirdBought, 10000) 
    end
end)
--------------------------------------------------------
RegisterServerEvent("huntingbirds:checkmenujob")
AddEventHandler("huntingbirds:checkmenujob", function(jobs, id)
    local _source = source
    local Character = VorpCore.getUser(_source).getUsedCharacter
    local u_job = Character.job
    for i,v in pairs(jobs) do
        if u_job == v then
            TriggerClientEvent("huntingbirds:openshop", _source, id)
            return
        end
    end
    TriggerClientEvent("vorp:TipRight", _source, Config.Texts.NoJob, 10000) 
end)

RegisterServerEvent("huntingbirds:checkhunt")
AddEventHandler("huntingbirds:checkhunt", function()
    local _source = source
    if Config.Hunting.jobrequired == true then
        local Character = VorpCore.getUser(_source).getUsedCharacter
        local u_job = Character.job
        for i,v in pairs(Config.Hunting.jobs) do
            if u_job == v then
                TriggerClientEvent("huntingbirds:starthunt", _source)
                return
            end
        end
        TriggerClientEvent("vorp:TipRight", _source, Config.Texts.NoJob, 10000) 
    else
        TriggerClientEvent("huntingbirds:starthunt", _source)
    end
end)
--------------------------------------------------------
RegisterServerEvent('huntingbirds:getOwnedBirds')
AddEventHandler('huntingbirds:getOwnedBirds', function()
    local _source = source
    local Character = VorpCore.getUser(_source).getUsedCharacter
    local identifier = Character.identifier
    local charid = Character.charIdentifier
    TriggerEvent('huntingbirds:getOwnedDB',identifier, charid, function(call)
        if call then
            TriggerClientEvent('huntingbirds:ownedbirds', _source, call)
        end
    end)
end)
--------------------------------------------------------
RegisterServerEvent('huntingbirds:getOwnedDB')
AddEventHandler('huntingbirds:getOwnedDB', function(identifier,charid,callback)
    local Callback = callback
    exports.oxmysql:execute('SELECT * FROM birds WHERE `identifier`=@identifier AND `charid`=@charid;', {identifier = identifier, charid = charid}, function(birds)
        if birds[1] then
            Callback(birds)
        else
            Callback(false)
        end
    end)
end)
--------------------------------------------------------
RegisterServerEvent('huntingbirds:DeleteBird')
AddEventHandler('huntingbirds:DeleteBird', function(bdata)
    local _source = source
    local Character = VorpCore.getUser(_source).getUsedCharacter
    local identifier = Character.identifier
    local charid = Character.charIdentifier
        local params = {identifier = identifier, charid = charid,  id = tonumber(bdata.id)}
        exports.oxmysql:execute('DELETE FROM birds  WHERE `identifier`=@identifier AND `charid`=@charid AND `id`=@id;', params, function(result)
        end)
        TriggerClientEvent("vorp:TipRight", _source, Config.Texts.SoldBird..bdata.price, 10000) 
        Character.addCurrency(0 , tonumber(bdata.price))
end)
--------------------------------------------------------
RegisterServerEvent('huntingbirds:addxp')
AddEventHandler('huntingbirds:addxp', function(xp, id)
    local _source = source
    local _id = tonumber(id)
    local _xp = tonumber(xp)
    local Character = VorpCore.getUser(_source).getUsedCharacter
    local identifier = Character.identifier
    local charid = Character.charIdentifier
   
    exports.oxmysql:execute('SELECT * FROM birds WHERE `identifier`=@identifier AND `charid`=@charid AND `id`=@id;', {identifier = identifier, id = _id, charid = charid}, function(result)
        Citizen.Wait(100)
        while not result[1] do
            Citizen.Wait(1)
        end
        while not result[1].xp do
            Citizen.Wait(1)
        end
        local newxp = result[1].xp + _xp
        if newxp > Config.MaxBirdXP then
            newxp = Config.MaxBirdXP
        end
        local Parameters = { ['identifier'] = identifier, ['charid'] = charid, ['id'] = _id}
		exports.oxmysql:execute("UPDATE birds SET xp ='"..newxp.."' WHERE identifier = @identifier AND charid = @charid AND id=@id", Parameters)              
    end)            
    
end)
--------------------------------------------------------
RegisterServerEvent('huntingbirds:addscavengeditem')
AddEventHandler('huntingbirds:addscavengeditem', function(name, am)
    local _source = source
    local _name = tostring(name)
    local amount = tonumber(am)
    VorpInv.addItem(_source, _name, amount)
    local label = Config.ItemLabels[_name] or _name
    TriggerClientEvent("vorp:TipRight", _source, Config.Texts.FoundScavItem.." ("..label..")", 10000) 
end)
--------------------------------------------------------
RegisterServerEvent("huntingbirds:sell:create")
AddEventHandler("huntingbirds:sell:create", function(id, price, coords, pid, pedid)
	local _source = source
    local _id = tonumber(id)
    local Character = VorpCore.getUser(_source).getUsedCharacter
    local identifier = Character.identifier
    local charid = Character.charIdentifier
        exports.oxmysql:execute("SELECT * FROM birds WHERE identifier=@identifier AND charid=@charid AND id=@id", { ['@identifier'] = identifier, ['@charid'] = charid, ['@id'] = tonumber(id) }, function(result)
            while not result do
                Citizen.Wait(1)
            end
            while not result[1] do
                Citizen.Wait(1)
            end
            if result[1] then
                SellPoints[_id] = result[1]
                SellPoints[_id].identifier = nil
                SellPoints[_id].charid = nil
                SellPoints[_id].sellprice = tonumber(price)
                SellPoints[_id].owner = _source
                SellPoints[_id].sellcoords = coords
                SellPoints[_id].pedid = tonumber(pedid)
                TriggerClientEvent("huntingbirds:sell:updatepoints", -1, SellPoints[_id], _id, nil)
            end
        end)  
end)
--------------------------------------------------------
RegisterServerEvent("huntingbirds:sell:stop")
AddEventHandler("huntingbirds:sell:stop", function(id)
	local _source = source
    local _id = tonumber(id)
    SellPoints[_id] = nil
    TriggerClientEvent("huntingbirds:sell:updatepoints1", -1, _id)
end)
--------------------------------------------------------
RegisterServerEvent("huntingbirds:sell:buyoffer")
AddEventHandler("huntingbirds:sell:buyoffer", function(_owner, _price, _id)
	local _source = source
    local owner = tonumber(_owner)
    local price = tonumber(_price)
    local horseid = tonumber(_id)
    local tidenti 
    local tcharid
    local oidenti
    local ocharid
    local cango = false
    local tCharacter = VorpCore.getUser(_source).getUsedCharacter
    local tidenti = tCharacter.identifier
    local tcharid = tCharacter.charIdentifier
        if tCharacter.money < price then
            TriggerClientEvent("vorp:TipRight", _source, Config.Texts.PlayerBuyNoMoney, 10000) 
            TriggerClientEvent("vorp:TipRight", owner, Config.Texts.PlayerBuyNoMoneyAtBuyer, 10000) 
            cango = false
            return
        else
            cango = true
        end
        if cango == true then
            TriggerClientEvent("vorp:TipRight", _source, Config.Texts.PlayerBoughtBird, 10000) 
            tCharacter.removeCurrency(0, price)
        end
    if cango == true then
        local oCharacter = VorpCore.getUser(owner).getUsedCharacter
        local oidenti = oCharacter.identifier
        local ocharid = oCharacter.charIdentifier
        TriggerClientEvent("vorp:TipRight", owner, Config.Texts.PlayerSoldBird, 10000) 
        oCharacter.addCurrency(0, price)
        local params2 = { ['oidenti'] = oidenti, ['ocharid'] = ocharid,  ['id'] = horseid, ['tcharid'] = tcharid, ['tidenti'] = tidenti}
        Citizen.Wait(100)
        while params2.tidenti == nil do
            Citizen.Wait(1)
        end

        exports.oxmysql:execute("UPDATE birds SET identifier=@tidenti, charid=@tcharid WHERE identifier=@oidenti AND charid=@ocharid AND id=@id", params2, function(done)
            while done ~= 1 do
                Citizen.Wait(1)
            end
        end)

        TriggerClientEvent("huntingbirds:sell:updatepoints1", -1, horseid)
        TriggerClientEvent("huntingbirds:sell:finishsell", owner)
    end

end)
--------------------------------------------------------
RegisterServerEvent("huntingbirds:sell:getpoints")
AddEventHandler("huntingbirds:sell:getpoints", function()
	TriggerClientEvent("huntingbirds:sell:gotpoints_c", source, SellPoints)
end)