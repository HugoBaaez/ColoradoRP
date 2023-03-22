Config = {}

Config.OneSyncOn = true
Config.Fix_Money_Hunt = true

Config.Gum_Notify_Old = false
Config.FirstName = ""--If you use old Notify you must add Image path
Config.SecondName = ""--If you use old Notify fro mme you must add Image Name

Config.Gum_Notify_NUI = true
Config.Image = "money"


Config.DiscordHook = true
Config.HookName = "RWRP"
Config.Webhook_link = "https://discord.com/api/webhooks/1010936344991764600/NmrwIeG8X4qteDsJYd_aYtJhIRPT1VaZ0Y9t9ojT9uH9uhAJMUBfyJFgoXB6OXd1yK0Y"
Config.HookLanguage = {
    [1] = {text = "Steam name",},
    [2] = {text = "Steam hex",},
    [3] = {text = "Volte o carrinho",},
    [4] = {text = "Compre itens : ",},
    [5] = {text = "for",},
    [6] = {text = "Vender por ",},
    [7] = {text = "Vender peles por ",},
    [8] = {text = "vender itens"}
}

Config.Language = {
    [1] = {text = "Selecionar",},
    [2] = {text = "Quanto comprar?",},
    [3] = {text = "Você seleciona preço ruim.",},
    [4] = {text = "Armazém geral",},
    [5] = {text = "Preço",},
    [6] = {text = "Preço",},
    [7] = {text = "Expandir para",},
    [8] = {text = "Mercadorias para importação",},
    [9] = {text = "Selecione o local para exportação",},
    [10] = {text = "Você começa a expandir a loja, pega os itens no carrinho e leva para a loja. Loja que você fixou no mapa. Depois de expandir todos os suprimentos, leve o carrinho de volta aos estábulos próximos",},
    [11] = {text = "Armazém geral",},
    [12] = {text = "Perto está outro carrinho",},
    [13] = {text = "Trabalho com suprimentos",},
    [14] = {text = "Você começa a expandir o caçador, pega itens no carrinho e leva para Saint Denis. Loja que você fixou no mapa. Depois de expandir todos os suprimentos, leve o carrinho de volta aos estábulos próximos.",},
    [15] = {text = "Você deve esperar, porque 1 carrinho foi spawnado.",},
    [16] = {text = "Você não pode, porque você não tem emprego.",},
    [18] = {text = "Você terminou a missão. Você recebeu dinheiro.",},
    [19] = {text = "Açougueiro",},
    [20] = {text = "You take :",},
    [21] = {text = "Você não está perto da loja.",},
    [22] = {text = "Você não está segurando um animal",},
    [23] = {text = "Mostrar",},
    [24] = {text = "Iniciar expandir/exportar",},
    [25] = {text = "Pegar Suprimentos",},
    [26] = {text = "Colocar na carroça",},
    [27] = {text = "Colocar suprimentos",},
    [28] = {text = "Vender animal",},
    [29] = {text = "Iniciar expandir/exportar",},
    [30] = {text = "Devolver carroça",},
    [31] = {text = "Comprar",},
    [32] = {text = "Sair",},
    [33] = {text = "Você pagou 1 $ pelo carrinho (se você pegar o carrinho de volta, você recebe o dinheiro de volta)",},
    [34] = {text = "Você comprou : ",},
    [35] = {text = "Seu inventário está cheio",},
    [36] = {text = "Você não tem dinheiro",},
    [37] = {text = "Você não tem dinheiro para alugar a carroça.Você precisa 1$.",},
    [38] = {text = "Você vendeu a pele e pegou : ",},
    [39] = {text = "Você pegou : ",},
    [40] = {text = "Você vendeu : ",},
    [41] = {text = "Mallow e vá no carrinho de novo ",},
    [42] = {text = "Você recebeu suprimentos : ",},
    [43] = {text = "Você deve ter um cavalo perto de você",},
}

Config.StandardHunting = true

Config.Job_Need = false--Job function enable 
Config.Job_Need_Item = false--If you enable you change job to items (like licences or what you like)
Config.Jobs_Needs = {
    [1] =  {job_check = "Storage_Keeper",},
    [2] =  {job_check = "Check_Text_Job",},
    [3] =  {job_check = "Storage_Job",},
} 
------------------------------------------------------------
------------------------------------------------------------
----------------Standard stores
------------------------------------------------------------
------------------------------------------------------------
Config.PayForWagon = 0.5

Config.Enable_Light_All_Items = false
Config.Light_On_Preview_Item = false

Config.Job_Rev_Spot = {
    [1] =  {
        ["blip_name"] = "Armazén",
        ["job_coords"] = {2838.19, -1364.30, 46.27},
        ["cart_spawn"] = "huntercart01",
        ["cart_coords"] = {2846.38, -1359.23, 46.15, 50.0},
        ["box_cd"] = {2833.74, -1379.90, 43.56, 45.0},
    },
}


