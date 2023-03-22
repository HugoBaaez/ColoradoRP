--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

 -- ==== Will be used in a later update ==== --
 -- Keep an eye on Github for future updates! --

--------------------------------------------------------------------------------
VorpInv = exports.vorp_inventory:vorp_inventoryApi()
local VorpCore = {}
TriggerEvent("getCore", function(core) VorpCore = core end)
-- VORP = exports.vorp_core:vorpAPI()
-- --------------------------------------------------------------------------------
-- -- Event Register
-- RegisterServerEvent('DevDokus:Metabolism:S:StartStatus')
-- --------------------------------------------------------------------------------
-- AddEventHandler('DevDokus:Metabolism:S:StartStatus', function()
--   if VorpCore ~= nil then
--     TriggerEvent("vorp:getCharacter", source, function(Data)
--       Ident = Data.identifier
--       exports.oxmysql:execute("Select * from `characters` where `identifier` = @ident", {
--         ['@ident'] = Ident
--       }, function(cb)
--         if cb[1] ~= nil then
--           local Status = json.decode(cb[1].status)
--           TriggerClientEvent('DevDokus:Metabolism:C:SetFirstStatus', -1, Status)
--         end
--       end)
--     end)
--   end
-- end)
--
Citizen.CreateThread(function()
	Citizen.Wait(2000)
    VorpInv.RegisterUsableItem("pao", function(data)
        VorpInv.subItem(data.source, "pao", 1)
        VorpInv.CloseInv(data.source)
        local prop = "p_bread05x"
        local valor = 10
        TriggerClientEvent('metabolism:ativar', data.source, prop, valor)
    end)
    VorpInv.RegisterUsableItem("ensopadocarne", function(data)
        VorpInv.subItem(data.source, "ensopadocarne", 1)
        VorpInv.CloseInv(data.source)
        local valor = 50
        local valor2 = 10
        TriggerClientEvent('metabolism:Ensopado', data.source, valor, valor2)
    end)
    VorpInv.RegisterUsableItem("caldodepeixe", function(data)
        VorpInv.subItem(data.source, "caldodepeixe", 1)
        VorpInv.CloseInv(data.source)
        local valor = 50
        local valor2 = 30
        TriggerClientEvent('metabolism:Ensopado', data.source, valor, valor2)
    end)
    VorpInv.RegisterUsableItem("batatacomL", function(data)
        VorpInv.subItem(data.source, "batatacomL", 1)
        VorpInv.CloseInv(data.source)
        local valor = 100
        local valor2 = 0
        TriggerClientEvent('metabolism:Ensopado', data.source, valor, valor2)
    end)
    VorpInv.RegisterUsableItem("tortadecarne", function(data)
        VorpInv.subItem(data.source, "tortadecarne", 1)
        VorpInv.CloseInv(data.source)
        local valor = 100
        local valor2 = 0
        TriggerClientEvent('metabolism:Ensopado', data.source, valor, valor2)
    end)
    VorpInv.RegisterUsableItem("bistecaMilho", function(data)
        VorpInv.subItem(data.source, "bistecaMilho", 1)
        VorpInv.CloseInv(data.source)
        local valor = 80
        local valor2 = 10
        TriggerClientEvent('metabolism:Ensopado', data.source, valor, valor2)
    end)
    VorpInv.RegisterUsableItem("peixebtt", function(data)
        VorpInv.subItem(data.source, "peixebtt", 1)
        VorpInv.CloseInv(data.source)
        local valor = 100
        local valor2 = 0
        TriggerClientEvent('metabolism:Ensopado', data.source, valor, valor2)
    end)
    VorpInv.RegisterUsableItem("biscoito", function(data)
        VorpInv.subItem(data.source, "biscoito", 1)
        VorpInv.CloseInv(data.source)
        local prop = "p_biscuits02x"
        local valor = 15
        TriggerClientEvent('metabolism:ativar', data.source, prop, valor)
    end)
    VorpInv.RegisterUsableItem("salmao_enlatado", function(data)
        VorpInv.subItem(data.source, "salmao_enlatado", 1)
        VorpInv.CloseInv(data.source)
        local prop = "s_canbeans01x"
        local valor = 30
        TriggerClientEvent('metabolism:ativar', data.source, prop, valor)
    end)
    VorpInv.RegisterUsableItem("feijaoenlatado", function(data)
        VorpInv.subItem(data.source, "feijaoenlatado", 1)
        VorpInv.CloseInv(data.source)
        local prop = "s_canbeans01x"
        local valor = 30
        TriggerClientEvent('metabolism:ativar', data.source, prop, valor)
    end)
    VorpInv.RegisterUsableItem("maca", function(data)
        VorpInv.subItem(data.source, "maca", 1)
        VorpInv.CloseInv(data.source)
        local prop = "s_bit_apple01x"
        local valor = 10
        TriggerClientEvent('metabolism:ativar', data.source, prop, valor)
    end)
    VorpInv.RegisterUsableItem("tomate", function(data)
        VorpInv.subItem(data.source, "tomate", 1)
        VorpInv.CloseInv(data.source)
        local prop = "s_bit_apple01x"
        local valor = 5
        TriggerClientEvent('metabolism:ativar', data.source, prop, valor)
    end)
    VorpInv.RegisterUsableItem("cenoura", function(data)
        VorpInv.subItem(data.source, "cenoura", 1)
        VorpInv.CloseInv(data.source)
        local prop = "p_carrot01x"
        local valor = 5
        TriggerClientEvent('metabolism:ativar', data.source, prop, valor)
    end)
    VorpInv.RegisterUsableItem("javali_consumivel", function(data)
        VorpInv.subItem(data.source, "javali_consumivel", 1)
        VorpInv.CloseInv(data.source)
        local prop = "p_redefleshymeat01xb"
        local valor = 30
        TriggerClientEvent('metabolism:ativar', data.source, prop, valor)
    end)
    VorpInv.RegisterUsableItem("peru_consumivel", function(data)
        VorpInv.subItem(data.source, "peru_consumivel", 1)
        VorpInv.CloseInv(data.source)
        local prop = "p_redefleshymeat01xb"
        local valor = 30
        TriggerClientEvent('metabolism:ativar', data.source, prop, valor)
    end)
    VorpInv.RegisterUsableItem("cervo_consumivel", function(data)
        VorpInv.subItem(data.source, "cervo_consumivel", 1)
        VorpInv.CloseInv(data.source)
        local prop = "p_redefleshymeat01xb"
        local valor = 30
        TriggerClientEvent('metabolism:ativar', data.source, prop, valor)
    end)
    VorpInv.RegisterUsableItem("alce_consumivel", function(data)
        VorpInv.subItem(data.source, "alce_consumivel", 1)
        VorpInv.CloseInv(data.source)
        local prop = "p_redefleshymeat01xb"
        local valor = 30
        TriggerClientEvent('metabolism:ativar', data.source, prop, valor)
    end)
    VorpInv.RegisterUsableItem("bluegill_consumivel", function(data)
        VorpInv.subItem(data.source, "bluegill_consumivel", 1)
        VorpInv.CloseInv(data.source)
        local prop = "p_redefleshymeat01xb"
        local valor = 30
        TriggerClientEvent('metabolism:ativar', data.source, prop, valor)
    end)
    VorpInv.RegisterUsableItem("cafe_consumivel", function(data)
        VorpInv.subItem(data.source, "cafe_consumivel", 1)
        VorpInv.CloseInv(data.source)
        TriggerClientEvent('metabolism:cafe', data.source)
    end)
    VorpInv.RegisterUsableItem("agua", function(data)
        VorpInv.subItem(data.source, "agua", 1)
        VorpInv.CloseInv(data.source)
        local prop = 'p_water01x'
        local valor = 15
        TriggerClientEvent('metabolism:beber', data.source, prop, valor)
    end)
    VorpInv.RegisterUsableItem("agua_consumivel", function(data)
        VorpInv.subItem(data.source, "agua_consumivel", 1)
        VorpInv.CloseInv(data.source)
        local prop = 'p_water01x'
        local valor = 20
        TriggerClientEvent('metabolism:beber', data.source, prop, valor)
    end)
    VorpInv.RegisterUsableItem("milk", function(data)
        VorpInv.subItem(data.source, "milk", 1)
        VorpInv.CloseInv(data.source)
        local prop = 'p_water01x'
        local valor = 80
        TriggerClientEvent('metabolism:beber', data.source, prop, valor)
    end)
    VorpInv.RegisterUsableItem("cha", function(data)
        VorpInv.subItem(data.source, "cha", 1)
        VorpInv.CloseInv(data.source)
        TriggerClientEvent('metabolism:cha', data.source)
    end)

    VorpInv.RegisterUsableItem("tonico_c1", function(data)
        VorpInv.subItem(data.source, "tonico_c1", 1)
        VorpInv.CloseInv(data.source)
        local valor = 50
        TriggerClientEvent('metabolism:Seringa', data.source, valor)
    end)
    VorpInv.RegisterUsableItem("tonico_c2", function(data)
        VorpInv.subItem(data.source, "tonico_c2", 1)
        VorpInv.CloseInv(data.source)
        local valor = 100
        TriggerClientEvent('metabolism:Seringa', data.source, valor)
    end)
    VorpInv.RegisterUsableItem("tonico_s1", function(data)
        VorpInv.subItem(data.source, "tonico_s1", 1)
        VorpInv.CloseInv(data.source)
        local valor = 50
        TriggerClientEvent('metabolism:Seringa2', data.source, valor)
    end)
    VorpInv.RegisterUsableItem("tonico_s2", function(data)
        VorpInv.subItem(data.source, "tonico_s2", 1)
        VorpInv.CloseInv(data.source)
        local valor = 100
        TriggerClientEvent('metabolism:Seringa2', data.source, valor)
    end)
    VorpInv.RegisterUsableItem("bolochocolate", function(data)
        VorpInv.subItem(data.source, "bolochocolate", 1)
        VorpInv.CloseInv(data.source)
        local prop = "p_crab_cakes01x"
        local valor = 30
        TriggerClientEvent('metabolism:ativar', data.source, prop, valor)
        Wait(7000)
        TriggerClientEvent('stress:modify', data.source, -50)
    end)
    VorpInv.RegisterUsableItem("bolocenoura", function(data)
        VorpInv.subItem(data.source, "bolocenoura", 1)
        VorpInv.CloseInv(data.source)
        local prop = "p_crab_cakes01x"
        local valor = 30
        TriggerClientEvent('metabolism:ativar', data.source, prop, valor)
        Wait(7000)
        TriggerClientEvent('stress:modify', data.source, -50)
    end)
    VorpInv.RegisterUsableItem("doceamora", function(data)
        VorpInv.subItem(data.source, "doceamora", 1)
        VorpInv.CloseInv(data.source)
        local prop = "p_cs_candy01x"
        local valor = 30
        TriggerClientEvent('metabolism:ativar', data.source, prop, valor)
        Wait(7000)
        TriggerClientEvent('stress:modify', data.source, -50)
    end)
    VorpInv.RegisterUsableItem("pirulito", function(data)
        VorpInv.subItem(data.source, "pirulito", 1)
        VorpInv.CloseInv(data.source)
        local prop = "p_cs_candy01x"
        local valor = 30
        TriggerClientEvent('metabolism:ativar', data.source, prop, valor)
        Wait(7000)
        TriggerClientEvent('stress:modify', data.source, -50)
    end)
    VorpInv.RegisterUsableItem("croa-pork", function(data)
        VorpInv.subItem(data.source, "croa-pork", 1)
        VorpInv.CloseInv(data.source)
        local prop = "p_crab_cakes01x"
        local valor = 30
        TriggerClientEvent('metabolism:ativar', data.source, prop, valor)
        Wait(7000)
        TriggerClientEvent('stress:modify', data.source, -50)
    end)
    VorpInv.RegisterUsableItem("croa-meat", function(data)
        VorpInv.subItem(data.source, "croa-meat", 1)
        VorpInv.CloseInv(data.source)
        local prop = "p_crab_cakes01x"
        local valor = 30
        TriggerClientEvent('metabolism:ativar', data.source, prop, valor)
        Wait(7000)
        TriggerClientEvent('stress:modify', data.source, -50)
    end)
    VorpInv.RegisterUsableItem("hotdog", function(data)
        VorpInv.subItem(data.source, "hotdog", 1)
        VorpInv.CloseInv(data.source)
        local prop = "p_crab_cakes01x"
        local valor = 30
        TriggerClientEvent('metabolism:ativar', data.source, prop, valor)
        Wait(7000)
        TriggerClientEvent('stress:modify', data.source, -50)
    end)
    VorpInv.RegisterUsableItem("shakeGroselha", function(data)
        VorpInv.subItem(data.source, "shakeGroselha", 1)
        VorpInv.CloseInv(data.source)
        local prop = 'p_water01x'
        local valor = 50
        TriggerClientEvent('metabolism:beber', data.source, prop, valor)
        Wait(7000)
        TriggerClientEvent('stress:modify', data.source, -50)
    end)
    VorpInv.RegisterUsableItem("shakeBeterraba", function(data)
        VorpInv.subItem(data.source, "shakeBeterraba", 1)
        VorpInv.CloseInv(data.source)
        local prop = 'p_water01x'
        local valor = 50
        TriggerClientEvent('metabolism:beber', data.source, prop, valor)
        Wait(7000)
        TriggerClientEvent('stress:modify', data.source, -50)
    end)
    VorpInv.RegisterUsableItem("sucoHortela", function(data)
        VorpInv.subItem(data.source, "sucoHortela", 1)
        VorpInv.CloseInv(data.source)
        local prop = 'p_water01x'
        local valor = 50
        TriggerClientEvent('metabolism:beber', data.source, prop, valor)
        Wait(7000)
        TriggerClientEvent('stress:modify', data.source, -50)
    end)
    VorpInv.RegisterUsableItem("sucoAmora", function(data)
        VorpInv.subItem(data.source, "sucoAmora", 1)
        VorpInv.CloseInv(data.source)
        local prop = 'p_water01x'
        local valor = 50
        TriggerClientEvent('metabolism:beber', data.source, prop, valor)
        Wait(7000)
        TriggerClientEvent('stress:modify', data.source, -50)
    end)
    VorpInv.RegisterUsableItem("sorvHotela", function(data)
        VorpInv.subItem(data.source, "sorvHotela", 1)
        VorpInv.CloseInv(data.source)
        local prop = "p_crab_cakes01x"
        local valor = 30
        TriggerClientEvent('metabolism:ativar', data.source, prop, valor)
        Wait(7000)
        TriggerClientEvent('stress:modify', data.source, -50)
    end)
    VorpInv.RegisterUsableItem("bchocolate", function(data)
        VorpInv.subItem(data.source, "bchocolate", 1)
        VorpInv.CloseInv(data.source)
        local prop = "p_crab_cakes01x"
        local valor = 30
        TriggerClientEvent('metabolism:ativar', data.source, prop, valor)
        Wait(7000)
        TriggerClientEvent('stress:modify', data.source, -50)
    end)
end)

