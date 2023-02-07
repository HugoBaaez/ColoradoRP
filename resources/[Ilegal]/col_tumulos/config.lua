Config = {}

Config.framework = "vorp" --"redemrp" or "vorp" or "qbr"

Config.PrayAnim = {
    { "amb_misc@world_human_pray_rosary@base", "base" },
    { "amb_misc@prop_human_seat_pray@male_b@idle_b", "idle_d" },
    { "script_common@shared_scenarios@stand@random@town_burial@stand_mourn@male@react_look@loop@generic", "front" },
    { "amb_misc@world_human_grave_mourning@kneel@female_a@idle_a", "idle_a" },
    { "script_common@shared_scenarios@kneel@mourn@female@a@base", "base" },
    { "amb_misc@world_human_grave_mourning@female_a@idle_a", "idle_a" },
    { "amb_misc@world_human_grave_mourning@male_b@idle_c", "idle_g" },
    { "amb_misc@world_human_grave_mourning@male_b@idle_c", "idle_h" },
}

Config.ShovelItem = "robbingkit" --inventory name of the shovel item for grave dig
Config.DiggingTimer = 20 --seconds
Config.Dig = {
    shovel = `p_shovel02x`,
    anim = { "amb_work@world_human_gravedig@working@male_b@idle_a", "idle_a" },
    bone = "skel_r_hand",
    pos = { 0.06, -0.06, -0.03, 270.0, 165.0, 17.0 },
}

Config.Rewards = {
    { item = "oldbuckle", label = "Fivela Antiga" },
    { item = "oldwatch", label = "Relógio Antigo" },
    { item = "rubyring", label = "Anel de Ruby" },
    { item = 'goldtooth', label = 'Dente de Ouro' },
    { item = 'goldring', label = 'Anel de Ouro' },
    { item = 'peacockfeather', label = 'Pena de Pavão' },
    { item = 'piratecoin', label = 'Moeda Antiga' },

}

Config.Prompts = {
    Prompt1 = 0x05CA7C52,
    Prompt2 = 0x156F7119,
}

Config.Texts = {
    Prompt1 = "Cavar",
    Prompt2 = "Rezar",
    GraveRobbery = "Túmulo",
    GraveDisplay = "Túmulo:",
    CantDoThat = "Você não pode fazer isso agora!",
    GraveRobbed = " Este túmullo já foi roubado!",
    NoShovel = "Nenhum item de pá!",
    FoundItem = "Você encontrou algum item!",
}

Config.Textures = {
    cross = { "scoretimer_textures", "scoretimer_generic_cross" },
    locked = { "menu_textures", "stamp_locked_rank" },
    tick = { "scoretimer_textures", "scoretimer_generic_tick" },
    money = { "inventory_items", "money_moneystack" },
    alert = { "menu_textures", "menu_icon_alert" },
}

Config.JobsToAlert = { "police"} -- to alert these jobs if they are on duty using society
Config.synSociety = false