Config.Buy_Spot = {
    Valentine_Store = {
        butcher = false,
        blip = true,
        blip_name = "Loja de Valentine",
        blip_type = 819673798,
        center = {-322.73, 801.77, 117.93, 5.0},
        enable_tax = true,
        min_max = {40.0, 100.0},
        expand_cd = {-322.29, 794.87, 117.61},
        wagon_cd = {-358.19, 787.60, 115.17},
        box_tax = {2.0, 0.9},--TAX | Price

        back_wagon_cd = {2502.28, -1432.24, 45.24}, 
        items = {
            pao = {
                name = "Pao",    props = "p_bread_13_ab",    price = 0.40,   tax = 0.03,
                coord = {-320.550, 805.3587, 117.68},
                camer = {-321.040, 805.0587, 117.88, 285.85},
            },
            agua_consumivel = {
                name = "Àgua",  props = "p_water01x",   price = 0.40,   tax = 0.03,
                coord = {-320.252, 804.3786, 118.18},
                camer = {-320.552, 804.2786, 118.30, 285.85},
            },
            telegram = {
                name = "Papel para telegrama", props = "s_inv_paper02e_x", price = 0.20, tax = 0.03,
                coord = {-322.996, 803.7608, 117.98, 50.60},
                camer = {-321.696, 803.4608, 118.08, 60.50},
            },
            cigarro = {
                name = "Cigarro",    props = "p_cigarette_cs02x",  price = 0.90,   tax = 0.03,
                coord = {-322.965, 804.7943, 117.93},
                camer = {-322.465, 804.7943, 118.10, 96.13},
            },
            -- cafe_consumivel = {
            --     name = "Café",   props = "p_mugcoffee01x",    price = 0.40,   tax = 0.03,
            --     coord = {-323.56, 796.73, 117.66, 7.87},
            --     camer = {-323.64, 796.55, 117.85, -168.82},
            -- },
            consumable_haycube = {
                name = "Feno em Cubo", props = "s_horsnack_haycube01x", price = 1.30, tax = 0.03,
                coord = {-324.06, 796.59, 117.69, 7.87}, 
                camer = {-324.24, 796.55, 117.65, -168.82},
            },
            garrafavazia = {
                name = "Garrafa Vazia", props = "p_bottletequilafull02x",   price = 0.10,   tax = 0.03,
                coord = {-319.30, 799.12, 118.24, 282.00},
                camer = {-319.84, 798.55, 118.42, -77.46},
            },
            wateringcan = {
                name = "Balde",  props = "p_bucket03x",  price = 0.40,   tax = 0.03,
                coord = {-325.28, 799.57, 117.94, 91.36},
                camer = {-324.65, 799.68, 118.22, 99.66},
            },
            -- biscoito = {
            --     name = "Biscoitos",  props = "p_biscuits02x",  price = 0.40,   tax = 0.03,
            --     coord = {-319.70, 802.02, 118.19, 108.28},
            --     camer = {-320.19, 801.93, 118.32, -77.66},
            -- },
            hairpomade = {
                name = "Pomada de cabelo", props = "p_boxgelatin01x", price = 0.70, tax = 0.03,
                coord = {-319.97, 803.60, 118.18, 108.28},
                camer = {-321.20, 803.40, 118.38, -77.66},
            },
            stim = {
                name = "Estimulante Animal", props = "p_cs_syringe01x", price = 10.0, tax = 0.03,
                coord = {-319.87, 802.60, 118.18, 108.28},
                camer = {-321.20, 802.40, 118.38, -77.66},
            },
            goldpan = {
                name = "Paneira",    props = "p_cs_miningpan01x",   price = 1.00,   tax = 0.03,
                coord = {-322.92, 802.52, 117.90, 50.65},
                camer = {-322.20, 802.11, 118.30, 60.50},
            },
            charuto = {
                name = "Charuto",    props = "p_cigarlit01x",   price = 1.50,   tax = 0.03,
                coord = {-323.91, 802.30, 117.94, 50.65},
                camer = {-322.20, 802.11, 118.30, 60.50},
            },
            maca = {
                name = "Maçã",    props = "s_inv_apple01x",   price = 0.20,   tax = 0.03,
                coord = {-322.41, 798.81, 117.85, 50.65},
                camer = {-322.12, 798.61, 118.00, 52.47},
            },
            horsebrush = {
                name = "Escova de Cavalo", props = "p_brushhorse02x", price = 1.0, tax = 0.03,
                coord = {-322.59, 799.93, 117.88, 50.65},
                camer = {-322.12, 799.53, 118.28, 52.47},
            },
            -- salmao_enlatado = {
            --     name = "Salmão Enlatado", props = "s_canbeansused01x", price = 0.80,   tax = 0.03,
            --     coord = {-319.43, 800.25, 118.24, 282.00},
            --     camer = {-319.10, 799.12, 118.24, 282.00},
            -- },
            -- feijaoenlatado = {
            --     name = "Feijão Enlatdo",   props = "s_canbeansused01x", price = 0.80,   tax = 0.03,
            --     coord = {-319.47, 800.74, 118.19, 9.59},
            --     camer = {-320.09, 800.63, 118.47, -81.62},
            -- },
            tabacomascar = {
                name = "Tabaco de Mascar", props = "s_tobaccotin01x", price = 1.00, tax = 0.03,
                coord = {-321.12, 797.15, 117.60},
                camer = {-321.545, 797.77, 118.08,  -168.82},
            },
        }
    },
    Blackwater_Store = {
        butcher = false,
        blip = true,
        blip_name = "Blackwater store",
        blip_type = 819673798,
        center = {-785.49, -1324.54, 42.88, 10.0},
        enable_tax = true,
        min_max = {40.0, 100.0},
        expand_cd = {-790.32, -1318.90, 42.54},
        wagon_cd = {-852.23, -1365.78, 43.56},
        box_tax = {2.0, 1.5},--TAX | Price
        
        back_wagon_cd = {2502.28, -1432.24, 45.24}, 
        items = {
            pao = {
                name = "Pão",    props = "p_bread_13_ab",    price = 0.40,   tax = 0.03,
                coord = {-789.68, -1321.16, 43.68, 114.46},
                camer = {-789.69, -1321.59, 43.94, -1.12},
            },
            agua_consumivel = {
                name = "Àgua",  props = "p_water01x",   price = 0.40,   tax = 0.03,
                coord = {-788.02, -1321.26, 43.68, 43.00},
                camer = {-788.02, -1321.68, 43.94, 0.61},
            },
            -- salmao_enlatado = {
            --     name = "Salmão Enlatado", props = "s_canbeansused01x", price = 0.80, tax = 0.03,
            --     coord = {-784.801, -1327.25, 43.683},
            --     camer = {-784.791, -1326.50, 44.083,-175.36},
            -- },
            cigarro = {
                name = "Cigarro",    props = "p_cigarette_cs02x",  price = 0.90,   tax = 0.03,
                coord = {-788.63, -1327.39, 43.94, 177.39},
                camer = {-788.60, -1326.96, 44.17, 175.57},
            },
            telegram = {
                name = "Papel para telegrama", props = "s_inv_paper02e_x", price = 0.20, tax = 0.03,
                coord = {-787.883, -1327.37, 43.95},
                camer = {-787.883, -1326.77, 44.084, 188.7},
            },
            consumable_haycube = {
                name = "Feno em Cubo", props = "s_horsnack_haycube01x", price = 1.30, tax = 0.03,
                coord = {-783.271, -1325.30, 43.88, 87.11},
                camer = {-782.271, -1325.15, 44.084, 87.11},
            },
            horsebrush = {
                name = "Escova de Cavalo", props = "p_brushhorse02x", price = 1.00, tax = 0.03,
                coord = {-790.10, -1324.42, 43.49},
                camer = {-789.309, -1324.42, 43.59, 88.96},
            },
            stim = {
                name = "Estimulante Animal", props = "p_cs_syringe01x", price = 10.00, tax = 0.03,
                coord = {-790.15, -1325.62, 43.52, 352.64},
                camer = {-789.509, -1325.62, 43.60, 102.22},
            },
            goldpan = {
                name = "Peneira", props = "p_cs_miningpan01x", price = 1.00, tax = 0.03,
                coord = {-786.269, -1323.11, 43.90},
                camer = {-786.269, -1323.91, 44.084, 2.75},
            },
            -- cafe_consumivel = {
            --     name = "Café",   props = "p_mugcoffee01x",    price = 0.40,   tax = 0.03,
            --     coord = {-786.82, -1322.26, 43.93, 287.68},
            --     camer = {-787.14, -1322.39, 44.06, -67.55},
            -- },
            garrafavazia = {
                name = "Garrafa Vazia", props = "p_bottletequilafull02x",   price = 0.10,   tax = 0.03,
                coord = {-787.05, -1327.38, 43.92, -148.84},
                camer = {-787.04, -1326.98, 44.17, 178.20},
            },
            wateringcan = {
                name = "Balde",  props = "p_bucket03x",  price = 0.40,   tax = 0.03,
                coord = {-785.65, -1325.12, 43.51, 272.00},
                camer = {-785.87, -1324.60, 43.87, -157.23},
            },
            -- biscoito = {
            --     name = "Biscoitos",  props = "p_biscuits02x",  price = 0.40,   tax = 0.03,
            --     coord = {-785.50, -1327.26, 43.66, 357.49},
            --     camer = {-785.53, -1326.91, 43.80, -175.36},
            -- },
            maca = {
                name = "Maçã",    props = "s_inv_apple01x",   price = 0.20,   tax = 0.03,
                coord = {-783.76, -1327.28, 43.70, -88.56},
                camer = {-783.79, -1326.78, 43.90, -178.28},
            },
            acucar = {
                name = "Açucar", props = "p_sacksugar01x", price = 1.50, tax = 0.03,
                coord = {-788.876, -1321.34, 42.824},
                camer = {-788.876, -1321.84, 44.084, 2.01},
            },
        }
    },
    SaintDenis_Store = {
        butcher = false,
        blip = true,
        blip_name = "Loja de Saint Denis",
        blip_type = 819673798,
        center = {2829.72, -1313.29, 46.17, 10.0},
        enable_tax = true,
        min_max = {40.0, 100.0},
        expand_cd = {2820.48, -1315.00, 45.17},
        wagon_cd = {2504.26, -1430.86, 45.17},
        box_tax = {2.0, 0.7},--TAX | Price

        back_wagon_cd = {2502.28, -1432.24, 45.24}, 
        items = {
            pao = {
                name = "Pao",    props = "p_bread_13_ab",    price = 1.00,   tax = 0.03,
                coord = {2830.58, -1317.11, 46.80, 131.46},
                camer = {2830.29, -1316.97, 46.99, -130.89},
            },
            agua_consumivel = {
                name = "Àgua",  props = "p_water01x",   price = 1.00,   tax = 0.03,
                coord = {2832.94, -1314.35, 46.80, 43.00},
                camer = {2832.59, -1314.03, 46.99, -130.89},
            },
            cigarro = {
                name = "Cigarro",    props = "p_cigarette_cs02x",  price = 1.50,   tax = 0.03,
                coord = {2834.07, -1313.01, 46.80, 225.39},
                camer = {2833.72, -1312.71, 46.99, -130.89},
            },
            -- cafe_consumivel = {
            --     name = "Café",   props = "p_mugcoffee01x",    price = 1.00,   tax = 0.03,
            --     coord = {2831.63, -1309.64, 47.25, 287.68},
            --     camer = {2831.45, -1309.86, 47.39, -41.89},
            -- },
            -- salmao_enlatado = {
            --     name = "Salmão Enlatado", props = "s_canbeansused01x", price = 0.80, tax = 0.03,
            --     coord = {2833.32, -1311.08, 46.81},
            --     camer = {2833.52, -1311.18, 46.95, 325.47},
            -- },
            -- feijaoenlatado = {
            --     name = "Feijão enlatado", props = "s_canbeansused01x", price = 0.80, tax = 0.03,
            --     coord = {2832.50, -1310.50, 46.85},
            --     camer = {2831.943, -1311.14, 46.955, 323.35},
            -- },
            telegram = {
                name = "Papel para telegrama", props = "s_inv_paper02e_x", price = 0.20, tax = 0.03,
                coord = {2827.52, -1321.00, 47.26},
                camer = {2827.31, -1320.70, 47.45, 232.75},
            },
            garrafavazia = {
                name = "Garrafa Vazia", props = "p_bottletequilafull02x",   price = 0.20,   tax = 0.03,
                coord = {2829.26, -1308.94, 46.80, -148.84},
                camer = {2829.56, -1309.20, 47.08, 49.22},
            },
            wateringcan = {
                name = "Balde",  props = "p_bucket03x",  price = 1,   tax = 1.00,
                coord = {2828.07, -1310.21, 46.80, 272.00},
                camer = {2828.45, -1310.53, 47.08, 49.22},
            },
            -- biscoito = {
            --     name = "Biscoitos",  props = "p_biscuits02x",  price = 1,   tax = 0.03,
            --     coord = {2825.95, -1312.78, 46.80, 357.49},
            --     camer = {2826.29, -1313.04, 46.98, 49.22},
            -- },
            maca = {
                name = "Maçã",    props = "s_inv_apple01x",   price = 0.30,   tax = 0.03,
                coord = {2828.66, -1314.52, 46.73},
                camer = {2828.64, -1314.99, 46.95, 352.37},
            },
            horsebrush = {
                name = "Escova de Cavalo", props = "p_brushhorse02x", price = 1.00, tax = 0.03,
                coord = {2824.29, -1317.35, 46.65},
                camer = {2824.59, -1316.86, 46.95, 137.79}
            },
            stim = {
                name = "Estimulante Animal", props = "p_cs_syringe01x", price = 10.00, tax = 0.03,
                coord = {2825.28, -1318.96, 46.81},
                camer = {2825.78, -1318.26, 46.95, 142.68}
            }
        },

    },
    Strawberry_Store = {
        butcher = false,
        blip = true,
        blip_name = "Loja de Strawberry",
        blip_type = 819673798,
        center = {-1791.75, -385.58, 160.34, 10.0},
        enable_tax = true,
        min_max = {40.0, 100.0},
        expand_cd = { -1797.43,-383.42,160.27},
        wagon_cd = {-1806.23,-556.1,155.97},
        box_tax = {2.0, 1.80},--TAX | Price

        back_wagon_cd = {2502.28, -1432.24, 45.24}, 
        items = {
            pao = {
                name = "Pao",    props = "p_bread_13_ab",    price = 1.00,   tax = 0.03,
                coord = {-1793.403, -384.6103, 160.1349, },
                camer = {-1793.403, -384.6103, 160.1349, 149.04},
            },
            agua_consumivel = {
                name = "Àgua",  props = "p_water01x",   price = 1.00,   tax = 0.03,
                coord = {-1792.967, -384.9832, 160.1349},
                camer = {-1792.967, -384.9832, 160.1349, 147.86},
            },
            -- cafe_consumivel = {
            --     name = "Café",   props = "p_mugcoffee01x",    price = 1.00,   tax = 0.03,
            --     coord = {-1790.523, -386.0093, 160.1279},
            --     camer = {-1790.523, -386.0093, 160.1279, 233.41},
            -- },
            -- salmao_enlatado = {
            --     name = "Salmão Enlatado", props = "s_canbeansused01x", price = 0.80, tax = 0.03,
            --     coord = {-1792.683, -388.6552, 159.7805},
            --     camer = {-1792.683, -388.6552, 159.7805, 147.46},
            -- },
            -- feijaoenlatado = {
            --     name = "Feijão enlatado", props = "s_canbeansused01x", price = 0.80, tax = 0.03,
            --     coord = {-1793.632, -387.9778, 159.7805},
            --     camer = {-1793.632, -387.9778, 159.7805, 137.52},
            -- },
            telegram = {
                name = "Papel para telegrama", props = "s_inv_paper02e_x", price = 0.20, tax = 0.03,
                coord = {-1790.887, -387.6599, 160.3719},
                camer = {-1790.887, -387.6599, 160.3719, 240.32},
            },
            garrafavazia = {
                name = "Garrafa Vazia", props = "p_bottletequilafull02x",   price = 0.20,   tax = 0.03,
                coord = {-1794.596, -387.0436, 159.9325},
                camer = {-1794.596, -387.0436, 159.9325, 144.63},
            },
            wateringcan = {
                name = "Balde",  props = "p_bucket03x",  price = 1,   tax = 1.00,
                coord = {-1790.407, -383.6965, 160.1119},
                camer = {-1790.407, -383.6965, 160.1119, 328.38},
            },
            maca = {
                name = "Maçã",    props = "s_inv_apple01x",   price = 0.30,   tax = 0.03,
                coord = {-1795.614, -386.5147, 160.38},
                camer = {-1795.614, -386.5147, 160.38, 147.89},
            },
            horsebrush = {
                name = "Escova de Cavalo", props = "p_brushhorse02x", price = 1.00, tax = 0.03,
                coord = {-1795.175, -383.4268, 159.7727},
                camer = {-1795.175, -383.4268, 159.7727, 54.4}
            },
            stim = {
                name = "Estimulante Animal", props = "p_cs_syringe01x", price = 10.00, tax = 0.03,
                coord = {-1796.26, -385.8487, 159.9325},
                camer = {-1796.26, -385.8487, 159.9325, 139.16}
            },
--            shoptoken = {
  --              name = "Token de Loja", props = "s_inv_coinsack01x", price = 800.00, tax = 0.03,
    --            coord = {-1792.1, -382.6463, 159.9507},
      --          camer = {-1792.1, -382.6463, 159.9507, 311.27}
        --    }
        },

    },
    Sementes_Store = {
        butcher = false,
        blip = true,
        blip_name = "Loja de Sementes",
        blip_type = 819673798,
        center = {2821.58, -1225.90, 47.75, 10.0},
        enable_tax = false,
        min_max = {40.0, 100.0},
        expand_cd = {},
        wagon_cd = {},
        box_tax = {},--TAX | Price

        back_wagon_cd = {}, 
        items = {
            sementetomate = {
                name = "Semente de Tomate", props = "p_packetseeds01x", price = 0.10, tax = 0.01,
                coord = {2819.56, -1227.85, 47.79},
                camer = {2820.06, -1227.55, 48.26, 128.77},
            },
            sementecenoura = {
                name = "Semente de Cenoura", props = "p_packetseeds01x", price = 0.10, tax = 0.01,
                coord = {2822.10, -1229.39, 47.46},
                camer = {2822.50, -1229.03, 47.76,139.69}
            },
            sementebrocolis = {
                name = "Semente de Brócolis", props = "p_packetseeds01x", price = 0.10, tax = 0.01,
                coord = {2825.450, -1224.75, 47.221},
                camer = {2824.930, -1225.85, 47.771, 357.78},
            },
            sementebatata = {
                name = "Semente de Batata", props = "p_packetseeds01x", price = 0.10, tax = 0.01,
                coord = {2822.807, -1223.03, 47.356},
                camer = {2822.427, -1223.03, 47.426,271.09},
            },
            sementetrigo = {
                name = "Semente de Trigo", props = "p_packetseeds01x", price = 0.10, tax = 0.01,
                coord = {2825.536, -1227.65, 47.590},
                camer = {2824.736, -1227.55, 47.798, 254.64},
            },
            barbaseed = {
                name = "Semente de Beterraba", props = "p_packetseeds01x", price = 0.10, tax = 0.01,
                coord = {2827.284, -1232.80, 47.69},
                camer = {2827.914, -1232.60, 47.853, 103.77},
            },
            sementemilho ={
                name = "Semente de Milho", props = "p_packetseeds01x", price = 0.10, tax = 0.01,
                coord = {2822.85, -1229.91, 47.187},
                camer = {2823.579, -1229.11, 47.767,132.43}
            } ,
        },
    },
    Rhodes_Store = {
        butcher = false,
        blip = true,
        blip_name = "Rhodes store",
        blip_type = 819673798,
        center = {1329.91, -1292.27, 78.64, 10.0},
        enable_tax = true,
        min_max = {40.0, 100.0},
        expand_cd = {1328.61, -1297.16, 78.05},
        wagon_cd = {1423.646, -1299.18, 77.720},
        box_tax = {2.0, 0.7},--TAX | Price
 
        back_wagon_cd = {2502.28, -1432.24, 45.24}, 
        items = {
            pao = {
                name = "Pão",    props = "p_bread_13_ab",    price = 0.40,   tax = 0.03,
                coord = {1330.85, -1290.33, 77.05, -108.70},
                camer = {1330.66, -1290.68, 77.19, -27.60},
            },
            agua_consumivel = {
                name = "Àgua",  props = "p_water01x",   price = 0.40,   tax = 0.03,
                coord = {1329.14, -1289.54, 76.76, -24.27},
                camer = {1329.01, -1289.86, 76.97, -22.59},
            },
            cigarro = {
                name = "Cigarro",    props = "p_cigarette_cs02x",  price = 0.90,   tax = 0.03,
                coord = {1327.04, -1288.45, 76.81, -24.56},
                camer = {1326.89, -1288.75, 76.97, -26.68},
            },
            -- cafe_consumivel = {
            --     name = "Café",   props = "p_mugcoffee01x",    price = 0.40,   tax = 0.03,
            --     coord = {1325.24, -1289.07, 77.05, 48.24},
            --     camer = {1325.49, -1289.19, 77.18, 64.23},
            -- },
            garrafavazia = {
                name = "Garrafa Vazia", props = "p_bottletequilafull02x",   price = 0.10,   tax = 0.03,
                coord = {1324.61, -1293.48, 76.82, 154.03},
                camer = {1324.75, -1293.17, 77.05, 156.35},
            },
            wateringcan = {
                name = "Balde",  props = "p_bucket03x",  price = 0.40,   tax = 0.03,
                coord = {1329.71, -1292.38, 77.05, -116.55},
                camer = {1329.25, -1292.16, 77.42, -115.23},
            },
            hairpomade = {
                name = "Pomada de Cabelo",  props = "p_boxgelatin01x",  price = 0.70,   tax = 0.03,
                coord = {1326.68, -1291.06, 76.81, -113.62},
                camer = {1326.36, -1290.93, 76.95, -112.50},
            },
            maca = {
                name = "Maçã",    props = "s_inv_apple01x",   price = 0.20,   tax = 0.03,
                coord = {1329.88, -1289.84, 76.78, -24.97},
                camer = {1329.69, -1290.41, 77.00, -22.74},
            },
            -- salmao_enlatado = {
            --     name = "Salmão Enlatado", props = "s_canbeansused01x", price = 0.80, tax = 0.03,
            --     coord = {1324.35, -1290.93, 77.05},
            --     camer = {1324.75, -1290.93, 77.22, 71.05},
            -- },
            consumable_haycube = {
                name = "Feno em Cubo", props = "s_horsnack_haycube01x", price = 1.30, tax = 0.03,
                coord = {1328.84, -1293.98, 77.06},
                camer = {1328.65, -1293.88, 77.22, 244.94},
            },
            telegram = {
                name = "Papel para Telegrama", props = "s_inv_paper02e_x", price = 0.20, tax = 0.03,
                coord = {1324.71, -1290.10, 77.00},
                camer = {1324.71, -1290.45, 77.22,11.71},
            },
        }
    },
    Armadilo_Store = {
        butcher = false,
        blip = true,
        blip_name = "Armadilo",
        blip_type = 819673798,
        center = {-3684.88, -2626.52, -13.43, 10.0},
        enable_tax = true,
        min_max = {40.0, 100.0},
        expand_cd = {-3678.75, -2623.27, -13.92},
        wagon_cd = {-3687.33, -2570.80, -13.72},
        box_tax = {2.0, 2.0},--TAX | Price

        back_wagon_cd = {}, 
        items = {
--[[            p_oppio = {
                name = "Semente de Oppio", props = "p_packetseeds01x", price = 0.35, tax = 0.01,
                coord = {-3686.874, -2629.229, -13.80412},
                camer = {-3686.874, -2629.229, -13.80412,158.78},
            },]]
            lockpick = {
                name = "lockpick", props = "p_key02x", price = 0.75, tax = 0.01,
                coord = {-3688.738, -2622.562, -13.85833},
                camer = {-3688.738, -2622.562, -13.85833,89.85},
            },
            robbingkit = {
                name = "Pá", props = "p_hangingshovel03x", price = 0.55, tax = 0.01,
                coord = {-3686.928, -2626.177, -13.4114},
                camer = {-3686.928, -2626.177, -13.4114, 101.73},
            },
            blacktelegram = {
                name = "Telegrama Anônimo", props = "s_inv_paper02e_x", price = 0.50, tax = 0.03,
                coord = {-3686.397, -2623.535, -13.38161},
                camer = {-3686.397, -2623.535, -13.38161, 86.20},
            },
            pao = {
                name = "Pão",    props = "p_bread_13_ab",    price = 0.40,   tax = 0.03,
                coord = {-3681.313, -2628.054, -13.40956},
                camer = {-3681.313, -2628.054, -13.40956, 181.14},
            },
            agua_consumivel = {
                name = "Àgua",  props = "p_water01x",   price = 0.40,   tax = 0.03,
                coord = {-3682.468, -2628.093, -13.40956},
                camer = {-3682.468, -2628.093, -13.40956, 173.11},
            },
            garrafavazia = {
                name = "Garrafa Vazia", props = "p_bottletequilafull02x",   price = 0.10,   tax = 0.03,
                coord = {-3684.196, -2629.785, -13.62991},
                camer = {-3684.196, -2629.785, -13.62991, 189.31},
            },
            horsebrush = {
                name = "Escova de Cavalo", props = "p_brushhorse02x", price = 1.00, tax = 0.03,
                coord = {-3685.312, -2629.77, -13.62991},
                camer = {-3685.312, -2629.77, -13.62991, 189.31}
            },
            stim = {
                name = "Estimulante Animal", props = "p_cs_syringe01x", price = 10.00, tax = 0.03,
                coord = {-3684.046, -2622.233, -13.90135},
                camer = {-3684.046, -2622.233, -13.90135, 4.71}
            },
            telegram = {
                name = "Papel para Telegrama", props = "s_inv_paper02e_x", price = 0.20, tax = 0.03,
                coord = {-3688.699219, -2623.715820, -12.933513},
                camer = {-3688.699219, -2623.715820, -12.933513, 271.73},
            },
            -- dynamite = {
            --     name = "Dinamite", props = "p_dynamite02x", price = 700, tax = 0.03,
            --     coord = {-3689.433, -2626.063, -13.63341},
            --     camer = {-3689.433, -2626.063, -13.63341, 356.61},
            -- },
        }
    },
    Emerald_Ranch = {
        butcher = false,
        blip = true,
        blip_name = "Emerald",
        blip_type = 819673798,
        center = {1419.44, 376.85, 90.32, 10.0},
        enable_tax = false,
        min_max = {40.0, 100.0},
        expand_cd = {},
        wagon_cd = {},
        box_tax = {},--TAX | Price

        back_wagon_cd = {}, 
        items = {
            fermento = {
                name = "Fermento", props = "p_canempty09x", price = 0.50, tax = 0.01,
                coord = {1417.14, 378.04, 89.97},
                camer = {1417.83, 377.90, 90.53,72.50},
            },
            salsicha = {
                name = "Salsicha", props = "p_cs_sausage01x", price = 0.25, tax = 0.01,
                coord = {1417.08, 375.44, 89.98 },
                camer = {1417.19, 376.06, 90.67,166.01},
            },
            farinha = {
                name = "Farinha de Trigo", props = "p_floursack07x", price = 0.50, tax = 0.03,
                coord = {1420.526, 380.3097, 89.97018},
                camer = {1420.39, 379.67, 90.45, -15.87},
            },
            sementecacau = {
                name = "Semente de Cacau", props = "p_packetseeds01x", price = 0.20, tax = 0.01,
                coord = {1418.78, 380.07, 89.96},
                camer = {1418.72, 379.75, 90.42, -12.40},
            },
            sementepessego = {
                name = "Semente de Pessego", props = "p_packetseeds01x", price = 0.20, tax = 0.01,
                coord = {1420.37, 374.52, 89.97},
                camer = {1420.47, 375.03, 90.20, 168.56},
            },
        }
    },
   
}


