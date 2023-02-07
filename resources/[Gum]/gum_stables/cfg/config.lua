Config = {}

Config.IncreaseSpeedControl = {`INPUT_CREATOR_LT`, `INPUT_PREV_WEAPON`}
Config.DecreaseSpeedControl = {`INPUT_CREATOR_RT`, `INPUT_NEXT_WEAPON`}

Config.RageForCallHorse = 80.0
Config.OneSync = true
Config.OutOfRangeTask = false--If horse out of range -> automaticaly go to you
Config.OutOfRangeDespawn = true--If horse out of range -> automaticaly despawn
Config.RangeForDespawnHorse = 110.0

Config.Debug = false

Config.TransferEnable = false--Transfer between stables is enabled (its beta function, does use it now)
Config.mainStables = 1
Config.CityStablesHorse = false
Config.CityStablesWagon = false
Config.CoordAdjustForStablesId = 30.0--(this control coords from "save" wild horses too normal stables)
Config.SaveStatus = true--Save status sprint, health from horse after flee

Config.BlockSpamEat = true--Blocked spamming eat for full stamina etc..
Config.BlockSpamEatTime = 120--2min

Config.KickHorse = false-- If you enable, your horse can kick you

Config.AffectDamageToCart = true--This affect damage on cart to your vehicle
--Under 600 HP cart is more and more dirty and under 100HP is undriveble

Config.AffectDirtyToCart = true--Clean / under 600Hp more dirty and every 100 -> more and more dirty
Config.AffectRidingToCart = true--Under 100 HP -> undriveble cart you are kicked from cart with notify "Your cart is much broken"

Config.RangeForDespawnWagon = 110.0

Config.Gum_Notify_Old = false
Config.FirstName = ""--If you use old Notify you must add Image path
Config.SecondName = ""--If you use old Notify fro mme you must add Image Name

Config.Gum_Notify_NUI = true
Config.Image = "stables"

Config.GoldRol = false
Config.UnemployedJob = "unemployed"
Config.Cooldown = 180--3 min for again call
Config.Max_Agility = 9--Max agility is 9 but you can select smaller :)

Config.DiscordHook = true
Config.DiscordLink = "https://discord.com/api/webhooks/1016331422765678613/7s3IPSfIthR3AWFVPqeZ5Jsb4F5yLaLgTAYtlFX1sZTfRFEgjL8P-ss7IBXzBpVXwTsa"
Config.DiscordName = "ColoradoRP"

Config.Access_Other_Storage = true
Config.Access_Only_Id = true
Config.RemoveAccessAfterDrop = false
Config.DiscordLanguage = {
    [2] = {text = "Steam name",},
    [3] = {text = "Steam hex",},
    [4] = {text = "Modelo",},
    [5] = {text = "Nome",},
    [6] = {text = "Male/Female",},
    [7] = {text = "Idade",},
    [8] = {text = "Preço",},
    [10] = {text = "Iniciou Cruzamento ",},
    [11] = {text = "Which",},
    [12] = {text = "Dando Cavalo",},
    [13] = {text = "Horse ID",},
    [14] = {text = "Vendeu um cavalo",},
    [15] = {text = "Vendeu o Proprio Cavalo",},
    [16] = {text = "Salvou um Cavalo Selvagem",},
    [17] = {text = "Pagou : ",},
    [18] = {text = "Cavalo foi Morto",},
    [19] = {text = "Cavalo Morreu de Velho",},
    [20] = {text = "Ferradura de Cavalo",},
    [21] = {text = "Tranferiu Carroça",},
    [22] = {text = "Comprou Cavalo",},
    [23] = {text = "Salvou um Cavalo Adulto",},
    [24] = {text = "Comprou Componentes",},
    [25] = {text = "Atualizou a Ferradura do Cavalo",},
    [26] = {text = "Comprou Carroça",},
    [27] = {text = "Vendeu a Propria Carroça",},
    [28] = {text = "Excluiu um Cavalo Morto",},
    [29] = {text = "Cavalo está doente",},
    [30] = {text = "Carroça ID "}
}

Config.Clothe1InBlanket = true--Here you can set clothing 1 / 2 slots via ID (its special for vorp/gum, where you can edit clothing -> IDs )

Config.Farming = false--If you use my farming

Config.JobForTamming = false
Config.JobForShoe = true
Config.Only_Job_Exp = true
Config.JobSet = {"horsetrainer","horsetrainerBW", "horseStrawberry"}

Config.Only_Breeder_Can_Breed = true
Config.JobSetB = {"horsetrainer","horsetrainerBW", "horseStrawberry"}


Config.BreedPriceEnable = false
Config.BreedPriceDistance = 90--Example : If you have BreedPriceDistance 60 you can breed like horse for 30$ and max horse for 90$ (60+30)
Config.BreedTimerUpdate = 10--Every 10 second 1 value of breed

Config.Exp_Notify = 10--10 min for showing notify, and update to SQL

Config.PayForBreed = true--(((Price first horse+Price Second horse)/2)/100*Percent price for breed)
Config.BreedPricePercent = 50 
Config.BreedingTime = 3000--3000 * 10 sec.
Config.BlockBreedHorse = {
    [GetHashKey("A_C_HorseMulePainted_01")] = false,
    [GetHashKey("A_C_HorseMule_01")] = false,
    [GetHashKey("A_C_Donkey_01")] = false,
}
Config.JobGrade = false
Config.GradeForShoe = 0--If you have enabel Grade you set Job grade

Config.DeleteCommand = "dv"
Config.DeleteJobs = {
    "horsetrainer",
    "horsetrainerBW",
    "police",
    "horseStrawberry",
}

Config.AdminCommand = "delHorseCart"
Config.DeleteAdmin = {
    "horsetrainer",
    "horsetrainerBW",
    "police",
    "horseStrawberry",
}


-- Cinematic protection = If you this enable player if hold V and Run on waypoint -> automaticaly disable / enable exp (if it true -> disabled)

-- IfTrener =  All Exp what player make * If player is Trener like (153*5= Finish saved exp)
-- IfNoTrener = All exp what player make * For normal players like (153*1 = Finish saved exp)
-- Every (Leading, LOOPS exps is calculated with IfNoTrener / IfTrener)

-- LOOP EXPS : 
-- Walking = If player sit on horse and walk with him = Get 1 exp
-- Running = If player sit on horse and run with him = Get 2 exp
-- Sprinting = If player sit on horse and run with him = Get 2 exp
-- Leading = IF player Lead horse get 4 exp but if it Cub or Adult get exp like     Leading+IfCub= Finish get (this value is calculated with Trainer / No Trainer)
--
Config.CinematicCameraProtection = true
Config.ExpTimer = 10--Every 10 second add Exp to horse if player lead, or walk with horse
Config.ExpTable = {
    Walking = 4,
    Running = 2,
    Sprinting = 2,
    Leading = 4,

    IfCub = 6,
    IfAdult = 4,

    IfTrener = 4,
    IfNoTrener = 1,

    ExpForCommandSkills = true,-- Language command = 400,401,402,403
    Resting = 10,
    Sleep = 10,
    Wallow = 10,
    Drink = 10,
}



Config.FriendlySystem = true
Config.OnlyTrainerFriendly = false--Only trainer can train friendly
Config.ChanceToMakeFrendlyTrainer = 70--30% chance for make friendly action
Config.ChanceToMakeFriendlyNoTrainer = 10
Config.RandomBadSituation = false
Config.RandomBadSituationTimer = {60, 300}--    1m-5m  randomly
Config.BadFriendlyActionTimer = 30--Every  30 second horse make bad action (affected on Percent) like Every 30 second = You have change 70% for bad action
Config.BadFriendlyAction = {
    [10] = 0,--10 Level friendly
    [9] = 10,
    [8] = 15,
    [7] = 20,
    [6] = 25,
    [5] = 30,
    [4] = 35,
    [3] = 40,
    [2] = 45,
    [1] = 50,
    [0] = 70,--0 Level friendly
}

Config.ShoeItem = "Horse_Shoe"
Config.BrushItem = "horsebrush"


Config.RepairKit = "Repair_Kit"
Config.RemoveKit = true

Config.HealHorse = false--If you disable you can select HealPrice on "strong" value like 40$ now
Config.HealCount = 4--If you have enable HealHorse you pay for healt Price horse / 4

Config.HealPrice = 5--If you have disable Heal horse this "strong" price 40$

Config.Max_Horse_Without_Job = 3
Config.Max_Horse_With_Job = 21

Config.Max_Wagon_Without_Job = 2
Config.Max_Wagon_With_Job = 2

Config.Real_Logic = true
Config.Age_Update_If_Real_Logic = 60--60 min real logic update (every 30min == 1 year up)
Config.Age_Update_For_1_Time = 0.009

Config.Dead_On_Old = true
Config.Chance_For_Dead = 10

Config.Age_Check = 30--30 min for check age

Config.Destroy_Wheel = true
Config.Chance_On_Destroy = 10--10% every 10 second for destroy wheel
Config.TimerForCheckSpeed = 10---Every 10 second check speed cart if is fastest -> 30% for wheel down

Config.Can_Breed_Again_Chance = 30--Percentage chance for again breed

--price_first_breed+price_second_breed/2)/100*Config.BreedPricePercent
--200+200 = 400 / 2 = 200/100 = 2* Config.BreedPricePercent ==> Pay for breed

---This for calling horses or cart (you can set to true and you can call only if you are in stables)
Config.CallFromStableHorse = false
Config.CallFromStableCart = false

Config.CourageSystem = true
Config.CourageUpgradeChance = 70
Config.MaxCourage = 9

Config.keys = {["one"] = 0xD8F73058,["two"] = 0xF3830D8E,["three"] = 0x24978A28,["four"] = 0x8AAA0AD4,["five"] = 0xD9D0E1C0,}
Config.Keysconfig = {
    [1] = {key = 0x27D1C284},--Open stable spot
    [2] = {key = 0xA1ABB953},--Open breeding
    [3] = {key = 0x3F4DC0EF},--DELETE Key
    [4] = {key = 0x27D1C284},--Animal on wagon
    [5] = {key = 0x27D1C284},--Open wagon storage
    [6] = {key = 0xA1ABB953},--Flee wagon
    [7] = {key = 0x27D1C284},--Open bags
    [8] = {key = 0x27D1C284},--+z on horse
    [9] = {key = 0x0522B243},--Component manipulation
    [10] = {key = 0xA1ABB953},--Trasnfer horse to other
    [11] = {key = 0x0522B243},--Sell tammed horse
    [12] = {key = 0x27D1C284},--Save tamemd horse
    [13] = {key = 0x24978A28},--Whistle horse
    [14] = {key = 0xF3830D8E},--Whistle wagon
    [15] = {key = 0x4216AF06},--Flee horse
    [16] = {key = 0x27D1C284},--Open stables

    [17] = {key = 0x20190AB4},--Rotate left
    [18] = {key = 0x65F9EC5B},--Rotate right
    [19] = {key = 0x6319DB71},--Zoom+
    [20] = {key = 0x05CA7C52},--Zoom-
}


Config.Horse_Bedrolls = 0.55
Config.Horse_Blankets = 1.29
Config.Horse_Manes = 0.20
Config.Horse_Bags = 10.00
Config.Horse_Saddles = 12.50
Config.Horse_Tails = 0.20
Config.Horse_Horn = 0.55
Config.Horse_Stirrups = 0.55
Config.Horse_Accesori = 9.25
Config.Horse_Mustache = 0.10
Config.Horse_Holster = 0.10
Config.Horse_Lantern = 5.90
Config.Horse_Bridle = 5.55
Config.Horse_Shoe = 1.55

Config.Extras = 0.1
Config.Tint = 0.5
Config.Livery = 0.5
Config.Lantern = 0.5

Config.Wood_Items = {
    [1] = {"Wood", "Wood", 1.0},
    [2] = {"Wood Branch", "Wood_Branch", 0.1},
    [3] = {"Wood Plank", "Wood_Plank", 0.5},
    [4] = {"Wood Chord", "Wood_Chord", 0.1},
    [5] = {"Wood Bark", "Wood_Bark", 0.1},
    [6] = {"Tree sap", "Tree_Sap", 0.1},
}

Config.Stone_Items = {
    [1] = {"Stone", "Stone", 1.0},
    [2] = {"Charcoal", "Charcoal", 0.5},
    [3] = {"Iron", "Iron", 1.5},
    [4] = {"Weird Stone", "Weird_Stone", 0.1},
    [5] = {"Diamond", "Diamond", 0.1},
}


Config.Eat_Items = {
    [1] = {item = "consumable_haycube", health=40, stamina=40, gold_health=0.0, gold_stamina=0.0, prop="p_haypilepitchfork01x",useOtherScript=false},
	[2] = {item = "milho", health=20, stamina=40, gold_health=0.0, gold_stamina=0.0, prop="p_haypilepitchfork01x",useOtherScript=false},
	[3] = {item = "Wild_Carrot", health=30, stamina=30, gold_health=0.0, gold_stamina=0.0, prop="p_haypilepitchfork01x",useOtherScript=false},
}

Config.Stimulant_Items = {
    [1] = {item = "Heal_For_Horse", health=100, stamina=0, gold_health=0.0, gold_stamina=0.0},
    [2] = {item = "Boost_For_Horse", health=0, stamina=100, gold_health=0.0, gold_stamina=0.0},
    [3] = {item = "stim", health=100, stamina=100, gold_health=1000.0, gold_stamina=1000.0},
}

