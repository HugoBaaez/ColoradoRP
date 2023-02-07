Config = {}


Config.MissionChecker = 60 --minutes to create a mission if not started

Config.MissionEndCD = 20 -- minutes or false for no cooldown upon fail/finish mission

Config.framework = "vorp" --"redemrp" or "vorp" or "qbr" or "qbr2" (qbr reboot)
Config.TrainSpawnDistanceDebug = true 
Config.TrainDistanceSpawn = 110.0 --distance between player and train spawn pos to spawn train, RedM wont recognize carriage if distance is too high

Config.PoliceAlert = {"police"} --for no alert, use: Config.PoliceAlert = false
Config.Prompts = {
    PromptStart = 0x05CA7C52,
	PromptRob = 0x05CA7C52,
}

Config.Marker = {
    rgba = {126, 0, 0, 100},
    size = {2.0, 2.0, 0.3},
}

Config.Marker2 = {
    rgba = {126, 0, 0, 100},
    size = {2.0, 2.0, 0.3},
}


Config.Texts = {
    PromptStart = "Iniciar Trabalho",
	PromptRob = "Roubo ao Trem",
    --TEXTS
    BanditBlipName = "Bandidos",
    GuardBlipName = "Guardas",
    RobD = "Roubar",
    CartD = "Carroça",
    RobbedD = "Roubado",
    MissionStarted = "Trabalho Iniciado",
    Ambush = "Emboscada",
    Robbery = "Roubo",
    Follow1 = "Siga seu Lider",
    Follow2 = "Siga o Shotcaller",
    ClearBandits = "Limpe os bandidos antes que o trem chegue!",
    ClearArea = "A área parece limpa!",
    AlreadyRobbed = "Local já roubado!",
    Started = "Roubo começou!",
    NoJob = "Você não tem o emprego necessário!",
    NotPossible = "Não é mais possível!",
    DeadBandits = "Os bandidos morreram! O trem chega em instantes, prepare-se!",
    TrainComes = "Trem está chegando em um momento!",
    Abandoned = "A missão foi abandonada pelo Líder!",
    GoCloser = "Você tem que encontrar uma posição mais próxima (spawn)!",
    TrainArea = "Área de trem",
    TrainAlert = "Um trem está prestes a ser assaltado! Verifique o mapa para a área!",
}

Config.Textures = {
    cross = {"scoretimer_textures", "scoretimer_generic_cross"},
    locked = {"menu_textures","stamp_locked_rank"},
    tick = {"scoretimer_textures","scoretimer_generic_tick"},
    money = {"inventory_items", "money_moneystack"},
    alert = {"menu_textures", "menu_icon_alert"},
}

Config.GuardOptions = {
	model = `s_m_m_pinlaw_01`,
	maxpreset = 40,
}

Config.RandomItemRewards = {
    "goldnugget","goldtooth", "goldring",
}

