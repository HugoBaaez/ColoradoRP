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

---------------------------------------------------------------------------
--[[
    You can trigger different events when a players sits/leaves in a table
    toggle = true  | means the player just sat in the table
    toggle = false | means the player just left the table
    [This function is client side only]
]]
function cl_isPlaying(toggle)
    if toggle then
        --add code
    else
        --add code
    end
end
---------------------------------------------------------------------------

------------------------------------------------------------------------------------------
Config.command = {
    name = '',   --leaving it empty or not string the command will not activate
    ace  = false --for ace permission only 
}
--[[
    New Admin Feature, in order to reset poker tables live
    with a simple command, ` /command Valentine ` will reset the appropriate poker table
    [This function is client side only]
]]
function get_resetCommand(ID, arguments)
    -- arguments are an array of strings. /command hello world -> arguments[1] == 'hello' arguments[2] == 'world'
    if type(arguments[1]) == 'string' and VorpCore.getUser(ID).getUsedCharacter.group == 'admin' then
        post_manualReset(arguments[1])
    end
end
------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------
--[[
    This a logger function, it sents out different cases for you to record.
    [This function is server side only]
        [number] ID   -> the player's server id

        [string] case -> with this you can determine which URL, title and description will be posted

        [table]  data -> this is the main value you want to keep a track
        data.money - contains the remaining money of player
        data.bet   - contains the bet values [Supported by CASES: bet]
        data.won   - contains the win values [Supported by CASES: won]
        data.lost  - contains the loss values [Supported by CASES: lost]

        [string] poker_table -> where the event took place

        [string] reason -> Which event the player triggered
        Buy-In | Big Blind | Small Blind | Raised | Called | All-In | Left | Won | Lost
        -You can use these for extra cases for translation or extra information inside your webhook json

        CASES:
        buy-in | bet | left | dropped | 
]]
function post_log(ID, case, data, poker_table, reason)
    
    -----------------------
    --REMOVE ME IF USE
    if true then return end
    -----------------------

    local URL, title, desc, steam = "", "", "", GetPlayerIdentifier(ID, 0)
    if case == 'buy-in' then
        -- URL   = "" --based on poker_tables ? unique url : action unique url
        title = ""
        desc  = reason.."\n"..steam.."\n@"..poker_table.."\n$"..tostring(data.money) --example
    elseif case == 'bet' then
        -- URL   = "" --based on poker_tables ? unique url : action unique url
        title = ""
        desc  = reason.."\n"..steam.."\n@"..poker_table.."\nBet - $"..tostring(data.bet).."\nRemaining - $"..tostring(data.money) --example
    elseif case == 'left' then
        URL   = ""
        title = ""
        desc  = reason.."\n"..steam.."\n@"..poker_table.."\nMoney that player should receive for leaving: $"..tostring(data.money) --example
    elseif case == 'dropped' then
        -- URL   = "" --based on poker_tables ? unique url : action unique url
        title = ""
        --reason = the playerdrop event reason
        desc  = reason.."\n"..steam.."\n@"..poker_table.."\nMoney that player should receive for leaving: $"..tostring(data.money) --example
    elseif case == 'won' then
        -- URL   = "" --based on poker_tables ? unique url : action unique url
        title = ""
        desc  = reason.."\n"..steam.."\n@"..poker_table.."\nWon - $"..tostring(data.won).."\nRemaining - $"..tostring(data.money) --example
    elseif case == 'lost' then
        -- URL   = "" --based on poker_tables ? unique url : action unique url
        title = ""
        desc  = reason.."\n"..steam.."\n@"..poker_table.."\nLost - $"..tostring(data.lost).."\nRemaining - $"..tostring(data.money) --example
    end
    --This is a raw post request example to your webhook.
    -- PerformHttpRequest(URL, function(err, text, headers) end, 'POST', json.encode({
    --     username = "Poker - Webhook",
    --     avatar_url = "",
    --     embeds = {
    --         {
    --             ["author"] = {
    --                 ["name"] = "",
    --                 ["icon_url"] = ""
    --             },
    --             ["title"] = title,
    --             ["url"] = "https://discord.com/api/webhooks/1087397333597167636/nfc9B9Fv2L4df61mLscg46wbaW2P8C7cnegsHGRZycZCJ_XyeU-YoTruE9CAu_lHB4fk",
    --             ["description"] = desc,
    --             ["color"] = 00000000,
    --             ["fields"] = {
    --                 {
    --                     ["name"] = "",
    --                     ["value"] = "",
    --                     ["inline"] = true
    --                 },
    --                 {
    --                     ["name"] = "",
    --                     ["value"] = ""
    --                 },
    --             },
    --             ["thumbnail"] = {
    --                 ["url"] = ""
    --             },
    --             ["image"] = {
    --                 ["url"] = ""
    --             },
    --             ["footer"] = {
    --                 ["text"] = ""..os.date("!%c"),
    --                 ["icon_url"] = ""
    --             },
    --         },

    --     },
    -- }), { ['Content-Type'] = 'application/json' })
end
---------------------------------------------------------------------------------------------------------

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
    offset -> is a degree value ranging from 0.0 to 360.0 this means you can rotate props around the table
    to fit them appropriately in table seats for custom tables
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
        --multi_chair = true --This enables multiple chair models the chair key must be changed to an array of string
        --chairs = { 'p_windsorchair03x', 'p_chair14x' }
        deck   = 'valentine',
        offset = 18.5
    },
    Blackwater  = {
        vector = vector3(-813.2147827148438, -1316.54736328125, 42.67874908447265),
        table  = 'p_tablepoker01x',
        chairs = 'p_windsorchair03x',
        deck   = 'default',
        offset = 0.5
    },
    Armadillo = {
        vector = vector3(-3650.14990234375, -2549.889892578125, -15.1037540435791),
        table  = 'p_tablepoker01x',
        chairs = 'p_windsorchair03x',
        deck   = 'default',
        offset = 0.5
    }
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