Config.Language = {
    ---Notify is delayedd for notify, if it notify affect time 
    ---NOTIFY TIME (if it notify), NOTIFY TEXT
    [15] = {time=5000, text = "Cavalo",},
    [18] = {time=5000, text = "Máscara",},
    [19] = {time=5000, text = "Selas",},
    [20] = {time=5000, text = "Acshorn",},
    [21] = {time=5000, text = "Estribos",},
    [22] = {time=5000, text = "Bolsas",},
    [23] = {time=5000, text = "Panos de sela",},
    [24] = {time=5000, text = "Lanterna",},
    [25] = {time=5000, text = "AcsLuggage",},
    [26] = {time=5000, text = "Rédea",},
    [27] = {time=5000, text = "Coldre",},
    [34] = {time=5000, text = "Componentes do cavalo",}, -- titulo
    [38] = {time=5000, text = "Tudo bem",},
    [43] = {time=5000, text = "Classe",},
    [44] = {time=5000, text = "Nome",},
    [45] = {time=5000, text = "Gênero",},
    [46] = {time=5000, text = "Pode procriar?",},
    [47] = {time=5000, text = "Idade",},
    [48] = {time=5000, text = "Status",},
    [50] = {time=5000, text = "Estábulo",},  -- titulo
    [53] = {time=5000, text = "Aceitar",},
    [54] = {time=5000, text = "Cura para o cavalo",},
    [55] = {time=5000, text = "",},
    [67] = {time=5000, text = "Male",},
    [68] = {time=5000, text = "Female",},
    [70] = {time=5000, text = "filhote ou cavalo",},
    [77] = {time=5000, text = "Girar para a esquerda",},
    [78] = {time=5000, text = "Girar para a direita",},
    [79] = {time=5000, text = "Abrir estábulo",},
    [81] = {time=5000, text = "Abrir",},
    [82] = {time=5000, text = "Vender",},
    [83] = {time=5000, text = "Cancelar chamada",},
    [84] = {time=5000, text = "Suba a cavalo",},
    [844] = {time=5000,text = "Pegar pele",},
    [85] = {time=5000, text = "Adicionar a Carroça",},
    [86] = {time=5000, text = "Você precisa de nível 2",},
    [87] = {time=5000, text = "Você precisa de nível 4",},
    [88] = {time=5000, text = "Você precisa ter cavalo na água",},
    [89] = {time=5000, text = "Você precisa de nível 3",},
    [90] = {time=5000, text = "Ponto de Venda",},--Sell spot  blip
    [91] = {time=5000, text = "Animal para carroça",},
    [92] = {time=5000, text = "Estábulo",},
    [94] = {time=5000, text = "Carroça",},
    [95] = {time=5000, text = "Player ID",},
    [96] = {time=5000, text = "Para mandar a carroça embora, você precisa subir nela",},
    [98] = {time=5000, text = "Você não tem slot para peles",},
    [99] = {time=5000, text = "Level",},
    [100] = {time=5000, text = "Exp",},
    [101] = {time=5000, text = "Seu cavalo tem sacolas",},
    [102] = {time=5000, text = "Você consegue",},
    [103] = {time=5000, text = "Você está em velocidade e destrói sua roda",},
    [104] = {time=5000, text = "Feito",},
    [105] = {time=5000, text = "Recompensa",},
    [106] = {time=5000, text = "Seu cavalo foi transferido para o estábulo porque está doente. Você precisa ir ao estábulo e pagar pela saúde",},
    [107] = {time=5000, text = "Você precisa entrar em sua carroça e sair por último",},
    [1070] = {time=5000, text = "Você está chamando uma carroça destruida",},
    [108] = {time=5000, text = "fix_wheel",},--command
    [109] = {time=5000, text = "Adicionar item",},
    [110] = {time=5000, text = "Pegar item",},
    [133] = {time=5000, text = "Sua bolsa está cheia",},
    [136] = {time=5000, text = "Você não tem essa quantidade",},
    [155] = {time=5000, text = "Você deu cenoura ao seu cavalo",},
    [156] = {time=5000, text = "You are not neat horse",},
    [157] = {time=5000, text = "Você limpou seu cavalo",},
    [164] = {time=5000, text = "Yes",},--Breeding state
    [1640] = {time=5000, text = "No",},
    [165] = {time=5000, text = "Com",},
    [166] = {time=5000, text = "Tempo",},
    [167] = {time=5000, text = "Escolha um nome do filhote",},
    [168] = {time=5000, text = "Adicionar lista de Cruzamentos",},
    [170] = {time=5000, text = "Você iniciou um cruzamento",},
    [171] = {time=5000, text = "Você não pode iniciar um cruzamento com o mesmo gênero",},
    [180] = {time=5000, text = "Menu de Componentes",},
    [186] = {time=5000, text = "Selecione sua carroça",},
    [191] = {time=5000, text = "Nome para a carroça",},
    [192] = {time=5000, text = "Você nãao escolheu uma carroça",},
    [193] = {time=5000, text = "Você pode chamar próximo as estradas",},
    [194] = {time=5000, text = "Vender Cavalo selvagem",},
    [195] = {time=5000, text = "Salvar cavalo selvagem",},
    [196] = {time=5000, text = "Pegue seu último cavalo domado.",},
    [197] = {time=5000, text = "Nome para cavalo com gênero :",},
    [198] = {time=5000, text = "Você comprou um cavalo por",},
    [199] = {time=5000, text = "e colocou o nome",},
    [200] = {time=5000, text = "Você nãao tem dinheiro",},
    [201] = {time=5000, text = "Você salvou um cavalo no estábulo com nome : ",},
    [202] = {time=5000, text = "Você comprou componentes por : ",},
    [204] = {time=5000, text = "You dont have coutn what you set",}, ---- 
    [205] = {time=5000, text = "Você não pode segurar ",},
    [206] = {time=5000, text = "Você comprou carroça por",},
    [207] = {time=5000, text = "e deu o nome",},
    [208] = {time=5000, text = "Você vendeu cavalo selvagem por",},
    [209] = {time=5000, text = "Você salva o cavalo selvagem e nomeie-o : ",},
    [210] = {time=5000, text = "Você não tem ",},
    [211] = {time=5000, text = "para saúde.",},
    [212] = {time=5000, text = "Não",},
    [213] = {time=5000, text = "Você selecionou cavalo",},
    [2133] = {time=2000, text = "You select cart",},
    [214] = {time=5000, text = "Equipamento",},
	[215] = {time=5000, text = "Selecionar equipamento",},
	[216] = {time=5000, text = "Cruzando",},
	[217] = {time=5000, text = "Seu cavalo está ferido. Vá para o estábulo e cure-o",},
	[218] = {time=5000, text = "Your horse dye on Old",},
	[219] = {time=5000, text = "Você não pode fazer spam",},
	[220] = {time=5000, text = "Você tem este equipamento",},
	[221] = {time=5000, text = "Preço",},
	[222] = {time=5000, text = "Armazenar",},
	[2222] = {time=5000, text = "Rol",},
	[223] = {time=5000, text = "Peça",},
	[224] = {time=5000, text = "Caixa de armazenamento",},
    [225] = {time=5000, text = "Você não pode porque você tem reprodução. ",},
	[226] = {time=5000, text = "Você não tem emprego para comprar cavalos. ",},
	[227] = {time=5000, text = "Você não tem emprego para comprar carroças. ",},
	[228] = {time=5000, text = "Seu estábulo está cheio, você não pode comprar cavalos. ",},
	[229] = {time=5000, text = "Seu estábulo está cheio, você não pode comprar carroças. ",},
	[230] = {time=5000, text = "Edição de ferraduras",},
	[231] = {time=5000, text = "Agilidade do cavalo",},
	[232] = {time=5000, text = "Velocidade do cavalo",},
	[233] = {time=5000, text = "Aceleração do cavalo",},
	[234] = {time=5000, text = "Você não pode comprar ferraduras porque você não é um treinador",},
    [236] = {time=5000, text = "Aumente a sua vez neste cavalo",},
	[239] = {time=5000, text = "Não spam",},
	[240] = {time=5000, text = "Quantos?",},
	[241] = {time=5000, text = "Armazenamento do estábulo",},
	[242] = {time=5000, text = "Aqui você pesquisa itens o que você tem em cavalos",},
	[243] = {time=5000, text = "Item da lista",},
	[244] = {time=5000, text = "Você não pode chamar um cavalo agora, precisa esperar.",},
	[245] = {time=5000, text = "Iniciar Cruzamento : ",},
    [248] = {time=5000, text = "Coldre",},
    [249] = {time=5000, text = "Rédea",},
    [250] = {time=5000, text = "Bigode",},
    [252] = {time=5000, text = "Cor",},
    [253] = {time=5000, text = "Você não tem ferradura.",},
    [2533] = {time=5000, text = "Você atualizou ferraduras em seu cavalo",},
    [254] = {time=5000, text = "Você não pode colocar ferraduras em cavalos.",},
    [255] = {time=5000, text = "Você não tem emprego para salvar seus cavalos.",},
    [256] = {time=5000, text = "Você não tem dinheiro.",},
    [257] = {time=5000, text = "Você quer criar um cavalo por : ",},
    [258] = {time=5000, text = "$ ? ",},
    [259] = {time=5000, text = "Esta carrroça não tem espaço de armazenamento.",},
    [260] = {time=5000, text = "Você realmente quer vender este cavalo?Escreva: Sim",},
    [261] = {time=5000, text = "Você vendeu por",},
    [262] = {time=5000, text = "Somente o treinador pode cruzar os cavalos",},
    [2622] = {time=5000, text = "Apenas o treinador pode cruzar os cavalos",},
    [263] = {time=5000, text = "Zoom +",},
    [264] = {time=5000, text = "Zoom -",},
    [267] = {time=5000, text = "Pagar com 1=$ ,  0=G",},
    [268] = {time=5000, text = "Este usuário existe",},
    [269] = {time=5000, text = "Você deu um cavalo ao jogador : ",},
    [270] = {time=5000, text = "Você deu uma carroça ao jogador : ",},
    [271] = {time=5000, text = "Você adiciona ferradura ao cavalo selecionado",},
    [272] = {time=5000, text = "Você tem esta ferradura",},
    [273] = {time=5000, text = "Permitir IDs",},
    [274] = {time=5000, text = "Add ID",},
    [275] = {time=5000, text = "Remove ID",},
    [276] = {time=5000, text = "Digite o ID",},
    [277] = {time=5000, text = "Remover ID",},
    [278] = {time=5000, text = "Vender minha carroça?por 25% do preço",},
    [279] = {time=5000, text = "Cor",},
    [288] = {time=2000, text = "You can call only from spot",},
    [280] = {time=5000, text = "Inventário",},
    [281] = {time=5000, text = "Você chamou o cavalo, você deve desfazer a chamada",},
    [282] = {time=5000, text = "O cavalo está muito longe",},
    [283] = {time=5000, text = "Meus cavalos e carroças",},
    [284] = {time=5000, text = "Stable man take your horse and give between stables",}, ----
    [285] = {time=5000, text = "Stable man take your wagon and give between stables",}, -----
    [286] = {time=5000, text = "Você chamou a carroça",},
    [287] = {time=5000, text = "Você não tem emprego para cruzamento",},
    [289] = {time=5000, text = "Você deve ter selecionado cavalo",},
    [300] = {time=5000, text = "Idade : ",},
    [301] = {time=5000, text = "Exp : ",},
    [302] = {time=5000, text = "Gênero : ",},
    [303] = {time=5000, text = "Cruzamento : ",},
    [304] = {time=5000, text = "Ferradura : 1 lv / 1x Ferradura",},
    [305] = {time=5000, text = "Editar habilidade",},
    [306] = {time=5000, text = "Cobertores : 0.55$",},
    [307] = {time=5000, text = "Selas : 12.50$",},
    [308] = {time=5000, text = "Chifres : 0.55$",},
    [309] = {time=5000, text = "Estribos : 0.55$",},
    [310] = {time=5000, text = "Bolsas : 10$",},
    [311] = {time=5000, text = "Sacos de dormir : 0.55$",},
    [312] = {time=5000, text = "Lanterna : 5.90$",},
    [313] = {time=5000, text = "Máscara : 9.95$",},
    [314] = {time=5000, text = "Rabos : 0.20$",},
    [315] = {time=5000, text = "Juba : 0.20$",},
    [316] = {time=5000, text = "Bigodes : 0.10$",},
    [317] = {time=5000, text = "Coldres : 0.10$",},
    [318] = {time=5000, text = "Rédeas : 5.55$",},
    [319] = {time=5000, text = "Comprar",},
    [320] = {time=5000, text = "Loja Cavalos",},
    [321] = {time=5000, text = "Loja Carroças",},
    [322] = {time=5000, text = "Cavalos",},
    [323] = {time=5000, text = "Carroças",},
    [324] = {time=5000, text = "Componentes de Cavalo",},
    [325] = {time=5000, text = "Componentes de Carroça",},
    [326] = {time=5000, text = "Ferradura de Cavalo",},
    [327] = {time=5000, text = "Cruzamento de Cavalos",},
    [328] = {time=5000, text = "Comprar componentes",},
    [329] = {time=5000, text = "Lanterna",},
    [330] = {time=5000, text = "Pintura",},
    [331] = {time=5000, text = "Livery",},
    [332] = {time=5000, text = "Extra",},
    [333] = {time=5000, text = "Cruzamento de Cavalos",},
    [334] = {time=5000, text = "Você gostaria de cruzar esses cavalos?"},
    [335] = {time=5000, text = "Sim"},
    [336] = {time=5000, text = "Não"},
    [337] = {time=5000, text = "Quer vender o cavalo por :"},
    [338] = {time=5000, text = "Quer vender a carroça por 25% ?"},
    [339] = {time=5000, text = "Filhote ou Adulto?"},
    [340] = {time=5000, text = "Filhote"},
    [341] = {time=5000, text = "Adulto"},
    [342] = {time=5000, text = "Macho ou fêmea? "},
    [343] = {time=5000, text = "Male"},
    [344] = {time=5000, text = "Female"},
    [345] = {time=5000, text = "Aceitar"},
    [346] = {time=5000, text = "Selecione o nome"},
    [347] = {time=5000, text = "Pagar com ?"},
    [348] = {time=5000, text = "Compre componentes por "},
    [349] = {time=5000, text = "Você não tem nada para comprar."},
    [350] = {time=5000, text = "Nome para filhote?"},
    [365] = {time=5000, text = "Você gostaria de criar esses dois cavalos?"},
    [363] = {time=5000, text = "Você gostaria de selecionar este cavalo?"},
    [364] = {time=5000, text = "Você gostaria de selecionar este carrinho?"},
    [371] = {time=5000,text = "Cruzamento terminou, agora espere um pouco para preparar recompensa para você."},
    [372] = {time=5000,text = "Seu carrinho está muito quebrado. Você deve consertar"},
    [373] = {time=5000,text = "Isso não é cavalo selvagem."},
    [374] = {time=5000,text = "Seus estábulos estão cheios. Você pode vender cavalos que não gosta mais?"},
    [375] = {time=5000,text = "Muito tarde para consertar a carroça. Feche o minigame e tente novamente"},
    [376] = {time=5000,text = "Você tem o estábulo cheio."},
    [3766] = {time=5000,text = "Ele tem o estábulo cheio."},
    [377] = {time=5000,text = "Chamar cavalo"},
    [378] = {time=5000,text = "Chamar carroça"},
    [379] = {time=5000,text = "Chame seu cavalo novamente"},
    [380] = {time=5000,text = "Aguerde carregar a carroça"},
    [381] = {time=5000,text = "Now stable man sleep. Comeback at morning???"},
    [382] = {time=5000,text = "Animals"},
    [383] = {time=5000,text = "O carrinho está cheio."},
    [384] = {time=5000,text = "Prepare health"},
    [385] = {time=5000,text = "Exp"},
    [386] = {time=5000,text = "Animals"},
    [387] = {time=2000,text = "A estrada está longe de você. Chame a carroça mais perto da estrada."},
    [388] = {time=2000,text = "Você pode ter apenas um alcance "..Config.BreedPriceDistance.."."},
    [389] = {time=2000,text = "Vestir"},
    [390] = {time=2000,text = "Adicionar od Remover acesso?"},
    [391] = {time=2000,text = "Adicionar"},
    [392] = {time=2000,text = "Remover"},
    [393] = {time=2000,text = "Roupas 1 ou 2?"},
    [394] = {time=2000,text = "slot 1"},
    [395] = {time=2000,text = "Slot 2"},
    [396] = {time=2000,text = "O que você precisa ? "},
    [397] = {time=2000,text = "Roupas"},
    [398] = {time=2000,text = "Mudar ID"},
    [399] = {time=2000,text = "ID da roupa do armazenamento :"},
  
    [405] = {time=2000,text = "Você tem este sapato de cavalo"},
    [406] = {time=2000,text = "Você precisa pegar ou adicionar?"},
    [407] = {time=2000,text = "pegar"},
    [408] = {time=2000,text = "adicionar"},
    [409] = {time=2000,text = "Quantos"},
    [410] = {time=2000,text = "você precisa pegar?"},
    [411] = {time=2000,text = "você precisa adicionar?"},
    [412] = {time=2000,text = "Você não tem espaço na carroça."},
    [413] = {time=2000,text = "Você não tem essa espaço no inventário."},
    [414] = {time=2000,text = "Você não tem espaço no inventário."},
    [415] = {time=2000,text = "Armazenar"},
    [416] = {time=2000,text = "Roupas"},
    [417] = {time=2000,text = "Velho"},
    [418] = {time=2000,text = "Gerenciamento de posição de cavalos/carroças",},
    [419] = {time=2000,text = "Parar de Guiar",},
    [420] = {time=2000,text = "Abrir",},
    [421] = {time=2000,text = "Colocar no Estábulo",},
    [422] = {time=2000,text = "Você deve selecionar, onde você precisa de cavalo/carroça",},
    [423] = {time=2000,text = "Você deve esperar : "..Config.BlockSpamEatTime.."segundos",},
    [424] = {time=2000,text = "Seu cavalo está um pouco mais amigável.",},
    [425] = {time=2000,text = "Amigável",},
    [426] = {time=2000,text = "Coragem",},

    [351] = {time=5000, text = "Carroça de caça"},--Cart config
    [352] = {time=5000, text = "Carroça de trablho"},--Cart config
    [353] = {time=5000, text = "Carroça"},--Cart config

    [354] = {time=5000, text = "Peles"},
    [355] = {time=5000, text = "Armazém"},
    [356] = {time=5000, text = "Componentes"},
    [357] = {time=5000, text = "Mandar Fugir"},
    [358] = {time=5000, text = "Conduzir"},
    [359] = {time=5000, text = "Acalmar"},
    [360] = {time=5000, text = "Bolsas"},
    [361] = {time=5000, text = "Transferir"},
    
    [362] = {time=5000, text = "Horse can have max 10 shoes"},

    [370] = {time=5000, text = "Selecione"},
    [366] = {time=5000, text = "Now breed"},
    [367] = {time=5000, text = "Vender"},
    [368] = {time=5000, text = "Heal"},
    [369] = {time=5000, text = "Dead"},
    --Commands
	[400] = {time=5000, text = "horserest",},
	[401] = {time=5000, text = "horseplay",},
	[402] = {time=5000, text = "horsesleep",},
	[403] = {time=5000, text = "horsedrink",},
}

Config.Pay_For_Save_Horse = false
Config.Pay_For_Save_Percent = 10

Config.Random_Age_For_Tamming_Save_1 = 6--From Year
Config.Random_Age_For_Tamming_Save_2 = 20--To Year

Config.Tamming_Horses = true
Config.Sell_My_Horse = 4--For without wild calculation (Horse price / 4)
--
Config.minigameShoe = true
--
Config.Tamming_Mini_Game = true
Config.Tamming_Key_Table = {
    [1] = {0xE6F612E4, "1"},
    [2] = {0x1CE6D9EB, "2"},
    [3] = {0x4F49CC4C, "3"},
    [4] = {0x8F9F9E58, "4"},
    [5] = {0xAB62E997, "5"},
    [6] = {0xA1FDE2A6, "6"},
}
Config.Time_To_Press = 50
--

---ID Horse = Price : 31 = Reward money
Config.Sell_Spot_Price_Calc = 31--Default value for horses if it not in "wild horses table"
Config.Wild_Horses = {--For my horses and wild horses
    A_C_Horse_KentuckySaddle_Black = 31, -- 0,9
    A_C_Horse_KentuckySaddle_ButterMilkBuckskin_PC = 15, -- 2,0
    A_C_Horse_KentuckySaddle_ChestnutPinto = 31, -- 0,9
    A_C_Horse_KentuckySaddle_Grey = 31, -- 0,9
    A_C_Horse_KentuckySaddle_SilverBay = 31, -- 0,9
    A_C_Horse_Morgan_Bay = 45, -- 0,6
    A_C_Horse_Morgan_BayRoan = 45, -- 0,6
    A_C_Horse_Morgan_FlaxenChestnut = 45, -- 0,6
    A_C_Horse_Morgan_LiverChestnut_PC = 45, -- 0,6
    A_C_Horse_Morgan_Palomino = 45, -- 0,6
    A_C_Horse_TennesseeWalker_BlackRabicano = 30, -- 1,0
    A_C_Horse_TennesseeWalker_Chestnut = 30, -- 1,0
    A_C_Horse_TennesseeWalker_MahoganyBay = 30, -- 1,0
    A_C_Horse_TennesseeWalker_RedRoan = 30, -- 1,0
    A_C_Horse_TennesseeWalker_GoldPalomino_PC = 30, -- 1,0
    A_C_Horse_AmericanPaint_Tobiano = 15, -- 2,0
    A_C_Horse_AmericanPaint_SplashedWhite = 15, -- 15
    A_C_Horse_AmericanPaint_Overo = 15, -- 2,0
    A_C_Horse_AmericanStandardbred_Black = 15, -- 2,3
    A_C_Horse_AmericanStandardbred_Buckskin = 15, -- 2,3
    A_C_Horse_Andalusian_Perlino = 3, -- 11,6
    A_C_Horse_Appaloosa_Blanket = 24, -- 1,25
    A_C_Horse_Appaloosa_FewSpotted_PC = 4, -- 7,5
    A_C_Horse_Appaloosa_LeopardBlanket = 24, -- 1,25
    A_C_Horse_HungarianHalfbred_FlaxenChestnut = 20, -- 1,5
    A_C_Horse_HungarianHalfbred_PiebaldTobiano = 20, -- 1,5
    A_C_Horse_Mustang_GrulloDun = 15, -- 2,0
    A_C_Horse_Mustang_TigerStripedBay = 3, -- 11,6
    A_C_Horse_Mustang_WildBay = 15, -- 2,0
    A_C_Horse_Nokota_BlueRoan = 10, -- 3,5
    A_C_Horse_Nokota_WhiteRoan = 10, -- 3,5
    A_C_Horse_Thoroughbred_BloodBay = 11, -- 3,1
    A_C_Horse_Thoroughbred_DappleGrey = 11, -- 3,1
}

--Age For small horses (after buy horse)
Config.Random_Age_From = 1
Config.Random_Age_To = 2

--Age For big horses (after buy horse)
Config.Random_Age_For_Normal_Horses_1 = 5
Config.Random_Age_For_Normal_Horses_2 = 20

Config.HuntingCartCalculate = 2--Hunting cart storage / 2 = Is storage for animals

Config.SpotForTake = false--If you dis enable you cant whistle horse anywhere but can spawn horse at this spot
Config.TimeForSpawn = 5--(5 Second for spawn at pos)
Config.SpotForTakeCd = {
    [1] = {
        blip_e = true,--Blip enable / disable
        blip = "Take spot horse",--Blip name
        coords = {-360.76470947265625, 791.9559936523438, 116.30496215820312},--Cords for enter
        scoords = {-353.72296142578125, 792.6137084960938, 115.32096862792969, -124.0}--Coords + heading for spawn
    }
}