Config.Sell_Spot = {
--[[    Valentine_Butcher = {
        butcher = true,
        blip = true,
        blip_name = "Açougue Valentine",
        blip_job = "",
        blip_type = 1369919445,
        enable_tax = true,
        min_max = {40.0, 100.0},
        center = {-341.42, 767.40, 115.72},
        j_coord = {-336.49, 767.62, 115.46},
        expand_cd = {2838.19, -1364.30, 46.27},
        box_tax = {2.0, 0.5},--TAX | Price
        butcher_tax = 1.00,--For 1 Animal carcas down

        cart_spawn = "huntercart01",
        cart_coords = {-333.96, 748.76, 115.90, 103.0}, 
        box_coords = {-338.71, 752.32, 115.90, 103.0}, 
        back_wagon_cd = {2502.28, -1432.24, 45.24, 103.0}, 
        items = {
            meat = {
                price = 0.05,
                tax = 0.10,
            },
            Gamey_meat = {
                price = 0.07,
                tax = 0.10,
            },
            Small_Leather = {
                price = 0.05,
                tax = 0.10,
            },
            Big_Leather = {
                price = 0.07,
                tax = 0.10,
            },
            Feather = {
                price = 0.07,
                tax = 0.10,
            },
            Snake_Poison = {
                price = 0.07,
                tax = 0.10,
            },
            Fish_meat = {
                price = 0.05,
                tax = 0.10,
            },
        }
    },]]
    Blackwater_Butcher = {
        butcher = true,
        blip = true,
        blip_name = "Açougue Bw",
        blip_job = "",
        blip_type = 1369919445,
        enable_tax = true,
        min_max = {40.0, 100.0},
        center = {-751.12, -1284.87, 43.29},
        j_coord = {-751.12, -1279.34, 43.37},
        expand_cd = {2838.19, -1364.30, 46.27},
        box_tax = {2.0, 7.3},--TAX | Price
        butcher_tax = 1.00,--For Carcass

        cart_spawn = "huntercart01",
        cart_coords = {-745.07, -1301.86, 43.13, 2.0}, 
        box_coords = {-740.49, -1291.90, 42.56, 357.0}, 
        back_wagon_cd = {2502.28, -1432.24, 45.24, 103.0}, 
        items = {
            meat = {
                price = 0.05,
                tax = 0.10,
            },
            Gamey_meat = {
                price = 0.07,
                tax = 0.10,
            },
            Small_Leather = {
                price = 0.05,
                tax = 0.10,
            },
            Big_Leather = {
                price = 0.07,
                tax = 0.10,
            },
            Feather = {
                price = 0.07,
                tax = 0.10,
            },
            Snake_Poison = {
                price = 0.07,
                tax = 0.10,
            },
            -- Fish_meat = {
            --     price = 0.05,
            --     tax = 0.10,
            -- },
        }
    },
    Rhodes_Butcher = {
        butcher = true,
        blip = true,
        blip_name = "Açougue Rhodes",
        blip_job = "",
        blip_type = 1369919445,
        enable_tax = true,
        min_max = {40.0, 100.0},
        center = {1296.38, -1279.60, 75.85},
        j_coord = {1305.92, -1277.13, 75.97},
        expand_cd = {2838.19, -1364.30, 46.27},
        box_tax = {2.0, 4.33},--TAX | Price
        butcher_tax = 1.00,--For Carcass

        cart_spawn = "huntercart01",
        cart_coords = {1315.12, -1281.68, 76.15, 149.0}, 
        box_coords = {1306.20, -1282.38, 75.50, 357.0}, 
        back_wagon_cd = {2502.28, -1432.24, 45.24, 103.0}, 
        items = {
            meat = {
                price = 0.05,
                tax = 0.10,
            },
            Gamey_meat = {
                price = 0.07,
                tax = 0.10,
            },
            Small_Leather = {
                price = 0.05,
                tax = 0.10,
            },
            Big_Leather = {
                price = 0.07,
                tax = 0.10,
            },
            Feather = {
                price = 0.07,
                tax = 0.10,
            },
            Snake_Poison = {
                price = 0.07,
                tax = 0.10,
            },
            -- Fish_meat = {
            --     price = 0.05,
            --     tax = 0.10,
            -- },
        }
    },
    Annesburg_Butcher = {
        butcher = true,
        blip = true,
        blip_name = "Açougue Annesburg",
        blip_job = "",
        blip_type = 1369919445,
        enable_tax = true,
        min_max = {40.0, 100.0},
        center = {2932.60, 1301.90, 44.49},
        j_coord = {2939.21, 1308.10, 44.49},
        expand_cd = {2838.19, -1364.30, 46.27},
        box_tax = {2.0, 5.7},--TAX | Price
        butcher_tax = 1.00,--For Carcass

        cart_spawn = "huntercart01",
        cart_coords = {2932.15, 1314.86, 44.26, 150.0}, 
        box_coords = {2933.30, 1321.02, 43.15, 341.0}, 
        back_wagon_cd = {2502.28, -1432.24, 45.24, 103.0}, 
        items = {
            meat = {
                price = 0.05,
                tax = 0.10,
            },
            Gamey_meat = {
                price = 0.07,
                tax = 0.10,
            },
            Small_Leather = {
                price = 0.05,
                tax = 0.10,
            },
            Big_Leather = {
                price = 0.07,
                tax = 0.10,
            },
            Feather = {
                price = 0.07,
                tax = 0.10,
            },
            Snake_Poison = {
                price = 0.07,
                tax = 0.10,
            },
            -- Fish_meat = {
            --     price = 0.05,
            --     tax = 0.10,
            -- },
        }
    },
    Armadillo_Butcher = {
        butcher = true,
        blip = true,
        blip_name = "Açougue Armadillo",
        blip_job = "",
        blip_type = 1369919445,
        enable_tax = true,
        min_max = {40.0, 100.0},
        center = {-3691.36, -2620.23, -13.73},
        j_coord = {-3695.49, -2622.63, -13.78},
        expand_cd = {2838.19, -1364.30, 46.27},
        box_tax = {1.0, 8.0},--TAX | Price
        butcher_tax = 1.00,--For Carcass

        cart_spawn = "huntercart01",
        cart_coords = {-3693.90, -2616.30, -14.01, 264.53}, 
        box_coords = {-3693.90, -2619.07, -12.52, 178.22}, 
        back_wagon_cd = {2502.28, -1432.24, 45.24, 103.0}, 
        items = {
            meat = {
                price = 0.05,
                tax = 0.10,
            },
            Gamey_meat = {
                price = 0.07,
                tax = 0.10,
            },
            Small_Leather = {
                price = 0.05,
                tax = 0.10,
            },
            Big_Leather = {
                price = 0.07,
                tax = 0.10,
            },
            Feather = {
                price = 0.07,
                tax = 0.10,
            },
            snakepoison = {
                price = 0.07,
                tax = 0.10,
            },
            -- Fish_meat = {
            --     price = 0.05,
            --     tax = 0.10,
            -- },
        }
    },
    Strawberry_Butcher = {
        butcher = true,
        blip = true,
        blip_name = "Açougue Strawberry",
        blip_job = "",
        blip_type = 1369919445,
        enable_tax = true,
        min_max = {40.0, 100.0},
        center = {-1752.00, -392.638, 156.25},
        j_coord = {-1743.73, -393.301, 156.78},
        expand_cd = {2838.19, -1364.30, 46.27},
        box_tax = {2.0, 4.7},--TAX | Price
        butcher_tax = 1.00,--For Carcass

        cart_spawn = "huntercart01",
        cart_coords = {-1750.69, -400.89, 155.61, 233.3},
        box_coords = {-1748.77, -395.65, 156.28,  354.1},
        back_wagon_cd = {2502.28, -1432.24, 45.24, 103.0}, 
        items = {
            meat = {
                price = 0.05,
                tax = 0.10,
            },
            Gamey_meat = {
                price = 0.07,
                tax = 0.10,
            },
            Small_Leather = {
                price = 0.05,
                tax = 0.10,
            },
            Big_Leather = {
                price = 0.07,
                tax = 0.10,
            },
            Feather = {
                price = 0.07,
                tax = 0.10,
            },
            snakepoison = {
                price = 0.07,
                tax = 0.10,
            },
            -- Fish_meat = {
            --     price = 0.05,
            --     tax = 0.10,
            -- },
        }
    },
   Venda_prod_roubados = {
        butcher = false,
        blip = false,
        blip_name = "Tumulos",
        blip_job = "",
        blip_type = -0,
        enable_tax = false,
        min_max = {},
        center = {2474.060, 2000.377, 168.25},
        j_coord = {},
        expand_cd = {},
        box_tax = {},
        butcher_tax = 0,

        cart_spawn = "huntercart01",
        cart_coords = {}, 
        box_coords = {}, 
        back_wagon_cd = {}, 
        items = {
            oldbuckle = {
                price = 1.85,
                tax = 0.0,
            },
            oldwatch = {
                price = 1.85,
                tax = 0.0,
            },
            rubyring = {
                price = 1.85,
                tax = 0.0,
            },
            goldtooth = {
                price = 1.85,
                tax = 0.0,
            },
            token = {
                price = 1.85,
                tax = 0.0,
            },
            peacockfeather = {
                price = 1.85,
                tax = 0.0,
            },
            piratecoin = {
                price = 1.85,
                tax = 0.0,
            },
            goldring = {
                price = 1.85,
                tax = 0.0,
            }
        }
    },
    Venda_Verduras = {
        butcher = false,
        blip = true,
        blip_name = "Verdureira",
        blip_job = "",
        blip_type = 819673798,
        enable_tax = false,
        min_max = {40.0, 100.0},
        center = {-841.154, -1366.09, 43.938},
        j_coord = {},
        expand_cd = {},
        box_tax = {},
        butcher_tax = 0,

        cart_spawn = "huntercart01",
        cart_coords = {}, 
        box_coords = {}, 
        back_wagon_cd = {}, 
        items = {
            tomate = {
                price = 0.25,
                tax = 0.0,
            },
            brocolis = {
                price = 0.25,
                tax = 0.0,
            },
            cenoura = {
                price = 0.25,
                tax = 0.0,
            },
            barbabietole = {
                price = 0.23,
                tax = 0.0,
            },
            batata = {
                price = 0.27,
                tax = 0.0,
            },
            trigo = {
                price = 0.26,
                tax = 0.0,
            },
            milho = {
                price = 0.28,
                tax = 0.0,
            },
            milk = {
                price = 0.15,
                tax = 0.0,
            },
            egg = {
                price = 0.15,
                tax = 0.0,
            },
        }
    },
    Sell_Wood_Spot = {
        butcher = false,
        blip = true,
        blip_name = "Madeireira",
        blip_job = "",
        blip_type = 1480984695,
        enable_tax = false,
        min_max = {40.0, 100.0},
        center = {-1399.89, -209.49, 104.38},
        j_coord = {},
        expand_cd = {},
        box_tax = {},--TAX | Price
        butcher_tax = 0,

        cart_spawn = "huntercart01",
        cart_coords = {}, 
        box_coords = {}, 
        back_wagon_cd = {}, 
        items = {
            tira_pinho = {
                price = 0.10,  --0,10
                tax = 0.0,
            },
            tira_cedro = {
                price = 0.20,  --0,20
                tax = 0.0,
            },
            tira_abeto = {
                price = 0.15, --0,15
                tax = 0.0,
            },
        }
    },
    Sell_Stone_Spot = {
        butcher = false,
        blip = true,
        blip_name = "Ferragens",
        blip_job = "",
        blip_type = -243818172,
        enable_tax = false,
        min_max = {40.0, 100.0},
        center = {496.0080, 673.2286, 121.24},
        j_coord = {},
        expand_cd = {},
        box_tax = {},--TAX | Price
        butcher_tax = 0,

        cart_spawn = "huntercart01",
        cart_coords = {}, 
        box_coords = {}, 
        back_wagon_cd = {}, 
        items = {
            ferro = {
                price = 0.27,
                tax = 0.0,
            },
            carvao = {
                price = 0.12,
                tax = 0.0,
            },
            barraaco = {
                price = 0.35,
                tax = 0.0,
            },
        }
    },
}


