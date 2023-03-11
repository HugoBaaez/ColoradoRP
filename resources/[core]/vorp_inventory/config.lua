----------------------------------------------------------------------------------------------------
--------------------------------------- CONFIG -----------------------------------------------------
-- VORP INVENTORY LUA*

Config = {
  --======================= DEVELOPMENT ==============================--
  Debug = false, -- if your server is live set this to false.  to true only if you are testing things
  DevMode = false, -- if your server is live set this to false.  to true only if you are testing things (auto load inventory when script restart and before character selection. Alos add /getInv command)
  dbupdater = true,

  --======================= CONFIGURATION =============================--
  defaultlang = "pt_lang",
  ShowCharacterNameOnGive = false, -- when giving an item, show the character name of nearby players instead of their player ID. if set to false, show the player ID
  DoubleClickToUse = true, -- if toggled to false, items in inventory will right click then left click "use"
  NewPlayers = false, --- if you dont want new players to give money or items then set to true. this can avoid cheaters giving stuff on first join


  -- GOLD ITEM LIKE DOLLARS
  UseGoldItem = true,
  AddGoldItem = true, -- Should there be an item in inventory to represent gold
  AddDollarItem = true, -- Should there be an item in inventory to represent dollars
  AddAmmoItem = true, -- Should there be an item in inventory to represent the gun belt

  InventorySearchable = true, -- Should the search bar appear in inventories
  InventorySearchAutoFocus = true, -- Search autoofocuses when you type
  -- DEATH FUNCTIONS
  DisableDeathInventory = true, -- prevent the ability to access inventory while dead

  --{ I } OPEN INVENTORY
  OpenKey = 0xC1989F95,

  --RMB mouse PROMPT PICKUP
  PickupKey = 0xF84FA74F,

  -- NORMAL LOGS
  webhookavatar = "https://cdn3.iconfinder.com/data/icons/hand/500/Hand_give_thumbs_finger-512.png",
  webhook = "https://discord.com/api/webhooks/988546572130320394/qt00EXOT_8d1gLH3hFQZqdUrSbexqKjoQ0-7p4JLABPWEl0xW9nEg8TutNtzOqAWlGAZ",
  
  discordid = true, -- turn to true if ur using discord whitelist
  -- WEBHOOK LANGUAGE
  Language = {
    gaveitem = "Transferir item",
    gave = " Transferido ",
    to = " para ",
    withid = " com id de arma: ",
  },

  -- =================== CUSTOM INVENTORY LOGS =====================--
  WebHook = {
    color = 4777493,
    title = "INV logs",
    avatar = "https://cdn3.iconfinder.com/data/icons/hand/500/Hand_give_thumbs_finger-512.png",
    logo = "https://media.discordapp.net/attachments/978860849957593129/1012423777419804884/colorado_logo.png?width=468&height=468",
    footerlogo = "https://media.discordapp.net/attachments/978860849957593129/1012423777419804884/colorado_logo.png?width=468&height=468",
    webhookname = "Inventario Custom",
    CustomInventoryTakeFrom = "https://discord.com/api/webhooks/1070372397062049903/h94D20yDUqyJzhKF19u8O99EG7zy0kW4Y3gpjlJ5UwWXSxiFtcC7j05rCqg_ZSZcr69A",
    CustomInventoryMoveTo = "https://discord.com/api/webhooks/1070372484890759258/KpO9ZHi1Qb_gLqC9hM2ua2o4P39bzfAIq9CroHY8cHZ_Ig3N4wQbgqEpyV7YEwP5o2dx"
  },

  NetDupWebHook = { -- somone tries to use dev tools to cheat
    Active = true,
    Language = {
      title = "Possivel Dup de Item Usando DevTools",
      descriptionstart = "NUI Callback inválido realizado por...\n **Playername** `",
      descriptionend = "`\n"
    }
  },


  -- NEED TO TEST
  DropOnRespawn = {
    AllMoney       = false,
    PartMoney      = false,
    PartPercentage = 25,
    Gold           = false, -- TRUE ONLY IF UseGoldItem = true
    Weapons        = false,
    Items          = false
  },

  -- HOW MANY WEAPONS AND ITEMS ALLOWED PER PLAYER
  MaxItemsInInventory = {
    Weapons = 10,
    Items = 100,
  },


  -- FIRST JOIN
  startItems = {
    agua_consumivel = 5, --ITEMS SAME NAME AS IN DATABASE
    pao = 5 --AMMO SAME NAME AS I NTHE DATABASE
  },

  startWeapons = {
    WEAPON_MELEE_KNIFE = {} --WEAPON HASH NAME
  },

  -- items that dont get added up torwards your max weapon count
  notweapons = {
    "WEAPON_KIT_BINOCULARS_IMPROVED",
    "WEAPON_KIT_BINOCULARS",
    "WEAPON_FISHINGROD",
    "WEAPON_KIT_CAMERA",
    "WEAPON_kIT_CAMERA_ADVANCED",
    "WEAPON_MELEE_LANTERN",
    "WEAPON_MELEE_DAVY_LANTERN",
    "WEAPON_MELEE_LANTERN_HALLOWEEN",
    "WEAPON_KIT_METAL_DETECTOR",
    "WEAPON_MELEE_HAMMER",
    "WEAPON_MELEE_KNIFE",
  },

  Ammotypes = {
    ["416676503"] = { "AMMO_PISTOL", "AMMO_PISTOL_EXPRESS", "AMMO_PISTOL_EXPRESS_EXPLOSIVE", "AMMO_PISTOL_HIGH_VELOCITY",
      "AMMO_PISTOL_SPLIT_POINT" },
    ["-594562071"] = { "AMMO_REPEATER", "AMMO_REPEATER_EXPRESS", "AMMO_REPEATER_EXPRESS_EXPLOSIVE",
      "AMMO_REPEATER_HIGH_VELOCITY", "AMMO_REPEATER_SPLIT_POINT" },
    ["-1101297303"] = { "AMMO_REVOLVER", "AMMO_REVOLVER_EXPRESS", "AMMO_REVOLVER_EXPRESS_EXPLOSIVE",
      "AMMO_REVOLVER_HIGH_VELOCITY", "AMMO_REVOLVER_SPLIT_POINT", "AMMO_SHOTGUN", "AMMO_SHOTGUN_BUCKSHOT_INCENDIARY",
      "AMMO_SHOTGUN_EXPRESS_EXPLOSIVE", "AMMO_SHOTGUN_SLUG" },
    ["970310034"] = { "AMMO_RIFLE", "AMMO_RIFLE_ELEPHANT", "AMMO_RIFLE_EXPRESS", "AMMO_RIFLE_EXPRESS_EXPLOSIVE",
      "AMMO_RIFLE_HIGH_VELOCITY", "AMMO_RIFLE_SPLIT_POINT", "AMMO_22", "AMMO_22_TRANQUILIZER" },
    ["-1212426201"] = { "AMMO_RIFLE", "AMMO_RIFLE_EXPRESS", "AMMO_RIFLE_EXPRESS_EXPLOSIVE", "AMMO_RIFLE_HIGH_VELOCITY",
      "AMMO_RIFLE_SPLIT_POINT" },
    ["860033945"] = { "AMMO_SHOTGUN", "AMMO_SHOTGUN_BUCKSHOT_INCENDIARY", "AMMO_SHOTGUN_EXPRESS_EXPLOSIVE",
      "AMMO_SHOTGUN_SLUG" },
    ["-1241684019"] = { "AMMO_ARROW", "AMMO_ARROW_DYNAMITE", "AMMO_ARROW_FIRE", "AMMO_ARROW_IMPROVED",
      "AMMO_ARROW_SMALL_GAME", "AMMO_ARROW_POISON" },
    ["1548507267"] = { "AMMO_THROWING_KNIVES", "AMMO_TOMAHAWK", "AMMO_POISONBOTTLE", "AMMO_BOLAS", "AMMO_BOLAS_HAWKMOTH",
      "AMMO_BOLAS_INTERTWINED", "AMMO_BOLAS_IRONSPIKED", "AMMO_DYNAMITE", "AMMO_DYNAMITE_VOLATILE", "AMMO_MOLOTOV",
      "AMMO_MOLOTOV_VOLATILE" }
  },

  maxammo = { -- max ammo allowed to transfer between players
    AMMO_PISTOL = 100,
    AMMO_PISTOL_EXPRESS = 100,
    AMMO_PISTOL_EXPRESS_EXPLOSIVE = 100,
    AMMO_PISTOL_HIGH_VELOCITY = 100,
    AMMO_PISTOL_SPLIT_POINT = 100,
    AMMO_REPEATER = 100,
    AMMO_REPEATER_EXPRESS = 100,
    AMMO_REPEATER_EXPRESS_EXPLOSIVE = 100,
    AMMO_REPEATER_HIGH_VELOCITY = 100,
    AMMO_REPEATER_SPLIT_POINT = 100,
    AMMO_REVOLVER = 100,
    AMMO_REVOLVER_EXPRESS = 100,
    AMMO_REVOLVER_EXPRESS_EXPLOSIVE = 100,
    AMMO_REVOLVER_HIGH_VELOCITY = 100,
    AMMO_REVOLVER_SPLIT_POINT = 100,
    AMMO_RIFLE = 100,
    AMMO_RIFLE_ELEPHANT = 100,
    AMMO_RIFLE_EXPRESS = 100,
    AMMO_RIFLE_EXPRESS_EXPLOSIVE = 100,
    AMMO_RIFLE_HIGH_VELOCITY = 100,
    AMMO_RIFLE_SPLIT_POINT = 100,
    AMMO_22 = 100,
    AMMO_22_TRANQUILIZER = 100,
    AMMO_SHOTGUN = 100,
    AMMO_SHOTGUN_BUCKSHOT_INCENDIARY = 100,
    AMMO_SHOTGUN_EXPRESS_EXPLOSIVE = 100,
    AMMO_SHOTGUN_SLUG = 100,
    AMMO_ARROW = 10,
    AMMO_ARROW_DYNAMITE = 10,
    AMMO_ARROW_FIRE = 10,
    AMMO_ARROW_IMPROVED = 10,
    AMMO_ARROW_SMALL_GAME = 10,
    AMMO_ARROW_POISON = 10,
    AMMO_THROWING_KNIVES = 10,
    AMMO_TOMAHAWK = 10,
    AMMO_POISONBOTTLE = 10,
    AMMO_BOLAS = 10,
    AMMO_BOLAS_HAWKMOTH = 10,
    AMMO_BOLAS_INTERTWINED = 10,
    AMMO_BOLAS_IRONSPIKED = 10,
    AMMO_DYNAMITE = 5,
    AMMO_DYNAMITE_VOLATILE = 5,
    AMMO_MOLOTOV = 5,
    AMMO_MOLOTOV_VOLATILE = 5
  },
  Ammolabels = { -- you can change this to your language
  AMMO_PISTOL = "Munição Normal de Pistola",
  AMMO_PISTOL_EXPRESS = "Munição Express de Pistola",
  AMMO_PISTOL_EXPRESS_EXPLOSIVE = "Munição Explosiva de Pistola",
  AMMO_PISTOL_HIGH_VELOCITY = "Munição de Alta Velocida de Pistola",
  AMMO_PISTOL_SPLIT_POINT = "Munição Splitpoint de Pistola",
  AMMO_REPEATER = "Munição Normal de Repetidor",
  AMMO_REPEATER_EXPRESS = "Munição Express de Repetidor",
  AMMO_REPEATER_EXPRESS_EXPLOSIVE = "Munição Explosiva de Repetidor",
  AMMO_REPEATER_HIGH_VELOCITY = "Munição de Alta Velocidade de Repetidor",
  AMMO_REPEATER_SPLIT_POINT = "Munição Splitpoint de Repetidor",
  AMMO_REVOLVER = "Munição Normal de Revolver",
  AMMO_REVOLVER_EXPRESS = "Munição Express de Revolver",
  AMMO_REVOLVER_EXPRESS_EXPLOSIVE = "Munição Explosiva de Revolver",
  AMMO_REVOLVER_HIGH_VELOCITY = "Munição de Alta Velocidade de Revolver",
  AMMO_REVOLVER_SPLIT_POINT = "Munição Splitpoint de Revolver",
  AMMO_RIFLE = "Munição Normal de Rifle",
  AMMO_RIFLE_ELEPHANT = "Munição de Elefante de Rifle",
  AMMO_RIFLE_EXPRESS = "Munição Express de Rifle",
  AMMO_RIFLE_EXPRESS_EXPLOSIVE = "Munição Explosiva de Rifle",
  AMMO_RIFLE_HIGH_VELOCITY = "Munição de Alta Velocidade de Rifle",
  AMMO_RIFLE_SPLIT_POINT = "Munição Splitpoint de Rifle",
  AMMO_22 = "Munição de Rifle 22",
  AMMO_22_TRANQUILIZER = "Munição de Rifle 22 Tranquilizante",
  AMMO_SHOTGUN = "Normal Shotgun",
  AMMO_SHOTGUN_BUCKSHOT_INCENDIARY = "Incendiary Shotgun",
  AMMO_SHOTGUN_EXPRESS_EXPLOSIVE = "Explosive Shotgun",
  AMMO_SHOTGUN_SLUG = "Slug Shotgun",
  AMMO_ARROW = "Flechas Normais",
  AMMO_ARROW_DYNAMITE = "Flechas de Dinamite",
  AMMO_ARROW_FIRE = "Flechas de Fogo",
  AMMO_ARROW_IMPROVED = "Flechas Melhoradas",
  AMMO_ARROW_SMALL_GAME = "Small Game Arrows",
  AMMO_ARROW_POISON = "Flechas Envenenadas",
  AMMO_THROWING_KNIVES = "Throwing Knives",
  AMMO_TOMAHAWK = "Tomahawk",
  AMMO_POISONBOTTLE = "Poison Bottle",
  AMMO_BOLAS = "Bolas",
  AMMO_BOLAS_HAWKMOTH = "Hawkmoth Bolas",
  AMMO_BOLAS_INTERTWINED = "Intertwined Bolas",
  AMMO_BOLAS_IRONSPIKED = "Ironspiked Bolas",
  AMMO_DYNAMITE = "Dynamite",
  AMMO_DYNAMITE_VOLATILE = 'Volatile Dynamite',
  AMMO_MOLOTOV = "Molotov",
  AMMO_MOLOTOV_VOLATILE = "Volatile Molotov"
  },
  --DON'T TOUCH BESIDES NAME OF WEAPON
  Weapons = {
    {
      Name     = "laço", -- TRANSLATE NAME ONLY
      Desc     = "Uma corda irritantemente útil", -- CHANGE DESCRIPTION ONLY
      HashName = "WEAPON_LASSO", -- DONT TOUCH
    },
    {
      Name     = "Laço Reforçado",
      Desc     = "Uma corda super irritantemente útil",
      HashName = "WEAPON_LASSO_REINFORCED",
    },
    {
      Name = "Faca",
      Desc = "Faca usada principalmente para esfolar animais",
      HashName = "WEAPON_MELEE_KNIFE",
    },
    {
      Name = "Knife Rustic",
      Desc = "old looking knife, could it be still useful ?",
      HashName = "WEAPON_MELEE_KNIFE_RUSTIC",
    },
    {
      Name = "Knife Horror",
      Desc = "This knife was used to do plenty of unpleasant things",
      HashName = "WEAPON_MELEE_KNIFE_HORROR",
    },
    {
      Name = "Knife Civil War",
      Desc = "A knife with a lot of history",
      HashName = "WEAPON_MELEE_KNIFE_CIVIL_WAR",
    },
    {
      Name = "Knife Jawbone",
      Desc = "A knife made of ancient bones",
      HashName = "WEAPON_MELEE_KNIFE_JAWBONE",
    },
    {
      Name = "Knife Miner",
      Desc = "Miners bestfriend",
      HashName = "WEAPON_MELEE_KNIFE_MINER",
    },
    {
      Name = "Knife Vampire",
      Desc = "They cant be real...",
      HashName = "WEAPON_MELEE_KNIFE_VAMPIRE",
    },
    {
      Name = "Cleaver",
      Desc = "Scary looking but useful",
      HashName = "WEAPON_MELEE_CLEAVER",
    },
    {
      Name = "Hachet",
      Desc = "A piece of wood with a blade",
      HashName = "WEAPON_MELEE_HATCHET",
    },
    {
      Name = "Hachet Double Bit",
      Desc = "A Piece of wood with twice the blade",
      HashName = "WEAPON_MELEE_HATCHET_DOUBLE_BIT",
    },
    {
      Name = "Hachet Hewing",
      Desc = "Some say this hatchet is magical",
      HashName = "WEAPON_MELEE_HATCHET_HEWING",
    },
    {
      Name = "Hachet Hunter",
      Desc = "A Hunters bestfriend",
      HashName = "WEAPON_MELEE_HATCHET_HUNTER",
    },
    {
      Name = "Hachet Viking",
      Desc = "Smells of fish and salt",
      HashName = "WEAPON_MELEE_HATCHET_VIKING",
    },
    {
      Name = "Tomahawk",
      Desc = "Uma arma digna de um guerreiro",
      HashName = "WEAPON_THROWN_TOMAHAWK",
    },
    {
      Name = "Tomahawk Ancient",
      Desc = "This one is Ancient",
      HashName = "WEAPON_THROWN_TOMAHAWK_ANCIENT",
    },
    {
      Name = "Throwing Knifes",
      Desc = "Folks love playing with these",
      HashName = "WEAPON_THROWN_THROWING_KNIVES",
  
    },
    {
      Name = "Machete",
      Desc = "Útil na selva",
      HashName = "WEAPON_MELEE_MACHETE",
    },
    {
      Name = "Arco",
      Desc = "Uma arma simples, mas eficaz",
      HashName = "WEAPON_BOW",
    },
    {
      Name = "Pistola Semi-Automática",
      Desc = "pistola de câmara única de repetição",
      HashName = 'WEAPON_PISTOL_SEMIAUTO',
    },
    {
      Name = "Pistola Mauser",
      Desc = "pistola semiautomática que foi originalmente produzida pelo fabricante de armas alemão Mauser",
      HashName = "WEAPON_PISTOL_MAUSER",
    },
    {
      Name = "Pistola Volcanic",
      Desc = " uma versão melhorada da munição Rocket Ball",
      HashName = "WEAPON_PISTOL_VOLCANIC",
    },
    {
      Name = "Pistola M1899",
      Desc = "sua munição com carregador permite uma recarga rápida",
      HashName = "WEAPON_PISTOL_M1899",
    },
    {
      Name = "Revolver Schofield",
      Desc = "revólver de ação simples, disparo de cartucho, top-break",
      HashName = "WEAPON_REVOLVER_SCHOFIELD",
    },
    {
      Name = "Revolver Navy",
      Desc = "revólver que foi projetado por Samuel Colt",
      HashName = "WEAPON_REVOLVER_NAVY",
    },
    {
      Name = "Revolver Navy Crossover",
      Desc = "DESC IN config.lua",
      HashName = "WEAPON_REVOLVER_NAVY_CROSSOVER",
    },
    {
      Name = "Revolver Lemat",
      Desc = "um revólver que também é uma espingarda",
      HashName = "WEAPON_REVOLVER_LEMAT",
    },
    {
      Name = "Revolver de Ação Dupla",
      Desc = "tem um gatilho que tanto engatilha o martelo quanto o solta em um puxão ",
      HashName = "WEAPON_REVOLVER_DOUBLEACTION",
    },
    {
      Name = "Revolver Cattleman",
      Desc = "O melhor amigo de vaqueiros",
      HashName = "WEAPON_REVOLVER_CATTLEMAN",
    },
    {
      Name = "Revolver Cattleman mexican",
      Desc = "a different flavor",
      HashName = "WEAPON_REVOLVER_CATTLEMAN_MEXICAN",
    },
    {
      Name = "Varmint Rifle",
      Desc = "A rifle useful for hunting critters",
      HashName = "WEAPON_RIFLE_VARMINT",
  
    },
    {
      Name = "Repetidor Winchester",
      Desc = "Rifles de repetição de ação de alavanca fabricados pela Winchester Repeating Arms Company",
      HashName = "WEAPON_REPEATER_WINCHESTER",
  
    },
    {
      Name = "Repetidor Henry",
      Desc = " rifle de revista tubular de ação de alavanca",
      HashName = "WEAPON_REPEATER_HENRY",
  
    },
    {
      Name = "Repetidor Evans",
      Desc = "um rifle de repetição de ação de alavanca projetado por Warren R. Evans como um rifle de alta capacidade",
      HashName = "WEAPON_REPEATER_EVANS",
  
    },
    {
      Name = "Carabina de Reapetição",
      Desc = "Um rifle de repetição confiável e popular, o Buck Carbine fornece dano médio e uma taxa de disparo decente",
      HashName = "WEAPON_REPEATER_CARBINE",
    },
    {
      Name = "Rolling Block Rifle",
      Desc = "Remington Rolling Block is a family of breech-loading rifles",
      HashName = "WEAPON_SNIPERRIFLE_ROLLINGBLOCK",
    },
    {
      Name = "Carcano Rifle",
      Desc = "The Carcano is an Italian, bolt action rifle",
      HashName = "WEAPON_SNIPERRIFLE_CARCANO",
    },
    {
      Name = "Rifle Springfield ",
      Desc = "Rifle de emissão padrão do exército",
      HashName = "WEAPON_RIFLE_SPRINGFIELD",
    },
    {
      Name = "Elephant Rifle",
      Desc = "Best Weapon for a hunter looking to take down large prey",
      HashName = "WEAPON_RIFLE_ELEPHANT",
    },
    {
      Name = "Rifle de Ferrolho",
      Desc = " arma de fogo manual que é operada pela manipulação direta do ferrolho",
      HashName = "WEAPON_RIFLE_BOLTACTION",
    },
    {
      Name = "Semi-Auto Shotgun",
      Desc = "a repeating shotgun with a semi-automatic action, capable of automatically chambering a new shell",
      HashName = "WEAPON_SHOTGUN_SEMIAUTO",
    },
    {
      Name = "Sawedoff Shotgun",
      Desc = "shotgun with a shorter gun barre",
      HashName = "WEAPON_SHOTGUN_SAWEDOFF",
    },
    {
      Name = "Repeating Shotgun",
      Desc = "The Lancaster Repeating Shotgun",
      HashName = "WEAPON_SHOTGUN_REPEATING",
    },
    {
      Name = "Double Barrel Exotic Shotgun",
      Desc = "exotic-rarity variant of the Double Barrel Shotgun",
      HashName = "WEAPON_SHOTGUN_DOUBLEBARREL_EXOTIC",
    },
    {
      Name = "Pump Shotgun",
      Desc = "repeating firearm action that is operated manually by moving a sliding handguard",
      HashName = "WEAPON_SHOTGUN_PUMP",
  
    },
    {
      Name = "Double Barrel Shotgun",
      Desc = "break-action shotgun with two parallel barrels, allowing two single shots to be fired in quick succession",
      HashName = "WEAPON_SHOTGUN_DOUBLEBARREL",
    },
    {
      Name = "Camera",
      Desc = "o melhor amigo dos jornalistas",
      HashName = "WEAPON_KIT_CAMERA",
    },
    {
      Name = "Improved Binoculars",
      Desc = "See things clearly !",
      HashName = "WEAPON_KIT_BINOCULARS_IMPROVED",
    },
    {
      Name = "Knife Trader",
      Desc = "a traders bestfriend",
      HashName = "WEAPON_MELEE_KNIFE_TRADER",
    },
    {
      Name = "Binóculos",
      Desc = "permite que você veja coisas distantes",
      HashName = "WEAPON_KIT_BINOCULARS",
    },
    {
      Name = "Advanced Camera",
      Desc = "a camera thats slightly technologicaly better",
      HashName = "WEAPON_KIT_CAMERA_ADVANCED",
    },
    {
      Name = "Lantern",
      Desc = "lets you see better in the dark",
      HashName = "WEAPON_MELEE_LANTERN",
    },
    {
      Name = "Davy Lantern",
      Desc = "safety lamp for use in flammable atmospheres",
      HashName = "WEAPON_MELEE_DAVY_LANTERN",
    },
    {
      Name = "Halloween Lantern",
      Desc = "made with a real human skull",
      HashName = "WEAPON_MELEE_LANTERN_HALLOWEEN",
    },
    {
      Name = "Poison Bottle",
      Desc = "who knows whats in this thing",
      HashName = "WEAPON_THROWN_POISONBOTTLE",
    },
    {
      Name = "Detector de Metal",
      Desc = "Ajuda a encontrar coisas valiosas",
      HashName = "WEAPON_KIT_METAL_DETECTOR",
    },
    {
      Name = "Dynamite",
      Desc = "boomstick",
      HashName = "WEAPON_THROWN_DYNAMITE",
  
    },
    {
      Name = "Molotov",
      Desc = "o melhor amigo de um incendiário",
      HashName = "WEAPON_THROWN_MOLOTOV",
  
    },
    {
      Name = "Improved Bow",
      Desc = "a bow with better accuracy",
      HashName = "WEAPON_BOW_IMPROVED",
    },
    {
      Name = "Machete Collector",
      Desc = "every collector needs one",
      HashName = "WEAPON_MELEE_MACHETE_COLLECTOR",
    },
    {
      Name = "Electric Lantern",
      Desc = "a marvel of technology",
      HashName = "WEAPON_MELEE_LANTERN_ELECTRIC",
    },
    {
      Name = "Tocha",
      Desc = "seu bastão básico em chamas",
      HashName = "WEAPON_MELEE_TORCH",
    },
    {
      Name = "Moonshine Jug",
      Desc = "those are very fun",
      HashName = "WEAPON_MOONSHINEJUG_MP",
  
    },
    {
      Name = "Bolas",
      Desc = "every badass cowboy needs one",
      HashName = "WEAPON_THROWN_BOLAS",
    },
    {
      Name = "Bolas Hawkmoth",
      Desc = "a bola with a twist",
      HashName = "WEAPON_THROWN_BOLAS_HAWKMOTH",
    },
    {
      Name = "Bolas Ironspiked",
      Desc = "a more edgy bola",
      HashName = "WEAPON_THROWN_BOLAS_IRONSPIKED",
  
    },
    {
      Name = "Bolas Intertwined",
      Desc = "a stronger bola",
      HashName = "WEAPON_THROWN_BOLAS_INTERTWINED",
  
    },
    {
      Name = "Vara de Pescar",
      Desc = "o que é melhor do que pegar peixe",
      HashName = "WEAPON_FISHINGROD",
    },
    {
      Name = "Machete Horror",
      Desc = "this one scares people",
      HashName = "WEAPON_MACHETE_HORROR",
    },
    {
      Name = "Lantern Haloween",
      Desc = "made with a real human skull",
      HashName = "WEAPON_MELEE_LANTERN_HALOWEEN",
  
    },
    {
      Name = "Martelo",
      Desc = "Martelo Richards!",
      HashName = "WEAPON_MELEE_HAMMER",
  
    }
  }
}