Config.TrainMissionConfigs = {
	[1] = {
		riding_pos = vector3(419.704, 1801.364, 182.436),
		train_spawn = vector3(514.847, 1758.885, 187.626),
        train_end = vector3(-1304.999, 412.733, 94.863),
        train_hash = 0x487B2BE7,
		train_speed = 10.0,
		direction = 0,
        train_carriage = {
            allowed_carriage = {[2] = true, [4] = true, [5] = true, [6] = true, [7] = true},
            loot_pos = {
                {pos = vector3(0.0, -4.0, 1.1), guard = true},
                {pos = vector3(0.1, 0.0, 1.1), guard = true},
                {pos = vector3(0.0, -2.0, 1.1), guard = true},
                {pos = vector3(0.0, 2.5, 1.1), guard = true},
            },
            reward = {item = "random", amount = 1}, --for money use: "reward = {min = 10, max = 25}," for item use: reward = {item = "gold_nugget", amount = 1},
        },
		arrival_bandits = {
            {pos = vector3(450.628, 1776.768, 188.310), model = `mp_g_m_m_unicriminals_06`, preset = 0, heading = 55.520, weapon = `weapon_thrown_molotov`},
            {pos = vector3(449.539, 1774.408, 188.466), model = `mp_g_m_m_unicriminals_06`, preset = 1, heading = 47.935, weapon = `weapon_shotgun_pump`},
            {pos = vector3(446.414, 1772.644, 188.653), model = `mp_g_m_m_unicriminals_06`, preset = 2, heading = 44.683, weapon = `weapon_revolver_cattleman`},
            {pos = vector3(440.798, 1776.621, 187.390), model = `mp_g_m_m_unicriminals_06`, preset = 3, heading = 32.523, weapon = `weapon_revolver_cattleman`},
            {pos = vector3(408.668, 1773.365, 191.520), model = `mp_g_m_m_unicriminals_06`, preset = 4, heading = 337.357, weapon = `weapon_repeater_carbine`},
            {pos = vector3(411.458, 1775.121, 191.333), model = `mp_g_m_m_unicriminals_06`, preset = 5, heading = 340.379, weapon = `weapon_pistol_mauser`},
            --{pos = vector3(0.0, 0.0, 0.0), model = ``, preset = 0, heading = 0},
        },
	},
	[2] = {
		riding_pos = vector3(-833.572, -611.165, 59.145),
		train_spawn = vector3(-1107.340, -576.186, 82.136),
        train_end = vector3(-340.729, -349.726, 87.826),
        train_hash = 0x487B2BE7,
		train_speed = 7.0,
		direction = 0,
        train_carriage = {
            allowed_carriage = {[2] = true, [4] = true, [5] = true, [6] = true, [7] = true},
            loot_pos = {
                {pos = vector3(0.0, -4.0, 1.1), guard = true},
                {pos = vector3(0.1, 0.0, 1.1), guard = true},
                {pos = vector3(0.0, -2.0, 1.1), guard = true},
                {pos = vector3(0.0, 2.5, 1.1), guard = true},
            },
            reward = {min = 10, max = 25},
        },
		arrival_bandits = {
            {pos = vector3(-894.431, -664.468, 65.597), model = `mp_g_m_m_unicriminals_05`, preset = 2, heading = 333.194, weapon = `weapon_thrown_molotov`},
            {pos = vector3(-896.680, -664.037, 65.794), model = `mp_g_m_m_unicriminals_05`, preset = 10, heading = 336.521, weapon = `weapon_shotgun_pump`},
            {pos = vector3(-900.179, -662.506, 66.215), model = `mp_g_m_m_unicriminals_05`, preset = 12, heading = 339.61, weapon = `weapon_revolver_cattleman`},
            {pos = vector3(-910.637, -664.860, 66.986), model = `mp_g_m_m_unicriminals_05`, preset = 11, heading = 315.848, weapon = `weapon_revolver_cattleman`},
            {pos = vector3(-900.420, -672.401, 65.571), model = `mp_g_m_m_unicriminals_05`, preset = 13, heading = 323.222, weapon = `weapon_repeater_carbine`},
        },
	},
	[3] = {
		riding_pos = vector3(1499.900, -701.982, 51.231),
		train_spawn = vector3(1467.749, -466.097, 74.913),
        train_end = vector3(2169.656, -1261.312, 43.463),
        train_hash = 0x487B2BE7,
		train_speed = 7.0,
		direction = 1,
        train_carriage = {
            allowed_carriage = {[2] = true, [4] = true, [5] = true, [6] = true, [7] = true},
            loot_pos = {
                {pos = vector3(0.0, -4.0, 1.1), guard = true},
                {pos = vector3(0.1, 0.0, 1.1), guard = true},
                {pos = vector3(0.0, -2.0, 1.1), guard = true},
                {pos = vector3(0.0, 2.5, 1.1), guard = true},
            },
            reward = {min = 10, max = 25},
        },
		arrival_bandits = {
            {pos = vector3(1450.171, -695.405, 59.023), model = `mp_g_m_m_unicriminals_04`, preset = 5, heading = 278.749, weapon = `weapon_thrown_molotov`},
            {pos = vector3(1451.796, -701.351, 57.801), model = `mp_g_m_m_unicriminals_04`, preset = 6, heading = 239.110, weapon = `weapon_shotgun_pump`},
            {pos = vector3(1457.408, -706.758, 55.866), model = `mp_g_m_m_unicriminals_04`, preset = 7, heading = 252.312, weapon = `weapon_revolver_cattleman`},
            {pos = vector3(1452.258, -712.249, 56.470), model = `mp_g_m_m_unicriminals_04`, preset = 8, heading = 275.806, weapon = `weapon_revolver_cattleman`},
            {pos = vector3(1445.886, -706.467, 58.110), model = `mp_g_m_m_unicriminals_04`, preset = 9, heading = 301.746, weapon = `weapon_repeater_carbine`},
        },
	},
	[4] = {
		riding_pos = vector3(2381.873, 2060.217, 175.945),
		train_spawn = vector3(2181.383, 1922.936, 187.689),
        train_end = vector3(3036.105, 1485.707, 49.877),
        train_hash = 0x487B2BE7,
		train_speed = 7.0,
		direction = 1,
        train_carriage = {
            allowed_carriage = {[2] = true, [4] = true, [5] = true, [6] = true, [7] = true},
            loot_pos = {
                {pos = vector3(0.0, -4.0, 1.1), guard = true},
                {pos = vector3(0.1, 0.0, 1.1), guard = true},
                {pos = vector3(0.0, -2.0, 1.1), guard = true},
                {pos = vector3(0.0, 2.5, 1.1), guard = true},
            },
            reward = {min = 10, max = 25},
        },
		arrival_bandits = {
            {pos = vector3(2345.034, 2025.555, 168.778), model = `mp_g_m_m_unicriminals_03`, preset = 1, heading = 316.516, weapon = `weapon_thrown_molotov`},
            {pos = vector3(2348.164, 2029.584, 169.861), model = `mp_g_m_m_unicriminals_03`, preset = 4, heading = 313.580, weapon = `weapon_shotgun_pump`},
            {pos = vector3(2341.683, 2013.845, 167.171), model = `mp_g_m_m_unicriminals_03`, preset = 5, heading = 294.607, weapon = `weapon_revolver_cattleman`},
            {pos = vector3(2344.365, 2013.565, 165.982), model = `mp_g_m_m_unicriminals_03`, preset = 6, heading = 305.884, weapon = `weapon_revolver_cattleman`},
            {pos = vector3(2344.045, 2018.203, 166.683), model = `mp_g_m_m_unicriminals_03`, preset = 7, heading = 341.040, weapon = `weapon_repeater_carbine`},
        },
	},
	[5] = {
		riding_pos = vector3(-2670.743, -2095.510, 71.635),
		train_spawn = vector3(-2859.442, -2024.853, 78.688),
        train_end = vector3(-2498.501, -2434.331, 60.218),
        train_hash = 0x487B2BE7,
		train_speed = 7.0,
		direction = 0,
        train_carriage = {
            allowed_carriage = {[2] = true, [4] = true, [5] = true, [6] = true, [7] = true},
            loot_pos = {
                {pos = vector3(0.0, -4.0, 1.1), guard = true},
                {pos = vector3(0.1, 0.0, 1.1), guard = true},
                {pos = vector3(0.0, -2.0, 1.1), guard = true},
                {pos = vector3(0.0, 2.5, 1.1), guard = true},
            },
            reward = {min = 25, max = 40},
        },
		arrival_bandits = {
            {pos = vector3(-2727.290, -2093.860, 71.075), model = `mp_g_m_m_unicriminals_07`, preset = 2, heading = 297.851, weapon = `weapon_thrown_molotov`},
            {pos = vector3(-2730.923, -2087.594, 72.950), model = `mp_g_m_m_unicriminals_07`, preset = 3, heading = 285.573, weapon = `weapon_shotgun_pump`},
            {pos = vector3(-2738.026, -2081.427, 75.593), model = `mp_g_m_m_unicriminals_07`, preset = 7, heading = 282.651, weapon = `weapon_revolver_cattleman`},
            {pos = vector3(-2746.793, -2081.103, 76.163), model = `mp_g_m_m_unicriminals_07`, preset = 8, heading = 280.090, weapon = `weapon_revolver_cattleman`},
            {pos = vector3(-2769.747, -2079.609, 76.275), model = `mp_g_m_m_unicriminals_07`, preset = 12, heading = 258.227, weapon = `weapon_repeater_carbine`},
        },
	},
	[6] = {
		riding_pos = vector3(-3750.209, -2051.419, -4.839),
		train_spawn = vector3(-3824.134, -1922.550, 25.783),
        train_end = vector3(-3749.183, -2610.737, -13.722),
        train_hash = 0x487B2BE7,
		train_speed = 5.0,
		direction = 1,
        train_carriage = {
            allowed_carriage = {[2] = true, [4] = true, [5] = true, [6] = true, [7] = true},
            loot_pos = {
                {pos = vector3(0.0, -4.0, 1.1), guard = true},
                {pos = vector3(0.1, 0.0, 1.1), guard = true},
                {pos = vector3(0.0, -2.0, 1.1), guard = true},
                {pos = vector3(0.0, 2.5, 1.1), guard = true},
            },
            reward = {min = 25, max = 40},
        },
		arrival_bandits = {
            {pos = vector3(-3775.707, -2011.635, 2.066), model = `mp_g_m_m_unicriminals_08`, preset = 0, heading = 192.680, weapon = `weapon_thrown_molotov`},
            {pos = vector3(-3770.784, -2010.181, 0.890), model = `mp_g_m_m_unicriminals_08`, preset = 14, heading = 228.226, weapon = `weapon_shotgun_pump`},
            {pos = vector3(-3766.159, -2010.850, -0.330), model = `mp_g_m_m_unicriminals_08`, preset = 16, heading = 200.301, weapon = `weapon_revolver_cattleman`},
            {pos = vector3(-3775.961, -1998.037, 5.168), model = `mp_g_m_m_unicriminals_08`, preset = 17, heading = 155.253, weapon = `weapon_revolver_cattleman`},
            {pos = vector3(-3781.314, -1999.460, 5.295), model = `mp_g_m_m_unicriminals_08`, preset = 15, heading = 184.327, weapon = `weapon_repeater_carbine`},
        },
	},
	[7] = {
		riding_pos = vector3(-5855.638, -3636.633, -25.738),
		train_spawn = vector3(-5972.840, -3411.602, -21.123),
        train_end = vector3(-5235.745, -3466.491, -20.258),
        train_hash = 0x487B2BE7,
		train_speed = 14.0,
		direction = 1,
        train_carriage = {
            allowed_carriage = {[2] = true, [4] = true, [5] = true, [6] = true, [7] = true},
            loot_pos = {
                {pos = vector3(0.0, -4.0, 1.1), guard = true},
                {pos = vector3(0.1, 0.0, 1.1), guard = true},
                {pos = vector3(0.0, -2.0, 1.1), guard = true},
                {pos = vector3(0.0, 2.5, 1.1), guard = true},
            },
            reward = {min = 10, max = 15},
        },
		arrival_bandits = {
            {pos = vector3(-5892.885, -3620.590, -20.315), model = `mp_g_m_m_unicriminals_09`, preset = 2, heading = 262.505, weapon = `weapon_thrown_molotov`},
            {pos = vector3(-5889.797, -3621.063, -20.364), model = `mp_g_m_m_unicriminals_09`, preset = 4, heading = 260.644, weapon = `weapon_shotgun_pump`},
            {pos = vector3(-5890.578, -3625.556, -20.594), model = `mp_g_m_m_unicriminals_09`, preset = 18, heading = 219.767, weapon = `weapon_revolver_cattleman`},
            {pos = vector3(-5893.643, -3618.042, -20.872), model = `mp_g_m_m_unicriminals_09`, preset = 20, heading = 295.881, weapon = `weapon_revolver_cattleman`},
            {pos = vector3(-5889.635, -3615.345, -21.140), model = `mp_g_m_m_unicriminals_09`, preset = 21, heading = 270.344, weapon = `weapon_repeater_carbine`},
        },
	},

	
}