--------------------------------------------------------------------------------
local stressList = {}
RegisterServerEvent('stress:share')
AddEventHandler('stress:share', function(value) 
    local _source = source
        for k,v in pairs(stressList) do 
            if _source == v.id then
                stressList[k].stress = value
                return
            end
        end
    table.insert(stressList, {id = _source, stress = value})
end)

RegisterServerEvent('stress:getStress')
AddEventHandler('stress:getStress', function(source, cb)
    for k,v in pairs(stressList) do
        if tonumber(source) == v.id then 
            cb(v.stress)
        end
    end
end)

RegisterServerEvent('stress:requestStress')
AddEventHandler('stress:requestStress', function() 
    local _source = source
    local User = VorpCore.getUser(_source)
    local Character = User.getUsedCharacter
    local identifier = Character.identifier

    exports.oxmysql:execute("SELECT stress FROM characters WHERE identifier = @id", 
    {
        ['@id'] = identifier,

    }, function(ret)
    --    print(ret[1].stress)
        TriggerClientEvent('stress:modify', _source, tonumber(ret[1].stress))
    end)
end)

AddEventHandler('playerDropped', function(reason) 
    local stress = 0
    local _source = source
    for k,v in pairs(stressList) do 
        if tonumber(source) == v.id then 
            stress = v.stress
            table.remove(stressList, k)
        end
    end

    local steamid
	for k,v in pairs(GetPlayerIdentifiers(_source)) do
			
		if string.sub(v, 1, string.len("steam:")) == "steam:" then
			steamid = v
		end
    end
    print('save stress', _source, stress)
    exports.oxmysql:execute("UPDATE characters SET stress = @stress WHERE identifier = @id", 
    {
        ['@stress'] = stress,
        ['@id'] = steamid,
    })

end)