------------------------------------------------------------
------------------------------------------------------------
----------------Hunters Animals
------------------------------------------------------------
------------------------------------------------------------

Config.Animals = {
    [-1202329112]  = {["name"] = "Small Pelt",                  ["money"] = 0.15,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = 1806153689,   ["good"] = -802026654,   ["perfect"] = -1625078531 },
    [-1038420333]  = {["name"] = "Medium Pelt",                 ["money"] = 0.20,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = 85441452,     ["good"] = 1145777975,   ["perfect"] = 653400939 },
    [85379810]     = {["name"] = "Big Pelt",                    ["money"] = 0.25,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = 9293261,   ["good"] = -802026654,   ["perfect"] = -1625078531 },
    [963025744]    = {["name"] = "Very Big Pelt",               ["money"] = 0.25,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = 9293261,   ["good"] = -802026654,   ["perfect"] = -1625078531 },
    [-2004866590]  = {["name"] = "Very big Hide",               ["money"] = 0.25,     ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = 1806153689,   ["good"] = -802026654,   ["perfect"] = -1625078531 },
    [-1962493114]  = {["name"] = "Very big Hide",               ["money"] = 0.25,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = 1806153689,   ["good"] = -802026654,   ["perfect"] = -1625078531 },
    [213792403]    = {["name"] = "Very big Hide",               ["money"] = 0.25,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = 1806153689,   ["good"] = -802026654,   ["perfect"] = -1625078531 },

    [-1124266369]  = {["name"] = "Bear",                        ["money"] = 0.65,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = 957520252,    ["good"] = 143941906,    ["perfect"] = 1292673537 },
    [-1631768462]  = {["name"] = "Bear",                        ["money"] = 0.67,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = 957520252,    ["good"] = 143941906,    ["perfect"] = 1292673537 },
    [-1568716381]  = {["name"] = "Rocky Mountain Bighorn",      ["money"] = 0.35,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = 1806153689,   ["good"] = -802026654,   ["perfect"] = -1625078531 },
    [2028722809]   = {["name"] = "Boar",                        ["money"] = 0.57,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = 1248540072,   ["good"] = nil,          ["perfect"] = -1858513856 },
    [-1963605336]  = {["name"] = "Buck",                        ["money"] = 0.67,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = 1603936352,   ["good"] = -868657362,   ["perfect"] = -702790226 },
    [1556473961]   = {["name"] = "Bison",                       ["money"] = 0.67,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = -1730060063,  ["good"] = -591117838,   ["perfect"] = -237756948 },
    [-1258513246]  = {["name"] = "Bison",                       ["money"] = 0.67,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = -1730060063,  ["good"] = -591117838,   ["perfect"] = -237756948 },
    [1957001316]   = {["name"] = "Bull",                        ["money"] = 0.57,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = 9293261,      ["good"] = -336086818,   ["perfect"] = -53270317 },
    [1110710183]   = {["name"] = "Deer",                        ["money"] = 0.57,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = -662178186,   ["good"] = -1827027577,  ["perfect"] = -1035515486 },
    [-1003616053]  = {["name"] = "Duck",                        ["money"] = 0.47,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [1459778951]   = {["name"] = "Eagle",                       ["money"] = 0.47,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [831859211]    = {["name"] = "Egret",                       ["money"] = 0.47,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-2021043433]  = {["name"] = "Elk",                         ["money"] = 0.57,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = 2053771712,   ["good"] = 1181652728,   ["perfect"] = -1332163079 },
    [412583060]    = {["name"] = "Elk",                         ["money"] = 0.57,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = 2053771712,   ["good"] = 1181652728,   ["perfect"] = -1332163079 },
    [252669332]    = {["name"] = "American Red Fox",            ["money"] = 0.67,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = 1647012424,   ["good"] = 238733925,    ["perfect"] = 500722008 },
    [-1143398950]  = {["name"] = "Big Grey Wolf",               ["money"] = 0.67,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = 85441452,     ["good"] = 1145777975,   ["perfect"] = 653400939 },
    [-885451903]   = {["name"] = "Medium Grey Wolf",            ["money"] = 0.67,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = 85441452,     ["good"] = 1145777975,   ["perfect"] = 653400939 },
    [-829273561]   = {["name"] = "Small Grey Wolf",             ["money"] = 0.57,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = 85441452,     ["good"] = 1145777975,   ["perfect"] = 653400939 },
    [1104697660]   = {["name"] = "Vulture",                     ["money"] = 0.47,       ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-407730502]   = {["name"] = "Snapping Turtle",             ["money"] = 0.47,       ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-466054788]   = {["name"] = "Wild Turkey",                 ["money"] = 0.47,       ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-2011226991]  = {["name"] = "Wild Turkey",                 ["money"] = 0.47,       ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-166054593]   = {["name"] = "Wild Turkey",                 ["money"] = 0.47,       ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-229688157]   = {["name"] = "Water Snake",                 ["money"] = 0.47,       ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-1790499186]  = {["name"] = "Snake Red Boa",               ["money"] = 0.47,       ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [1464167925]   = {["name"] = "Snake Fer-De-Lance",          ["money"] = 0.47,       ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [846659001]    = {["name"] = "Black-Tailed Rattlesnake",    ["money"] = 0.47,       ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [545068538]    = {["name"] = "Western Rattlesnake",         ["money"] = 0.47,       ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-1211566332]  = {["name"] = "Striped Skunk",               ["money"] = 0.47,       ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [40345436]     = {["name"] = "Merino Sheep",                ["money"] = 0.47,       ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = 1729948479,   ["good"] = -1317365569,  ["perfect"] = 1466150167 },
    [-164963696]   = {["name"] = "Herring Seagull",             ["money"] = 0.47,       ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-1076508705]  = {["name"] = "Roseate Spoonbill",           ["money"] = 0.47,       ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [2023522846]   = {["name"] = "Dominique Rooster",           ["money"] = 0.47,       ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-466687768]   = {["name"] = "Red-Footed Booby",            ["money"] = 0.47,       ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-575340245]   = {["name"] = "Wester Raven",                ["money"] = 0.47,       ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [1458540991]   = {["name"] = "North American Racoon",       ["money"] = 0.47,       ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-541762431]   = {["name"] = "Black-Tailed Jackrabbit",     ["money"] = 0.47,       ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [1755643085]   = {["name"] = "American Pronghorn Doe",      ["money"] = 0.67,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = -983605026,   ["good"] = 554578289,    ["perfect"] = -1544126829 },
    [2079703102]   = {["name"] = "Greater Prairie Chicken",     ["money"] = 0.47,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-1414989025]  = {["name"] = "Wirginia Possum",             ["money"] =  0.47,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [1007418994]   = {["name"] = "Berkshire Pig",               ["money"] =  0.47,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = -308965548,   ["good"] = -57190831,    ["perfect"] = -1102272634 },
    [1416324601]   = {["name"] = "Ring-Necked Pheasant",        ["money"] = 0.47,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [1265966684]   = {["name"] = "American White Pelican",      ["money"] = 0.47,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-1797450568]  = {["name"] = "Blue And Yellow Macaw",       ["money"] = 0.47,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [1654513481]   = {["name"] = "Panther",                     ["money"] = 0.67,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = 1584468323,   ["good"] = -395646254,   ["perfect"] = 1969175294 },
    [1205982615]   = {["name"] = "Californian Condor",          ["money"] = 0.47,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-2063183075]  = {["name"] = "Dominique Chicken",           ["money"] = 0.47,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-2073130256]  = {["name"] = "Double-Crested Cormorant",    ["money"] = 0.47,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [90264823]     = {["name"] = "Cougar",                      ["money"] = 0.67,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = 1914602340,   ["good"] = 459744337,    ["perfect"] = -1791452194 },
    [-50684386]    = {["name"] = "Florida Cracker Cow",         ["money"] = 0.47,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = 334093551,    ["good"] = 1150594075,   ["perfect"] = -845037222 },
    [480688259]    = {["name"] = "Coyote",                      ["money"] = 0.67,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = -1558096473,  ["good"] = 1150939141,   ["perfect"] = -794277189 },
    [-564099192]   = {["name"] = "Whooping Crane",              ["money"] = 0.47,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },   
    [457416415]    = {["name"] = "Gila Monster",                ["money"] = 0.47,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-753902995]   = {["name"] = "Alpine Goat",                 ["money"] = 0.47,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = 699990316,    ["good"] = 1710714415,   ["perfect"] = -1648383828 },
    [723190474]    = {["name"] = "Canada Goose",                ["money"] = 0.47,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-2145890973]  = {["name"] = "Ferruinous Hawk",             ["money"] = 0.47,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [1095117488]   = {["name"] = "Great Blue Heron",            ["money"] = 0.47,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-1854059305]  = {["name"] = "Green Iguana",                ["money"] = 0.47,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-593056309]   = {["name"] = "Desert Iguana",               ["money"] = 0.47,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [1751700893]   = {["name"] = "Peccary Pig",                 ["money"] = 0.47,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = -99092070,    ["good"] = -1379330323,  ["perfect"] = 1963510418 },
    [386506078]    = {["name"] = "Common Loon",                 ["money"] = 0.47,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-1098441944]  = {["name"] = "Moose",                       ["money"] = 0.67,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = 1868576868,   ["good"] = 1636891382,   ["perfect"] = -217731719 },
    [-1134449699]  = {["name"] = "American Muskrat",            ["money"] = 0.47,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-861544272]   = {["name"] = "Great Horned Owl",            ["money"] = 0.47,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [556355544]    = {["name"] = "Angus Ox",                    ["money"] = 0.47,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = 4623248928,   ["good"] = 1208128650,   ["perfect"] = 659601266 },
    [-1892280447]  = {["name"] = "Alligator",                   ["money"] = 0.57,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = 1806153689,   ["good"] = -802026654,   ["perfect"] = -1625078531 },
    [759906147]    = {["name"] = "North American Beaver",       ["money"] = 0.47,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = -1569450319,  ["good"] = -2059726619,  ["perfect"] = 854596618 },
    [730092646]    = {["name"] = "American Black Bear",         ["money"] = 0.67,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = 1083865179,   ["good"] = 1490032862,   ["perfect"] = 663376218 },
    [1780825678]   = {["name"] = "American Black Bear",        ["money"] = 0.67,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = 1083865179,   ["good"] = 1490032862,   ["perfect"] = 663376218 },
    [-1295720802]  = {["name"] = "American Alligator",          ["money"] = 0.67,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = 1806153689,   ["good"] = -802026654,   ["perfect"] = -1625078531 },
    [-1170118274]  = {["name"] = "American Badger",             ["money"] = 0.47,      ["poorQualityMultiplier"] = 1.00,  ["goodQualityMultiplier"] = 1.25,  ["perfectQualityMultiplier"] = 1.50,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
}