Config.enableInteractWithNpc = false
Config.useNPC = true
Config.useTimeLogic = false
Config.StableNPC = {
    [1] = {
        npc="u_m_m_bwmstablehand_01",
        coords={-366.0655822753906, 790.820556640625, 115.31959533691406, 170.0},
        timeStart=10,--Hours
        timeEnd=20--Hours
    },
    [2] = {
        npc="u_m_m_bwmstablehand_01",
        coords={-878.3824462890625, -1364.4324951171875, 42.67800521850586, -84.0},
        timeStart=10,--Hours
        timeEnd=20--Hours
    },
    [3] = {
        npc="u_m_m_bwmstablehand_01",
        coords={ 2501.14, -1457.63, 45.31, 314.34},
        timeStart=10,--Hours
        timeEnd=20--Hours
    },
    [4] = {
        npc="u_m_m_bwmstablehand_01",
        coords={1458.99, -1367.89, 77.86, 352.52},
        timeStart=10,--Hours
        timeEnd=20--Hours
    },
    [5] = {
        npc="u_m_m_bwmstablehand_01",
        coords={-3689.0, -2565.05, -14.6, 152.97},
        timeStart=10,--Hours
        timeEnd=20--Hours
    },
    [6] = {
        npc="u_m_m_bwmstablehand_01",
        coords={ -1818.55, -562.31, 155.06, 65.98},
        timeStart=10,--Hours
        timeEnd=20--Hours
    },
}

Config.SpotsForStable = {
    [1] =  {
        ["Blip_Enable"] = true,
        ["Blip_Name"] = "Estábulo de Valentine",
        ["BasicCoord"] = {-366.3105773925781, 789.9218139648438, 116.16857147216797},
        ["CallHorseCart"] = {-356.34600830078125, 787.7254638671875, 116.16722869873047, -85.55},---If you use CallHorse from stable you must add to all Stables this

        ["CamPosHorse"] = {-392.91, 784.00, 116.80, -138.88},
        ["1SpawnHorse"] = {-389.01, 779.59, 114.80},
        ["2SpawnHorse"] = {-391.05, 781.74, 114.40},

        ["Breedingcam"] = {-367.61, 785.39, 118.55, -177.12},
        ["B1SpawnHorse"] = {-366.82, 781.75, 115.07, 0.0},
        ["B2SpawnHorse"] = {-369.42, 781.52, 115.08, 0.0},

        ["B3SpawnHorse"] = {-366.1467590332031, 782.2237548828125, 115.06133575439453, 0.0},
        ["B4SpawnHorse"] = {-368.77520751953125, 781.9990234375, 115.06626892089844, 0.0},
    },
    [2] =  {
        ["Blip_Enable"] = true,
        ["Blip_Name"] = "Estábulo de Blackwater",
        ["BasicCoord"] = {-877.2943725585938, -1363.5467529296875, 43.5307502746582},

        ["CamPosHorse"] = {-876.28, -1366.26, 44.81, -90.75},
        ["1SpawnHorse"] = {-869.7044677734375, -1365.9764404296875, 42.46372604370117},
        ["2SpawnHorse"] = {-872.6951904296875, -1365.9708251953125, 42.4640007019043},

        ["Breedingcam"] = {-865.64, -1365.76, 46.21, -0.63},
        ["B1SpawnHorse"] = {-866.399658203125, -1361.783203125, 42.46372604370117, -177.0},
        ["B2SpawnHorse"] = {-864.407861328125, -1362.0040283203125, 42.4640007019043, -177.0},

        ["B3SpawnHorse"] = {-866.999658203125, -1361.783203125, 42.46372604370117, -177.0},
        ["B4SpawnHorse"] = {-865.007861328125, -1362.0040283203125, 42.4640007019043, -177.0},
    },
    [3] =  {
        ["Blip_Enable"] = true,
        ["Blip_Name"] = "Estábulo de Saint Denise",
        ["BasicCoord"] = {2510.435791015625, -1456.816650390625, 45.3140869140625},

        ["CamPosHorse"] = {2503.02, -1455.03, 47.88, 0.76},
        ["1SpawnHorse"] = {2502.98974609375, -1447.7025146484375, 45.24526977539062},
        ["2SpawnHorse"] = {2503.072021484375, -1451.102783203125, 45.24560546875},

        ["Breedingcam"] = {2503.17, -1451.52, 48.98, -91.69},

        --Breed spawn
        ["B3SpawnHorse"] = {2508.2578125, -1453.605712890625, 45.33822631835937, -267.0},
        ["B4SpawnHorse"] = {2508.28271484375, -1450.0401611328125, 45.34003067016601, -267.0},
    
        --Adult spawn
        ["B1SpawnHorse"] = {2508.2578125, -1453.105712890625, 45.33822631835937, -267.0},
        ["B2SpawnHorse"] = {2508.28271484375, -1450.6401611328125, 45.34003067016601, -267.0},
    },

    [4] =  {
        ["Blip_Enable"] = true,
        ["Blip_Name"] = "Estábulo de Rhodes",
        ["BasicCoord"] = {1459.88, -1368.52, 78.88},

        ["CamPosHorse"] = {1447.56, -1384.31, 81.00, 193.00},
        ["1SpawnHorse"] = {1449.60, -1389.51, 78.50},
        ["2SpawnHorse"] = {1448.18, -1387.96, 78.00},

        ["Breedingcam"] = {1460.10, -1367.63, 80.78, -114.62},

        --Breed spawn
        ["B3SpawnHorse"] = {1463.46, -1367.59, 78.01, 60.0},
        ["B4SpawnHorse"] = {1462.49, -1370.10, 78.01, 60.0},
    
        --Adult spawn
        ["B1SpawnHorse"] = {1464.41, -1365.81, 78.01, 60.0},
        ["B2SpawnHorse"] = {1461.22, -1371.74, 78.01, 60.0},
    },
    [5] =  {
        ["Blip_Enable"] = true,
        ["Blip_Name"] = "Estábulo de Armadillo",
        ["BasicCoord"] = {-3689.11, -2564.68, -13.58},

        ["CamPosHorse"] = {-3688.83, -2568.63, -9.714, 180.55},
        ["1SpawnHorse"] = {-3686.19, -2579.05, -13.70},
        ["2SpawnHorse"] = {-3686.37, -2576.42, -13.73},

        ["Breedingcam"] = {},

        --Breed spawn
        ["B3SpawnHorse"] = {},
        ["B4SpawnHorse"] = {},
    
        --Adult spawn
        ["B1SpawnHorse"] = {},
        ["B2SpawnHorse"] = {},
    },

    [6] =  {
        ["Blip_Enable"] = true,
        ["Blip_Name"] = "Estábulo de StrawBerry",
        ["BasicCoord"] = { -1820.98, -561.28, 156.06},

        ["CamPosHorse"] = {-1823.11,-561.65,157.4,167.04},
        ["1SpawnHorse"] = {-1822.93, -566.5, 155.16}, 
        ["2SpawnHorse"] = {-1825.55, -565.62, 155.13}, 

        ["Breedingcam"] = {-1823.11,-561.65,157.4,167.04},

        --Breed spawn
        ["B3SpawnHorse"] = {-1822.93, -566.5, 155.16, 359.98},
        ["B4SpawnHorse"] = {-1825.55, -565.62, 155.13, 336.58},
    
        --Adult spawn
        ["B1SpawnHorse"] = {},
        ["B2SpawnHorse"] = {},
    },
}

Config.SellGetWildHorse = {
    [1] =  {
        ["Blip_Enable"] = true,
        ["WildCoords"] = {-383.38067626953125, 785.8182373046875, 115.89981079101562},
    },
    [2] =  {
        ["Blip_Enable"] = true,
        ["WildCoords"] = {2501.8916015625, -1431.5257568359375, 46.26433181762695},
    },
    [3] =  {
        ["Blip_Enable"] = true,
        ["WildCoords"] = {-874.1815795898438, -1357.041748046875, 43.56147384643555},
    },
    [4] =  {
        ["Blip_Enable"] = true,
        ["WildCoords"] = {-857.90, 348.14, 96.09},
    },
}

Config.Wagons = {
    ----Model           -Name --$ -- Gold -- Storage- Rol
    ["ArmySupplyWagon"] = {"Supply wagon", 1000, 0, 400, 0,{"unemployed"}, Config.Language[351].text},
    ["buggy01"] = {"Coach 1", 150, 0,  20,0,{"unemployed"}, Config.Language[353].text},
    ["buggy02"] = {"Coach 2", 150, 0,  20,0,{"unemployed"}, Config.Language[353].text},
    ["buggy03"] = {"Coach 3", 150, 0,  20,0,{"unemployed"}, Config.Language[353].text},
    ["cart01"] = {"Cart 1", 150, 0,  50,0,{"unemployed"}, Config.Language[353].text},
    ["cart02"] = {"Cart 2", 150, 0,  50,0,{"unemployed"}, Config.Language[353].text},
    ["cart03"] = {"Small hunting 1", 150, 0,  50,0,{"unemployed"}, Config.Language[351].text},
    ["cart05"] = {"Watering wagon", 150, 0,  50,0,{"unemployed"}, Config.Language[353].text},
    ["cart07"] = {"Small hunting 2", 150, 0,  50,0,{"unemployed"}, Config.Language[351].text},
    ["cart08"] = {"Small hunting 3", 150, 0,  50,0,{"unemployed"}, Config.Language[351].text},
    ["chuckwagon000x"] = {"Freight Cart 1", 600, 0,  80,0,{"unemployed"}, Config.Language[351].text},
    ["gatchuck"] = {"Freight Cart 2", 600, 0,  80,0,{"unemployed"}, Config.Language[351].text},
    ["utilliwag"] = {"Freight Cart 3", 600, 0,  50,0,{"unemployed"}, Config.Language[351].text},
    ["huntercart01"] = {"Hunting cart", 50, 0, 100,0,{"unemployed"}, Config.Language[351].text},
    ["wagon03x"] = {"Wagon 1", 600, 0,  100,0,{"unemployed"}, Config.Language[353].text},
    ["wagon06x"] = {"Wagon 2", 600, 0,  100,0,{"unemployed"}, Config.Language[353].text},
    ["wagon05x"] = {"Wagon 3", 600, 0,  100,0,{"unemployed"}, Config.Language[353].text},
    ["coach2"] = {"Cart 4", 600, 0,  60,0,{"unemployed"}, Config.Language[353].text},
    ["coach3"] = {"Cart 5", 600, 0,  60,0,{"unemployed"}, Config.Language[353].text},
    ["coach4"] = {"Cart 6", 600, 0,  40,0,{"unemployed"}, Config.Language[353].text},
    ["coach5"] = {"Cart 7", 600, 0,  40,0,{"unemployed"}, Config.Language[353].text},
    ["coach6"] = {"Cart 8", 600, 0,  30,0,{"unemployed"}, Config.Language[353].text},
    ["stagecoach001x"] = {"Cart 9", 600, 0,  150,0,{"unemployed"}, Config.Language[353].text},
    ["stagecoach002x"] = {"Cart 10", 600, 0,  150,0,{"unemployed"}, Config.Language[353].text},
    ["stagecoach003x"] = {"Cart 11", 600, 0,  150,0,{"unemployed"}, Config.Language[353].text},
    ["stagecoach004x"] = {"Armored cart", 500, 0,  150,0,{"unemployed"}, Config.Language[353].text},
    ["stagecoach005x"] = {"Cart 12", 600, 0,  150,0,{"unemployed"}, Config.Language[353].text},
    ["stagecoach006x"] = {"Cart 13", 600, 0,  150,0,{"unemployed"}, Config.Language[353].text},
    ["coal_wagon"] = {"Wagon for stone", 600, 0,  150,0,{"unemployed"}, Config.Language[352].text},
    ["policewagon01x"] = {"Transporte Policial", 10000, 0,  150,0,{"police"}, Config.Language[352].text},
    ["wagonPrison01x"] = {"Transporte de Detentos", 10000, 0,  150,0,{"police"}, Config.Language[352].text},
    ["logwagon"] = {"Wagon for wood", 800, 0,  200,0,{"unemployed"}, Config.Language[352].text},
    ["oilWagon01x"] = {"Water tank", 600, 0,  150,0,{"unemployed"}, Config.Language[352].text},
    ["supplywagon"] = {"Freight Cart 4", 800, 0,  200,0,{"unemployed"}, Config.Language[351].text},
    ["wagondairy01x"] = {"Shopping wagon", 600, 0,  150,0,{"unemployed"}, Config.Language[353].text},
    ["wagondoc01x"] = {"Doctor wagon", 800, 0,  200,0,{"doctor"}, Config.Language[353].text},
    ["wagontraveller01x"] = {"Travering wagon 1", 600, 0,  150,0,{"unemployed"}, Config.Language[353].text},
    ["wagonwork01x"] = {"Travering wagon 2", 600, 0,  150,0,{"unemployed"}, Config.Language[353].text},
}