Config.Missions = {
--[[[1] = {
        name = "Train Robbery",
        ped = {model = `a_m_m_sclroughtravellers_01`, preset = 0, heading = 249.582},
        start_pos = vector3(461.724, 2038.191, 234.744),
        horse = `a_c_horse_morgan_flaxenchestnut`,
		bandits_allowed = 1,-- 0 = no bandits, 1 = bandits, 2 = random (no or yes) bandits
		missionConfig = 1,
        job = false,
    },
	[2] = {
        name = "Train Robbery",
        ped = {model = `a_m_m_sclroughtravellers_01`, preset = 1, heading = 244.987},
        start_pos = vector3(297.787, 2049.659, 225.023),
        horse = `a_c_horse_gypsycob_skewbald`,
		bandits_allowed = 1,-- 0 = no bandits, 1 = bandits, 2 = random (no or yes) bandits
		missionConfig = 1,
        job = false,
    },
	[3] = {
        name = "Train Robbery",
        ped = {model = `mp_re_slumpedhunter_males_01`, preset = 3, heading = 204.257},
        start_pos = vector3(108.340, 1803.488, 200.556),
        horse = `a_c_horse_norfolkroadster_rosegrey`,
		bandits_allowed = 0,-- 0 = no bandits, 1 = bandits, 2 = random (no or yes) bandits
		missionConfig = 1,
        job = false,
    },
	[4] = {
        name = "Train Robbery",
        ped = {model = `mp_re_slumpedhunter_males_01`, preset = 4, heading = 353.578},
        start_pos = vector3(738.932, 1821.162, 236.025),
        horse = `a_c_horse_turkoman_silver`,
		bandits_allowed = 2,-- 0 = no bandits, 1 = bandits, 2 = random (no or yes) bandits
		missionConfig = 1,
        job = false,
    },
	[5] = {
        name = "Train Robbery",
        ped = {model = `mp_s_m_m_revenueagents_01`, preset = 5, heading = 226.381},
        start_pos = vector3(777.627, 1512.176, 201.094),
        horse = `a_c_horse_thoroughbred_dapplegrey`,
		bandits_allowed = 2,-- 0 = no bandits, 1 = bandits, 2 = random (no or yes) bandits
		missionConfig = 1,
        job = false,
    },
	[6] = {
        name = "Train Robbery",
        ped = {model = `mp_s_m_m_revenueagents_01`, preset = 6, heading = 358.566},
        start_pos = vector3(-153.245, 1749.678, 190.724),
        horse = `a_c_horse_tennesseewalker_goldpalomino_pc`,
		bandits_allowed = 2,-- 0 = no bandits, 1 = bandits, 2 = random (no or yes) bandits
		missionConfig = 1,
        job = false,
    },
	[7] = {
        name = "Train Robbery",
        ped = {model = `mp_a_m_m_saloonpatrons_02`, preset = 7, heading = 4.487},
        start_pos = vector3(-756.226, -842.928, 51.664),
        horse = `a_c_horse_tennesseewalker_blackrabicano`,
		bandits_allowed = 1,-- 0 = no bandits, 1 = bandits, 2 = random (no or yes) bandits
		missionConfig = 2,
        job = false,
    },
	[8] = {
        name = "Train Robbery",
        ped = {model = `mp_a_m_m_saloonpatrons_02`, preset = 8, heading = 176.702},
        start_pos = vector3(-858.480, -752.687, 58.216),
        horse = `a_c_horse_suffolkpunch_redchestnut`,
		bandits_allowed = 2,-- 0 = no bandits, 1 = bandits, 2 = random (no or yes) bandits
		missionConfig = 2,
        job = false,
    },
	[9] = {
        name = "Train Robbery",
        ped = {model = `mp_a_m_m_saloonpatrons_04`, preset = 9, heading = 292.846},
        start_pos = vector3(-958.160, -328.458, 55.150),
        horse = `a_c_horse_shire_lightgrey`,
		bandits_allowed = 2,-- 0 = no bandits, 1 = bandits, 2 = random (no or yes) bandits
		missionConfig = 2,
        job = false,
    },
	[10] = {
        name = "Train Robbery",
        ped = {model = `mp_a_m_m_saloonpatrons_04`, preset = 10, heading = 207.639},
        start_pos = vector3(-1121.428, -661.006, 77.735),
        horse = `a_c_horse_nokota_reversedappleroan`,
		bandits_allowed = 2,-- 0 = no bandits, 1 = bandits, 2 = random (no or yes) bandits
		missionConfig = 2,
        job = false,
    },
	[11] = {
        name = "Train Robbery",
        ped = {model = `s_m_m_sdcowpoke_01`, preset = 11, heading = 140.895},
        start_pos = vector3(1721.932, -403.866, 47.121),
        horse = `a_c_horse_mustang_grullodun`,
		bandits_allowed = 1,-- 0 = no bandits, 1 = bandits, 2 = random (no or yes) bandits
		missionConfig = 3,
        job = false,
    },
	[12] = {
        name = "Train Robbery",
        ped = {model = `s_m_m_sdcowpoke_01`, preset = 12, heading = 91.098},
        start_pos = vector3(1878.377, -618.225, 41.025),
        horse = `a_c_horse_mustang_tigerstripedbay`,
		bandits_allowed = 2,-- 0 = no bandits, 1 = bandits, 2 = random (no or yes) bandits
		missionConfig = 3,
        job = false,
    },
	[13] = {
        name = "Train Robbery",
        ped = {model = `mp_g_m_y_uniexconfeds_01`, preset = 34, heading = 157.464},
        start_pos = vector3(1160.298, -597.059, 77.356),
        horse = `a_c_horse_mp_mangy_backup`,
		bandits_allowed = 2,-- 0 = no bandits, 1 = bandits, 2 = random (no or yes) bandits
		missionConfig = 3,
        job = false,
    },
	[14] = {
        name = "Train Robbery",
        ped = {model = `mp_g_m_y_uniexconfeds_01`, preset = 14, heading = 116.552},
        start_pos = vector3(2761.652, 2302.077, 157.606),
        horse = `a_c_horse_morgan_bayroan`,
		bandits_allowed = 1,-- 0 = no bandits, 1 = bandits, 2 = random (no or yes) bandits
		missionConfig = 4,
        job = false,
    },
	[15] = {
        name = "Train Robbery",
        ped = {model = `mp_g_m_m_unimountainmen_01`, preset = 15, heading = 227.884},
        start_pos = vector3(2163.889, 2101.512, 225.475),
        horse = `a_c_horse_missourifoxtrotter_sablechampagne`,
		bandits_allowed = 1,-- 0 = no bandits, 1 = bandits, 2 = random (no or yes) bandits
		missionConfig = 4,
        job = false,
    },
	[16] = {
        name = "Train Robbery",
        ped = {model = `mp_g_m_m_unimountainmen_01`, preset = 16, heading = 286.322},
        start_pos = vector3(2184.053, 1688.729, 113.465),
        horse = `a_c_horse_morgan_flaxenchestnut`,
		bandits_allowed = 1,-- 0 = no bandits, 1 = bandits, 2 = random (no or yes) bandits
		missionConfig = 4,
        job = false,
    },
	[17] = {
        name = "Train Robbery",
        ped = {model = `mp_g_m_m_unilangstonboys_01`, preset = 17, heading = 276.600},
        start_pos = vector3(-2688.189, -2440.738, 77.046),
        horse = `a_c_horse_kladruber_silver`,
		bandits_allowed = 1,-- 0 = no bandits, 1 = bandits, 2 = random (no or yes) bandits
		missionConfig = 5,
        job = false,
    },
	[18] = {
        name = "Train Robbery",
        ped = {model = `mp_g_m_m_unilangstonboys_01`, preset = 18, heading = 91.474},
        start_pos = vector3(-2172.796, -2132.040, 72.630),
        horse = `a_c_horse_kentuckysaddle_chestnutpinto`,
		bandits_allowed = 1,-- 0 = no bandits, 1 = bandits, 2 = random (no or yes) bandits
		missionConfig = 5,
        job = false,
    },]]
	[1] = {
        name = "Train Robbery",
        ped = {model = `g_m_m_uniranchers_01`, preset = 19, heading = 237.615},
        start_pos = vector3(-4091.727, -2105.543, -6.062),
        horse = `a_c_horse_hungarianhalfbred_flaxenchestnut`,
		bandits_allowed = 1,-- 0 = no bandits, 1 = bandits, 2 = random (no or yes) bandits
		missionConfig = 6,
        job = false,
    },
	[2] = {
        name = "Train Robbery",
        ped = {model = `g_m_m_uniranchers_01`, preset = 20, heading = 260.461},
        start_pos = vector3(-3423.812, -2080.536, -6.336),
        horse = `a_c_horse_gang_sean`,
		bandits_allowed = 1,-- 0 = no bandits, 1 = bandits, 2 = random (no or yes) bandits
		missionConfig = 6,
        job = false,
    },
	[3] = {
        name = "Train Robbery",
        ped = {model = `g_m_m_unibrontegoons_01`, preset = 21, heading = 210.0},
        start_pos = vector3(-3651.481, -2634.274, -14.837),
        horse = `a_c_horse_gang_javier`,
		bandits_allowed = 1,-- 0 = no bandits, 1 = bandits, 2 = random (no or yes) bandits
		missionConfig = 6,
        job = false,
    },
	[4] = {
        name = "Train Robbery",
        ped = {model = `g_m_m_unibrontegoons_01`, preset = 22, heading = 219.472},
        start_pos = vector3(-6331.083, -3596.661, -26.177),
        horse = `a_c_horse_dutchwarmblood_sealbrown`,
		bandits_allowed = 1,-- 0 = no bandits, 1 = bandits, 2 = random (no or yes) bandits
		missionConfig = 7,
        job = false,
    },
	[5] = {
        name = "Train Robbery",
        ped = {model = `g_m_m_unibanditos_01`, preset = 23, heading = 323.460},
        start_pos = vector3(-5866.354, -3073.795, 0.827),
        horse = `a_c_horse_breton_sorrel`,
		bandits_allowed = 1,-- 0 = no bandits, 1 = bandits, 2 = random (no or yes) bandits
		missionConfig = 7,
        job = false,
    },
	[6] = {
        name = "Train Robbery",
        ped = {model = `a_m_m_sdchinatown_01`, preset = 5, heading = 64.418},
        start_pos = vector3(-5363.629, -3412.877, -16.524),
        horse = `a_c_horse_andalusian_rosegray`,
		bandits_allowed = 1,-- 0 = no bandits, 1 = bandits, 2 = random (no or yes) bandits
		missionConfig = 7,
        job = false,
    },
}
