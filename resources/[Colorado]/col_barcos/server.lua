local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

RegisterServerEvent('elrp:buyboat')
AddEventHandler( 'elrp:buyboat', function ( args )

    local _src   = source
    local _price = args['Preço']
    local _level = args['Level']
    local _model = args['Modelo']

    local User = VorpCore.getUser(_src) 
    local Character = User.getUsedCharacter

    u_identifier = Character.identifier
        --u_level = Character.getLevel()
    u_charid = 0
    u_money = Character.money

    if u_money <= _price then
        TriggerClientEvent( 'UI:DrawNotification', _src, Config.NoMoney )
        return
    end


    TriggerEvent("vorp:removeMoney", _src, 0, _price)

    exports.oxmysql:execute( "SELECT * FROM boates WHERE identifier = @identifier AND charid = @charid ", {
        ['identifier'] = u_identifier,
        ['charid'] = 0
    }, function(result)
        if #result > 0 then
            local Parameters = { ['identifier'] = u_identifier, ['charid'] = u_charid, ['boat'] = _model }
            exports.oxmysql:executeSync("UPDATE boates SET boat = @boat WHERE identifier = @identifier AND charid = @charid ", Parameters)
            TriggerClientEvent( 'UI:DrawNotification', _src, 'Você comprou um novo barco!' )
        else
            local Parameters = { ['identifier'] = u_identifier, ['charid'] = u_charid, ['boat'] = _model }
            exports.oxmysql:executeSync("INSERT INTO boates ( `identifier`, `charid`, `boat` ) VALUES ( @identifier, @charid, @boat )", Parameters)
            TriggerClientEvent( 'UI:DrawNotification', _src, 'Você comprou um novo barco!' )
        end
    end)

end)

RegisterServerEvent( 'elrp:dropboat' )
AddEventHandler( 'elrp:dropboat', function ( )

    local _source = source

    local User = VorpCore.getUser(_source) 
    local Character = User.getUsedCharacter       
    u_identifier = Character.identifier
    u_charid = 0

    local Parameters = { ['identifier'] = u_identifier, ['charid'] = u_charid }
    local HasBoates = exports.oxmysql:executeSync( "SELECT * FROM boates WHERE identifier = @identifier AND charid = @charid ", Parameters )
     
    --if HasBoates ~= nil then  
    if HasBoates[1] then
        local boat = HasBoates[1].boat
        TriggerClientEvent("elrp:spawnBoat", _source, boat)
    end
--end

end )