Config.Horses = {
    {
    name = "American Paint horse",
       ----Název           -                           $ -- Zlata -- Místo ve skladu - Rol
       ["A_C_Horse_AmericanPaint_Greyovero"] = {"Grey", 70, 1, 30,0,{"unemployed"}, "state_2"}, 
       ["A_C_Horse_AmericanPaint_Overo"] = {"Overo", 70, 1, 30,0,{"unemployed"}, "state_1"},
       ["A_C_Horse_AmericanPaint_SplashedWhite"] = {"Splash White", 70, 1, 30,0,{"unemployed"}, "state_1"},
       ["A_C_Horse_AmericanPaint_Tobiano"] = {"Tobiano", 70, 1, 30,0,{"unemployed", "unemployed2", "unemployed3"}, "state_1"},
   },
   {
   name = "Gypsy cob",
       ["a_c_horse_gypsycob_palominoblagdon"] = {"Palomino Blagdon", 160, 3 , 40,0,{"unemployed"}, "state_2"},
       ["a_c_horse_gypsycob_piebald"] = {"Piebald", 160, 3 , 40,0,{"unemployed"}, "state_2"},
       ["a_c_horse_gypsycob_splashedbay"] = {"Splashed Bay", 160, 3 , 40,0,{"unemployed"}, "state_3"},
       ["a_c_horse_gypsycob_splashedpiebald"] = {"Splashed Piebald", 160, 3 , 40,0,{"unemployed"}, "state_3"},
       ["a_c_horse_gypsycob_skewbald"] = {"Skewbald", 160, 3, 40,0,{"unemployed"}, "state_2"},
       ["a_c_horse_gypsycob_whiteblagdon"] = {"White Blagdon", 160, 3 , 40,0,{"unemployed"}, "state_2"},
   },
   {
   name = "American standard",
       ["A_C_Horse_AmericanStandardbred_Black"] = {"Black", 120, 3, 30,0,{"unemployed"}, "state_3"},
       ["A_C_Horse_AmericanStandardbred_Buckskin"] = {"Buck Skin", 120, 3, 30,0,{"unemployed"}, "state_3"},
       ["A_C_Horse_AmericanStandardbred_PalominoDapple"] = {"Palomino Dapple", 120, 3, 30,0,{"unemployed"}, "state_3"},
       ["A_C_Horse_AmericanStandardbred_SilverTailBuckskin"] = {"Silver Tail Buck Skin", 120, 3, 30,0,{"unemployed"}, "state_3"},
   },
   {
   name = "Andalusian",
       ["A_C_Horse_Andalusian_DarkBay"] = {"Dark Bay", 200, 4, 40,0,{"unemployed"}, "state_2"},
       ["A_C_Horse_Andalusian_Perlino"] = {"Perlino", 200, 4, 40,0,{"unemployed"}, "state_1"},
       ["A_C_Horse_Andalusian_RoseGray"] = {"Rose Gray", 200, 4, 40,0,{"unemployed"}, "state_2"},    
   },
   {
   name = "Appaloosa",
       ["A_C_Horse_Appaloosa_BlackSnowflake"] = {"Black Snow flake", 0, 800, 50, 0,{"unemployed"}, "state_4"},
       ["A_C_Horse_Appaloosa_Blanket"] = {"Blanket", 0,800,  50, 0,{"unemployed"}, "state_4"},
       ["A_C_Horse_Appaloosa_BrownLeopard"] = {"Brown Leopard", 0, 800, 50, 0,{"unemployed"}, "state_4"},
       ["A_C_Horse_Appaloosa_FewSpotted_PC"] = {"FewSpotted", 0, 800,  50, 0,{"unemployed"}, "state_4"},
       ["A_C_Horse_Appaloosa_Leopard"] = {"Leopard",  0, 800, 30, 0,{"unemployed"}, "state_4"},
       ["A_C_Horse_Appaloosa_LeopardBlanket"] = {"Leopard Blanket", 0, 800, 50, 0,{"unemployed"}, "state_4"},
   },
   {
   name = "Arabian",
       ["A_C_Horse_Arabian_Black"] = {"Black", 0, 1000, 50,0,{"unemployed"}, "state_4"},
       ["A_C_Horse_Arabian_Grey"] = {"Grey", 0, 1000, 50,0,{"unemployed"}, "state_4"},
       ["A_C_Horse_Arabian_RedChestnut"] = {"Red Chestnut", 0, 1000, 50,0,{"unemployed"}, "state_4"},
       ["A_C_Horse_Arabian_RoseGreyBay"] = {"Rose Grey Bay", 0, 1000, 50,0,{"unemployed"}, "state_4"},
       ["A_C_Horse_Arabian_WarpedBrindle_PC"] = {"Warped Brindle", 0, 1000, 50,0,{"unemployed"}, "state_4"},
       ["A_C_Horse_Arabian_White"] = {"White", 0, 1000, 50,0,{"unemployed"}, "state_4"},
   },
   {
   name = "Ardennes",
       ["A_C_Horse_Ardennes_BayRoan"] = {"Bay Roan", 240, 4, 30,0,{"unemployed"}, "state_2"},
       ["A_C_Horse_Ardennes_IronGreyRoan"] = {"Iron Grey Roan", 240, 4, 30,0,{"unemployed"}, "state_3"},
       ["A_C_Horse_Ardennes_StrawberryRoan"] = {"Strawberry Roan", 240, 40, 30,0,{"unemployed"}, "state_3"},
   },
   {
   name = "Belgian",
       ["A_C_Horse_Belgian_BlondChestnut"] = {"Blond Chestnut", 89, 2, 35,0,{"unemployed"}, "state_1"},
       ["A_C_Horse_Belgian_MealyChestnut"] = {"Mealy Chestnut", 89, 2, 35,0,{"unemployed"}, "state_1"},
   },
   {
   name = "Dutch Warm Blood",
       ["A_C_Horse_DutchWarmblood_ChocolateRoan"] = {"Chocolate Roan", 180, 4, 30,0,{"unemployed"}, "state_3"},
       ["A_C_Horse_DutchWarmblood_SealBrown"] = {"Seal Brown", 180, 4, 30,0,{"unemployed"}, "state_2"},
       ["A_C_Horse_DutchWarmblood_SootyBuckskin"] = {"Sooty Buckskin", 180, 4, 30,0,{"unemployed"}, "state_2"},
   },
   {
   name = "Hungarian",
       ["A_C_Horse_HungarianHalfbred_DarkDappleGrey"] = {"Dark Dapple Grey", 65, 1, 30,0,{"unemployed"}, "state_2"},
       ["A_C_Horse_HungarianHalfbred_FlaxenChestnut"] = {"Flaxen Chestnut", 65, 1, 30,0,{"unemployed"}, "state_1"},
       ["A_C_Horse_HungarianHalfbred_LiverChestnut"] = {"Liver Chestnut", 65, 1, 30,0,{"unemployed"}, "state_2"},
       ["A_C_Horse_HungarianHalfbred_PiebaldTobiano"] = {"Piebald Tobiano", 65, 1, 30,0,{"unemployed"}, "state_1"},
   },
   {
   name = "Kentucky Saddle",
       ["A_C_Horse_KentuckySaddle_Black"] = {"Black", 50, 1, 30,0,{"unemployed"}, "state_1"},
       ["A_C_Horse_KentuckySaddle_ButterMilkBuckskin_PC"] = {"Butter Milk Buckskin", 50, 1, 30,0,{"unemployed"}, "state_1"},
       ["A_C_Horse_KentuckySaddle_ChestnutPinto"] = {"Chestnut Pinto", 50, 1, 30,0,{"unemployed"}, "state_1"},
       ["A_C_Horse_KentuckySaddle_Grey"] = {"Grey", 50, 1, 30,0,{"unemployed"}, "state_1"},
       ["A_C_Horse_KentuckySaddle_SilverBay"] = {"Silver Bay", 50, 1, 30,0,{"unemployed"}, "state_1"},
   },
   {
   name = "Kladruber",
       ["A_C_Horse_Kladruber_Black"] = {"Black", 195, 4, 30,0,{"unemployed"}, "state_2"},
       ["A_C_Horse_Kladruber_Silver"] = {"Silver", 195, 4, 30,0,{"unemployed"}, "state_3"},
       ["A_C_Horse_Kladruber_Cremello"] = {"Cremello", 195, 4, 30,0,{"unemployed"}, "state_3"},
       ["A_C_Horse_Kladruber_Grey"] = {"Grey", 195, 4, 30,0,{"unemployed"}, "state_3"},
       ["A_C_Horse_Kladruber_DappleRoseGrey"] = {"Dapple Rose Grey", 195, 4, 30,0,{"unemployed"}, "state_3"},
       ["A_C_Horse_Kladruber_White"] = {"White", 195, 4, 30,0,{"unemployed"}, "state_2"},
   },
   {
   name = "Missouri Fox Trotter",
       ["A_C_Horse_MissouriFoxTrotter_AmberChampagne"] = {"Amber Champagne", 130, 3, 30,0,{"unemployed"}, "state_4"},
       ["A_C_Horse_MissouriFoxTrotter_SableChampagne"] = {"Sable Champagne", 130, 3, 30,0,{"unemployed"}, "state_4"},
       ["A_C_Horse_MissouriFoxTrotter_SilverDapplePinto"] = {"Silver Dapple Pinto", 130, 3, 30,0,{"unemployed"}, "state_4"},
       ["a_c_horse_missourifoxtrotter_blacktovero"] = {"Black Tovero", 130, 3, 30,0,{"unemployed"}, "state_4"},   
       ["a_c_horse_missourifoxtrotter_blueroan"] = {"Blue", 130, 3, 30,0,{"unemployed"}, "state_4"},   
       ["a_c_horse_missourifoxtrotter_buckskinbrindle"] = {"Buck Skin", 130, 3, 30,0,{"unemployed"}, "state_4"},  
       ["a_c_horse_missourifoxtrotter_dapplegrey"] = {"Dapple Grey", 130, 3, 30,0,{"unemployed"}, "state_4"},
   },
   {
   name = "Morgan",
       ["A_C_Horse_Morgan_Bay"] = {"Bay", 30, 1, 30,0,{"unemployed"}, "state_1"},
       ["A_C_Horse_Morgan_BayRoan"] = {"Bay Roan", 30, 1, 30,0,{"unemployed"}, "state_1"},
       ["A_C_Horse_Morgan_FlaxenChestnut"] = {"Flaxen Chestnut", 30, 1, 30,0,{"unemployed"}, "state_1"},
       ["A_C_Horse_Morgan_LiverChestnut_PC"] = {"Liver Chestnut", 30, 1, 30,0,{"unemployed"}, "state_1"},
       ["A_C_Horse_Morgan_Palomino"] = {"Palomino", 30, 1, 30,0,{"unemployed"}, "state_1"},
   },
   {
   name = "Mangy",
       ["A_C_Horse_MP_Mangy_Backup"] = {"Mangy", 5, 0, 15,0,{"unemployed"}, "state_1"},
   },
   {
   name = "Mustang",
       ["A_C_Horse_Mustang_GoldenDun"] = {"Golden Dun", 200, 4, 30,0,{"unemployed"}, "state_4"},
       ["A_C_Horse_Mustang_GrulloDun"] = {"Grullo Dun", 200, 4, 30,0,{"unemployed"}, "state_1"},
       ["A_C_Horse_Mustang_TigerStripedBay"] = {"Tiger Striped Bay", 200, 4, 30,0,{"unemployed"}, "state_1"},
       ["A_C_Horse_Mustang_WildBay"] = {"Wild Bay", 200, 4, 30,0,{"unemployed"}, "state_1"},
       ["a_c_horse_mustang_blackovero"] = {"Black Overo", 200, 4, 30,0,{"unemployed"}, "state_4"},    
       ["a_c_horse_mustang_buckskin"] = {"Buck Skin", 200, 4, 30,0,{"unemployed"}, "state_4"},  
       ["a_c_horse_mustang_chestnuttovero"] = {"Chestnutt", 200, 4, 30,0,{"unemployed"}, "state_4"}, 
       ["a_c_horse_mustang_reddunovero"] = {"Red", 200, 4, 30,0,{"unemployed"}, "state_4"},   
   },
   {
   name = "Nokota",
       ["A_C_Horse_Nokota_BlueRoan"] = {"Blue Roan", 100, 2, 30,0,{"unemployed"}, "state_1"},
       ["A_C_Horse_Nokota_ReverseDappleRoan"] = {"Reverse Dapple Roan", 100, 2, 30,0,{"unemployed"}, "state_3"},
       ["A_C_Horse_Nokota_WhiteRoan"] = {"White Roan", 100, 2, 30,0,{"unemployed"}, "state_1"},
   },
   {
   name = "Shire",
       ["A_C_Horse_Shire_DarkBay"] = {"Dark Bay", 320, 7, 50,0,{"unemployed"}, "state_2"},
       ["A_C_Horse_Shire_LightGrey"] = {"Light Grey", 320, 7, 50,0,{"unemployed"}, "state_2"},
       ["A_C_Horse_Shire_RavenBlack"] = {"Raven Black", 320, 7, 50,0,{"unemployed"}, "state_2"},
   },
   {
   name = "Suffolk punch",
       ["A_C_Horse_SuffolkPunch_RedChestnut"] = {"Red Chestnut", 90, 2, 35,0,{"unemployed"}, "state_1"},
       ["A_C_Horse_SuffolkPunch_Sorrel"] = {"Sorrel", 90, 2, 35,0,{"unemployed"}, "state_1"},
   },
   {
   name = "Tennessee Walker",
       ["A_C_Horse_TennesseeWalker_BlackRabicano"] = {"Black Rabicano", 50, 1, 30,0,{"unemployed"}, "state_1"},
       ["A_C_Horse_TennesseeWalker_Chestnut"] = {"Chestnut", 50, 1, 30,0,{"unemployed"}, "state_1"},
       ["A_C_Horse_TennesseeWalker_DappleBay"] = {"Dapple Bay", 50, 1, 30,0,{"unemployed"}, "state_1"},
       ["A_C_Horse_TennesseeWalker_FlaxenRoan"] = {"Flaxen Roan", 50, 1, 30,0,{"unemployed"}, "state_1"},
       ["A_C_Horse_TennesseeWalker_MahoganyBay"] = {"Mahogany Bay", 50, 1, 30,0,{"unemployed"}, "state_1"},
       ["A_C_Horse_TennesseeWalker_RedRoan"] = {"Red Roan", 50, 1, 30,0,{"unemployed"}, "state_1"},
       ["A_C_Horse_TennesseeWalker_GoldPalomino_PC"] = {"Gold Palomino", 50, 1, 30,0,{"unemployed"}, "state_1"},
   },
   {
   name = "Thoroughbred",
       ["A_C_Horse_Thoroughbred_BlackChestnut"] = {"Black Chestnut", 95, 2, 30,0,{"unemployed"}, "state_3"},
       ["A_C_Horse_Thoroughbred_BloodBay"] = {"Blood Bay", 95, 2, 30,0,{"unemployed"}, "state_1"},
       ["A_C_Horse_Thoroughbred_Brindle"] = {"Brindle", 95, 2, 30,0,{"unemployed"}, "state_3"},
       ["A_C_Horse_Thoroughbred_DappleGrey"] = {"Dapple Grey", 95, 2, 30,0,{"unemployed"}, "state_1"},
       ["A_C_Horse_Thoroughbred_ReverseDappleBlack"] = {"Reverse Dapple Black", 95, 2, 30,0,{"unemployed"}, "state_3"},
   },
   {
   name = "Turkoman",
       ["A_C_Horse_Turkoman_DarkBay"] = {"Dark Bay", 0, 1000, 50,0,{"unemployed"}, "state_4"},
       ["A_C_Horse_Turkoman_Gold"] = {"Gold", 0, 1000, 50,0,{"unemployed"}, "state_4"},
       ["A_C_Horse_Turkoman_Silver"] = {"Silver", 0, 1000, 50,0,{"unemployed"}, "state_4"},
       ["a_c_horse_turkoman_black"] = {"Black", 0, 1000, 50,0,{"unemployed"}, "state_4"},   
       ["a_c_horse_turkoman_chestnut"] = {"Chestnut", 0, 1000, 50,0,{"unemployed"}, "state_4"},
       ["a_c_horse_turkoman_grey"] = {"Grey", 0, 1000, 50,0,{"unemployed"}, "state_4"},    
       ["a_c_horse_turkoman_perlino"] = {"Perlino", 0, 1000, 50,0,{"unemployed"}, "state_4"},
   },
   {
   name = "Criollo",
       ["A_C_Horse_Criollo_Dun"] = {"Dun", 100, 2, 30,0,{"unemployed"}, "state_3"},
       ["A_C_Horse_Criollo_MarbleSabino"] = {"Marble Sabino", 100, 2, 30,0,{"unemployed"}, "state_4"},
       ["A_C_Horse_Criollo_BayFrameOvero"] = {"Bay Frame Overo", 100, 2, 30,0,{"unemployed"}, "state_4"},
       ["A_C_Horse_Criollo_BayBrindle"] = {"Bay Brindle", 100, 2, 30,0,{"unemployed"}, "state_4"},
       ["A_C_Horse_Criollo_SorrelOvero"] = {"Sorrel Overo", 100, 2, 30,0,{"unemployed"}, "state_4"},
       ["A_C_Horse_Criollo_BlueRoanOvero"] = {"Blue Roan Overo", 100, 2, 30,0,{"unemployed"}, "state_3"},
   },
   {
   name = "Breton",
       ["A_C_Horse_Breton_SteelGrey"] = {"Steel Grey", 260, 6, 40,0,{"unemployed"}, "state_4"},
       ["a_c_horse_breton_mealydapplebay"] = {"Mealy Dapple", 260, 6, 40,0,{"unemployed"}, "state_4"},
       ["A_C_Horse_Breton_SealBrown"] = {"Seal Brown", 260, 6, 40,0,{"unemployed"}, "state_3"},
       ["A_C_Horse_Breton_GrulloDun"] = {"Grullo Dun", 260, 6, 40,0,{"unemployed"}, "state_3"},
       ["A_C_Horse_Breton_Sorrel"] = {"Sorrel", 260, 6, 40,0,{"unemployed"}, "state_2"},
       ["A_C_Horse_Breton_RedRoan"] = {"Red Roan", 260, 6, 40,0,{"unemployed"}, "state_2"},
   },
   {
   name = "Norfolkroadster",
   ["A_C_HORSE_NORFOLKROADSTER_BLACK"] = {"Black", 200, 4, 30,0,{"unemployed"}, "state_3"},
   ["A_C_HORSE_NORFOLKROADSTER_SPECKLEDGREY"] = {"Speckled Grey", 200, 4, 30,0,{"unemployed"}, "state_3"},
   ["A_C_HORSE_NORFOLKROADSTER_PIEBALDROAN"] = {"Piedbald Ronan", 200, 4, 30,0,{"unemployed"}, "state_4"},
   ["A_C_HORSE_NORFOLKROADSTER_ROSEGREY"] = {"Rose grey", 200, 4, 30,0,{"unemployed"}, "state_4"},
   ["A_C_HORSE_NORFOLKROADSTER_DAPPLEDBUCKSKIN"] = {"Dappled Buck Skin", 200, 4, 30,0,{"unemployed"}, "state_4"},
   ["A_C_HORSE_NORFOLKROADSTER_SPOTTEDTRICOLOR"] = {"Spotted Tricolor", 200, 4, 30,0,{"unemployed"}, "state_4"},
   },
   {
   name = "Other",
   ["a_c_horse_eagleflies"] = {"Eagle", 0, 1500, 50,0,{"unemployed"}, "state_3"},
   ["A_C_HorseMulePainted_01"] = {"Zebra", 5, 1, 30,0,{"unemployed"}, "state_1"},
   ["A_C_HorseMule_01"] = {"Mula", 5, 1, 30,0,{"unemployed"}, "state_1"},
   ["A_C_Donkey_01"] = {"Osel", 5, 1, 30,0,{"unemployed"}, "state_1"},
   },
}

Config.Animals = {
   [GetHashKey("a_c_alligator_01")] = "Alligator",
   [GetHashKey("a_c_alligator_03")] = "Alligator",
   [GetHashKey("a_c_armadillo_01")] = "Armadillo",
   [GetHashKey("a_c_badger_01")] = "Badger",
   [GetHashKey("a_c_bat_01")] = "Bat",
   [GetHashKey("a_c_bear_01")] = "Bear",
   [GetHashKey("a_c_bearblack_01")] = "Bearblack",
   [GetHashKey("a_c_beaver_01")] = "Beaver",
   [GetHashKey("a_c_bighornram_01")] = "Big Horn Ram",
   [GetHashKey("a_c_boar_01")] = "Boar",
   [GetHashKey("a_c_buck_01")] = "Buck",
   [GetHashKey("a_c_buffalo_01")] = "Buffalo",
   [GetHashKey("a_c_bull_01")] = "Bull",
   [GetHashKey("a_c_cardinal_01")] = "Cardinal",
   [GetHashKey("a_c_californiacondor_01")] = "California Condor",
   [GetHashKey("a_c_carolinaparakeet_01")] = "Carolina Parakeet",
   [GetHashKey("a_c_cedarwaxwing_01")] = "Cedar WaxWing",
   [GetHashKey("a_c_chicken_01")] = "Chicken",
   [GetHashKey("a_c_chipmunk_01")] = "Chipmunk",
   [GetHashKey("a_c_cougar_01")] = "Cougar",
   [GetHashKey("a_c_cormorant_01")] = "Cormorant",
   [GetHashKey("a_c_cow")] = "Cow",
   [GetHashKey("a_c_coyote_01")] = "Coyote",
   [GetHashKey("a_c_crab_01")] = "Crab",
   [GetHashKey("a_c_cranewhooping_01")] = "Crane Whooping",
   [GetHashKey("a_c_crow_01")] = "Drow",
   [GetHashKey("a_c_deer_01")] = "Deer",
   [GetHashKey("a_c_duck_01")] = "Duck",
   [GetHashKey("a_c_eagle_01")] = "Eagle",
   [GetHashKey("a_c_egret_01")] = "Egret",
   [GetHashKey("a_c_elk_01")] = "Elk",
   [GetHashKey("a_c_fox_01")] = "Fox",
   [GetHashKey("a_c_frogbull_01")] = "Frogbull",
   [GetHashKey("a_c_gilamonster_01")] = "Gila Monster",
   [GetHashKey("a_c_goat_01")] = "Goat",
   [GetHashKey("a_c_goosecanada_01")] = "Goose Canada",
   [GetHashKey("a_c_hawk_01")] = "Hawk",
   [GetHashKey("a_c_heron_01")] = "Heron",
   [GetHashKey("a_c_iguana_01")] = "Iguana",
   [GetHashKey("a_c_iguanadesert_01")] = "Iguana Desert",
   [GetHashKey("a_c_javelina_01")] = "Javelina",  
   [GetHashKey("a_c_loon_01")] = "Loon",
   [GetHashKey("a_c_moose_01")] = "Moose",
   [GetHashKey("a_c_muskrat_01")] = "Muskrat",
   [GetHashKey("a_c_oriole_01")] = "Oriole",
   [GetHashKey("a_c_owl_01")] = "Owl",
   [GetHashKey("a_c_ox_01")] = "Ox",
   [GetHashKey("a_c_panther_01")] = "Panther", 
   [GetHashKey("a_c_parrot_01")] = "Parrot",
   [GetHashKey("a_c_pelican_01")] = "Pelican",
   [GetHashKey("a_c_pheasant_01")] = "Pheasant",
   [GetHashKey("a_c_pig_01")] = "Pig",
   [GetHashKey("a_c_pigeon")] = "Pigeon",
   [GetHashKey("a_c_possum_01")] = "Possum",
   [GetHashKey("a_c_prairiechicken_01")] = "Prairie Chicken",
   [GetHashKey("a_c_pronghorn_01")] = "Pronghorn",
   [GetHashKey("a_c_quail_01")] = "Quail",
   [GetHashKey("a_c_rabbit_01")] =  "Rabbit",
   [GetHashKey("a_c_raccoon_01")] = "Raccoon",
   [GetHashKey("a_c_rat_01")] = "Rat",
   [GetHashKey("a_c_raven_01")] =  "Raven",
   [GetHashKey("a_c_redfootedbooby_01")] = "Redfooted Booby",
   [GetHashKey("a_c_robin_01")] = "Robin",
   [GetHashKey("a_c_rooster_01")] = "Rooster",
   [GetHashKey("a_c_roseatespoonbill_01")] = "Roseate Spoonbill",
   [GetHashKey("a_c_seagull_01")] = "Seagull",
   [GetHashKey("a_c_sheep_01")] = "Sheep",
   [GetHashKey("a_c_skunk_01")] =  "Skunk",
   [GetHashKey("a_c_snake_01")] = "Snake",
   [GetHashKey("a_c_snakeblacktailrattle_01")] = "Snake blacktail rattle",
   [GetHashKey("a_c_snakeferdelance_01")] = "Snake ferdelance",
   [GetHashKey("a_c_snakewater_01")] =  "Snakewater",   
   [GetHashKey("a_c_songbird_01")] = "Songbird",
   [GetHashKey("a_c_sparrow_01")] = "Sparrow",
   [GetHashKey("a_c_squirrel_01")] =  "Squirrel",
   [GetHashKey("a_c_toad_01")] = "Toad",
   [GetHashKey("a_c_turkey_01")] = "Turkey",
   [GetHashKey("a_c_turkeywild_01")] =  "Turkey Wild",
   [GetHashKey("a_c_turtlesnapping_01")] = "Turtle Snapping",
   [GetHashKey("a_c_vulture_01")] =  "Vulture",
   [GetHashKey("a_c_wolf")] = "Wolf",
   [GetHashKey("a_c_wolf_medium")] = "Wolf_medium",  
   [GetHashKey("a_c_wolf_small")] = "Wolf_small",
   [GetHashKey("a_c_woodpecker_01")] =  "Woodpecker",
   [GetHashKey("a_c_woodpecker_02")] = "Woodpecker",
   [GetHashKey("mp_a_c_alligator_01")] = "Alligator",
   [GetHashKey("mp_a_c_beaver_01")] =  "Beaver",
   [GetHashKey("mp_a_c_bighornram_01")] =  "Big Horn Ram",
   [GetHashKey("mp_a_c_boar_01")] = "Boar",
   [GetHashKey("mp_a_c_buck_01")] =  "Buck",
   [GetHashKey("mp_a_c_chicken_01")] = "Chicken",
   [GetHashKey("mp_a_c_cougar_01")] = "Cougar",    
}