Config.Graves = {
    --Rhodes
    [1] = {
        name = "Elsie Feeney",
        coords = vector3(1282.042, -1242.295, 79.989),
        heading = 26.0788,
    },
    [2] = {
        name = "Harvey Feeney",
        coords = vector3(1280.190, -1243.406, 79.721),
        heading = 26.999,
    },
    [3] = {
        name = "Nettie Mae Feeney",
        coords = vector3(1277.646, -1243.937, 79.641),
        heading = 28.891,
    },
    [4] = {
        name = "Stephen Banks",
        coords = vector3(1273.183, -1238.915, 79.715),
        heading = 21.938,
    },
    [5] = {
        name = "Marietta Banks",
        coords = vector3(1275.114, -1237.997, 79.923),
        heading = 17.2695,
    },
    [6] = {
        name = "Charlie Banks",
        coords = vector3(1277.472, -1237.081, 80.183),
        heading = 22.858,
    },
    [7] = {
        name = "Unknown",
        coords = vector3(1277.429, -1231.219, 80.685),
        heading = 9.5856,
    },
    [8] = {
        name = "Unknown",
        coords = vector3(1273.790, -1229.006, 80.594),
        heading = 5.973,
    },
    [9] = {
        name = "Unknown",
        coords = vector3(1270.969, -1230.913, 80.255),
        heading = 11.065,
    },
    [10] = {
        name = "Unknown",
        coords = vector3(1267.327, -1232.056, 79.946),
        heading = 16.203,
    },
    [11] = {
        name = "Douglas Gray",
        coords = vector3(1268.745, -1228.923, 80.280),
        heading = 15.811,
    },
    [12] = {
        name = "Lucille Braithwaite",
        coords = vector3(1275.525, -1220.127, 81.420),
        heading = 18.769,
    },
    [13] = {
        name = "Unknown",
        coords = vector3(1271.028, -1224.483, 80.772),
        heading = 15.9214,
    },
    [14] = {
        name = "Unknown",
        coords = vector3(1272.812, -1224.395, 80.905),
        heading = 16.95,
    },
    [15] = {
        name = "Unknown",
        coords = vector3(1274.721, -1223.716, 81.162),
        heading = 22.049,
    },
    [16] = {
        name = "Unknown",
        coords = vector3(1279.936, -1214.892, 81.869),
        heading = 14.358,
    },
    [17] = {
        name = "Unknown",
        coords = vector3(1275.776, -1207.828, 82.502),
        heading = 192.68,
    },
    [18] = {
        name = "Unknown",
        coords = vector3(1292.837, -1214.911, 81.841),
        heading = 358.166,
    },
    [19] = {
        name = "Unknown",
        coords = vector3(1295.810, -1215.574, 81.551),
        heading = 14.873,
    },
    [20] = {
        name = "Unknown",
        coords = vector3(1298.355, -1214.914, 81.341),
        heading = 4.81563,
    },
    [21] = {
        name = "Unknown",
        coords = vector3(1297.090, -1212.736, 81.562),
        heading = 15.6860,
    },
    [22] = {
        name = "Unknown",
        coords = vector3(1295.598, -1213.070, 81.674),
        heading = 103.038,
    },
    [23] = {
        name = "Unknown",
        coords = vector3(1294.745, -1213.792, 81.716),
        heading = 17.239,
    },
    [24] = {
        name = "Unknown",
        coords = vector3(1292.806, -1211.421, 82.019),
        heading = 19.154,
    },
    [25] = {
        name = "Unknown",
        coords = vector3(1293.655, -1210.771, 81.990),
        heading = 11.1098,
    },
    [26] = {
        name = "Unknown",
        coords = vector3(1295.177, -1210.914, 81.834),
        heading = 28.956,
    },
    [27] = {
        name = "William 'Willie' Bowley",
        coords = vector3(1302.913, -1214.625, 80.995),
        heading = 14.057,
    },
    [28] = {
        name = "Unknown",
        coords = vector3(1292.054, -1209.464, 82.274),
        heading = 24.189,
    },
    [29] = {
        name = "Unknown",
        coords = vector3(1290.816, -1210.013, 82.305),
        heading = 17.146,
    },
    [30] = {
        name = "Unknown",
        coords = vector3(1296.455, -1210.326, 81.760),
        heading = 26.106,
    },
    [31] = {
        name = "John Irish",
        coords = vector3(-249.77, 818.89, 122.2),
        heading = 303.62,
    },
    [32] = {
        name = "Charles Leon",
        coords = vector3(-239.56, 819.72, 123.74),
        heading = 288.82,
    },
    [33] = {
        name = "Evangeline Lewis-Wyatt",
        coords = vector3(-235.83, 821.2, 124.16),
        heading = 304.42,
    },
    [34] = {
        name = "Larry Wilder",
        coords = vector3(-241.77, 827.13, 123.23),
        heading = 291.7,
    },
    [35] = {
        name = "Jermiah Michaels",
        coords = vector3(-239.8, 822.19, 123.66),
        heading = 289.63,
    },
    [36] = {
        name = "Andrew Tate",
        coords = vector3(-245.94, 819.66, 122.74),
        heading = 298.87,
    },
    [37] = {
        name = "Major Marquis Warren",
        coords = vector3(-247.37, 812.04, 122.4),
        heading = 298.09,
    },
    [38] = {
        name = "Daisy Domergue",
        coords = vector3(-241.51, 809.03, 122.75),
        heading = 298.87,
    },
    [39] = {
        name = "Ash Benedict",
        coords = vector3(-242.4, 812.29, 123.02),
        heading = 295.31,
    },
    [40] = {
        name = "Donny Donowitz",
        coords = vector3(-239.52, 812.97, 123.55),
        heading = 294.21,
    },
    [41] = {
        name = "Reginald Wyatt",
        coords = vector3(-236.24, 812.84, 123.95),
        heading = 296.19,
    },
    [42] = {
        name = "Calamity Jane",
        coords = vector3(-241.25, 816.23, 123.53),
        heading = 294.52,
    },
    [43] = {
        name = "Jesse James",
        coords = vector3(-242.23, 818.18, 123.37),
        heading = 294.09,
    },
    [44] = {
        name = "William H. Bonney",
        coords = vector3(-243.06, 819.82, 123.21),
        heading = 295.12,
    },
    [45] = {
        name = "Wyatt Earp",
        coords = vector3(-244.42, 823.44, 122.92),
        heading = 294.1,
    },
    [46] = {
        name = "Harvey Logan",
        coords = vector3(-245.29, 825.8, 122.72),
        heading = 292.7,
    },
    [47] = {
        name = "John H. Holliday",
        coords = vector3(-246.14, 828.25, 122.49),
        heading = 293.48,
    },
    [48] = {
        name = "William Bennington",
        coords = vector3(-959.77, -1198.75, 56.15),
        heading = 359.89,
    },
    [49] = {
        name = "Henry Hilton",
        coords = vector3(-960.39, -1209.41, 55.03),
        heading = 4.59,
    },
    [50] = {
        name = "Jeffrey Myers",
        coords = vector3(-956.82, -1209.58, 54.92),
        heading = 354.25,
    },
    [51] = {
        name = "Sam Davids",
        coords = vector3(-954.61, -1204.39, 55.53),
        heading = 353.07,
    },
    [52] = {
        name = "Oliver Campo",
        coords = vector3(-954.22, -1193.28, 55.96),
        heading = 5.57,
    },
    [53] = {
        name = "Freddie Tik",
        coords = vector3(-957.16, -1192.93, 56.53),
        heading = 11.05,
    },
    [54] = {
        name = "Pablo Gomez",
        coords = vector3(-5446.67, -2903.56, 1.01),
        heading = 316.63,
    },
    [55] = {
        name = "Daniel Brown",
        coords = vector3(-5455.56, -2909.63, 0.87),
        heading = 111.25,
    },
    [56] = {
        name = "Zach Franklin",
        coords = vector3(-5456.38, -2906.22, 0.83),
        heading = 98.56,
    },
    [57] = {
        name = "Wyatt Dirt",
        coords = vector3(-5456.23, -2903.22, 0.85),
        heading = 72.29,
    },
    [58] = {
        name = "Samantha Stone",
        coords = vector3(-5460.42, -2904.91, 0.87),
        heading = 84.73,
    },
    [59] = {
        name = "Unknown",
        coords = vector3(2754.110, -1072.89, 46.890),
        heading = 175.21,
    },
    [60] = {
        name = "Unknown",
        coords = vector3(2759.640, -1072.79, 46.890),
        heading = 178.15,
    },
    [61] = {
        name = "Unknown",
        coords = vector3(2758.290, -1079.43, 46.890),
        heading = 178.72,
    },
    [62] = {
        name = "Unknown",
        coords = vector3(2762.259, -1095.02, 46.890),
        heading = 358.19,
    },
    [63] = {
        name = "Unknown",
        coords = vector3(2756.403, -1095.0, 46.890),
        heading = 356.21,
    },
    [64] = {
        name = "Unknown",
        coords = vector3(2688.324, -1070.03, 46.887),
        heading = 164.73,
    },
    [65] = {
        name = "Unknown",
        coords = vector3(2706.884, -1044.84, 46.863),
        heading = 192.16,
    },
    [66] = {
        name = "Unknown",
        coords = vector3(2672.253, -1062.92, 46.882),
        heading = 282.93,
    },
    [67] = {
        name = "ELMORE",
        coords = vector3(2676.284, -1080.90, 46.884),
        heading = 263.46,
    },
    [68] = {
        name = "Parker",
        coords = vector3(2679.137, -1087.08, 46.891),
        heading = 273.83,
    },
    [69] = {
        name = "Unknown",
        coords = vector3(2695.543, -1075.00, 46.890),
        heading = 352.58,
    },
    [70] = {
        name = "Unknown",
        coords = vector3(2708.626, -1087.45, 47.215),
        heading = 183.21,
    },
    [71] = {
        name = "Unknown",
        coords = vector3(2678.429, -1059.01, 46.907),
        heading = 102.48,
    },
    [72] = {
        name = "Unknown",
        coords = vector3(2744.813, -1058.18, 46.890),
        heading = 358.01,
    },
    [73] = {
        name = "Unknown",
        coords = vector3(2751.654, -1057.97, 46.915),
        heading = 356.65,
    },
    [74] = {
        name = "Unknown",
        coords = vector3(2756.996, -1049.85, 46.890),
        heading = 357.66,
    },
    [75] = {
        name = "Unknown",
        coords = vector3(2763.629, -1037.86, 46.885),
        heading = 179.98,
    },
    [76] = {
        name = "Unknown",
        coords = vector3(2779.275, -1074.09, 46.889),
        heading = 261.51,
    },
    [77] = {
        name = "Unknown",
        coords = vector3(2783.285, -1071.24, 46.882),
        heading = 359.67,
    },
    ----- Tumbleweed
    [78] = {
        name = "Turman Brings",
        coords = vector3(-5457.66, -2917.12, 0.8804),
        heading = 128.69,
    },
    [79] = {
        name = "Unknown",
        coords = vector3(-5459.86, -2914.25, 0.8830),
        heading = 109.39,
    },
    [80] = {
        name = "Tilápia",
        coords = vector3(-5461.48, -2911.58, 0.7645),
        heading = 104.23,
    },
    [81] = {
        name = "Hattie Tanner",
        coords = vector3(-5461.78, -2908.51, 0.8767),
        heading = 96.91,
    },
    [82] = {
        name = "John Bullet",
        coords = vector3(-5456.12, -2912.10, 0.7324),
        heading = 111.34,
    },
    [83] = {
        name = "Atlas Miguel",
        coords = vector3(-5451.53, -2918.53, 0.7368),
        heading = 141.42,
    },
    [84] = {
        name = "Clay Carson",
        coords = vector3(-5444.00, -2905.88, 0.9325),
        heading = 312.38,
    },
    [85] = {
        name = "Carter Slade",
        coords = vector3(-5455.03, -2896.51, 0.9104),
        heading = 344.31,
    },
    ------ ARMADILLO
    [86] = {
        name = "Christopher Collin",
        coords = vector3(-4438.65, -2699.42, -11.04),
        heading = 9.75,
    },
    [87] = {
        name = "Ellen Nugent",
        coords = vector3(-4432.78, -2697.04, -11.04),
        heading = 354.03,
    },
    [88] = {
        name = "Jhon Walker",
        coords = vector3(-4434.39, -2688.73, -10.94),
        heading = 349.78,
    },
    [89] = {
        name = "Unknown",
        coords = vector3(-4445.43, -2703.93, -11.12),
        heading = 33.15,
    },
    [90] = {
        name = "Django Libre",
        coords = vector3(-4450.29, -2685.55, -11.13),
        heading = 47.8,
    },
    [91] = {
        name = "Hasputin Orloff",
        coords = vector3(-4458.11, -2698.35, -11.14),
        heading = 56.5,
    },
    [92] = {
        name = "Will Bill",
        coords = vector3(-4438.05, -2672.31, -10.85),
        heading = 359.52,
    },

    
}


--[[
    --REDEM:RP INVENTORY 2.0 ITEM

    ["item"] =
    {
        label = "",
        description = "",
        weight = 0.05,
        canBeDropped = true,
        canBeUsed = true,
        requireLvl = 0,
        limit = 50,
        imgsrc = "items/item.png",
        type = "item_standard",
    },
]]
