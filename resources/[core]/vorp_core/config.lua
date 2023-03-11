--=============================================================================--
--========================= VORP SHARED CONFIG ================================--


Config = {

    autoUpdateDB = true,
    PrintPlayerInfoOnLeave = false, -- print in server console information of players leaving
    PrintPlayerInfoOnEnter = false, -- print player info on server console when enter server
    --======================== STARTING POINT ===========================--

    initGold     = 0.0,
    initMoney    = 15.0,
    initRol      = 0.0,
    initXp       = 0,
    initJob      = "unemployed", -- leave it like this
    initJobGrade = 0, -- leave it like this
    initGroup    = "user", -- leave it like this

    Whitelist                = false, -- dont use
    AllowWhitelistAutoUpdate = false, -- dont use
    SavePlayersStatus        = false, -- save players health stamina inner and outter core to DB?

    maxHealth             = 4, -- 10 is FULL 0 IS EMPTY define max outer core for players
    maxStamina            = 4, -- 10 is FULL 0 IS EMPTY define max outer core for players
    PVP                   = true, -- Can players attack/hurt one another
    PVPToggle             = false, -- If true, players can set their own pvp state
    savePlayersTimer      = 10, -- this will tell the core in how many minutes should all players be saved to the database
    showplayerIDwhenfocus = true, -- set false will show steam name when focus on another player RMB
    disableAutoAIM        = true, -- if false players with controllers will have autoaim just like in rdr2
    SavePlayersHours      = true, -- if you want to save players played hours in DB, tx admin already have this

    --=========================== MULTICHAR ==============================--
    SaveSteamNameDB   = true, -- TRUE if you want save steamname on character DB when player drop (need to update SQL)
    UseCharPermission = true, --| if false it will let players create maxchars bellow
    MaxCharacters     = 2, --MAX ALLOWED TO BE CREATED [if UseCharPermission = true, SELECTED players(with command) can create MaxCharacters characters / if UseCharPermission = false, players can create MaxCharacters characters]

    --=========================== UI CORES ==================================--
    -- disable
    HideOnlyDEADEYE = true,
    HidePlayersCore = true,
    HideHorseCores = false,

    --=========================== WEBHOOKS ==================================--

    webhookColor = 16711680, --EMBED COLOR
    name         = "VORP", --NAME OF EMBED
    logo         = "https://via.placeholder.com/30x30", --HEAD LOGO
    footerLogo   = "https://via.placeholder.com/30x30", --FOOTER LOGO
    Avatar       = "https://via.placeholder.com/30x30", -- AVATAR LOGO


    -- delete what you dont want
    Logs = {
        SetgroupWebhook   = "https://discord.com/api/webhooks/987936613755670568/Vig796zGjyCtHJwWHeY1e64fCKjVqJTwx3pBHf_YrNh9oK7tqpHc4ruftjFQ03HQAv9c", --
        SetjobWebhook     = "https://discord.com/api/webhooks/987936754323566592/T1EQPL8o3llumo7vu5zfeETzxsTEqeEH7oiV-Es9bQ9Cj-GcSh7ac1R3dRFyyfLneD2r", --
        AddmoneyWebhook   = "https://discord.com/api/webhooks/987936885609476118/tJI4juTNGqyQ8wPjFiVGM4Lqg8ZAGKX-mthLrVVu_UQ9WJq3YVcvaPlBJlzqXd-Sr6JY", --ADDMONEY
        DelMoneyWebhook   = "", --DELMONEY
        AddItemsWebhook   = "https://discord.com/api/webhooks/987936251573317732/1LXQK0PBVfBIpceumpwSUTXXBueja2NqaTEDGU1dsuaUQmJrkW-EOrk9KzKLpdKjPIek", --ADDITEMS
        AddWeaponsWebhook = "https://discord.com/api/webhooks/987936468926332978/imipbB8pIe4iq0f9xRIauw8UzWMGO3dkf0FcYOV6N22HZsHiROCwTtU6NuvH19jUzxsJ", --ADDWEAPONS
        DelWagonsWebhook  = "", --DELWAGONS
        TpmWebhook        = "", --TPM
        DelHorseWebhook   = "", --DELHORSE
        HealPlayerWebhook = "", --HEALPLAYER
        ReviveWebhook     = "", --REVIVE
        WhitelistWebhook  = "https://discord.com/api/webhooks/988717784903086100/BDbrfirdksinSbDykHYWf50tyzA_7WCWcJlPEyj8Ce8PXIsuu1VMtngEhgEZ89j8nf4A", --WHITELIST
        BanWarnWebhook    = "https://discord.com/api/webhooks/988717348527685663/EttEbUwhq8sorNhdxm1vHV-5iNKC7iOUrbUuslDBgmZOccSQPeDmEtDbBnSWi3ZAmDy8", --BANS/WARNS
        NewPlayerWebhook  = "https://discord.com/api/webhooks/988717690044678174/zv54M0VR6LvLnvVOwHGcIjAPNtGBinT6fs1zW1qSh-rUvhP_v75g_rDO4fNzsb0lubme", --NEWPLAYER
        CharPermWebhook   = "https://discord.com/api/webhooks/990799013865484308/1WsKxYKP_JLPE7KXejig0RHlxHQvSQ0TiYhPCe__knLykok69jmaOULo8nDKw6e6MuCx", --CHARPERMS
        ChangeNameWebhook = "", -- CHANGECHARNAMES
    },

    ------------------------------------------------------------------------------
    ------------------------- UI Configurations ----------------------------------
    HideUi         = true, -- Show or Hide the Overall UI
    HideGold       = true, --disables Gold UI for all
    HideMoney      = true, --disables Money UI for all
    HideLevel      = true, --disables Level UI for all
    HideID         = true, --disables ID UI for all
    HideTokens     = true, --disables Token UI for all
    HidePVP        = true, --disables PVP UI for all
    UIPosition     = 'TopRight', -- Changes position of UI. Options: BottomRight, MiddleRight, TopRight, TopMiddle, BottomMiddle
    UILayout       = 'Column', -- Changes the layour of the UI. Options: Row, Column
    HideWithRader  = true, -- UI will hide whenever the radar(minimap) is hidden
    OpenAfterRader = true, -- UI will show whenever the radar(minimap) is showing again
    CloseOnDelay   = false, -- UI will automatically close after an amount of time
    CloseOnDelayMS = 10000, -- CloseOnDelays time in miliseconds, 10000 = 10seconds

    ------------------------------------------------------------------------------
    ------------------------- MAP Configurations ----------------------------------
    mapTypeOnFoot     = 0, -- 0 = Off(no radar), 1 = Regular 2 = Expanded  3 = Simple(compass), for on foot
    mapTypeOnMount    = 1, -- 0 = Off(no radar), 1 = Regular 2 = Expanded  3 = Simple(compass), for on horse
    enableTypeRadar   = true, --- if true the above will work, if false players can choose their radar type in the game settings.
    Loadinscreen      = true, --ENABLE LOADING SCREENS on spawn and while spawn dead
    LoadinScreenTimer = 10000, -- miliseconds

    -------------------------------------------------------------------------------
    ------------------------------- RESPAWN ---------------------------------------

    HealthOnRespawn = 500, --Player's health when respawned in hospital (MAX = 500)
    HealthOnResurrection = 100, --Player's health when resurrected (MAX = 500)
    RagdollOnResurrection = true, -- Enable or disable Ragdoll and revive effects when revived
    --CanBeDamagedToSpawn = false, -- The player can take damage while spawning
    HealthRecharge = { enable = true, multiplier = 0.37 }, -- enable or disable auto recharge of health outer core (real ped health), multiplier 1.0 is default
    StaminaRecharge = { enable = true, multiplier = 0.4 }, -- enable or disable auto recharge of stamina outer core, multiplier 1.0 is default
    RespawnTime = 300, --seconds
    RespawnKey = 0xDFF812F9, --[E] KEY
    RespawnKeyTime = 5000, -- Milliseconds it will take to press the button
    CombatLogDeath = true, -- people who combat log now spawn in dead rather than force spawned
    --sprite = true, --- enable text with sprite or disable
    -- spriteColor = { r = 100, g = 1, b = 1 }, -- sprite rgb color
    UseControlsCamera = false, -- if youset this to true players while dead  or being carried can move the camera using w a d s controls this is resource intensive leave to false
    UseDeathHandler = true, -- levae this to true if you dont know what you doing . this is to disable the death handling incase you have something custom

    Hospitals = {
        Valentine = {
            name = "Valentine",
            pos = vector4(-283.83, 806.4, 119.38, 321.76), -- use vorp admin to get vector4 x y z h
        },
        SaintDenis = {
            name = "Saint Denis",
            pos = vector4(2721.4562, -1446.0975, 46.2303, 321.76),

        },
        Armadillo = {
            name = "Armadillo",
            pos = vector4(-3742.5, -2600.9, -13.23, 321.76),

        },
        Blackwater = {
            name = "Black water",
            pos = vector4(-723.9527, -1242.8358, 44.7341, 321.76),

        },
        Rhodes = {
            name = "Rhodes",
            pos = vector4(1229.0, -1306.1, 76.9, 321.76),

        },
    },
    -----------------------------------------------------------------------------

    ActiveEagleEye = false,
    ActiveDeadEye = false,
    TimeZoneDifference = -3, -- Your time zone difference with UTC in winter time

    ----------------------------------------------------------------------------
    --------------------------- COMMAND PERMISSION -----------------------------
    SetUserDBadmin = false, -- should the command addGroup set admins on Users table? for characters table do set false
    SetBothDBadmin = true, -- if set true should the command addGroup set admins on both table!
    GroupAllowed = { "admin" }, -- add here groups
    -- dont change this unless you change them in sv_commands too
    Commands = { "addGroup", "addJob", "addItems", "addWeapons", "addMoney", "delMoney", "healplayer",
        "reviveplayer", "tpm", "delhorse", "delwagons", "addchar", "banplayer", "wlplayer", "unwlplayer", "warn",
        "unban", "unwarn", "changeCharName", "tpp", "tpcds", }, -- commands available

    --------------------------------------------------------------------------------------
    -----------------------------BUILT IN RICH PRESENCE DISCORD --------------------------
    maxplayers = 250, -- change to the number of players that can get in to your server
    appid = 970631666664095784, -- Application ID (Replace this with you own)
    biglogo = "coloradog", -- image assets name for the "large" icon.
    biglogodesc = " Colorado Roleplay ", -- text when hover over image
    smalllogo = "coloradop", -- Nome dos ativos da imagem para o ícone "pequeno". (Opcional)
    smalllogodesc = "", -- text when hover over image
    discordlink = "discord.gg/coloradorp", -- discord link
    richpresencebutton = "", --set button text for Rich Presence Button
    shownameandid = true, --show player steam name and id

    ---------------------------------------------------------------------------------------
    ------------------------------- TRANSLATE ---------------------------------------------
    Langs = {
        IsConnected        = "🚫 Conta duplicada conectada (steam | rockstar)",
        NoSteam            = "🚫 Você tem que ter o Steam aberto, por favor abra o Steam e reinicie RedM",
        NoInWhitelist      = "🚫 Você não está na Whitelist. Envie seu #ID em nosso discord: ",
        NoPermissions      = "Você não tem permissões suficientes",
        CheckingIdentifier = "Verificando identificadores",
        LoadingUser        = "Falha ao Carregar usuário, tente reiniciar a steam/epic e o discord",
        BannedUser         = "Você está banido até ",
        DateTimeFormat     = "%d/%m/%y %H:%M:%S", -- Set wished DateTimeFormat for output in ban notification
        TimeZone           = " BRT", -- Set your timezone
        DropReasonBanned   = "Você foi banido do servidor até ",
        Warned             = "Você foi avisado",
        Unwarned           = "Você estava sem aviso",
        TitleOnDead        = "VOCÊ MORREU",
        SubTitleOnDead     = "Você pode reaparecer em %s segundos",
        RespawnIn          = "Você pode reaparecer em ",
        SecondsMove        = " segundas",
        YouAreCarried      = "Você está sendo carregado por uma pessoa",
        VoiceRangeChanged  = "Voice chat range changed to %s meters",
        promptLabel        = "Reaparecer", -- prompt label.
        prompt             = "Pressione", -- prompt group label
        wayPoint           = "VORP: You need to set a waypoint first!",
        mustBeSeated       = "VORP: You must be in the driver's seat!",
        wagonInFront       = "VORP: You must be seated or near a wagon to delete it!",
        cantCarry          = "VORP: Can't carry more weapons!",
        Hold               = "CARREGANDO!!",
        Load               = "Aguarde o carregamento completo para uma melhor experiência",
        Almost             = "A Equipe do Colorado agradece...",
        Holddead           = "VOCÊ ESTÁ MORTO",
        Loaddead           = "Você deixou o servidor enquanto estava morto",
        forcedrespawn      = "Você ira reaparecer",
        forced             = "Porque você deixou o servidor enquanto estava morto",
        sit                = "você precisa ser solto",
        NotifyChar         = "você deve definir sua altura de char para 1.0, poderá haver bugs se não o fizer.",
        NotifyCharSelect   = "Uma vez que você ~e~excluir ~q~um personagem não há volta!",
        PVPNotifyOn        = "PVP On ",
        PVPNotifyOff       = "PVP Off",
        AddChar            = "Added Multicharacter ",
        RemoveChar         = "Removed Multicharacter ",
        WrongHex           = "Hex não está na DB ou Hex incorreta",
        myjob              = "Meu emprego é: ~o~",
        mygrade            = " ~q~rank: ~o~",
        charhours          = "horas jogadas com seu personagem: ~o~",
        playhours          = "horas jogadas: ~o~",
        RespawnIn          = "Você pode reaparecer em ",
        message            = " ",
        message2           = "O tempo de reaparecer passou",
        message3           = "Você precisa esperar até que você possa reaparecer",
        message4           = "Player ID ",
        message5           = "você desmaiou, e esqueceu os últimos 30 minutos",
        message6           = "Reaparecer!!!"
    },



}