Config.Animals2 = {
   [GetHashKey("a_c_alligator_01")] = "a_c_alligator_01",
   [GetHashKey("a_c_alligator_03")] = "a_c_alligator_03",
   [GetHashKey("a_c_armadillo_01")] = "a_c_armadillo_01",
   [GetHashKey("a_c_badger_01")] = "a_c_badger_01",
   [GetHashKey("a_c_bat_01")] = "a_c_bat_01",
   [GetHashKey("a_c_bear_01")] = "a_c_bear_01",
   [GetHashKey("a_c_bearblack_01")] = "a_c_bearblack_01",
   [GetHashKey("a_c_beaver_01")] = "a_c_beaver_01",
   [GetHashKey("a_c_bighornram_01")] = "a_c_bighornram_01",
   [GetHashKey("a_c_boar_01")] = "a_c_boar_01",
   [GetHashKey("a_c_buck_01")] = "a_c_buck_01",
   [GetHashKey("a_c_buffalo_01")] = "a_c_buffalo_01",
   [GetHashKey("a_c_bull_01")] = "a_c_bull_01",
   [GetHashKey("a_c_cardinal_01")] = "a_c_cardinal_01",
   [GetHashKey("a_c_californiacondor_01")] = "a_c_californiacondor_01",
   [GetHashKey("a_c_carolinaparakeet_01")] = "a_c_carolinaparakeet_01",
   [GetHashKey("a_c_cedarwaxwing_01")] = "a_c_cedarwaxwing_01",
   [GetHashKey("a_c_chicken_01")] = "a_c_chicken_01",
   [GetHashKey("a_c_chipmunk_01")] = "a_c_chipmunk_01",
   [GetHashKey("a_c_cougar_01")] = "a_c_cougar_01",
   [GetHashKey("a_c_cormorant_01")] = "a_c_cormorant_01",
   [GetHashKey("a_c_cow")] = "a_c_cow",
   [GetHashKey("a_c_coyote_01")] = "a_c_coyote_01",
   [GetHashKey("a_c_crab_01")] = "a_c_crab_01",
   [GetHashKey("a_c_cranewhooping_01")] = "a_c_cranewhooping_01",
   [GetHashKey("a_c_crow_01")] = "a_c_crow_01",
   [GetHashKey("a_c_deer_01")] = "a_c_deer_01",
   [GetHashKey("a_c_duck_01")] = "a_c_duck_01",
   [GetHashKey("a_c_eagle_01")] = "a_c_eagle_01",
   [GetHashKey("a_c_egret_01")] = "a_c_egret_01",
   [GetHashKey("a_c_elk_01")] = "a_c_elk_01",
   [GetHashKey("a_c_fox_01")] = "a_c_fox_01",
   [GetHashKey("a_c_frogbull_01")] = "a_c_frogbull_01",
   [GetHashKey("a_c_gilamonster_01")] = "a_c_gilamonster_01",
   [GetHashKey("a_c_goat_01")] = "a_c_goat_01",
   [GetHashKey("a_c_goosecanada_01")] = "a_c_goosecanada_01",
   [GetHashKey("a_c_hawk_01")] = "a_c_hawk_01",
   [GetHashKey("a_c_heron_01")] = "a_c_heron_01",
   [GetHashKey("a_c_iguana_01")] = "a_c_iguana_01",
   [GetHashKey("a_c_iguanadesert_01")] = "a_c_iguanadesert_01",
   [GetHashKey("a_c_javelina_01")] = "a_c_javelina_01",  
   [GetHashKey("a_c_loon_01")] = "a_c_loon_01",
   [GetHashKey("a_c_moose_01")] = "a_c_moose_01",
   [GetHashKey("a_c_muskrat_01")] = "a_c_muskrat_01",
   [GetHashKey("a_c_oriole_01")] = "a_c_oriole_01",
   [GetHashKey("a_c_owl_01")] = "a_c_owl_01",
   [GetHashKey("a_c_ox_01")] = "a_c_ox_01",
   [GetHashKey("a_c_panther_01")] = "a_c_panther_01", 
   [GetHashKey("a_c_parrot_01")] = "a_c_parrot_01",
   [GetHashKey("a_c_pelican_01")] = "a_c_pelican_01",
   [GetHashKey("a_c_pheasant_01")] = "a_c_pheasant_01",
   [GetHashKey("a_c_pig_01")] = "a_c_pig_01",
   [GetHashKey("a_c_pigeon")] = "a_c_pigeon",
   [GetHashKey("a_c_possum_01")] = "a_c_possum_01",
   [GetHashKey("a_c_prairiechicken_01")] = "a_c_prairiechicken_01",
   [GetHashKey("a_c_pronghorn_01")] = "a_c_pronghorn_01",
   [GetHashKey("a_c_quail_01")] = "a_c_quail_01",
   [GetHashKey("a_c_rabbit_01")] =  "a_c_rabbit_01",
   [GetHashKey("a_c_raccoon_01")] = "a_c_raccoon_01",
   [GetHashKey("a_c_rat_01")] = "a_c_rat_01",
   [GetHashKey("a_c_raven_01")] =  "a_c_raven_01",
   [GetHashKey("a_c_redfootedbooby_01")] = "a_c_redfootedbooby_01",
   [GetHashKey("a_c_robin_01")] = "a_c_robin_01",
   [GetHashKey("a_c_rooster_01")] = "a_c_rooster_01",
   [GetHashKey("a_c_roseatespoonbill_01")] = "a_c_roseatespoonbill_01",
   [GetHashKey("a_c_seagull_01")] = "a_c_seagull_01",
   [GetHashKey("a_c_sheep_01")] = "a_c_sheep_01",
   [GetHashKey("a_c_skunk_01")] =  "a_c_skunk_01",
   [GetHashKey("a_c_snake_01")] = "a_c_snake_01",
   [GetHashKey("a_c_snakeblacktailrattle_01")] = "a_c_snakeblacktailrattle_01",
   [GetHashKey("a_c_snakeferdelance_01")] = "a_c_snakeferdelance_01",
   [GetHashKey("a_c_snakewater_01")] =  "a_c_snakewater_01",   
   [GetHashKey("a_c_songbird_01")] = "a_c_songbird_01",
   [GetHashKey("a_c_sparrow_01")] = "a_c_sparrow_01",
   [GetHashKey("a_c_squirrel_01")] =  "a_c_squirrel_01",
   [GetHashKey("a_c_toad_01")] = "a_c_toad_01",
   [GetHashKey("a_c_turkey_01")] = "a_c_turkey_01",
   [GetHashKey("a_c_turkeywild_01")] =  "a_c_turkeywild_01",
   [GetHashKey("a_c_turtlesnapping_01")] = "a_c_turtlesnapping_01",
   [GetHashKey("a_c_vulture_01")] =  "a_c_vulture_01",
   [GetHashKey("a_c_wolf")] = "a_c_wolf",
   [GetHashKey("a_c_wolf_medium")] = "a_c_wolf_medium",  
   [GetHashKey("a_c_wolf_small")] = "a_c_wolf_small",
   [GetHashKey("a_c_woodpecker_01")] =  "a_c_woodpecker_01",
   [GetHashKey("a_c_woodpecker_02")] = "a_c_woodpecker_02",
   [GetHashKey("mp_a_c_alligator_01")] = "mp_a_c_alligator_01",
   [GetHashKey("mp_a_c_beaver_01")] =  "mp_a_c_beaver_01",
   [GetHashKey("mp_a_c_bighornram_01")] =  "mp_a_c_bighornram_01",
   [GetHashKey("mp_a_c_boar_01")] = "mp_a_c_boar_01",
   [GetHashKey("mp_a_c_buck_01")] =  "mp_a_c_buck_01",
   [GetHashKey("mp_a_c_chicken_01")] = "mp_a_c_chicken_01",
   [GetHashKey("mp_a_c_cougar_01")] = "mp_a_c_cougar_01",    
}

Config.Pelts =  {
   [GetHashKey("p_cs_alligatorpelt_large")] = "Pelt 1",    
   [GetHashKey("p_cs_cowpelt2_xlarge")] = "Pelt 2",    
   [GetHashKey("p_cs_gilamonsterpelt01x")] = "Pelt 3",    
   [GetHashKey("p_cs_iguanapelt")] = "Pelt 4",    
   [GetHashKey("p_cs_iguanapelt02x")] = "Pelt 5",    
   [GetHashKey("p_cs_pelt_elklegendary")] = "Pelt 6",    
   [GetHashKey("p_cs_pelt_large")] = "Pelt 7",    
   [GetHashKey("p_cs_pelt_med_armadillo")] = "Pelt 8",    
   [GetHashKey("p_cs_pelt_med_badger")] = "Pelt 9",    
   [GetHashKey("p_cs_pelt_med_muskrat")] = "Pelt 10",    
   [GetHashKey("p_cs_pelt_med_possum")] = "Pelt 11",    
   [GetHashKey("p_cs_pelt_med_raccoon")] = "Pelt 12",    
   [GetHashKey("p_cs_pelt_med_skunk")] = "Pelt 13",    
   [GetHashKey("p_cs_medium")] = "Pelt 14",    
   [GetHashKey("p_cs_medium_og")] = "Pelt 15",    
   [GetHashKey("p_cs_medlarge")] = "Pelt 16",    
   [GetHashKey("p_cs_wolf")] = "Pelt 17",    
   [GetHashKey("p_cs_wolf_roll")] = "Pelt 18",    
   [GetHashKey("p_cs_ws_alligator")] = "Pelt 19",    
   [GetHashKey("p_cs_pelt_xlarge")] = "Pelt 20",    
   [GetHashKey("p_cs_pelt_xlarge_alligator")] = "Pelt 21",    
   [GetHashKey("p_cs_pelt_xlarge_bear")] = "Pelt 22",    
   [GetHashKey("p_cs_pelt_xlarge_bearlegendary")] = "Pelt 23",    
   [GetHashKey("p_cs_pelt_xlarge_buffalo")] = "Pelt 24",    
   [GetHashKey("p_cs_pelt_xlarge_elk")] = "Pelt 25",    
   [GetHashKey("p_cs_pelt_xlarge_tbuffalo")] = "Pelt 26",    
   [GetHashKey("p_cs_pelt_xlarge_wbuffalo")] = "Pelt 27",    
   [GetHashKey("p_cs_wolfpelt_large")] = "Pelt 28",    
   [GetHashKey("p_cs_blackbearskin_medlarge")] = "Pelt 29",   
   [GetHashKey("p_cs_pelt_medlarge")] = "Pelt 30", 
}
Config.Pelts2 =  {
   [GetHashKey("p_cs_alligatorpelt_large")] = {"p_cs_alligatorpelt_large", true},    
   [GetHashKey("p_cs_cowpelt2_xlarge")] = {"p_cs_cowpelt2_xlarge", true},   
   [GetHashKey("p_cs_gilamonsterpelt01x")] = {"p_cs_gilamonsterpelt01x", true},  
   [GetHashKey("p_cs_iguanapelt")] = {"p_cs_iguanapelt", true},  
   [GetHashKey("p_cs_iguanapelt02x")] = {"p_cs_iguanapelt02x", true}, 
   [GetHashKey("p_cs_pelt_elklegendary")] = {"p_cs_pelt_elklegendary", true}, 
   [GetHashKey("p_cs_pelt_large")] = {"p_cs_pelt_large", true},  
   [GetHashKey("p_cs_pelt_med_armadillo")] = {"p_cs_pelt_med_armadillo", true},
   [GetHashKey("p_cs_pelt_med_badger")] = {"p_cs_pelt_med_badger", true},
   [GetHashKey("p_cs_pelt_med_muskrat")] = {"p_cs_pelt_med_muskrat", true},
   [GetHashKey("p_cs_pelt_med_possum")] = {"p_cs_pelt_med_possum", true},
   [GetHashKey("p_cs_pelt_med_raccoon")] = {"p_cs_pelt_med_raccoon", true}, 
   [GetHashKey("p_cs_pelt_med_skunk")] = {"p_cs_pelt_med_skunk", true},
   [GetHashKey("p_cs_medium")] = {"p_cs_medium", true},
   [GetHashKey("p_cs_medium_og")] = {"p_cs_medium_og", true},
   [GetHashKey("p_cs_medlarge")] = {"p_cs_medlarge", true},
   [GetHashKey("p_cs_wolf")] = {"p_cs_wolf", true},
   [GetHashKey("p_cs_wolf_roll")] = {"p_cs_wolf_roll", true},
   [GetHashKey("p_cs_ws_alligator")] = {"p_cs_ws_alligator", true},
   [GetHashKey("p_cs_pelt_xlarge")] = {"p_cs_pelt_xlarge", true},
   [GetHashKey("p_cs_pelt_xlarge_alligator")] = {"p_cs_pelt_xlarge_alligator", true},
   [GetHashKey("p_cs_pelt_xlarge_bear")] = {"p_cs_pelt_xlarge_bear", true},
   [GetHashKey("p_cs_pelt_xlarge_bearlegendary")] = {"p_cs_pelt_xlarge_bearlegendary", true},
   [GetHashKey("p_cs_pelt_xlarge_buffalo")] = {"p_cs_pelt_xlarge_buffalo", true},
   [GetHashKey("p_cs_pelt_xlarge_elk")] = {"p_cs_pelt_xlarge_elk", true},
   [GetHashKey("p_cs_pelt_xlarge_tbuffalo")] = {"p_cs_pelt_xlarge_tbuffalo", true},
   [GetHashKey("p_cs_pelt_xlarge_wbuffalo")] = {"p_cs_pelt_xlarge_wbuffalo", true},
   [GetHashKey("p_cs_wolfpelt_large")] = {"p_cs_wolfpelt_large", true},
   [GetHashKey("p_cs_blackbearskin_medlarge")] = {"p_cs_blackbearskin_medlarge", true},
   [GetHashKey("p_cs_pelt_medlarge")] = {"p_cs_pelt_medlarge", true}, 
}
Config.vehicle_extras = {
    ["armoredCar03x"] = {
        5,
        6,
        7,
    },

    ["bountywagon01x"] = {
        5,
    },

    ["caboose01x"] = {
        1,
    },

    ["cart01"] = {
        1,
        4,
    },

    ["cart05"] = {
        1,
        2,
        3,
    },

    ["cart07"] = {
        1,
    },

    ["cart08"] = {
        4,
    },

    ["chuckwagon000x"] = {
        1,
        2,
        3,
    },

    ["chuckwagon002x"] = {
        1,
        2,
        3,
    },

    ["coach2"] = {
        1,
        2,
        3,
        5,
    },

    ["coalHopper01x"] = {
        1,
        2,
        3,
        4,
        5,
    },

    ["gatchuck"] = {
        1,
        2,
        3,
        4,
    },

    ["gatchuck_2"] = {
        1,
    },

    ["horseBoat"] = {
        1,
        2,
        3,
        4,
    },

    ["keelboat"] = {
        5,
    },

    ["midlandboxcar05x"] = {
        1,
        2,
        3,
        4,
        5,
    },

    ["midlandrefrigeratorcar"] = {
        1,
        2,
        3,
    },

    ["northpassenger01x"] = {
        1,
        2,
        3,
        4,
        5,
    },

    ["northpassenger03x"] = {
        1,
        2,
        3,
        4,
        5,
    },

    ["policewagon01x"] = {
        5,
    },

    ["privatebaggage01x"] = {
        1,
        2,
    },

    ["privateboxcar01x"] = {
        1,
        2,
        3,
        4,
        5,
    },

    ["privateboxcar02x"] = {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
    },

    ["privateboxcar04x"] = {
        5,
    },

    ["privatedining01x"] = {
        1,
        2,
        3,
        4,
        5,
    },

    ["privateopensleeper01x"] = {
        1,
        2,
        3,
    },

    ["privateopensleeper02x"] = {
        1,
        2,
        3,
    },

    ["privatepassenger01x"] = {
        1,
        2,
        3,
        4,
        5,
        6,
    },

    ["rowboat"] = {
        1,
    },

    ["rowboatSwamp"] = {
        5,
    },

    ["rowboatSwamp02"] = {
        5,
    },

    ["ship_guama02"] = {
        1,
    },

    ["ship_nbdGuama2"] = {
        1,
        2,
        3,
    },

    ["smuggler02"] = {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13,
        14,
        15,
        16,
    },

    ["stagecoach001x"] = {
        1,
        2,
    },

    ["stagecoach002x"] = {
        1,
        2,
    },

    ["stagecoach004_2x"] = {
        5,
        6,
        7,
    },

    ["stagecoach005x"] = {
        1,
    },

    ["supplywagon"] = {
        1,
        2,
        4,
    },

    ["trolley01x"] = {
        1,
        2,
    },

    ["TugBoat2"] = {
        1,
        2,
    },

    ["utilliwag"] = {
        2,
    },

    ["wagon02x"] = {
        1,
        2,
        3,
        5,
    },

    ["wagon04x"] = {
        1,
        2,
        3,
    },

    ["wagon05x"] = {
        5,
    },

    ["wagon06x"] = {
        1,
        2,
    },

    ["wagonCircus01x"] = {
        1,
    },

    ["wagonCircus02x"] = {
        1,
    },

    ["wagondoc01x"] = {
        1,
    },
}

