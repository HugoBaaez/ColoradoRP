-- VORP = nil
local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

-- AddEventHandler('onServerResourceStart', function (resourceName)
--     if GetCurrentResourceName() == resourceName then
--         VORP = exports.vorp_core:vorpAPI()
--     end
-- end)

Config = {}

function sv_notifyme(ID, title, message, timer, display)
    if display then
        TriggerClientEvent('f_notify:sendNotification', ID, message)
    end
end

function cl_notifyme(title, message, timer, display)
    if display then
        TriggerEvent('f_notify:sendNotification', message)
    end
end

function get_playerName(ID)
    local player = VorpCore.getUser(ID).getUsedCharacter
    local name = player.firstname and player.lastname and
    tostring(player.firstname).." "..tostring(player.lastname) or
    GetPlayerName(ID)
    return name
end

function get_playerMoney(ID, money)
    local result = VorpCore.getUser(ID).getUsedCharacter.money
    return money <= result and true or false
end

function set_playerMoney(case, ID, money) --case01 = 'add', case02 = 'sub'
    local player = VorpCore.getUser(ID).getUsedCharacter
    player[case == 'add' and 'addCurrency' or 'removeCurrency'](0, money)
end

function set_playerSave(ID, money)
    local identifier = VorpCore.getUser(ID).getUsedCharacter.charIdentifier
    exports['ghmattimysql']:execute("UPDATE characters SET money=@money WHERE charidentifier=@charidentifier",
    {
        ['@charidentifier'] = identifier,
        ['@money'] = string.format("%.2f", money)
    })
end

--//////////////////////////////////////////////////////////////////////////////////////////////////////
Config.tables = {
--[[
    Here you can set as many poker tables as you want.
    These label keys can be visible in the UI (underscores will be removed automatically by the script)
    ex. \ Saint_Denis = \ will output "Saint Denis"

    vector -> coordinates of the poker table prop
    table -> the name of the poker table object
    charis -> the name of the poker table chair objects
    deck -> sleeve choices below:
    (any wrong input will revert back to default)
   ------------
    default
    blackwater
    camp
    guarma
    newhanover
    rhodes
    station
    saintdenis
    illegal
    valentine
    vanhorn
   ------------
]]

    Valentine   = {
        vector = vector3(-304.53515625, 801.1351928710938, 117.97854614257812),
        table  = 'p_tablepoker01x',
        chairs = 'p_windsorchair03x',
        deck   = 'valentine',
        offset = 18.5
    },
    Blackwater  = {
        vector = vector3(-813.2147827148438 -1316.54736328125 42.67874908447265),
        table  = 'p_tablepoker01x',
        chairs = 'p_windsorchair03x',
        deck   = 'default',
        offset = 0.5
    },
    Armadillo  = {
        vector = vector3(-3649.59, -2549.46, -13.72),
        table  = 'p_tablepoker01x',
        chairs = 'p_windsorchair03x',
        deck   = 'default',
        offset = 0.5
    },
}
--//////////////////////////////////////////////////////////////////////////////////////////////////////

Config.logo_large = true
Config.render = false

Citizen.CreateThread(function ()
    while not render do
        Wait(0)
    end
    Config.render = true
    Config.prompts = { --holdMs = 1500 is default | call and check share the same prompt
        call_check = { text = render.call,  action = 0xC7B5340A, hold = true,  holdMs = 550, },
        leave      = { text = render.leave, action = 0xDE794E3E, hold = true,  holdMs = nil, },
        start      = { text = render.start, action = 0xCEFD9220, hold = true,  holdMs = nil, },
        raise      = { text = render.raise, action = 0xE30CD707, hold = false, holdMs = nil, },
        allin      = { text = render.allin, action = 0x6319DB71, hold = true,  holdMs = nil, },
        fold       = { text = render.fold,  action = 0xD27782E3, hold = true,  holdMs = nil, },
        join       = { text = render.tJoin, action = 0xCEFD9220, hold = true,  holdMs = nil, },
    }
end)

Config.input_placeholder = false

------------------------------------------------
--How long to wait after the end round results
--in MS and minimum 5000 (5 seconds) by script
Config.endRound = 10000
------------------------------------------------

---------------------------------
--Cards in front of the player will be the actual prop card instead of an empty card
--Recommended FALSE to avoid abusers from seeing through objects
Config.enable_trueCards = false
---------------------------------

Config.chips = { --will determine the amount of visible stack of chips next to the player based on player's current money
    large = 1000, medium = 500, --below medium will be the smallest prop
}

Config.pot = { --same concept with chips but for pot props
    large = 600, medium = 300, --below medium will be the smallest prop
}

Config.win_pot = { --same concept with chips but for pot props
    large = 1000, medium = 500, small = 100 --below small will be the smallest prop
}

Config.loss_pot = { --same concept with chips but for pot props
    large = 1000, medium = 500 --below medium will be the smallest prop
}