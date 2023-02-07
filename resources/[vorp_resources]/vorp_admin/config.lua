Config = {
    --add your language
    defaultlang = "en_lang",

    Key = 0x4AF4D473, --DEL open menu

    CanOpenMenuWhenDead = true, -- if true any staff can open menu when dead, !WARNING! staff can abuse this to get revived

    ---------------------- NO CLIP ----------------------
    ShowControls = false,
    Controls = {

        goUp = 0xDE794E3E, -- Q
        goDown = 0x26E9DC00, -- Z
        turnLeft = 0x7065027D, -- A
        turnRight = 0xB4E465B4, -- D
        goForward = 0x8FD015D8, -- W
        goBackward = 0xD27782E3, -- S
        changeSpeed = 0x8FFC75D6, -- L-Shift
        camMode = 0x24978A28, -- H
        ShowControls = 0x8AAA0AD4 -- left alt
    },

    Speeds = {
        -- You can add or edit existing speeds with relative label
        { label = 'Very Slow', speed = 0 },
        { label = 'Slow', speed = 0.5 },
        { label = 'Normal', speed = 2 },
        { label = 'Fast', speed = 10 },
        { label = 'Very Fast', speed = 15 },
        { label = 'Max', speed = 29 },
    },

    Offsets = {
        y = 0.2, -- Forward and backward movement speed multiplier
        z = 0.1, -- Upward and downward movement speed multiplier
        h = 1, -- Rotation movement speed multiplier
    },

    FrozenPosition = true,


    -----------------------------------------------------
    -- Users scoreboard
    -- only one can be added
    -- choose what info should show to all users
    showUsersInfo = "showID", -- showAll --showJob --showGroup -- showID

    --------------------------------------------------------
    -- WEBHOOKS/LOGS
    ReportLogs   = {
        Reports = "", -- for reports
        RequestStaff = "", -- for request staff
        BugReport = "", -- for bug report
        RulesBroken = "", -- for rules broken report
        Cheating = "" -- for cheating report
    },
    AlertCooldown = 60, -- cooldown for request staff to request again (seconds)
    webhookColor = 16711680, --EMBED COLOR RED
    name         = "VORP", --NAME OF EMBED
    logo         = "https://via.placeholder.com/30x30", --HEAD LOGO
    footerLogo   = "https://via.placeholder.com/30x30", --FOOTER LOGO
    Avatar       = "https://via.placeholder.com/30x30", -- AVATAR LOGO
    -- delete the ones you dont want to LOG into your discord.
    BoosterLogs  = {
        NoClip = "https://discord.com/api/webhooks/998357450908499978/shAGBUc-lMzPaFZUMn5SmuzzO0NMm0FNFTUNjZho2pDyg4Xlj8mmJ1qf4RKXjvZz6zig",
        InfiniteAmmo = "https://discord.com/api/webhooks/998357450908499978/shAGBUc-lMzPaFZUMn5SmuzzO0NMm0FNFTUNjZho2pDyg4Xlj8mmJ1qf4RKXjvZz6zig",
        GoldenCores = "https://discord.com/api/webhooks/998357450908499978/shAGBUc-lMzPaFZUMn5SmuzzO0NMm0FNFTUNjZho2pDyg4Xlj8mmJ1qf4RKXjvZz6zig",
        GodMode = "https://discord.com/api/webhooks/998357450908499978/shAGBUc-lMzPaFZUMn5SmuzzO0NMm0FNFTUNjZho2pDyg4Xlj8mmJ1qf4RKXjvZz6zig",
        SelfHeal = "https://discord.com/api/webhooks/998357450908499978/shAGBUc-lMzPaFZUMn5SmuzzO0NMm0FNFTUNjZho2pDyg4Xlj8mmJ1qf4RKXjvZz6zig",
        SelfRevive = "https://discord.com/api/webhooks/998357450908499978/shAGBUc-lMzPaFZUMn5SmuzzO0NMm0FNFTUNjZho2pDyg4Xlj8mmJ1qf4RKXjvZz6zig",
        SelfSpawnHorse = "https://discord.com/api/webhooks/998357450908499978/shAGBUc-lMzPaFZUMn5SmuzzO0NMm0FNFTUNjZho2pDyg4Xlj8mmJ1qf4RKXjvZz6zig",
        SelfSpawnWagon = "https://discord.com/api/webhooks/998357450908499978/shAGBUc-lMzPaFZUMn5SmuzzO0NMm0FNFTUNjZho2pDyg4Xlj8mmJ1qf4RKXjvZz6zig",
    },
    -- delete the ones you dont want to LOG into your discord.
    AdminLogs    = {
        --simple actions
        Freezed = "https://discord.com/api/webhooks/998357450908499978/shAGBUc-lMzPaFZUMn5SmuzzO0NMm0FNFTUNjZho2pDyg4Xlj8mmJ1qf4RKXjvZz6zig",
        Bring = "https://discord.com/api/webhooks/998357450908499978/shAGBUc-lMzPaFZUMn5SmuzzO0NMm0FNFTUNjZho2pDyg4Xlj8mmJ1qf4RKXjvZz6zig",
        Goto = "https://discord.com/api/webhooks/998357450908499978/shAGBUc-lMzPaFZUMn5SmuzzO0NMm0FNFTUNjZho2pDyg4Xlj8mmJ1qf4RKXjvZz6zig",
        Revive = "https://discord.com/api/webhooks/998357450908499978/shAGBUc-lMzPaFZUMn5SmuzzO0NMm0FNFTUNjZho2pDyg4Xlj8mmJ1qf4RKXjvZz6zig",
        Heal = "https://discord.com/api/webhooks/998357450908499978/shAGBUc-lMzPaFZUMn5SmuzzO0NMm0FNFTUNjZho2pDyg4Xlj8mmJ1qf4RKXjvZz6zig",
        Warned = "https://discord.com/api/webhooks/998357450908499978/shAGBUc-lMzPaFZUMn5SmuzzO0NMm0FNFTUNjZho2pDyg4Xlj8mmJ1qf4RKXjvZz6zig",
        Unwarned = "https://discord.com/api/webhooks/998357450908499978/shAGBUc-lMzPaFZUMn5SmuzzO0NMm0FNFTUNjZho2pDyg4Xlj8mmJ1qf4RKXjvZz6zig",
        Spectate = "https://discord.com/api/webhooks/998357450908499978/shAGBUc-lMzPaFZUMn5SmuzzO0NMm0FNFTUNjZho2pDyg4Xlj8mmJ1qf4RKXjvZz6zig",
        --advanced actions
        Respawn = "https://discord.com/api/webhooks/998357450908499978/shAGBUc-lMzPaFZUMn5SmuzzO0NMm0FNFTUNjZho2pDyg4Xlj8mmJ1qf4RKXjvZz6zig",
        Kick = "https://discord.com/api/webhooks/998357450908499978/shAGBUc-lMzPaFZUMn5SmuzzO0NMm0FNFTUNjZho2pDyg4Xlj8mmJ1qf4RKXjvZz6zig",
        Ban = "https://discord.com/api/webhooks/998357450908499978/shAGBUc-lMzPaFZUMn5SmuzzO0NMm0FNFTUNjZho2pDyg4Xlj8mmJ1qf4RKXjvZz6zig",
        Unban = "https://discord.com/api/webhooks/998357450908499978/shAGBUc-lMzPaFZUMn5SmuzzO0NMm0FNFTUNjZho2pDyg4Xlj8mmJ1qf4RKXjvZz6zig",
        Whitelist = "https://discord.com/api/webhooks/998357450908499978/shAGBUc-lMzPaFZUMn5SmuzzO0NMm0FNFTUNjZho2pDyg4Xlj8mmJ1qf4RKXjvZz6zig",
        Unwhitelist = "https://discord.com/api/webhooks/998357450908499978/shAGBUc-lMzPaFZUMn5SmuzzO0NMm0FNFTUNjZho2pDyg4Xlj8mmJ1qf4RKXjvZz6zig",
        Setgroup = "https://discord.com/api/webhooks/998357450908499978/shAGBUc-lMzPaFZUMn5SmuzzO0NMm0FNFTUNjZho2pDyg4Xlj8mmJ1qf4RKXjvZz6zig",
        Setjob = "https://discord.com/api/webhooks/998357450908499978/shAGBUc-lMzPaFZUMn5SmuzzO0NMm0FNFTUNjZho2pDyg4Xlj8mmJ1qf4RKXjvZz6zig",
        Announce = "https://discord.com/api/webhooks/998357450908499978/shAGBUc-lMzPaFZUMn5SmuzzO0NMm0FNFTUNjZho2pDyg4Xlj8mmJ1qf4RKXjvZz6zig"

    },
    -- delete the ones you dont want to LOG into your discord.
    TeleportLogs = {
        Tpm = "",
        Tptocoords = "",
        Tptoplayer = "",
        Bringplayer = "",
    },
    -- delete the ones you dont want to LOG into your discord.
    DatabaseLogs = {
        Giveitem = "https://discord.com/api/webhooks/998357783382593587/qdPGuTzrKhDsMIDKM72v6Cl6G_1Kg8FIUr1SKzYgUV8-iBEqKz5JD2bI-UWqsrty-DlJ",
        Giveweapon = "https://discord.com/api/webhooks/998357783382593587/qdPGuTzrKhDsMIDKM72v6Cl6G_1Kg8FIUr1SKzYgUV8-iBEqKz5JD2bI-UWqsrty-DlJ",
        Givecurrency = "https://discord.com/api/webhooks/998357783382593587/qdPGuTzrKhDsMIDKM72v6Cl6G_1Kg8FIUr1SKzYgUV8-iBEqKz5JD2bI-UWqsrty-DlJ",
        Givehorse = "https://discord.com/api/webhooks/998357783382593587/qdPGuTzrKhDsMIDKM72v6Cl6G_1Kg8FIUr1SKzYgUV8-iBEqKz5JD2bI-UWqsrty-DlJ",
        Givewagon = "https://discord.com/api/webhooks/998357783382593587/qdPGuTzrKhDsMIDKM72v6Cl6G_1Kg8FIUr1SKzYgUV8-iBEqKz5JD2bI-UWqsrty-DlJ",
        Clearmoney = "https://discord.com/api/webhooks/998357783382593587/qdPGuTzrKhDsMIDKM72v6Cl6G_1Kg8FIUr1SKzYgUV8-iBEqKz5JD2bI-UWqsrty-DlJ",
        Cleargold = "https://discord.com/api/webhooks/998357783382593587/qdPGuTzrKhDsMIDKM72v6Cl6G_1Kg8FIUr1SKzYgUV8-iBEqKz5JD2bI-UWqsrty-DlJ",
        Clearitems = "https://discord.com/api/webhooks/998357783382593587/qdPGuTzrKhDsMIDKM72v6Cl6G_1Kg8FIUr1SKzYgUV8-iBEqKz5JD2bI-UWqsrty-DlJ",
        Clearweapons = "https://discord.com/api/webhooks/998357783382593587/qdPGuTzrKhDsMIDKM72v6Cl6G_1Kg8FIUr1SKzYgUV8-iBEqKz5JD2bI-UWqsrty-DlJ",
    }



}