Config.vehicle_lantern_propsets = {
    ["keelboat"] = {
        "none",
        "pg_veh_keelboat_lanterns_1",
    },
    ["cart01"] = {
      "none",
      "pg_teamster_cart01_lightupgrade1",
        "pg_teamster_cart01_lightupgrade2",
        "pg_teamster_cart01_lightupgrade3",
        "pg_veh_cart01_lanterns01",
    },
    ["cart06"] =    {
      "none",
      "pg_re_deadbodies01x_lights",
        "pg_teamster_cart06_lightupgrade1",
        "pg_teamster_cart06_lightupgrade2",
        "pg_teamster_cart06_lightupgrade3",
        "pg_veh_cart06_lanterns01",
    },
    ["ArmySupplyWagon"] = {
      "none",
      "pg_veh_ArmySupplyWagon_lanterns01",
    },
    ["chuckwagon000x"] = {
      "none",
      "pg_teamster_chuckwagon000x_lightupgrade1",
        "pg_teamster_chuckwagon000x_lightupgrade2",
        "pg_teamster_chuckwagon000x_lightupgrade3",
        "pg_veh_chuckwagon000x_lanterns",
    },
    ["coal_wagon"] =      {
        "none",
        "pg_teamster_coalwagon_lightupgrade1",
        "pg_teamster_coalwagon_lightupgrade2",
        "pg_teamster_coalwagon_lightupgrade3",
        "pg_veh_coal_wagon_lanterns01",
    },
    ["chuckwagon002x"] =  {
      "none",
      "pg_teamster_chuckwagon002x_lightupgrade1",
        "pg_teamster_chuckwagon002x_lightupgrade2",
        "pg_teamster_chuckwagon002x_lightupgrade3",
        "pg_veh_chuckwagon002x_lanterns01",
    },
    ["horseBoat"] = {
      "none",
      "pg_veh_horseboat_1_lights",
    },
    ["policeWagon01x"] = {
      "none",
      "pg_veh_policeWagon01x_lanterns01",
    },
    ["policeWagongatling01x"] = {
      "none",
      "pg_veh_policeWagonGatling01x_lanterns01",
    },
    ["rowboat"] = {
      "none",
      "pg_veh_rowboat_lightupgrade_1",
        "pg_veh_rowboat_lightupgrade_2",
        "pg_veh_rowboat_lightupgrade_3",
    },
    ["ship_guama02"] = {
      "none",
      "pg_veh_shipguama02_lights01x",
    },
    ["turbineboat"] = {
      "none",
      "pg_veh_turbineboat01x_lights",
    },
    ["ship_nbdGuama"] =         {
      "none",
      "pg_veh_nbdguama_lights01x",
    },
    ["ship_nbdGuama2"] = {
      "none",
      "pg_veh_shipnbdguama2_1_lights",
    },
    ["stagecoach003x"] =    {
      "none",
      "pg_veh_stagecoach003x_lanterns01",
    },
    ["trolley01x"] = {
      "none",
      "pg_veh_trolley01x_lights",
    },
    ["TugBoat2"] = {
      "none",
      "pg_veh_tugboat2_lights01x",
    },
    ["wagon02x"] = {
      "none",
      "pg_teamster_wagon02x_lightupgrade1",
        "pg_teamster_wagon02x_lightupgrade2",
        "pg_teamster_wagon02x_lightupgrade3",
        "pg_veh_wagon02x_lanterns01",
        "pg_veh_wagonsuffrage_lanterns01",
    },
    ["wagon04x"] = {
      "none",
      "pg_teamster_wagon04x_lightupgrade1",
        "pg_teamster_wagon04x_lightupgrade2",
        "pg_teamster_wagon04x_lightupgrade3",
        "pg_veh_wagon04x_lanterns01",
    },
    ["wagon05x"] = {
      "none",
      "pg_teamster_wagon05x_lightupgrade1",
        "pg_teamster_wagon05x_lightupgrade2",
        "pg_teamster_wagon05x_lightupgrade3",
        "pg_veh_wagon05x_2_lanterns01",
        "pg_veh_wagon05x_lanterns01",
        "pg_veh_wagon05x_lanterns02",
    },
    ["wagon06x"] = {
      "none",
      "pg_teamster_wagon06x_lightupgrade1",
        "pg_teamster_wagon06x_lightupgrade2",
        "pg_teamster_wagon06x_lightupgrade3",
    },
    ["wagonPrison01x"] = {
      "none",
      "pg_veh_wagonPrison01x_lanterns01",
    },
    ["utilliwag"] = {
      "none",
      "pg_veh_utilliwag_lightupgrade_1",
        "pg_veh_utilliwag_lightupgrade_2",
        "pg_veh_utilliwag_lightupgrade_3",
        "pg_veh_utilliwag_lanterns01",
    },
    ["gatchuck"] =         {
      "none",
      "pg_teamster_gatchuck_lightupgrade1",
        "pg_teamster_gatchuck_lightupgrade2",
        "pg_teamster_gatchuck_lightupgrade3",
        "pg_veh_gatchuck_lanterns01",
    },
    ["bountywagon01x"] = {
      "none",
      "pg_teamster_chuckwagon002x_lightupgrade1",
        "pg_teamster_chuckwagon002x_lightupgrade2",
        "pg_teamster_chuckwagon002x_lightupgrade3",
        "pg_veh_chuckwagon002x_lanterns01",
    },
    ["wagonarmoured01x"] = {
      "none",
      "pg_veh_wagonarmoured01x_lanterns01",
    },
    ["huntercart01"] = {
      "none",
      "pg_re_deadbodies01x_lights",
        "pg_teamster_cart06_lightupgrade1",
        "pg_teamster_cart06_lightupgrade2",
        "pg_teamster_cart06_lightupgrade3",
        "pg_veh_cart06_lanterns01",
    },
    ["TugBoat3"] = {
      "none",
      "pg_veh_tugboat2_lights01x",
    },
}


