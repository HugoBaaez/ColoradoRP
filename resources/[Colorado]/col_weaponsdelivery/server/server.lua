local VORP_INV = exports.vorp_inventory:vorp_inventoryApi()
TriggerEvent("getCore",function(core)
    VorpCore = core
end)

RegisterServerEvent("weapons_delivery:sellitems")
AddEventHandler("weapons_delivery:sellitems", function(itemName, itemLabel, weaponId, money, type, playerId)
    local _source = source
    local player = VorpCore.getUser(_source).getUsedCharacter
    local job = player.job
    local grade = player.jobGrade
    local playername = player.firstname.. ' ' ..player.lastname
    sellItems(itemName, itemLabel, weaponId, money, type, playerId)
end)

function sellItems(itemName, itemLabel, weaponId, money, type, playerId)
    local _source = source
    local player = VorpCore.getUser(_source).getUsedCharacter
    local inventory = VORP_INV.getUserInventory(_source)
    local itemCount = 0;
    if type == 'weapon' then
        local weaponsPlayer = VORP_INV.getUserWeapons(playerId) --getloadoutcharweapons
        for key, value in pairs(weaponsPlayer) do
            local id = tonumber(value.id)
            if itemName == value.name then
                itemCount = itemCount + 1
                VORP_INV.subWeapon(_source, value.id)
                VORP_INV.deletegun(_source, value.id)
            end
        end
        if itemCount == 0 then
            TriggerClientEvent('vorp:TipRight', _source, 'Você não tem a arma solicitada', 3000)
        else
            player.addCurrency(0, money*itemCount)
            TriggerClientEvent('vorp:TipRight', _source, 'Você vendeu '..itemCount..' '..itemLabel..' por '..money*itemCount..'$', 3000)
        end
    elseif type == 'item' then
        for i, item in ipairs(inventory) do
            if itemName == item.name then
                itemCount = item.count;
            end
        end
        if itemCount == 0 then
            TriggerClientEvent('vorp:TipRight', _source, 'Você não tem o item solicitado', 3000)
        else
            VORP_INV.subItem(_source, itemName, itemCount)
            player.addCurrency(0, money*itemCount)
            TriggerClientEvent('vorp:TipRight', _source, 'Você vendeu '..itemCount..' '..itemLabel..' por '..money*itemCount..'$', 3000)
        end
    end
end

-------------------------------------------
RegisterServerEvent("weapons_delivery:getjob")
AddEventHandler("weapons_delivery:getjob", function()
  local _source = source
  local User = VorpCore.getUser(_source)
  local Character = User.getUsedCharacter
  local job = Character.job
  local rank = Character.jobGrade
  TriggerClientEvent("weapons_delivery:findjob", _source,job,rank)
end)

-----------------------

RegisterServerEvent("weapons_delivery:announce", function(announce)
    local _source = source
    TriggerClientEvent('vorp:ShowTopNotification', _source, 'Governo Informa', announce, 10000)
end)