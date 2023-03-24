
------------------------
-- types of functionallity: 
--none = nothing
-- changing = changing room 
-- inv = inventory   -- player can only have 1 active inv furniture 
-- stew = stewpot  -- stew pot will only give food and water etc if you use fred metabolsim
-- stable = stable  -- stable functionallity props will only work if you own syn_stables ! change functionallity to none if you done
-- hunting = hunting station 
-- waterbarrel = a barrel to clean yourself
--beerbox = a box of beed for you and your friends 
-- IMPORTANT: ALL PROPS WITH THE (CATA = SET) OTHERWISE KNOWN AS PROP SETS CANNOT BE USED AS FUNCTIONAL FURNI AND SHOULD BE MARKED
-- FUNCTIONAL = "NONE"

Config.clanfurni = { 
    ["tipi"] = { 
        hash = `s_wap_rainsfalls`,
        label = "Tipi nativo",
        cata = "prop",
        functional = "changing",
    },
    ["tent2"] = { 
        hash = `mp005_s_posse_tent_trader07x`,
        label = "Tenda do trader",
        cata = "prop",
        functional = "changing",
    },
    ["tent3"] = { 
        hash = `mp005_s_posse_tent_bountyhunter04x`,
        label = "Tenda simples",
        cata = "prop",
        functional = "changing",
    },
    ["tent4"] = { 
        hash = `p_mptenttanner01x`,
        label = "Sombra de tela",
        cata = "prop",
        functional = "none",
    },
    ["dreamcatcher"] = { 
        hash = `p_indiandream01x`,
        label = "Apanhador de Sonhos",
        cata = "prop",
        functional = "none",
    },
    ["nativepot"] = { 
        hash = `p_potteryindian02x`,
        label = "Pote nativo",
        cata = "prop",
        functional = "none",
    },
    ["nativebasket1"] = { 
        hash = `p_basketindian02x`,
        label = "Cesta nativa 1",
        cata = "prop",
        functional = "none",
    },
    ["nativebasket2"] = { 
        hash = `p_basketindian03x`,
        label = "Cesta nativa 2",
        cata = "prop",
        functional = "none",
    },
    ["nativeskull"] = { 
        hash = `p_spookynative02x`,
        label = "Decoração nativa 1",
        cata = "prop",
        functional = "none",
    },
    ["skullpost"] = { 
        hash = `p_skullpost02x`,
        label = "Poste de crânio",
        cata = "prop",
        functional = "none",
    },
    ["loungechair"] = { 
        hash = `p_settee01x`,
        label = "Cadeira de lounge",
        cata = "prop",
        functional = "none",
    },
    ["loungechair2"] = { 
        hash = `p_settee_05x`,
        label = "Cadeira de lounge 2",
        cata = "prop",
        functional = "none",
    },
    ["pokerset"] = { 
        hash = `pg_mg_poker`,
        label = "Conjunto de tabela de pôquer",
        cata = "set", 
        functional = "none", 
    },

    ["decortent1"] = { 
        hash = `pg_mp_possecamp_tent_bounty07x`,
        label = "Tenda de decoração 1",
        cata = "set", 
        functional = "none", 
    },
    ["decortent2"] = { 
        hash = `pg_mp_possecamp_tent_trader07x`,
        label = "Tenda de decoração 2",
        cata = "set", 
        functional = "none", 
    },
    ["decortent3"] = { 
        hash = `pg_mp_possecamp_tent_collector07x`,
        label = "Tenda de decoração 3",
        cata = "set", 
        functional = "none", 
    },
    ["robberyplanning"] = { 
        hash = `PG_COMPANIONACTIVITY_ROBBERY`,
        label = "Conjunto de planejamento de roubo",
        cata = "set", 
        functional = "none", 
    },
    ["naturalwagon"] = { 
        hash = `pg_mp007_naturalist_camp01x`,
        label = "Conjunto de vagões naturalistas",
        cata = "set", 
        functional = "none", 
    },
    ["lamppost1"] = { 
        hash = `pg_ambient_camp_add_gamepole01`,
        label = "Poste de lâmpada 1 conjunto",
        cata = "set", 
        functional = "none", 
    },
    ["lamppost2"] = { 
        hash = `pg_ambient_camp_add_lamppost01`,
        label = "Poste de lâmpada 2 conjunto",
        cata = "set", 
        functional = "none", 
    },
    ["mountainmen"] = { 
        hash = `pg_re_mountainmen01x`,
        label = "Conjunto de acampamento de montanha",
        cata = "set", 
        functional = "none", 
    },

    ["undertaker1"] = { 
        hash = `s_loansharkundertaker01x`,
        label = "Caixão",
        cata = "prop",
        functional = "none",
    },
    ["undertaker2"] = { 
        hash = `mp004_s_mp_coffindecor01x`,
        label = "Caixão de Flores",
        cata = "prop",
        functional = "none",
    },
    ["kitchencounter"] = { 
        hash = `p_kitchenhutch01x`,
        label = "Balcão de cozinha",
        cata = "prop",
        functional = "none",
    },
    ["standingtorch"] = { 
        hash = `p_torchpostalwayson01x`,
        label = "Tocha permanente",
        cata = "prop",
        functional = "none",
    },
    ["shootingtarget"] = { 
        hash = `s_confedtarget`,
        label = "Tiro ao alvo",
        cata = "prop",
        functional = "none",
    },
    ["trayoffood"] = { 
        hash = `p_group_man01x_longtable`,
        label = "Mesa de servir",
        cata = "prop",
        functional = "beerbox",
    },
    ["chesta"] = {
        hash = `s_lootablebedchest`,
        label = "Baú A",
        cata = "prop",
        functional = "inv",
        slots = 1000, -- this section only exists for furniture marked with "inv" 
    },

    ["chestb"] = {
        hash = `s_lootablemiscchest_wagon`,
        label = "Baú B",
        cata = "prop",
        functional = "inv",
        slots = 500, 
    },

    ["chestc"] = {
        hash = `s_lootablebigbluechest03x`,
        label = "Baú C",
        cata = "prop",
        functional = "inv",
        slots = 1500,  
    },
    ["pokerset"] = { 
        hash = `pg_mg_poker`,
        label = "Conjunto de mesa de pôquer",
        cata = "set", -- these are prop sets not normal props when they are being placed u wont the visual representation of the set, it will only show a tent to help approximate the prop set location when placed
        functional = "none", -- SETS MUST BE MARKED AT FUNCTIONAL NONE
    },
    ["hitchingpost"] = { 
        hash = `p_hitchingpost01x`,
        label = "Poste de amarração",
        cata = "prop",
        functional = "stable", 
    },
    ["butchertable3"] = { 
        hash = `mp005_s_posse_goods03x`,
        label = "Mesa de açougueiro grande",
        cata = "prop",
        functional = "hunting", 
        maxstock = 100, -- this section only exists for props marked as "hunting"
    },
    ["butchertable2"] = { 
        hash = `mp005_s_posse_goods02bx`,
        label = "Mesa de açougue média",
        cata = "prop",
        functional = "hunting", 
        maxstock = 50, 
    },
    ["butchertable1"] = { 
        hash = `mp005_s_posse_goods01x`,
        label = "Mesa de açougueiro pequena",
        cata = "prop",
        functional = "hunting", 
        maxstock = 25, 
    },
    ["nativedecor"] = { 
        hash = `pg_ambient_camp_add_native01`,
        label = "Conjunto de decoração nativa",
        cata = "set", 
        functional = "none", 
    },
    ["gypsywagon"] = { 
        hash = `PG_MP005_COLLECTORWAGONCAMP01`,
        label = "Conjunto de carroça cigana",
        cata = "set", 
        functional = "none", 
    },
    ["beerbox"] = { 
        hash = `P_bottlecrate02X`,
        label = "Caixa de cerveja",
        cata = "prop", 
        functional = "beerbox", 
    },
    ["waterbarrel"] = { 
        hash = -1315817616,
        label = "Barril de água",
        cata = "prop", 
        functional = "waterbarrel", 
    },
    ["tent"] = { -- this is the item name on db
    hash = `mp005_s_posse_tent_bountyhunter07x`,
    label = "Barraca do Caçador de Recompensas",
    cata = "prop",
    functional = "changing",
    },
    ----------------------------------
    
    ----------------------------------
   
    ["wood_chair"] = { 
        hash = 325252933,
        label = "Cadeira de madeira",
        cata = "prop", 
        functional = "none", 
    },
    ["leather_chair"] = { 
        hash = 805425957,
        label = "Cadeira de couro",
        cata = "prop", 
        functional = "none", 
    },
    ["round_table"] = { 
        hash = 1070917324,
        label = "Mesa redonda",
        cata = "prop", 
        functional = "none", 
    },
    ["standard_table"] = { 
        hash = 85453683,
        label = "Mesa",
        cata = "prop", 
        functional = "none", 
    },
    ["rectangle_table"] = { 
        hash = 1287780262,
        label = "Mesa retângular",
        cata = "prop", 
        functional = "none", 
    },
    ["timber_table"] = { 
        hash = 1287780262,
        label = "Mesa de Madeira",
        cata = "prop", 
        functional = "none", 
    },
    ["crafting_fire"] = { 
        hash = -1279776992,
        label = "Fogueira",
        cata = "prop", 
        functional = "none", 
    },
    ["pota"] = { 
        hash = 174418135,
        label = "Caldeirão",
        cata = "prop",
        functional = "stew", 
    },
    ["water_pump"] = { 
        hash = -40350080,
        label = "Bomba de água",
        cata = "prop", 
        functional = "none", 
    },
    ["flowerboxes"] = { 
        hash = 456717314,
        label = "Caixas de flores",
        cata = "prop", 
        functional = "none", 
    },
    ["deer_pelt"] = { 
        hash = -944201792,
        label = "Pele de veado",
        cata = "prop", 
        functional = "none", 
    },
    ["coyote_pelt"] = { 
        hash = -1156281048,
        label = "Pele de Coiote",
        cata = "prop", 
        functional = "none", 
    },
    ["blanket_box"] = { 
        hash = -542120195,
        label = "Caixa de cobertor",
        cata = "prop", 
        functional = "none", 
    },
    ["gun_barrel"] = { 
        hash = 187048082,
        label = "Barril de Armas",
        cata = "prop", 
        functional = "none", 
    },
    ["apple_barrel"] = { 
        hash = -156060815,
        label = "Barril de maçã",
        cata = "prop", 
        functional = "none", 
    },
    ["apple_basket"] = { 
        hash = 86968515,
        label = "Cesta de maçã",
        cata = "prop", 
        functional = "none", 
    },
    ["food_barrel"] = { 
        hash = -589926798,
        label = "Barril de comida",
        cata = "prop", 
        functional = "none", 
    },
    ["washtub"] = { 
        hash = 768802576,
        label = "Balde de Banho",
        cata = "prop", 
        functional = "none", 
    },
    ["clothes_line"] = { 
        hash = -25978087,
        label = "Varal de roupas",
        cata = "prop", 
        functional = "none", 
    },
    ["tool_barrel"] = { 
        hash = -462883214,
        label = "Barril de ferramentas",
        cata = "prop", 
        functional = "none", 
    },
    ["coyote_taxidermy"] = { 
        hash = 755719297,
        label = "Coyote Empalhado",
        cata = "prop", 
        functional = "none", 
    },
    ["pheasant_taxidermy"] = { 
        hash = -139659644,
        label = "Faisão Empalhado",
        cata = "prop", 
        functional = "none", 
    },
    ["deer_taxidermy"] = { 
        hash = 270188936,
        label = "Veado Empalhado",
        cata = "prop", 
        functional = "none", 
    },
    ["cougar_taxidermy"] = { 
        hash = 106531847,
        label = "Puma Empalhado",
        cata = "prop", 
        functional = "none", 
    },
    ["vulture_taxidermy"] = { 
        hash = 1751914218,
        label = "Abutre Empalhado",
        cata = "prop", 
        functional = "none", 
    },
    ["bear_bench"] = { 
        hash = -191845882,
        label = "Banco de urso",
        cata = "prop", 
        functional = "none", 
    },
    ["log_bencha"] = { 
        hash = -359794697,
        label = "Banco de madeira 1",
        cata = "prop", 
        functional = "none", 
    },
    ["log_benchb"] = { 
        hash = 861210780,
        label = "Banco de madeira 2",
        cata = "prop", 
        functional = "none", 
    },
    ["cloth_bench"] = { 
        hash = 964931263,
        label = "Banco de pano",
        cata = "prop", 
        functional = "none", 
    },
    ["wooden_bench"] = { 
        hash = 1057555344,
        label = "Banco de madeira",
        cata = "prop", 
        functional = "none", 
    },
    ["wicker_bench"] = { 
        hash = 1220939063,
        label = "Banco de vime",
        cata = "prop", 
        functional = "none", 
    },
    ["bwdresser"] = { 
        hash = 614869605,
        label = "madeira marrom",
        cata = "prop", 
        functional = "none", 
    },
    ["bmdresser"] = { 
        hash = -565436466,
        label = "espelho marrom",
        cata = "prop", 
        functional = "none", 
    },
    ["nightstand"] = { 
        hash = -154796631,
        label = "Stand noturno",
        cata = "prop", 
        functional = "none", 
    },
    ["side_table"] = { 
        hash = 335118833,
        label = "mesa de apoio 1",
        cata = "prop", 
        functional = "none", 
    },
    ["side_tablea"] = { 
        hash = -96741014,
        label = "mesa de apoio 2",
        cata = "prop", 
        functional = "none", 
    },
    ["side_tableb"] = { 
        hash = 341544623,
        label = "mesa de apoio 3",
        cata = "prop", 
        functional = "none", 
    },
    ["lanterna"] = { 
        hash = 319326044,
        label = "Lanterna",
        cata = "prop", 
        functional = "none", 
    },
    ["dbcandle"] = { 
        hash = 1443543434,
        label = "Vela dbl",
        cata = "prop", 
        functional = "none", 
    },
    ["candlea"] = { 
        hash = 526843578,
        label = "Vela",
        cata = "prop", 
        functional = "none", 
    },
    ["smallmcandle"] = { 
        hash = -1200234060,
        label = "Pequena vela derretida",
        cata = "prop", 
        functional = "none", 
    },
    ["bcandle"] = { 
        hash = -1012195445,
        label = "Vela de garrafa",
        cata = "prop", 
        functional = "none", 
    },
    ["obed"] = { 
        hash = -335869017,
        label = "Cama velha",
        cata = "prop", 
        functional = "none", 
    },
    ["bunkbed"] = { 
        hash = -661790979,
        label = "beliche",
        cata = "prop", 
        functional = "none", 
    },
    ["singlebed"] = { 
        hash = 1190865994,
        label = "cama de solteiro",
        cata = "prop", 
        functional = "none", 
    },
    ["fancydouble"] = { 
        hash = 204817984,
        label = "cama extravagante",
        cata = "prop", 
        functional = "none", 
    },


}