Config.vehicle_liveries = {

	["privatebaggage01x"] = {
	 {0, "LM"},
	 {1, "CU"},
	 {2, "SE"},
	 {3, "PU"},
	},


	["gatchuck"] = {
	 {0, "0 - Simple Red Yellow"},
	 {1, "1 - Tapered Yellow Cream"},
	 {2, "2 - Squared Gold Black"},
	 {3, "3 - Flourish Gold Cream"},
	 {4, "4 - Simple Cream"},
	 {5, "5 - Tapered Gold Red"},
	 {6, "6 - Squared Cream Red"},
	 {7, "7 - Flourish Black Yellow"},
	 {8, "8 - Simple Yellow Red"},
	 {9, "9 - Tapered Gold Black"},
	 {10, "10 - Squared Black Red"},
	 {11, "11 - Flourish Cream Gold"},
	 {12, "12 - Gold Cream"},
	 {13, "13 - Tapered Blue Black"},
	 {14, "14 - Squared Gold Black"},
	 {15, "15 - Flourish Yellow Red"},
	},


	["privateboxcar04x"] = {
	 {0, "0 -Lannahechee"},
	 {1, "1 -Central Union"},
	 {2, "2 -Southern and Eastern"},
	 {3, "ARMY"},
	 {4, "PU"},
	},


	["privateboxcar02x"] = {
	 {0, "0 -LM"},
	 {1, "01 -CU"},
	 {2, "02 -SE"},
	 {3, "03 -military"},
	 {4, "PU"},
	},


	["stagecoach002x"] = {
	 {0, "0 -Davis"},
	 {1, "1 -Boles"},
	 {2, "2 -Heartlands"},
	 {3, "3 -Tapered"},
	},


	["cart03"] = {
	 {0, "0 - Simple Cream"},
	 {1, "1 - Tapered Double Cream Yellow"},
	 {2, "2 - Loco Red Yellow"},
	 {3, "3 - Fancy Red Blue Yellow"},
	 {4, "4 - Simple Worn Yellow Cream"},
	 {5, "5 - Chassis Worn Cream"},
	 {6, "6 - Loco Red Black"},
	 {7, "7 - Loco Blue Cream"},
	 {8, "8 - Fancy Red Gold"},
	 {9, "9 - Tapered Double Red Yellow"},
	},


	["midlandboxcar05x"] = {
	 {0, "LM"},
	 {1, "CU"},
	 {2, "SE"},
	 {3, "PU"},
	},


	["midlandrefrigeratorCar"] = {
	 {0, "LM"},
	},


	["boatSteam02x"] = {
	 {0, "0 -AnnieMay"},
	 {1, "1 -Calliope"},
	 {2, "2 -LaChuparrosa"},
	 {3, "3 -Magicienne"},
	},


	["northpassenger03x"] = {
	 {0, "CU"},
	},


	["privateopensleeper01x"] = {
	 {0, "SE"},
	 {1, "ARMY"},
	 {2, "PU"},
	},


	["coach4"] = {
	 {0, "0 - Lines Red Grey"},
	 {1, "1 - Crosshatch Red Green"},
	 {2, "2 - Accented Red Yellow"},
	 {3, "3 - Leaf Yellow"},
	 {4, "4 - Lines Red Green"},
	 {5, "5 - Crosshatch Red Yellow"},
	 {6, "6 - Accented Gold Red"},
	 {7, "7 - Leaf Red Yellow"},
	 {8, "8 - Lines Yellow Orange"},
	 {9, "9 - Crosshatch Cream"},
	 {10, "10 - Crosshatch Green"},
	 {11, "11 - Leaf Gold"},
	 {12, "12 - Lines Gold Yellow"},
	 {13, "13 - Crosshatch Gold"},
	},


	["wagon05x"] = {
	 {0, "0 - Simple Yellow"},
	 {1, "1 - Tapered Gold"},
	 {2, "2 - Double Cream Orange"},
	 {3, "3 - Flourish Yellow Orange"},
	 {4, "4 - Simple Cream"},
	 {5, "5 - Tapered Orange"},
	 {6, "6 - Double Cream Red"},
	 {7, "7 - Flourish Yellow Red"},
	 {8, "8 - Simple Red"},
	 {9, "9 - Tapered Yellow"},
	 {10, "10 - Double Creams"},
	 {11, "11 - Flourish Black Gold"},
	 {12, "12 - Simple Red"},
	 {13, "13 - Tapered Green"},
	 {14, "14 - Double Yellow Cream"},
	 {15, "15 - Flourish Yellow Cream"},
	 {16, "16 - Simple Orange"},
	 {17, "17 - Tapered Black"},
	 {18, "18 - Double Black Red"},
	 {19, "19 - Flourish Worn Red Cream"},
	},


	["bountywagon01x"] = {
	 {0, "0 - Livery1"},
	 {1, "1 - Livery2"},
	 {2, "2 - Livery3"},
	},


	["policeWagon01x"] = {
	 {0, "0 - Police Red White"},
	},


	["stagecoach003x"] = {
	 {0, "1 -Davis"},
	 {1, "2 -Boles"},
	 {2, "3 -Heartlands"},
	 {3, "4 -Ornate"},
	},


	["coach5"] = {
	 {0, "0 - Lines Yellow"},
	 {1, "1 - Tapered Yellow"},
	 {2, "2 - Squared Yellow Cream"},
	 {3, "3 - Leaf Yellow"},
	 {4, "4 - Lines Red Yellow"},
	 {5, "5 - Tapered Red Yellow"},
	 {6, "6 - Squared Red Yellow"},
	 {7, "7 - Leaf Red Yellow"},
	 {8, "8 - Lines Gold"},
	 {9, "9 - Tapered Gold"},
	 {10, "10 - Squared Gold"},
	 {11, "11 - Leaf Gold"},
	},


	["coach6"] = {
	 {0, "0 - Simple Cream"},
	 {1, "1 - Tapered Cream"},
	 {2, "2 - Squared Cream"},
	 {3, "3 - Leaf Cream Yellow"},
	 {4, "4 - Simple Yellow"},
	 {5, "5 - Tapered Yellow Red"},
	 {6, "6 - Squared Yellow"},
	 {7, "7 - Leaf Red Yellow"},
	 {8, "8 - Simple Red Yellow"},
	 {9, "9 - Tapered Red Yellow"},
	 {10, "10 - Squared Red"},
	 {11, "11 - Leaf Black Yellow"},
	 {12, "12 - Simple Black"},
	 {13, "13 - Tapered Gold Black"},
	 {14, "14 - Squared"},
	 {15, "15 - Leaf Gold"},
	},


	["northcoalcar01x"] = {
	 {0, "CU"},
	 {1, "LM"},
	},


	["policeWagongatling01x"] = {
	 {0, "0 - Police Red White"},
	},


	["privateboxcar01x"] = {
	 {0, "LM"},
	 {1, "CU"},
	 {2, "SE"},
	 {3, "ARMY"},
	 {4, "PU"},
	},


	["chuckwagon002X"] = {
	 {0, "0 - Simple Lining Yellow"},
	 {1, "1 - Double Lining Red Black"},
	 {2, "2 - Loco Grey Red"},
	 {3, "3 - Flourish Red Yellow"},
	 {4, "4 - Simple Lining Cream Red"},
	 {5, "5 - Double Lining Red Yellow"},
	 {6, "6 - Loco Red Cream"},
	 {7, "7 - Flourish Green"},
	 {8, "8 - Simple Lining Cream"},
	 {9, "9 - Double Lining Gold Red"},
	 {10, "10 - Gold Leaf"},
	},


	["coach3_cutscene"] = {
	 {0, "1 -Lines"},
	 {1, "2 -Flourish"},
	 {2, "3 -Gold Tapered"},
	 {3, "4 -Gold Leaf"},
	},


	["privateDining01x"] = {
	 {0, "SE"},
	 {1, "PU"},
	},


	["privateSteamer01x"] = {
	 {0, "SE"},
	 {1, "PU"},
	},


	["coach3"] = {
	 {0, "0 - Lines Gold"},
	 {1, "1 - Flourish Yellow"},
	 {2, "2 - Tapered Yellow"},
	 {3, "3 -  Leaf Yellow Red"},
	 {4, "4 - Lines Blue"},
	 {5, "5 - Flourish Gold Red"},
	 {6, "6 - Tapered Blue Grey"},
	 {7, "7 - Leaf Gold"},
	 {8, "8 - Lines Orange"},
	 {9, "9 - Flourish Red Cream"},
	 {10, "10 - Tapered Orange Yellow"},
	 {11, "11 - Leaf Worn"},
	 {12, "12 - Tapered Red Orange"},
	},


	["coach2"] = {
	 {0, "0 -Davis"},
	 {1, "1 -Boles"},
	 {2, "2 -Heartlands"},
	 {3, "3 -Tapered"},
	},


	["huntercart01"] = {
	 {0, "0 - Hunt0"},
	 {1, "1 - Hunt1"},
	 {2, "2 - Hunt2"},
	 {3, "3 - Hunt3"},
	 {4, "4 - Hunt4"},
	 {5, "5 - Hunt5"},
	},


	["oilWagon01x"] = {
	 {0, "0 - Cornwall Red Cream"},
	 {1, "1 - Cornwall Red Black"},
	 {2, "2 - Cornwall Cream Yellow"},
	 {3, "3 - Cornwall Cream Red Yellow"},
	 {4, "4 - Cornwall White Orange"},
	 {5, "5 -  Cornwall Yellow Red"},
	},


	["wagon06x"] = {
	 {0, "0 - Simple Cream Red"},
	 {1, "1 - Double Red Yellow"},
	 {2, "2 - Flourish Cream Gold"},
	 {3, "3 - Flourish II Red Black Yellow"},
	 {4, "4 - Simple Red"},
	 {5, "5 - Double Cream Yellow"},
	 {6, "6 - Flourish Black Yellow"},
	 {7, "7 - Flourish II Black Cream Gold"},
	 {8, "8 - Simple Red"},
	 {9, "9 - Double Red Cream"},
	 {10, "10 - Flourish Black Gold"},
	 {11, "11 - Flourish II Cream Orange Yellow"},
	 {12, "12 - Simple Yellow Red"},
	 {13, "13 - Double Black Red"},
	 {14, "14 - Flourish Red Yellow"},
	 {15, "15 - Flourish II Green Gold"},
	},


	["wagon03x"] = {
	 {0, "0 - Simple Brown Red"},
	 {1, "1 - Double Red Yellow"},
	 {2, "2 - Tapered Yellow Red"},
	 {3, "3 - Flourish Gold Black"},
	 {4, "4 - Simple Red"},
	 {5, "5 - Double Yellow Red"},
	 {6, "6 - Tapered Cream Red"},
	 {7, "7 - Flourish Red Black"},
	 {8, "8 - Simple Black"},
	 {9, "9 - Double Lining"},
	 {10, "10 - Tapered Yellow"},
	 {11, "11 - Flourish Red Gold"},
	 {12, "12 - Simple Brown"},
	 {13, "13 - Double Red"},
	 {14, "14 - Tapered Cream Red"},
	 {15, "15 - Flourish Red Yellow"},
	},


	["cart02"] = {
	 {0, "0 - Tapered Double Red Yellow"},
	 {1, "1 - Crossed Yellow Grey"},
	 {2, "2 - Leaf Yellow"},
	 {3, "3 - Flourish Red Yellow"},
	 {4, "4 - Tapered Worn Grey Yellow"},
	 {5, "5 - Simple Worn Cream"},
	 {6, "6 - Leaf Gold"},
	 {7, "7 - Flourish Gold"},
	 {8, "8 - Tapered Double Red Grey"},
	 {9, "9 - Crossed Red Yellow"},
	 {10, "10 - Leaf Red Yellow"},
	 {11, "11 - Flourish Brown"},
	 {12, "12 - Tapered Worn Red Yellow"},
	 {13, "13 - Simple Worn Yellow"},
	 {14, "14 - Leaf Cream Red"},
	 {15, "15 - Flourish Yellow"},
	},


	["warWagon2"] = {
	 {0, "0 -Simple Lining"},
	 {1, "1 -Double Lining"},
	 {2, "2 -Tapered"},
	 {3, "3 -Gold Leaf"},
	},


	["wagonarmoured01x"] = {
	 {0, "0 - Liv 1"},
	 {1, "1 - Liv 1a"},
	 {2, "2 - Liv 1b"},
	 {3, "3 -Liv 2"},
	 {4, "4 -Liv 2a"},
	 {5, "5 -Liv 2b"},
	 {6, "6 -Liv 3"},
	 {7, "7 -Liv 3a"},
	 {8, "8 -Liv 3b"},
	 {9, "9 -Liv 4"},
	 {10, "10 -Liv 4a"},
	 {11, "11 -Liv 4b"},
	 {12, "12 -Liv 5"},
	 {13, "13 -Liv 5a"},
	 {14, "14 -Liv 5b"},
	 {15, "15 -Liv 6"},
	 {16, "16 -Liv 6a"},
	 {17, "17 -Liv 6b"},
	 {18, "18 -Liv 7"},
	 {19, "19 -Liv 7a"},
	 {20, "20 -Liv 7b"},
	 {21, "21 -Liv 8"},
	 {22, "22 -Liv 8a"},
	 {23, "23 -Liv 8b"},
	 {24, "24 -Liv 9"},
	 {25, "25 -Liv 9a"},
	 {26, "26 -Liv 9b"},
	 {27, "27 -Liv 10"},
	 {28, "28 -Liv 10a"},
	 {29, "29 -Liv 10b"},
	 {30, "30 -Liv 10c"},
	},


	["caboose01x"] = {
	 {0, "LM"},
	 {1, "CU"},
	 {2, "SE"},
	 {3, "PU"},
	},


	["stagecoach004_2x"] = {
	 {0, "0 -Davis"},
	 {1, "1 -Boles"},
	 {2, "2 -Heartland"},
	 {3, "3 -Tapered"},
	 {4, "4 -Lemoyne"},
	},


	["privatepassenger01x"] = {
	 {0, "SE"},
	 {1, "PU"},
	},


	["trolley01x"] = {
	 {0, "CWALL"},
	 {1, "PU"},
	},


	["NORTHSTEAMER01X"] = {
	 {0, "northsteamer01x_LM"},
	 {1, "northsteamer01x_CU"},
	},


	["northpassenger01x"] = {
	 {0, "CU"},
	},


	["utilliwag"] = {
	 {0, "0 - Simple Red"},
	 {1, "1 - Double Red Cream"},
	 {2, "2 - Tapered Yellow Cream"},
	 {3, "3 - Flourish Cream Yellow"},
	 {4, "4 - Simple Red Yellow"},
	 {5, "5 - Double Red Black"},
	 {6, "6 - Tapered Red Cream Black"},
	 {7, "7 - Flourish Red Cream Gold"},
	 {8, "8 - Simple Black"},
	 {9, "9 - Double Red Black"},
	 {10, "10 - Tapered Cream Red"},
	 {11, "11 - Flourish Brown Gold"},
	 {12, "12 - Simple Cream Yellow"},
	 {13, "13 - Double Gold Cream"},
	 {14, "14 - Tapered Yellow Blue"},
	 {15, "15 - Flourish Red Yellow"},
	},


	["cart06"] = {
   {-1, "-1 - Default"},
   {0, "0 - Simple Yellow White"},
	 {1, "1 - Tapered Double Yellow Red"},
	 {2, "2 - Ornate Yellow"},
	 {3, "3 - Flourish Yellow Red"},
	 {4, "4 - Chassis Line White Yellow"},
	 {5, "5 - Rounded Blue White"},
	 {6, "6 - Simple White Red"},
	 {7, "7 - Tapered Double White Red"},
	 {8, "8 - Ornate Light Green"},
	 {9, "9 - Flourish Red"},
	 {10, "10 - Chassis Line Yellow Red"},
	 {11, "11 - Rounded Yellow Red"},
	 {12, "12 - Tapered Double Black"},
	},


	["wagondoc01x"] = {
	 {0, "0 -Doctors"},
	},


	["coal_wagon"] = {
	 {0, "0 -M.Harris01"},
	 {1, "1 -Jameson01"},
	 {2, "2 -M.Harris02"},
	 {3, "3 -Jameson02"},
	},


	["supplywagon2"] = {
	 {0, "0 - Simple Yellow Blue"},
	 {1, "1 - Double Yellow Red"},
	 {2, "2 - Tapered Yellow Red"},
	 {3, "3 - Flourish Green Yellow"},
	 {4, "4 - Appleseed Timber"},
	 {5, "5 - Simple Brown Blue"},
	 {6, "6 - Double Lining Green Yellow"},
	 {7, "7 - Tapered Yellow Cream"},
	 {8, "8 - Flourish Red Yellow"},
	 {9, "9 - Simple Red"},
	 {10, "10 - Double Brown Cream"},
	 {11, "11 - Tapered Gold Orange"},
	 {12, "12 - Flourish Cream Blue"},
	 {13, "13 - Double Gold Black"},
	 {14, "14 - Tapered Cream Orange"},
	 {15, "15 - Flourish Gold Brown"},
	},


	["cart04"] = {
	 {0, "0 - Simple Yellow"},
	 {1, "1 - Loco Cream Red"},
	 {2, "2 - Tapered Double Red Yellow"},
	 {3, "3 - Flourish Yellow"},
	 {4, "4 - Lines Red Yellow"},
	 {5, "5 - Lines Thick White Yellow"},
	 {6, "6 - Flourish Gold"},
	},


	["supplywagon"] = {
	 {0, "0 - Simple Yellow Blue"},
	 {1, "1 - Double Yellow Red"},
	 {2, "2 - Tapered Yellow Red"},
	 {3, "3 - Flourish Green Yellow"},
	 {4, "4 - Appleseed Timber"},
	 {5, "5 - Simple Brown Blue"},
	 {6, "6 - Double Lining Green Yellow"},
	 {7, "7 - Tapered Yellow Cream"},
	 {8, "8 - Flourish Red Yellow"},
	 {9, "9 - Simple Red"},
	 {10, "10 - Double Brown Cream"},
	 {11, "11 - Tapered Gold Orange"},
	 {12, "12 - Flourish Cream Blue"},
	 {13, "13 - Double Gold Black"},
	 {14, "14 - Tapered Cream Orange"},
	 {15, "15 - Flourish Gold Brown"},
	},


	["wagonwork01x"] = {
	 {0, "0 -Wakefield"},
	},


	["stagecoach004x"] = {
	 {0, "0 -Boles"},
	},


	["ArmySupplyWagon"] = {
        {0, "0 -US Army"},
	},


	["stagecoach006x"] = {
	 {0, "1 -Davis"},
	 {1, "2 -Boles"},
	 {2, "3 -Heartlands"},
	 {3, "4 -Simple"},
	},


	["buggy02"] = {
	 {0, "0 - Simple Yellow"},
	 {1, "1 - Flourish Red Yellow"},
	 {2, "2 - Ornate Red Yellow"},
	 {3, "3 - Fancy Yellow Brown"},
	 {4, "4 - Simple Red"},
	 {5, "5 - Flourish Orange Red"},
	 {6, "6 - Ornate Red Orange"},
	 {7, "7 - Fancy Red Orange"},
	 {8, "8 - Simple Cream"},
	 {9, "9 - Flourish Gold"},
	 {10, "10 - Ornate Gold Black"},
	 {11, "11 - Fancy Gold"},
	 {12, "12 - Simple Black"},
	 {13, "13 - Flourish Red Black"},
	 {14, "14 - Ornate Red Black"},
	},


	["wagon02x"] = {
	 {0, "0 - Simple Red"},
	 {1, "1 - Double Cream Yellow"},
	 {2, "2 - Tapered Red"},
	 {3, "3 - Flourish Red Cream"},
	 {4, "4 - Jameson"},
	 {5, "5 - Cornwall"},
	 {6, "6 - Simple Orange"},
	 {7, "7 - Double Lining"},
	 {8, "8 - Tapered Orange"},
	 {9, "9 - Flourish Red Yellow"},
	 {10, "10 - Simple Black"},
	 {11, "11 - Double Cream Yellow"},
	 {12, "12 - Tapered Cream Yellow"},
	 {13, "13 - Flourish Gold"},
	 {14, "14 - Simple Yellow"},
	 {15, "15 - Double Red Yellow"},
	 {16, "16 - Tapered Gold"},
	},


	["cart07"] = {
	 {0, "0 - Simple Green Yellow"},
	 {1, "1 - Tapered Double Yellow Red"},
	 {2, "2 - Loco Black Red Yellow"},
	 {3, "3 - Flourish Yellow Orange"},
	 {4, "4 - Rounded Off-White Yellow"},
	 {5, "5 - Rounded Worn Red Brown"},
	 {6, "6 - Tapered Double Orange Yellow"},
	 {7, "7 - Flourish Gold"},
	 {8, "8 - Rounded Grey Orange"},
	 {9, "9 - Loco Blue Black Yellow"},
	 {10, "10 - Simple Red Yellow"},
	 {11, "11 - Rounded Worn Black White"},
	},


	["privateCoalCar01x"] = {
	 {0, "SE"},
	 {1, "PU"},
	 {2, "ARMY"},
	},


	["oilWagon02x"] = {
	 {0, "0 - Cornwall Red Cream"},
	 {1, "1 - Cornwall Red Black"},
	 {2, "2 - Cornwall Cream Yellow"},
	 {3, "3 - Cornwall Cream Red Yellow"},
	 {4, "4 - Cornwall White Orange"},
	 {5, "5 -  Cornwall Yellow Red"},
	},


	["handcart"] = {
	 {0, "0 "},
	},


	["buggy01"] = {
	 {0, "0 - Simple Yellow"},
	 {1, "1 - Flourish Red Yellow"},
	 {2, "2 - Ornate Red Yellow"},
	 {3, "3 - Fancy Yellow Brown"},
	 {4, "4 - Simple Red"},
	 {5, "5 - Flourish Orange Red"},
	 {6, "6 - Ornate Red Orange"},
	 {7, "7 - Fancy Red Orange"},
	 {8, "8 - Simple Cream"},
	 {9, "9 - Flourish Gold Cream"},
	 {10, "10 - Ornate Gold Black"},
	 {11, "11 - Fancy Gold"},
	 {12, "12 - Simple Black"},
	 {13, "13 - Flourish Red Black"},
	 {14, "14 - Ornate Red Black"},
	},


	["buggy03"] = {
	 {0, "0 - Simple Yellow"},
	 {1, "1 - Flourish Red Yellow"},
	 {2, "2 - Ornate Red Yellow"},
	 {3, "3 - Fancy Yellow Brown"},
	 {4, "4 - Simple Red"},
	 {5, "5 - Flourish Orange Red"},
	 {6, "6 - Ornate Red Orange"},
	 {7, "7 - Fancy Red Orange"},
	 {8, "8 - Simple Cream"},
	 {9, "9 - Flourish Gold Cream"},
	 {10, "10 - Ornate Gold Black"},
	 {11, "11 - Fancy Gold"},
	 {12, "12 - Simple Black"},
	 {13, "13 - Flourish Red Black"},
	 {14, "14 - Ornate Red Black"},
	},


	["wagontraveller01x"] = {
	 {0, "0 - Traveller Red Yellow"},
	},


	["cart05"] = {
	 {0, "0 - Line Blue"},
	 {1, "1 - Double Line Yellow"},
	 {2, "2 - Line Thick Green"},
	 {3, "3 - Flourish Red"},
	 {4, "4 - Simple Red"},
	 {5, "5 - Simple White"},
	 {6, "6 - Line Thick Yellow Orange"},
	 {7, "7 - Line Thick Red Blue"},
	 {8, "8 - Flourish Yellow White"},
	 {9, "9 - Double Line Orange"},
	},


	["gatchuck_2"] = {
	 {0, "0 - Simple Red Yellow"},
	 {1, "1 - Tapered Yellow Cream"},
	 {2, "2 - Squared Gold Black"},
	 {3, "3 - Flourish Gold Cream"},
	 {4, "4 - Simple Cream"},
	 {5, "5 - Tapered Gold Red"},
	 {6, "6 - Squared Cream Red"},
	 {7, "7 - Flourish Black Yellow"},
	 {8, "8 - Simple Yellow Red"},
	 {9, "9 - Tapered Gold Black"},
	 {10, "10 - Squared Black Red"},
	 {11, "11 - Flourish Cream Gold"},
	 {12, "12 - Gold Cream"},
	 {13, "13 - Tapered Blue Black"},
	 {14, "14 - Squared Gold Black"},
	 {15, "15 - Flourish Yellow Red"},
	},


	["cart08"] = {
	 {0, "0 - Single Line Yellow Red"},
	 {1, "1 - Simple Double Cream Yellow"},
	 {2, "2 - Tapered Double Brown White"},
	 {3, "3 - Flourish Cream"},
	 {4, "4 - Simple Red"},
	 {5, "5 - Chassis Cream Yellow"},
	 {6, "6 - Single Line Orange"},
	 {7, "7 - Double Line Brown"},
	 {8, "8 - Single Line Brown Red"},
	 {9, "9 - Simple Double Cream Yellow"},
	 {10, "10 - Tapered Double Grey White"},
	 {11, "11 - Flourish Gold"},
	 {12, "12 - Simple Blue Red"},
	 {13, "13 - Chassis Red Yellow"},
	 {14, "14 - Single Line Bright Orange"},
	 {15, "15 - Double Line Worn"},
	},


	["wagondairy01x"] = {
	 {0, "0 - Kauffman"},
	 {1, "1 - Kauffman Worn"},
	},


	["wagon04x"] = {
	 {0, "0 - Simple Cream"},
	 {1, "1 - Double Yellows"},
	 {2, "2 - Tapered Red"},
	 {3, "3 - Flourish Red Yellow"},
	 {4, "4 - Simple Red"},
	 {5, "5 - Double Yellow White"},
	 {6, "6 - Tapered Yellow"},
	 {7, "7 - Flourish Cream Black"},
	 {8, "8 - Simple Green"},
	 {9, "9 - Double Red Yellow"},
	 {10, "10 - Tapered Cream"},
	 {11, "11 - Flourish Black Gold"},
	 {12, "12 - Simple Black Cream"},
	 {13, "13 - Double Brown Orange"},
	 {14, "14 - Tapered Orange"},
	 {15, "15 - Flourish Cream Red"},
	},


	["stagecoach005x"] = {
	 {0, "1 -Davis"},
	 {1, "2 -Boles"},
	 {2, "3 -Heartlands"},
	 {3, "4 -Tapered"},
	},


	["chuckwagon000x"] = {
	 {0, "0 -Simple Lining Red"},
	 {1, "1 - Dot Lining Red Yellow"},
	 {2, "2 - Double Lining White Blue"},
	 {3, "3 - Flourish Yellow"},
	 {4, "4 -Simple Lining Yellow"},
	 {5, "5 - Dot Lining Orange Yellow"},
	 {6, "6 - Double Lining Black Red"},
	 {7, "7 - Flourish Red Yellow"},
	 {8, "8 - Flourish Cream Gold"},
	 {9, "9 - Flourish Red Black"},
	 {10, "10 - Double Lining Red Yellow"},
	},


	["stagecoach001x"] = {
	 {0, "1 -Davis"},
	 {1, "2 -Boles"},
	 {2, "3 -Heartlands"},
	 {3, "4 -Ornate"},
	},


	["privateopensleeper02x"] = {
	 {0, "SE"},
	 {1, "ARMY"},
	 {2, "PU"},
	},


	["privateRooms01x"] = {
	 {0, "SE"},
	 {1, "PU"},
	},


	["cart01"] = {
	 {0, "0 - Simple Cream"},
	 {1, "1 - Tapered Double Yellow"},
	 {2, "2 - Loco Cream Blue"},
	 {3, "3 - Flourish Yellow Cream"},
	 {4, "4 - Simple Worn Yellow"},
	 {5, "5 - Tapered Worn Cream"},
	 {6, "6 - Simple Yellow"},
	 {7, "7 - Tapered Double Red Cream"},
	 {8, "8 - Loco Cream Red"},
	 {9, "9 - Flourish Red Yellow"},
	 {10, "10 - Simple Worn Cream"},
	 {11, "11 - Tapered Worn Red Cream"},
	},


	["wagon05x_2"] = {
	 {0, "0 - Simple Yellow"},
	 {1, "1 - Tapered Gold"},
	 {2, "2 - Double Cream Orange"},
	 {3, "3 - Flourish Yellow Orange"},
	 {4, "4 - Simple Cream"},
	 {5, "5 - Tapered Orange"},
	 {6, "6 - Double Cream Red"},
	 {7, "7 - Flourish Yellow Red"},
	 {8, "8 - Simple Red"},
	 {9, "9 - Tapered Yellow"},
	 {10, "10 - Double Creams"},
	 {11, "11 - Flourish Black Gold"},
	 {12, "12 - Simple Red"},
	 {13, "13 - Tapered Green"},
	 {14, "14 - Double Yellow Cream"},
	 {15, "15 - Flourish Yellow Cream"},
	 {16, "16 - Simple Orange"},
	 {17, "17 - Tapered Black"},
	 {18, "18 - Double Black Red"},
	 {19, "19 - Flourish Worn Red Cream"},
	},
} 

Config.vehicle_tints = {
	["armoredCar01x"]              = 1,
	["armoredcar03x"]              = 1,
	["ArmySupplyWagon"]            = 1,
	["boatsteam02x"]               = 6,
	["bountywagon01x"]             = 5,
	["buggy01"]                    = 14,
	["buggy02"]                    = 16,
	["buggy03"]                    = 16,
	["caboose01x"]                 = 12,
	["canoe"]                      = 5,
	["canoeTreeTrunk"]             = 1,
	["cart01"]                     = 27,
	["cart02"]                     = 24,
	["cart03"]                     = 25,
	["cart04"]                     = 19,
	["cart05"]                     = 24,
	["cart06"]                     = 25,
	["cart07"]                     = 24,
	["cart08"]                     = 20,
	["chuckwagon000x"]             = 15,
	["chuckwagon002x"]             = 15,
	["coach2"]                     = 5,
	["coach3"]                     = 20,
	["coach3_cutscene"]            = 10,
	["coach4"]                     = 20,
	["coach5"]                     = 20,
	["coach6"]                     = 20,
	["coal_wagon"]                 = 24,
	["coalHopper01x"]              = 1,
	["gatchuck"]                   = 16,
	["gatchuck_2"]                 = 16,
	["handcart"]                   = 2,
	["huntercart01"]               = 6,
	["keelboat"]                   = 5,
	["logwagon"]                   = 5,
	["logwagon2"]                  = 5,
	["midlandboxcar05x"]           = 12,
	["midlandrefrigeratorCar"]     = 1,
	["northcoalcar01x"]            = 7,
	["northflatcar01x"]            = 3,
	["northpassenger01x"]          = 1,
	["northpassenger03x"]          = 1,
	["northsteamer01X"]            = 7,
	["oilWagon01x"]                = 14,
	["oilWagon02x"]                = 12,
	["pirogue"]                    = 6,
	["pirogue2"]                   = 7,
	["policewagon01x"]             = 3,
	["policewagongatling01x"]      = 3,
	["privateArmoured"]            = 1,
	["privatebaggage01x"]          = 8,
	["privateboxcar01x"]           = 15,
	["privateboxcar02x"]           = 15,
	["privateboxcar04x"]           = 15,
	["privateCoalCar01x"]          = 3,
	["privateDining01x"]           = 2,
	["privateflatcar01x"]          = 3,
	["privateObservationcar"]      = 1,
	["privateopensleeper01x"]      = 3,
	["privateopensleeper02x"]      = 3,
	["privatepassenger01x"]        = 2,
	["privaterooms01x"]            = 2,
	["privatesteamer01x"]          = 2,
	["rowboat"]                    = 7,
	["rowboatSwamp"]               = 6,
	["rowboatSwamp02"]             = 6,
	["ship_nbdGuama2"]             = 2,
	["skiff"]                      = 3,
	["stagecoach001x"]             = 4,
	["stagecoach002x"]             = 4,
	["stagecoach003x"]             = 4,
	["stagecoach004_2x"]           = 5,
	["stagecoach004x"]             = 3,
	["stagecoach005x"]             = 4,
	["stagecoach006x"]             = 7,
	["supplywagon"]                = 16,
	["supplywagon2"]               = 16,
	["trolley01x"]                 = 2,
	["tugboat2"]                   = 8,
	["tugBoat3"]                   = 4,
	["utilliwag"]                  = 17,
	["wagon02x"]                   = 22,
	["wagon03x"]                   = 16,
	["wagon04x"]                   = 21,
	["wagon05x"]                   = 20,
	["wagon05x_2"]                 = 20,
	["wagon06x"]                   = 16,
	["wagonarmoured01x"]           = 31,
	["wagoncircus01x"]             = 1,
	["wagoncircus02x"]             = 1,
	["wagondairy01x"]              = 2,
	["wagondoc01x"]                = 1,
	["wagonPrison01x"]             = 7,
	["wagontraveller01x"]          = 1,
	["wagonwork01x"]               = 2,
	["warwagon2"]                  = 6,
	["wintercoalcar"]              = 1,
}



Config.vehicle_propsets = {

    ["armoredCar01x"] = {
        "pg_veh_armoredCar01x_1",
    },

    ["armoredCar03x"] = {
        "pg_veh_armoredCar02x_1",
    },

    ["keelboat"] = {
        "pg_veh_keelboat_01",
        "pg_veh_keelboat_02",
        "pg_veh_keelboat_03",     
    },

    ["boatSteam02x"] = {
        "pg_veh_boatsteam02x_1",
    },

    ["caboose01x"] = {
        "pg_veh_caboose01x_1",
    },

    ["canoe"] = {
        "pg_veh_canoe_01",
        "pg_veh_canoe_02",
    },

    ["cart01"] = {
        "pg_re_checkpoint02x_food",
        "pg_re_moonshineCampgroupCart01x",
        "pg_teamster_cart01_breakables",
        "pg_teamster_cart01_gen",
        "pg_teamster_cart01_perishables",
        "pg_teamster_cart01_tnt",
        "pg_veh_cart01_1",
        "pg_veh_cart01_2",
        "pg_veh_cart01_3",
    },

    ["cart02"] = {
        "pg_mission_caravanCart02x",
        "pg_teamster_cart02_breakables",
        "pg_teamster_cart02_gen",
        "pg_teamster_cart02_perishables",
        "pg_teamster_cart02_tnt",     
    },

    ["cart03"] = {
        "pg_delivery_Coal02x",
        "pg_mp_moonshinebiz_supplies01x_cart03",
        "pg_teamster_cart03_breakables",
        "pg_teamster_cart03_gen",
        "pg_teamster_cart03_perishables",
        "pg_teamster_cart03_tnt",
        "pg_veh_cart03_1",
        "pg_veh_cart03_2",
        "pg_veh_cart03_barrels01x",     
    },

    ["cart04"] = {
        "pg_mission_caravanCart04x",
        "pg_teamster_cart04_breakables",
        "pg_teamster_cart04_gen",
        "pg_teamster_cart04_perishables",
        "pg_teamster_cart04_tnt",
        "pg_veh_cart04_1",
        "pg_veh_cart04_2",         
    },

    ["cart06"] = {
        "pg_teamster_cart06_breakables",
        "pg_teamster_cart06_gen",
        "pg_teamster_cart06_perishables",
        "pg_teamster_cart06_tnt",
        "pg_veh_cart06_1",
        "pg_veh_cart06_2",     
    },

    ["cart07"] = {
        "pg_teamster_cart07_breakables",
        "pg_teamster_cart07_gen",
        "pg_teamster_cart07_perishables",
        "pg_teamster_cart07_tnt",
        "pg_veh_cart07_1",
        "pg_veh_cart07_2",     
    },

    ["cart08"] = {
        "pg_teamster_cart08_breakables",
        "pg_teamster_cart08_gen",
        "pg_teamster_cart08_perishables",
        "pg_teamster_cart08_tnt",
        "pg_veh_cart08_1",
        "pg_veh_cart08_2",         
    },

    ["coach2"] = {
        "pg_mission_mary3_01x",
        "pg_re_coachrobbery01x",
        "pg_veh_coach2_1",
        "pg_veh_coach2_bootA",
    },

    ["ArmySupplyWagon"] = {
        "pg_rc_monroe1_01x",
    },

    ["chuckwagon000x"] = {
        "pg_re_fleeingfamily01x",
        "pg_teamster_chuckwagon000x_breakables",
        "pg_teamster_chuckwagon000x_gen",
        "pg_teamster_chuckwagon000x_perishables",
        "pg_teamster_chuckwagon000x_tnt",
        "pg_veh_chuckwagon000x_1",
        "pg_veh_chuckwagon000x_2",
        "pg_veh_chuckwagon000x_3",
        "pg_veh_chuckwagon000x_2a",
        "pg_veh_chuckwagon000x_3a",
        "pg_veh_chuckwagon000x_4",
        "pg_veh_chuckwagon000x_orange_1",
        "pg_vehload_cotton01",
        "pg_vehload_crates01",
        "pg_vehload_haybale01",
        "pg_vehload_livestock01",
        "pg_vehload_lumber01",
        "pg_vehload_sacks01",
        "pg_vl_blacksmith01",
        "pg_vl_butcher01",
        "pg_vl_craftsman01",
        "pg_vl_delivery01",
        "pg_vl_farmer01",
        "pg_vl_farmer02",
        "pg_vl_ferrier01",
        "pg_vl_fisherman01",
        "pg_vl_hunter01",
        "pg_vl_movingFamily01",
        "pg_vl_rancher01",
        "pg_vl_rancher02",
        "pg_vl_rancher03",
        "pg_vl_rancher04",
        "pg_vl_rancher05",
        "pg_vl_tradesman01",
        "pg_vl_tradesman02",
        "pg_vl_tradesman03",
        "pg_vl_tradesman04",
        "pg_vl_travellingFamily01",
        "pg_vl_travellingLabour01",
    },

    ["supplywagon"] = {
        "pg_mission_cornwall1_01x",
        "pg_mp_moonshinebiz_supplies02x_supwag",
        "pg_teamster_supplywagon_breakables",
        "pg_teamster_supplywagon_gen",
        "pg_teamster_supplywagon_perishables",
        "pg_teamster_supplywagon_tnt",
        "pg_delivery_Cotton01x",         
    },

    ["supplywagon2"] = {
        "pg_mission_mud4_strauswag01x",
        "pg_mission_mud4_strauswag02x",
    },

    ["logwagon"] = {
        "pg_veh_logwagon_1",         
    },

    ["logwagon2"] = {
        "pg_veh_logwagon2_1",         
    },

    ["coal_wagon"] = {
        "pg_delivery_Coal01x",     
    },

    ["chuckwagon002x"] = {
        "pg_rc_exconfederates1_01x",
        "pg_teamster_chuckwagon002x_breakables",
        "pg_teamster_chuckwagon002x_gen",
        "pg_teamster_chuckwagon002x_perishables",
        "pg_teamster_chuckwagon002x_tnt",
        "pg_veh_chuckwagon002x_1",
        "pg_veh_chuckwagon002x_2",
        "pg_veh_chuckwagon002x_3",
        "pg_vl_blacksmith01",
        "pg_vl_butcher01",
        "pg_vl_craftsman01",
        "pg_vl_delivery01",
        "pg_vl_farmer01",
        "pg_vl_farmer02",
        "pg_vl_ferrier01",
        "pg_vl_fisherman01",
        "pg_vl_hunter01",
        "pg_vl_movingFamily01",
        "pg_vl_rancher01",
        "pg_vl_rancher02",
        "pg_vl_rancher03",
        "pg_vl_rancher04",
        "pg_vl_rancher05",
        "pg_vl_tradesman01",
        "pg_vl_tradesman02",
        "pg_vl_tradesman03",
        "pg_vl_tradesman04",
        "pg_vl_travellingFamily01",
        "pg_vl_travellingLabour01",     
    },

    ["handcart"] = {
        "pg_mission_trainrob3_01x",     
    },

    ["horseBoat"] = {
        "pg_veh_horseBoat_1",
        "pg_veh_horseBoat_1_wreckage",
    },

    ["pirogue"] = {
        "pg_veh_pirogue_01",
    },

    ["pirogue2"] = {
        "pg_veh_pirogue_01",
    },

    ["GhostTrainCaboose"] = {
        "pg_veh_caboose01x_1",
    },

    ["rowboat"] = {
        "pg_veh_rowboat_01",
        "pg_veh_rowboat_02",
        "pg_mp_veh_rowboat_supplies01",
        "pg_mp_veh_rowboat_supplies02",
        "pg_mp_veh_rowboat_supplies03",
        "pg_mp_veh_rowboat_supplies04",
    },

    ["rowboatSwamp"] = {
        "pg_veh_rowboatswamp_01",
        "pg_veh_rowboatswamp_02",
        "pg_mp_veh_rowboatSwamp_supplies01",
        "pg_mp_veh_rowboatSwamp_supplies02",
        "pg_mp_veh_rowboatSwamp_supplies03",
        "pg_mp_veh_rowboatSwamp_supplies04",
    },

    ["rowboatSwamp02"] = {
        "pg_veh_rowboatswamp_01",
        "pg_veh_rowboatswamp_02",
    },

    ["ship_nbdGuama"] = {
        "pg_veh_NBDguama_01x",         
    },

    ["ship_nbdGuama2"] = {
        "pg_veh_shipNBDguama2_1",
    },

    ["stagecoach001x"] = {
        "pg_veh_stagecoach001x_1",
        "pg_veh_stagecoach001x_2",
    },

    ["stagecoach002x"] = {
        "pg_veh_stagecoach002x_1",
        "pg_veh_stagecoach002x_2",
        "pg_veh_stagecoach002x_bootA",
    },

    ["stagecoach003x"] = {
        "pg_veh_stagecoach003x_bootA",     
    },

    ["stagecoach004x"] = {
        "pg_mission_utp2_coachLockbox",
        "pg_teamster_armourwag_breakables",
        "pg_teamster_armourwag_gen",
        "pg_teamster_armourwag_perishables",
        "pg_teamster_armourwag_tnt",
    },

    ["stagecoach005x"] = {
        "pg_veh_stagecoach005x_1",
        "pg_veh_stagecoach005x_2",
    },

    ["stagecoach006x"] = {
        "pg_veh_stagecoach006x_1",
        "pg_veh_stagecoach006x_2",
    },

    ["trolley01x"] = {
        "pg_veh_trolley01x_1",
    },

    ["TugBoat2"] = {
        "pg_veh_tugboat2_1",
    },

    ["wagon02x"] = {
        "pg_gunforhire01x",
        "pg_vehload_cotton01",
        "pg_gunforhire02x",
        "pg_gunforhire03x",
        "Pg_Mis_Mud1_Wagon02x",
        "Pg_Mis_Mud1_Wagon02x_NoLooseProps",
        "pg_mission_ammoDeal",
        "pg_mission_caravanWagon02x",
        "pg_mission_marston7_lumber01x",
        "pg_mission_marston7_lumber02x",
        "pg_mission_marston7_lumber03x_doneloading",
        "pg_mission_mud1_wagon03x",
        "pg_mission_tntwagon01x",
        "pg_mission_trainrob3_start01x",
        "pg_mission_weaponsDeal",
        "pg_mission_winter1_4thwagon01x",
        "pg_rc_BeauAndPene101x",
        "pg_rc_beauandpene201x",
        "pg_rc_forgiven601x",
        "pg_rc_nativewagoncornwall01x",
        "pg_rc_saddiesupplies00x",
        "pg_rc_saddiesupplies01x",
        "pg_re_armsdeal01x",
        "pg_re_odriscollwagon01x",
        "pg_re_supplydelivery_gsmith01x",
        "pg_re_supplyDelivery01x",
        "pg_re_trainholdup01x",
        "pg_sp_MarstonsWagon02x",
        "pg_teamster_wagon02x_breakables",
        "pg_teamster_wagon02x_gen",
        "pg_teamster_wagon02x_gen02",
        "pg_teamster_wagon02x_perishables",
        "pg_teamster_wagon02x_tnt",
        "pg_wagon02xClimbtest01x",
        "pg_mission_trainRob4_Wagon02x_dynamite",
        "pg_veh_wagon02x_1",
        "pg_veh_wagon02x_2",
        "pg_veh_wagon02x_3",
        "pg_vl_blacksmith01",
        "pg_vl_butcher01",
        "pg_vl_craftsman01",
        "pg_vl_delivery01",
        "pg_vl_farmer01",
        "pg_vl_farmer02",
        "pg_vl_ferrier01",
        "pg_vl_fisherman01",
        "pg_vl_hunter01",
        "pg_vl_movingFamily01",
        "pg_vl_rancher01",
        "pg_vl_rancher02",
        "pg_vl_rancher03",
        "pg_vl_rancher04",
        "pg_vl_rancher05",
        "pg_vl_tradesman01",
        "pg_vl_tradesman02",
        "pg_vl_tradesman03",
        "pg_vl_tradesman04",
        "pg_vl_travellingFamily01",
        "pg_vl_travellingLabour01",
    },

    ["wagon04x"] = {
        "pg_gunforhire01x",
        "pg_gunforhire02x",
        "pg_gunforhire03x",
        "pg_mission_caravanWagon04x",
        "pg_mission_mud1_jackwagon01x",
        "pg_mission_mud1_wagon01x",
        "pg_mission_mud1_wagon02x",
        "pg_mission_winter1_keiranWag01x",
        "pg_mission_winter1_wag04_01x",
        "pg_teamster_wagon04x_breakables",
        "pg_teamster_wagon04x_gen",
        "pg_teamster_wagon04x_gen02",
        "pg_teamster_wagon04x_perishables",
        "pg_teamster_wagon04x_tnt",
        "pg_veh_wagon04x_1",
        "pg_veh_wagon04x_2",
        "pg_veh_wagon04x_3",
        "pg_vl_blacksmith01",
        "pg_vl_butcher01",
        "pg_vl_craftsman01",
        "pg_vl_delivery01",
        "pg_vl_farmer01",
        "pg_vl_farmer02",
        "pg_vl_ferrier01",
        "pg_vl_fisherman01",
        "pg_vl_hunter01",
        "pg_vl_movingFamily01",
        "pg_vl_rancher01",
        "pg_vl_rancher02",
        "pg_vl_rancher03",
        "pg_vl_rancher04",
        "pg_vl_rancher05",
        "pg_vl_tradesman01",
        "pg_vl_tradesman02",
        "pg_vl_tradesman03",
        "pg_vl_tradesman04",
        "pg_vl_travellingFamily01",
        "pg_vl_travellingLabour01",
        "pg_veh_germFam_wagon04x_01",     
    },

    ["wagon05x"] = {
        "pg_delivery_CKToil01x",
        "pg_delivery_Orange01x",
        "pg_gunforhire01x",
        "pg_gunforhire02x",
        "pg_gunforhire03x",
        "pg_ls_soldier2_01x",
        "pg_mission_bra1_wagon",
        "pg_mission_brt1_jump01x",
        "pg_mission_brt1_tomansion01x",
        "pg_mission_brt2",
        "pg_mission_BRT2_escape01x",
        "pg_mission_brt3",
        "pg_mission_caravanWagon05x",
        "pg_mission_moonshineSupplies",
        "pg_rc_ridethelightning01x",
        "pg_re_checkpoint01x",
        "pg_re_savagewagon01x",
        "pg_teamster_wagon05x_breakables",
        "pg_teamster_wagon05x_gen",
        "pg_teamster_wagon05x_perishables",
        "pg_teamster_wagon05x_tnt",
        "pg_veh_wagon05x_1",
        "pg_veh_wagon05x_2",
        "pg_veh_wagon05x_3",
        "pg_veh_wagon05x_4",
        "pg_veh_wagon05x_5",
        "pg_veh_wagon05x_cotton",
    },

    ["wagon06x"] = {
        "pg_teamster_wagon06x_breakables",
        "pg_teamster_wagon06x_gen",
        "pg_teamster_wagon06x_perishables",
        "pg_teamster_wagon06x_tnt",
        "pg_veh_wagon06x_1",
        "pg_veh_wagon06x_2",
        "pg_veh_wagon06x_3",
    },

    ["wagondairy01x"] = {
        "pg_delivery_dairy01x",    
    },

    ["utilliwag"] = {
        "pg_cs_marston101x",
        "pg_mission_marston1_supplies01x",
        "pg_mission_marston1_supplies02x",
        "pg_mission_marston2_postoffice01x",
        "pg_mission_native2_01x",
        "pg_rc_dinoLady01x",
        "pg_teamster_utilitywag_breakables",
        "pg_teamster_utilitywag_gen",
        "pg_teamster_utilitywag_perishables",
        "pg_teamster_utilitywag_tnt",
        "pg_veh_utilliwag_1",
        "pg_veh_utilliwag_2",
        "pg_veh_utilliwag_3",
        "pg_veh_utilliwag_orange_1",   
    },

    ["gatchuck"] = {
        "pg_mission_native2_01x",
        "pg_teamster_payroll01x_gat",         
    },

    ["wagon05x_2"] = {
        "pg_teamster_wagon05x_gen",
    },

    ["huntercart01"] = {
        "pg_mp005_huntingWagonTarp01",
    },

    ["TugBoat3"] = {
        "pg_moonshiner3_tugboat2_1",
    },
}
