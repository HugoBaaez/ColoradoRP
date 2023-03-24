------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------- VORP HUNTING SCRIPT ------------------------------------------------------------------------

Config = {}

Config.DevMode = false -- DIABLE THIS IF YOUR SERVER IS LIVE

Config.Linux = false -- If they use a Linux server, then true

Config.butcherfunction = true -- set to true if you want to use butcher functions
----------------------------- TRANSLATE HERE -------------------------------------
Config.Language = {
    NotHoldingAnimal = "Você não tem nada para vender",
    NotInTheButcher = "Eu não vou comprar esse animal",
    AnimalSold = "Obrigado pelo negócio! você conseguiu ",
    SkinnableAnimalstowed = "Você obteve ",
    stow = "Colocar",
    press = "Pressione",
    sell = "Vender",
    notabutcher = "You Dont Have The Right Job",
    dollar = " $",
    join = ", ",
    FullInventory = "O inventário está muito cheio"
}

------------------- PROMPT -----------------
Config.keys = {
    G = 0x760A9C6F, -- butcher sell and Stow
}

Config.aiButcherped = false -- spawn ai butched ped set to false if you dont want an ai butcher ped to spawn

Config.joblocked = false -- lock the butcher so only people with the job can access. u can change access to each butcher by editing this  butcherjob = "butcher"

Config.maxpelts = 3 -- max pelts allowed on back of horse

------------------- Item Quantity Instructions -----------------
-- The range for when a skinnableAnimal or Animal has a config value givenAmount of 0.
-- Example: Animals with givenAmount = {0} can be sold to the butcher or be skinned, which will give the player a random number between 1 and 3 amount of givenItem
Config.ItemQuantity = {
    Max = 3,
    Min = 1
}


Config.Butchers = {
    --[[{ butchername = "Valentine Butcher",   butcherjob = "butcher", blip = 1369919445, npcmodel = "S_M_M_UNIBUTCHERS_01", coords = vector3(-339.0141, 767.6358, 115.5645),   heading = 100.41544342041,  radius = 3.0, showblip = true, butcherped = true },
    { butchername = "Strawberry Butcher",  butcherjob = "butcher", blip = 1369919445, npcmodel = "S_M_M_UNIBUTCHERS_01", coords = vector3(-1753.143, -392.4201, 155.2578),  heading = 181.37438964844,  radius = 3.0, showblip = true, butcherped = true },
    { butchername = "Blackwater Butcher",  butcherjob = "butcher", blip = 1369919445, npcmodel = "S_M_M_UNIBUTCHERS_01", coords = vector3(-754.0, -1285.158, 43.03),        heading = 273.579,          radius = 3.0, showblip = true, butcherped = true },
    { butchername = "Annesburg Butcher",   butcherjob = "butcher", blip = 1369919445, npcmodel = "S_M_M_UNIBUTCHERS_01", coords = vector3(2934.51, 1301.159, 43.48365),     heading = 70.572128295898,  radius = 3.0, showblip = true, butcherped = true },
    { butchername = "Van Horn Butcher",    butcherjob = "butcher", blip = 1369919445, npcmodel = "S_M_M_UNIBUTCHERS_01", coords = vector3(2991.844, 572.0218, 43.36182),    heading = 259.52850341797,  radius = 3.0, showblip = true, butcherped = true },
    { butchername = "Rhodes Butcher",      butcherjob = "butcher", blip = 1369919445, npcmodel = "S_M_M_UNIBUTCHERS_01", coords = vector3(1297.578, -1277.589, 74.88102),   heading = 146.60472106934,  radius = 3.0, showblip = true, butcherped = true },
    { butchername = "Armadillo Butcher",   butcherjob = "butcher", blip = 1369919445, npcmodel = "S_M_M_UNIBUTCHERS_01", coords = vector3(-3691.438, -2623.152, -14.75121), heading = 0.46632757782936, radius = 3.0, showblip = true, butcherped = true },
    { butchername = "Tumbleweed Butcher",  butcherjob = "butcher", blip = 1369919445, npcmodel = "S_M_M_UNIBUTCHERS_01", coords = vector3(-5510.371, -2947.005, -1.894515), heading = 251.54911804199,  radius = 3.0, showblip = true, butcherped = true },
    { butchername = "Landing Butcher",     butcherjob = "butcher", blip = 1369919445, npcmodel = "CS_MP_SHAKY",          coords = vector3(-1435.61, -2330.28, 43.66),       heading = 1.15,             radius = 4.0, showblip = true, butcherped = true },
    { butchername = "Saint Denis Butcher", butcherjob = "butcher", blip = 1369919445, npcmodel = "S_M_M_UNIBUTCHERS_01", coords = vector3(2819.54, -1331.21, 45.00),        heading = 51.8221321532,    radius = 4.0, showblip = true, butcherped = true }]]
}

-----------------ANIMAL INSTRUCTIONS  -----------------
-- 1. To add more rewards on each animal, edit the givenItem table. For example change givenItem ={ "meat"}, to givenItem ={ "meat","feathers"}
-- 2. If using more than one item in givenItem, then you must add another value to givenAmount. For example change givenAmount ={0}, to givenAmount ={0,0}
-- 3. givenAmount = {0} will set an amount to random amount between ItemQuantity Max/Min
-- 4. givenAmount = {{2,5}} will set an amount to random between the first and second numbers in the supplied table, for the corresponding givenItem.
-- For example: givenItem = {"meat", "feathers", "claws", "beak"}, givenAmount = {{1,4}, {2,5}, 0, 1} will result in 1 to 4 "meat", 2 to 5 "feathers", ItemQuantity.Min to ItemQuanity.Max "claws" and 1 "beak".

----------------- !IMPORTANT! -----------------
-- TO ADD MORE ANIMALS AND FIND HASHES, HOLD ANIMALS OR PELTS AND DO /ANIMAL command
-- YOU CAN SEE WHAT ANIMAL HASH YOU Skined/plucked/stored IN THE f6/f8 logs.
-- THE ITEMS NAME MUST BE IN YOUR DATABASE FOR YOU TO RECEIVE THEM IN YOUR INVENTORY

-- Animals that are skinned/plucked/stored
Config.SkinnableAnimals = {
    --small animals skin them and sell them at the butcher no need to add them to  CONFIG.ANIMALS
    [989669666]   = { name = "Rat", givenItem = { "meat" }, givenAmount = { 1 }, givenDisplay = {"Rat"}, money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "animal_rat",action = "Picked", type ="satchel_textures" },
  
   
   
   
    
    
    
    -- big animals when you skin them it gives you items. if you have it added TO CONFIG.ANIMALS JUST COPY PASTE HERE AND REMOVE THE GIVE MONEY ETC LIKE SHOWN BELOW.
    ---------------------------------------------------- ANNIMAL SKINNER START HERE -----------------------------------------------
    [-1797625440]   = { name = "Armadillo", givenItem = {"meat" }, givenAmount = { 1 }, givenDisplay = { "Stringy meat"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "animal_armadillo",action = "Skinned", type ="satchel_textures"},
    [-1170118274]   = { name = "American Badger", givenItem = { "animalfat" , "meat" }, givenAmount = { 1,1 }, givenDisplay = { "Stringy meat"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "animal_badger",action = "Skinned" , type ="satchel_textures"},
    [1755643085]   = { name = "American Pronghorn Doe", givenItem = {"carne_cervo" , "animalfat" , "meat" }, givenAmount = {1,1,1 }, givenDisplay = { "Vension"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "animal_pronghorn",action = "Skinned", type ="satchel_textures" },
    [-1124266369]  = { name = "Bear", givenItem = { "animalfat" , "meat"}, givenAmount = { 1,1 },  givenDisplay = { "Big Game Meat"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "animal_bear",action = "Skinned", type ="satchel_textures"},
    [-1568716381] = { name = "Big Horn Ram", givenItem = { "carne_cervo" , "meat" }, givenAmount = { 1,1 },  givenDisplay = { "Mutton"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "animal_bighornram",action = "Skinned", type ="satchel_textures"},
    [2028722809]   = { name = "Boar", givenItem = { "carne_javali" , "animalfat" , "meat"  }, givenAmount = { 1,1,1 },  givenDisplay = { "Boar tusk"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "animal_boar",action = "Skinned", type ="satchel_textures"},
    [-1963605336]  = { name = "Buck", givenItem = { "carne_cervo" , "meat" , "animalfat" }, givenAmount = { 1,1,1 },  givenDisplay = { "Venison"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "animal_buck",action = "Skinned", type ="satchel_textures"},
    [1556473961]   = { name = "Bison", givenItem = { "carne_alce"  , "meat" }, givenAmount = { 1,1 },  givenDisplay = { "Beef"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "animal_buffal" ,action = "Skinned", type ="satchel_textures"},
    [367637652]   = { name = "Bison", givenItem = { "carne_alce" , "meat" }, givenAmount = { 1,1 },  givenDisplay = { "Beef"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "animal_buffal",action = "Skinned", type ="satchel_textures"},
    [1957001316]   = { name = "Bull", givenItem = { "carne_alce" , "meat" }, givenAmount = { 1,1 },  givenDisplay = { "Beef"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "animal_bull_angus",action = "Skinned" , type ="satchel_textures"},
    [1110710183]   = { name = "Deer", givenItem = { "carne_cervo" , "meat" }, givenAmount = { 1,1 },  givenDisplay = { "Vension"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "animal_deer" ,action ="Skinned",type = "satchel_textures"},
    [-1003616053]  = { name = "Duck", givenItem = { "feather" }, givenAmount = { 1 },  givenDisplay = { "Bird meat"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "animal_duck_mallard" ,action ="Skinned",type = "satchel_textures"},
    [1459778951]   = { name = "Eagle", givenItem = { "feather" }, givenAmount = { 1 },  givenDisplay = { "Bird meat"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "animal_eagle_bald",action ="Skinned",type = "satchel_textures"},
    [831859211]    = { name = "Egret", givenItem = { "feather" }, givenAmount = { 1 },  givenDisplay = { "Bird meat"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "animal_egret_little",action ="Skinned",type = "satchel_textures"},
    [-2021043433]  = { name = "Elk", givenItem = { "carne_cervo" , "meat" }, givenAmount = { 1,1 },  givenDisplay = { "Venison"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "animal_elk",action ="Skinned",type = "satchel_textures" },
    [252669332]    = { name = "American Red Fox", givenItem = {"meat" }, givenAmount = {1},  givenDisplay = { "Game Meat"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "animal_fox_red",action = "Skinned", type ="satchel_textures"},
    [-1143398950]  = { name = "Big Grey Wolf", givenItem = { "animalfat" , "meat" }, givenAmount = { 1,1 },  givenDisplay = { "Game Meat" },money = 0, gold = 0, rolPoints = 0, xp = 1,texture ="animal_wolf_gray" ,action = "Skinned", type ="satchel_textures"},
    [-885451903]   = { name = "Medium Grey Wolf", givenItem = { "animalfat" , "meat" }, givenAmount = { 1,1 },  givenDisplay = { "Game Meat" },money = 0, gold = 0, rolPoints = 0, xp = 1,texture ="animal_wolf_timber" ,action = "Skinned", type ="satchel_textures"},
    [-829273561]   = { name = "Small Grey Wolf", givenItem = { "animalfat" , "meat" }, givenAmount = { 1,1 },  givenDisplay = { "Game Meat" },money = 0, gold = 0, rolPoints = 0,xp = 1,texture ="animal_wolf_timber" ,action = "Skinned", type ="satchel_textures"},
    [1104697660]   = { name = "Vulture", givenItem = { "feather" }, givenAmount = { 1 },  givenDisplay = { "Bird meat"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture = "animal_vulture_western",action ="Skinned",type = "satchel_textures", type ="satchel_textures"},
    [-407730502]   = { name = "Snapping Turtle", givenItem = { "meat" }, givenAmount = { 1 },  givenDisplay = { "Stringy meat"},money = 0, gold = 0, rolPoints = 0,xp = 1,texture ="animal_snapping_turtle" ,action ="Skinned",type = "satchel_textures", type ="satchel_textures"},
    [-466054788]   = { name = "Wild Turkey", givenItem = { "carne_peru" , "meat" }, givenAmount = { 1,1 },  givenDisplay = { "Bird meat"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture = "animal_turkey_eastern",action ="Skinned",type = "satchel_textures"},
    [-2011226991]  = { name = "Wild Turkey", givenItem = { "carne_peru" , "meat" }, givenAmount = { 1,1 },  givenDisplay = {  "Bird meat"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture = "animal_turkey_eastern",action ="Skinned",type = "satchel_textures"},
    [-166054593]   = { name = "Wild Turkey", givenItem = { "carne_peru" , "meat" }, givenAmount = { 1,1 },  givenDisplay = {  "Bird meat"},money = 0, gold = 0, rolPoints = 0,xp = 1,texture ="animal_turkey_eastern" ,action ="Skinned",type = "satchel_textures"},
    [-22968827]   = { name = "Water Snake", givenItem = { "snakepoison"  }, givenAmount = { 1 },  givenDisplay = { "Snake tooth"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture = "animal_snakewater",action ="Skinned",type = "satchel_textures"},
    [-229688157]   = { name = "CottonMouth Water Snake", givenItem = { "snakepoison"  }, givenAmount = { 1 },  givenDisplay = { "Snake tooth"},money = 0, gold = 0, rolPoints = 0,xp = 1,texture ="animal_snakewater" ,action ="Skinned",type = "satchel_textures"},
    [-1790499186]  = { name = "Snake Red Boa", givenItem = { "snakepoison"  }, givenAmount = {  1 },  givenDisplay = { "Snake tooth"},money = 0, gold = 0, rolPoints = 0,xp = 1,texture ="animal_snakeredboa" ,action ="Skinned",type = "satchel_textures"},
    [1464167925]   = { name = "Snake Fer-De-Lance", givenItem = { "snakepoison"  }, givenAmount = {  1 },  givenDisplay = { "Snake tooth"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture = "animal_snakeferdelance",action ="Skinned",type = "satchel_textures"},
    [846659001]    = { name = "Black-Tailed Rattlesnake", givenItem = { "snakepoison"  }, givenAmount = {  1 },  givenDisplay = { "Snake tooth"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture = "animal_snakeblacktailrattle",action ="Skinned",type = "satchel_textures"},
    [545068538]    = { name = "Western Rattlesnake", givenItem = { "snakepoison"  }, givenAmount = {  1 },  givenDisplay = { "Snake tooth"},money = 0, gold = 0, rolPoints = 0,xp = 1,texture ="animal_snakeblacktailrattle" ,action ="Skinned",type = "satchel_textures"},
    [-121266332]  = { name = "Striped Skunk", givenItem = { "meat" }, givenAmount = { 1},  givenDisplay = { "Stringy meat"},money = 0, gold = 0, rolPoints = 0,xp = 1,texture ="animal_skunk" ,action ="Skinned",type = "satchel_textures"},
    [40345436]     = { name = "Merino Sheep", givenItem = { "meat" }, givenAmount = {1 },  givenDisplay = { "Mutton"},money = 0, gold = 0, rolPoints = 0,xp = 1,texture ="animal_sheep" ,action ="Skinned",type = "satchel_textures"},
    [-164963696]   = { name = "Herring Seagull", givenItem = { "feather" }, givenAmount = {1 },  givenDisplay = { "Seagull feather"},money = 0, gold = 0, rolPoints = 0,xp = 1,texture ="animal_seagull_herring" ,action ="Skinned",type = "satchel_textures"},
    [-1076508705]  = { name = "Roseate Spoonbill", givenItem = { "feather" }, givenAmount = { 1 },  givenDisplay = { "Roseta Spoonbill feather"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture ="animal_roseatespoonbill" ,action ="Skinned",type = "satchel_textures"},
    [2023522846]   = { name = "Dominique Rooster", givenItem = { "feather" }, givenAmount = { 1 },  givenDisplay = { "Rooster feather"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture ="animal_rooster_dominique" ,action ="Skinned",type = "satchel_textures"},
    [-466687768]   = { name = "Red-Footed Booby", givenItem = { "feather" }, givenAmount = { 1 },  givenDisplay = { "Red-footed booby feather"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture ="animal_red_footed_booby" ,action ="Skinned",type = "satchel_textures"},
    [-575340245]   = { name = "Wester Raven", givenItem = { "feather" }, givenAmount = { 1 },  givenDisplay = { "Raven feather"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture ="animal_raven" ,action ="Skinned",type = "satchel_textures"},
    [1458540991]   = { name = "North American Racoon", givenItem = { "meat" }, givenAmount = { 1 },  givenDisplay = { "Game Meat"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture = "animal_raccoon",action ="Skinned",type = "satchel_textures"},
    [-541762431]   = { name = "Black-Tailed Jackrabbit", givenItem = { "meat" }, givenAmount = { 1 },  givenDisplay = { "Game Meat"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture = "animal_rabbit",action ="Skinned",type = "satchel_textures"},
  --  [1755643085]   = { name = "American Pronghorn Doe", givenItem = { "meat" }, givenAmount = { 0 },  givenDisplay = { "meat","Heart", "Claw"},money = 0.75, gold = 0, rolPoints = 0,xp = 1,    texture = ,action = ,type = "satchel_textures"},
    [2079703102]   = { name = "Greater Prairie Chicken", givenItem = { "carne_peru" , "feather" }, givenAmount = { 1,1 },  givenDisplay = { "Prairi chicken feather", "Prairi chicken beak"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture ="animal_prairie_chicken" ,action ="Skinned",type = "satchel_textures"},
    [-1414989025]  = { name = "Wirginia Possum", givenItem = { "meat" }, givenAmount = { 1 },  givenDisplay = { "Stringy meat"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture ="animal_opossum" ,action ="Skinned",type = "satchel_textures"},
    [1007418994]   = { name = "Berkshire Pig", givenItem = { "carne_javali" }, givenAmount = { 1 },  givenDisplay = { "Pork"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture = "animal_pig_berkshire",action ="Skinned",type = "satchel_textures"},
    [1416324601]   = { name = "Ring-Necked Pheasant", givenItem = { "feather"  }, givenAmount = { 1 },  givenDisplay = { "Peasant feather"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture = "animal_pheasant_ringneck",action ="Skinned",type = "satchel_textures"},
    [1265966684]   = { name = "American White Pelican", givenItem = {  "feather"  }, givenAmount = {1 },  givenDisplay = { "Pelican feather"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture ="animal_pelican_white" ,action ="Skinned",type = "satchel_textures"},
    [-1797450568]  = { name = "Blue And Yellow Macaw", givenItem = {  "feather"  }, givenAmount = { 1 },  givenDisplay = { "Bird meat"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture = "animal_parrot_blueyellow",action ="Skinned",type = "satchel_textures"},
    [1654513481]   = { name = "Panther", givenItem = {"animalfat", "meat" }, givenAmount = { 1,1 },  givenDisplay = { "Panther pelt"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture ="animal_panther" ,action = "Skinned"},
    [120598262]   = { name = "Californian Condor", givenItem = { "feather" }, givenAmount = { 1 },  givenDisplay = { "Condor feather"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture ="animal_condor" ,action ="Skinned",type = "satchel_textures"},
    [-2063183075]  = { name = "Dominique Chicken", givenItem = { "feather", "carne_peru" }, givenAmount = { 1,1 },  givenDisplay = { "Chicken feather"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture = "animal_chicken_dominique",action ="Skinned",type = "satchel_textures"},
    [-2073130256]  = { name = "Double-Crested Cormorant", givenItem = { "feather" }, givenAmount = { 1 },  givenDisplay = { "Cormorant feather"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture = "animal_cormorant",action ="Skinned",type = "satchel_textures"},
    [90264823]     = { name = "Cougar", givenItem = { "animalfat", "meat" }, givenAmount = { 1,1 },  givenDisplay = { "Cougar skin"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture = "animal_bobcat",action = "Skinned"},
    [-50684386]    = { name = "Florida Cracker Cow", givenItem = {  "animalfat", "meat" }, givenAmount = { 1,1 },  givenDisplay = { "Beef"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture ="animal_cow" ,action ="Skinned",type = "satchel_textures"},
    [480688259]    = { name = "Coyote", givenItem = {"meat" }, givenAmount = {1},  givenDisplay = { "Game Meat", "Coyote tooth"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture ="animal_coyote" ,action ="Skinned",type = "satchel_textures"},
    [-564099192]   = { name = "Whooping Crane", givenItem = {  "feather"  }, givenAmount = { 1 },  givenDisplay = { "Crane feather"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture ="animal_crane" ,action ="Skinned",type = "satchel_textures"},
    [45741642]    = { name = "Gila Monster", givenItem = { "meat" }, givenAmount = { 1 },  givenDisplay = { "Herptile meat"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture ="animal_gila_monster" ,action ="Skinned",type = "satchel_textures"},
    [-753902995]   = { name = "Alpine Goat", givenItem = { "meat" }, givenAmount = { 1 },  givenDisplay = { "Game Meat"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture = "animal_goat",action ="Skinned",type = "satchel_textures"},
    [723190474]    = { name = "Canada Goose", givenItem = { "feather" }, givenAmount = { 1 },  givenDisplay = { "Goose feather"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture ="animal_goosecanada" ,action ="Skinned",type = "satchel_textures"},
    [-2145890973]  = { name = "Ferruinous Hawk", givenItem = { "feather" }, givenAmount = { 1 },  givenDisplay = { "Hawk feather"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture = "animal_hawk_roughlegged",action ="Skinned",type = "satchel_textures"},
    [1095117488]   = { name = "Great Blue Heron", givenItem = { "feather" }, givenAmount = { 1 },  givenDisplay = { "Tricolor heron feather"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture = "animal_loon_yellowbilled",action ="Skinned",type = "satchel_textures"},
    [-1854059305]  = { name = "Green Iguana", givenItem = { "meat" }, givenAmount = { 1 },  givenDisplay = { "Herptile meat"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture = "animal_iguana",action = "Skinned",type = "satchel_textures"},
    [-593056309]   = { name = "Desert Iguana", givenItem = { "meat" }, givenAmount = { 1 },  givenDisplay = { "Herptile meat"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture ="animal_iguanadesert" ,action ="Skinned",type = "satchel_textures"},
    [1751700893]   = { name = "Peccary Pig", givenItem = { "carne_javali" }, givenAmount = { 1 },  givenDisplay = { "Pork"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture = "animal_pig_oldspot",action ="Skinned",type = "satchel_textures"},
    [386506078]    = { name = "Common Loon", givenItem = { "feather" }, givenAmount = { 1 },  givenDisplay = { "Common loon feather"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture = "animal_loon_common",action ="Skinned",type = "satchel_textures"},
    [-1098441944]  = { name = "Moose", givenItem = { "carne_alce" }, givenAmount = { 1 },  givenDisplay = { "Moose Antlers"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture = "animal_moose",action ="Skinned",type = "satchel_textures"},
    [-1134449699]  = { name = "American Muskrat", givenItem = { "meat" }, givenAmount = { 1 },  givenDisplay = { "Stringy meat"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture = "animal_muskrat",action ="Skinned",type = "satchel_textures"},
    [-86244272]   = { name = "Great Horned Owl", givenItem = { "feather" }, givenAmount = { 1 },  givenDisplay = { "Owl feather"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture = "animal_owl_great",action ="Skinned",type = "satchel_textures"},
    [556355544]    = { name = "Angus Ox", givenItem = { "meat" }, givenAmount = { 1 },  givenDisplay = { "Angus Ox horn"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture = "animal_ox_angus",action ="Skinned",type = "satchel_textures" },
    [-1892280447]  = { name = "Alligator Small", givenItem = { "meat" },givenAmount = { 1 },  givenDisplay = { "Game meat"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture ="animal_alligator" ,action ="Skinned",type = "satchel_textures"},
    [-2004866590]  = { name = "Alligator", givenItem = { "meat" }, givenAmount = { 1 }, givenDisplay = { "BigGame meat"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture ="animal_alligator_medium" ,action ="Skinned",type = "satchel_textures"},
    [-1295720802]  = { name = "Northen American Alligator", givenItem = { "meat" }, givenAmount = { 1 }, givenDisplay = { "BigGame meat"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture ="animal_alligator_medium" ,action ="Skinned",type = "satchel_textures"},
    [759906147]    = { name = "North American Beaver", givenItem = { "meat" }, givenAmount = { 1 },  givenDisplay = { "Game meat"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture = "animal_beaver",action = "Skinned",type = "satchel_textures"},
    [730092646]    = { name = "American Black Bear", givenItem = { "meat" }, givenAmount = { 1 },  givenDisplay = { "Big Game Meat"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture = "animal_bear_black",action ="Skinned",type = "satchel_textures"},
    [195700131]    = { name = "Hereford Bull", givenItem = { "meat" }, givenAmount = { 1 },  givenDisplay = { "Beef"},money = 0, gold = 0, rolPoints = 0,xp = 1,    texture ="animal_bull_hereford" ,action ="Skinned",type = "satchel_textures"},
    
----------------------------------------------------------------------------------------------------DIRECT INVENTORY ITEMS (small animal which are directly added to the inventory)------------------------------------------------------------------------------    
    
    [703712157] = { name = "Large Bullhead Catfish", givenItem = { "a_c_fishbullheadcat_01_ms" }, givenAmount = {1},givenDisplay = {"Large Bullhead Catfish"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "provision_fish_bullhead_catfish",action ="Picked " , type ="inventory_items" },
    [264156159] = { name = "Chain Pickerel", givenItem = { "a_c_fishchainpickerel_01_sm" }, givenAmount = {1},givenDisplay = {"Chain Pickerel"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "provision_fish_chain_pickerel",action = "Picked ", type = "inventory_items"},
    [-1182983171] = { name = "Large Chain Pickerel", givenItem = { "a_c_fishchainpickerel_01_ms" }, givenAmount = {1},givenDisplay = {"Large Chain Pickerel"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture ="provision_fish_chain_pickerel" ,action ="Picked " , type ="inventory_items" },
    [122748261] = { name = "Largemouth Bass", givenItem = { "a_c_fishlargemouthbass_01_ms" }, givenAmount = {1},givenDisplay = {"Largemouth Bass"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "provision_fish_largemouth_bass",action = "Picked ", type = "inventory_items"},
    [706485280] = { name = "Perch", givenItem = { "a_c_fishperch_01_sm" }, givenAmount = {1},givenDisplay = {"Perch"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "provision_fish_perch",action = "Picked ", type = "inventory_items"},
    [-452224784] = { name = "Large Perch", givenItem = { "a_c_fishperch_01_ms" }, givenAmount = {1},givenDisplay = {"Large Perch"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "provision_fish_perch",action = "Picked ", type = "inventory_items"},
    [490159652] = { name = "Steelhead Trout", givenItem = { "a_c_fishrainbowtrout_01_ms" }, givenAmount = {1},givenDisplay = {"Steelhead Trout"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "provision_fish_steelhead_trout",action ="Picked " , type ="inventory_items" },
    [513249462] = { name = "Redfin Pickerel", givenItem = { "a_c_fishredfinpickerel_01_sm" }, givenAmount = {1},givenDisplay = {"Redfin Pickerel"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "provision_fish_redfin_pickerel",action ="Picked " , type ="inventory_items" },
    [-243188398] = { name = "Large Redfin Pickerel", givenItem = { "a_c_fishredfinpickerel_01_ms" }, givenAmount = {1},givenDisplay = {"Large Redfin Pickerel"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "provision_fish_redfin_pickerel",action ="Picked " , type ="inventory_items" },
    [1520661] = { name = "Rock Bass", givenItem = { "a_c_fishrockbass_01_sm" }, givenAmount = { 1 },givenDisplay = {"Rock Bass"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "provision_fish_rock_bass",action ="Picked " , type ="inventory_items" },
    [-1981561472] = { name = "Large Rock Bass", givenItem = { "a_c_fishrockbass_01_ms" }, givenAmount = {1},givenDisplay = {"Large Rock Bass"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "provision_fish_rock_bass",action = "Picked ", type = "inventory_items"},
    [41707457] = { name = "Salmon", givenItem = { "a_c_fishsalmonsockeye_01_ms" }, givenAmount = {1},givenDisplay = {"Salmon"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "provision_fish_sockeye_salmon",action ="Picked " , type ="inventory_items" },
    [1860580756] = { name = "Smallmouth Bass", givenItem = { "a_c_fishsmallmouthbass_01_ms" }, givenAmount = {1},givenDisplay = {"Smallmouth Bass"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "provision_fish_smallmouth_bass",action = "Picked ", type = "inventory_items"},
    [1867262572] = { name = "Large Blue Gill", givenItem = { "a_c_fishbluegil_01_ms" }, givenAmount = { 1 }, givenDisplay = {"Large Blue Gill"}, money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "provision_fish_bluegill",action ="Picked " , type ="inventory_items" },
    [1493541632] = { name = "Bullhead Catfish", givenItem = { "a_c_fishbullheadcat_01_sm" }, givenAmount = { 1 }, givenDisplay = {"Bullhead Catfish"}, money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "provision_fish_bullhead_catfish",action ="Picked " , type ="inventory_items" },
    [-2116748615] = { name = "Blue Gill", givenItem = { "a_c_fishbluegil_01_sm" }, givenAmount = { 1 }, givenDisplay = {"Blue Gill"}, money = 0, gold = 0, rolPoints = 0, xp = 1,    texture ="provision_fish_bluegill" ,action ="Picked" , type ="inventory_items" },
    
    
    
    
    [-1910795227] = { name = "Scarlet songbird", givenItem = { "songbird2_c" }, givenAmount = {1},givenDisplay = {"Scarlet songbird"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "animal_songbird_scarlet",action = "Picked", type = "satchel_textures"},
    [-1028170431] = { name = "Golden Sparrow", givenItem = { "sparrow2_c" }, givenAmount = {1},givenDisplay = {"Golden Sparrow"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "animal_sparrow_golden",action = "Picked", type = "satchel_textures"},
    [-1550768676] = { name = "Chipmunk", givenItem = { "chipmunk_c" }, givenAmount = {1},givenDisplay = {"Chipmunk"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture ="animal_chipmunk",action ="Picked" , type ="satchel_textures" },
    [1582986780] = { name = "Blue Jay", givenItem = { "bluejay_c" }, givenAmount = {1},givenDisplay = {"Blue Jay"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "animal_bluejay",action = "Picked", type = "satchel_textures"},
    [1784941179] = { name = "Cardinal", givenItem = { "cardinal_c" }, givenAmount = {1},givenDisplay = {"Cardinal"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "animal_cardinal",action = "Picked", type = "satchel_textures"},
    [-292997097] = { name = "Cedar waxwing", givenItem = { "cedarwaxwing_c" }, givenAmount = {1},givenDisplay = {"Cedar waxwing"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture ="animal_cedarwaxwing" ,action = "Picked", type = "satchel_textures"},
    [-2037578922] = { name = "Cuban Crab", givenItem = { "crab_c" }, givenAmount = {1},givenDisplay = {"Cuban Crab"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture ="animal_crab" ,action = "Picked", type = "satchel_textures"},
    [-1763055991] = { name = "Crawfish", givenItem = { "crawfish_c" }, givenAmount = {1},givenDisplay = {"Crawfish"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture ="animal_crawfish" ,action = "Picked", type = "satchel_textures"},
    [98537260] = { name = "Crow", givenItem = { "crow_c" }, givenAmount = {1},givenDisplay = {"Crow"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "animal_crow",action = "Picked", type = "satchel_textures"},
    [-930822792] = { name = "Frogbull", givenItem = { "frogbull_c" }, givenAmount = {1},givenDisplay = {"Frogbull"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture ="animal_frogbull" ,action = "Picked", type = "satchel_textures"},
    [-1302821723] = { name = "Hooded Oriole", givenItem = { "oriole_c" }, givenAmount = {1},givenDisplay = {"Hooded Oriole"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "animal_oriole_hooded",action = "Picked", type = "satchel_textures"},
    [111281960] = { name = "Pigeon", givenItem = { "pigeon_c" }, givenAmount = {1},givenDisplay = {"Pigeon"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "animal_pigeon",action = "Picked", type = "satchel_textures"},
    [674267496] = { name = "Bat", givenItem = { "bat_c" }, givenAmount = {1},givenDisplay = {"Bat"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "animal_bat",action = "Picked", type = "satchel_textures"},
    [-1210546580] = { name = "Robin", givenItem = { "robin_c" }, givenAmount = {1},givenDisplay = {"Robin"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "animal_robin",action = "Picked", type = "satchel_textures"},
    [-1910795227] = { name = "Songbird", givenItem = { "songbird_c" }, givenAmount = {1},givenDisplay = {"Songbird"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture ="animal_songbird" ,action = "Picked", type = "satchel_textures"},
    [-1028170431] = { name = "Sparrow", givenItem = { "sparrow1_c" }, givenAmount = {1},givenDisplay = {"Sparrow"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "animal_sparrow",action = "Picked", type = "satchel_textures"},
    [1502581273] = { name = "Toad", givenItem = { "toad_c" }, givenAmount = {1},givenDisplay = {"Toad"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "animal_toad",action = "Picked", type = "satchel_textures"},
    [510312109] = { name = "Red-bellied Woodpecker", givenItem = { "woodpeck01_c" }, givenAmount = {1},givenDisplay = {"Red-bellied Woodpecker"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture ="animal_woodpecker_redbellied" ,action ="Picked" , type ="satchel_textures" },
    [729471181] = { name = "Pileated Woodpecker", givenItem = { "woodpeck02_c" }, givenAmount = {1},givenDisplay = {"Pileated Woodpecker"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture ="animal_woodpecker_pileated" ,action = "Picked", type = "satchel_textures"},
    [1465438313] = { name = "Grey Squirrel", givenItem = { "squirrel_grey_c" }, givenAmount = {1},givenDisplay = {"Grey Squirrel"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "animal_squirrel_grey",action = "Picked", type = "satchel_textures"},

    
------------------------------------------------------------- LEGENDARY ANIMAL SKINNING STARTS HERE   ----------------------------------------------------------------------

--[[[-2021043433] = { name = "Legendary White Elk", givenItem = { "venison","elkantler","legelks" }, givenAmount = {1,1,1},givenDisplay = {"Venison","Elk antler","Legendary Elk pelt"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "animal_elk",action ="Skinned" , type ="satchel_textures" },
[-1747620994] = { name = "Legendary Boa", givenItem = { "stringy","legendsnakes","snaket" }, givenAmount = {1,1,1},givenDisplay = {"Stringy meat", "Legendary Boa pelt", "Snake tooth"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "animal_snakeblacktailrattle",action ="Skinned" , type ="satchel_textures" },
[674287411] = { name = "Legendary Sun Alligator", givenItem = { "aligatormeat","legaligators2","aligatorto" }, givenAmount = {1,1,1},givenDisplay = {"Alligator meat", "Legendary Sun Alligator pelt","Alligator tooth"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture ="mp_animal_alligator_legendary_02" ,action = "Skinned", type = "inventory_items_mp"},
[-1598866821] = { name = "Legendary Bull Alligator", givenItem = { "aligatormeat","legaligators","aligatorto" }, givenAmount = {1,1,1},givenDisplay = {"Alligator meat", "Legendary Bull Alligator pelt","Alligator tooth"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "animal_alligator",action ="Skinned" , type ="satchel_textures" },
[-1149999295] = { name = "Legendary White Beaver", givenItem = { "stringy","legbeavers2","beavertail" }, givenAmount = {1,1,1},givenDisplay = {"Stringy meat", "Legendary White Beaver pelt","Beaver tail"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture ="mp_animal_beaver_legendary_02" ,action ="Skinned" , type ="inventory_items_mp" },
[2028722809] = { name = "Legendary Gaint Boar", givenItem = { "pork","legboars2","boarmusk" }, givenAmount = {1,1,1},givenDisplay = {"Pork","Legendary Boar Pelt","boarMusk"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "mp_animal_boar_legendary_01",action ="Skinned" , type ="inventory_items_mp" },
[-389300196] = { name = "Legendary WakpaBoar", givenItem = { "pork","legboars1","boarmusk" }, givenAmount = {1,1,1},givenDisplay = {"Pork","Legendary Boar Pelt","boarMusk"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "mp_animal_boar_legendary_02",action = "Skinned", type = "inventory_items_mp"},
[-1433814131] = { name = "Legendary Maza Cougar", givenItem = { "biggame","legcougars2","cougarf" }, givenAmount = {1,1,1},givenDisplay = {"Legendary Maza Cougar pelt", "Cougar tooth"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "mp_animal_cougar_legendary_02",action ="Skinned" , type ="inventory_items_mp" },
[-1307757043] = { name = "Legendary Midnight Paw Coyote", givenItem = { "stringy","legcoyotes2","coyotef" }, givenAmount = {1,1,1},givenDisplay = {"Stringy Meat","Legendary Midnight Paw Coyote pelt","Coyote tooth"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "mp_animal_coyote_legendary_02",action ="Skinned" , type ="inventory_items_mp" },
[-1189368951] = { name = "Legendary Ghost Panther", givenItem = { "biggame","legpanthers2","panthere" }, givenAmount = {1,1,1},givenDisplay = {"Legendary Ghost Panther pelt","Panther eyes"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture ="mp_animal_panther_legendary_02" ,action ="Skinned" , type ="inventory_items_mp" },
[-1392359921] = { name = "Legendary Onyx Wolf", givenItem = { "game","wolftooth","legwolfs2","wolfheart" }, givenAmount = {1,1,1,1},givenDisplay = {"Game Meat","wolf  tooth", "Legendary Onyx Wolf pelt","Wolf Heart"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "mp_animal_wolf_legendary_02",action ="Skinned" , type ="inventory_items_mp" },
[-551216071] = { name = "Legendary Owiza Bear", givenItem = { "biggame","legbears2","bearc" }, givenAmount = {1,1,1},givenDisplay = { "Legendary Owiza Bear pelt","Bear Claw"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture ="mp_animal_bear_legendary_01" ,action ="Skinned" , type ="inventory_items_mp" },
[-511163808] = { name = "Legendary Chalk Horn Ram", givenItem = { "Mutton","ramhorn","legrams2" }, givenAmount = {1,1,1},givenDisplay = {"Mutton","Ramhorn", "Legendary Chalk Horn Ram Pelt"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "mp_animal_ram_legendary_02",action ="Skinned" , type ="inventory_items_mp" },
[-1754211037] = { name = "Legendary Buck", givenItem = { "buckantler","legbucks1","venison" }, givenAmount = {1,1,1},givenDisplay = {"Venison","Buck Antlers","Legendary Buck pelt"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "mp_animal_buck_legendary_01",action ="Skinned" , type ="inventory_items_mp" },
[-915290938] = { name = "Legendary Winyan Bison", givenItem = { "beef","bisonhorn","legbisons2" }, givenAmount = {1,1,1},givenDisplay = {"Beef","Bison Horn", "Legendary Winyan Bison pelt"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "mp_animal_bison_legendary_02",action ="Skinned" , type ="inventory_items_mp" },
[-117665949] = { name = "Legendary Snowflake Moose", givenItem = { "biggame","mooseantler","legmooses1" }, givenAmount = {1,1,1},givenDisplay = {"Moose Antlers", "Legendary Snowflake Moose pelt"},money = 0, gold = 0, rolPoints = 0, xp = 1,    texture = "mp_animal_moose_legendary_01",action = "Skinned", type = "inventory_items_mp"},]]
}

-- Animals that are traded in to the butcher


Config.Animals = {
    -- Animals
    [-1124266369]  = { name = "Bear", givenItem = { "animalfat", "meat" }, givenAmount = { 1, 2 }, money = 50, gold = 0, rolPoints = 0, xp = 0, poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 2, poor = 957520252, good = 143941906, perfect = 1292673537 },
    [-15687816381] = { name = "Big Horn Ram", givenItem = { "animalfat", "meat" }, givenAmount = { 1, 2 }, money = 0, gold = 0, rolPoints = 0, xp = 0, poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 2, poor = 1796037447, good = -476045512, perfect = 1795984405 },
    [2028722809]   = { name = "Boar", givenItem = { "carne_javali", "meat" }, givenAmount = { 1, 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0, poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 2, poor = 1248540072, good = nil, perfect = -1858513856 },
    [-1963605336]  = { name = "Buck", givenItem = { "carne_cervo", "meat" }, givenAmount = { 1, 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0, poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 2, poor = 1603936352, good = -868657362, perfect = -702790226 },
    [1556473961]   = { name = "Bison", givenItem = { "animalfat" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0, poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 2, poor = -1730060063, good = -591117838, perfect = -237756948 },
    [1957001316]   = { name = "Bull", givenItem = { "meat" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0, poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 2, poor = 9293261, good = -336086818, perfect = -53270317 },
    [1110710183]   = { name = "Deer", givenItem = { "carne_cervo", "meat" }, givenAmount = { 1, 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0, poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 2, poor = -662178186, good = -1827027577, perfect = -1035515486 },
    [-1003616053]  = { name = "Duck", givenItem = { "feather" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [1459778951]   = { name = "Eagle", givenItem = { "feather" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [831859211]    = { name = "Egret", givenItem = { "feather" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [-2021043433]  = { name = "Elk", givenItem = { "meat" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0, poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 2, poor = 2053771712, good = 1181652728, perfect = -1332163079 },
    [252669332]    = { name = "American Red Fox", givenItem = { "animalfat" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0, poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 2, poor = 1647012424, good = 238733925, perfect = 500722008 },
    [-1143398950]  = { name = "Big Grey Wolf", givenItem = { "animalfat" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [-885451903]   = { name = "Medium Grey Wolf", givenItem = { "animalfat" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [-829273561]   = { name = "Small Grey Wolf", givenItem = { "animalfat" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [1104697660]   = { name = "Vulture", givenItem = { "feather" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [-407730502]   = { name = "Snapping Turtle", givenItem = { "meat" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [-466054788]   = { name = "Wild Turkey", givenItem = { "carne_peru", "meat" }, givenAmount = { 1,1 }, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [-2011226991]  = { name = "Wild Turkey", givenItem = { "carne_peru", "meat" }, givenAmount = { 1 ,1}, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [-166054593]   = { name = "Wild Turkey", givenItem = { "carne_peru", "meat" }, givenAmount = { 1,1 }, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [-229688157]   = { name = "Water Snake", givenItem = { "snakepoison", "meat" }, givenAmount = { 1,1 }, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [-1790499186]  = { name = "Snake Red Boa", givenItem = { "snakepoison" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [1464167925]   = { name = "Snake Fer-De-Lance", givenItem = { "snakepoison" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [846659001]    = { name = "Black-Tailed Rattlesnake", givenItem = { "snakepoison" }, givenAmount = { 1 }, money =0, gold = 0, rolPoints = 0, xp = 0 },
    [545068538]    = { name = "Western Rattlesnake", givenItem = { "snakepoison" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [-1211566332]  = { name = "Striped Skunk", givenItem = { "meat" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [40345436]     = { name = "Merino Sheep", givenItem = { "wool" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0, poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 2, poor = 1729948479, good = -1317365569, perfect = 1466150167 },
    [-164963696]   = { name = "Herring Seagull", givenItem = { "feather" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [-1076508705]  = { name = "Roseate Spoonbill", givenItem = { "feather" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [2023522846]   = { name = "Dominique Rooster", givenItem = { "feather" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [-466687768]   = { name = "Red-Footed Booby", givenItem = { "feather" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [-575340245]   = { name = "Wester Raven", givenItem = { "feather" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [1458540991]   = { name = "North American Racoon", givenItem = { "meat" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [-541762431]   = { name = "Black-Tailed Jackrabbit", givenItem = { "meat" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [1755643085]   = { name = "American Pronghorn Doe", givenItem = { "carne_cervo" , "meat"}, givenAmount = { 1 ,1}, money = 0, gold = 0, rolPoints = 0, xp = 0, poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 2, poor = -983605026, good = 554578289, perfect = -1544126829 },
    [2079703102]   = { name = "Greater Prairie Chicken", givenItem = { "carne_peru", "meat" }, givenAmount = { 1,1 }, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [-1414989025]  = { name = "Wirginia Possum", givenItem = { "meat" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [1007418994]   = { name = "Berkshire Pig", givenItem = { "meat" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0, poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 2, poor = -308965548, good = -57190831, perfect = -1102272634 },
    [1416324601]   = { name = "Ring-Necked Pheasant", givenItem = { "feather" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [1265966684]   = { name = "American White Pelican", givenItem = { "feather" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [-1797450568]  = { name = "Blue And Yellow Macaw", givenItem = { "feather" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [1654513481]   = { name = "Panther", givenItem = { "animalfat" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0, poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 2, poor = 1584468323, good = -395646254, perfect = 1969175294 },
    [1205982615]   = { name = "Californian Condor", givenItem = { "feather" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [-2063183075]  = { name = "Dominique Chicken", givenItem = { "carne_peru" , "meat"}, givenAmount = { 1 ,1}, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [-2073130256]  = { name = "Double-Crested Cormorant", givenItem = { "feather" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [90264823]     = { name = "Cougar", givenItem = { "animalfat", "meat" }, givenAmount = { 1,1 }, money = 0, gold = 0, rolPoints = 0, xp = 0, poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 2, poor = 1914602340, good = 459744337, perfect = -1791452194 },
    [-50684386]    = { name = "Florida Cracker Cow", givenItem = { "feather" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0, poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 2, poor = 334093551, good = 1150594075, perfect = -845037222 },
    [480688259]    = { name = "Coyote", givenItem = { "animalfat" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0, poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 2, poor = -1558096473, good = 1150939141, perfect = -794277189 },
    [-564099192]   = { name = "Whooping Crane", givenItem = { "feather" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [457416415]    = { name = "Gila Monster", givenItem = { "meat" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [-753902995]   = { name = "Alpine Goat", givenItem = { "meat" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0, poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 2, poor = 699990316, good = 1710714415, perfect = -1648383828 },
    [723190474]    = { name = "Canada Goose", givenItem = { "feather" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [-2145890973]  = { name = "Ferruinous Hawk", givenItem = { "feather" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [1095117488]   = { name = "Great Blue Heron", givenItem = { "feather" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [-1854059305]  = { name = "Green Iguana", givenItem = { "meat" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [-593056309]   = { name = "Desert Iguana", givenItem = { "meat" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [1751700893]   = { name = "Peccary Pig", givenItem = { "carne_javali" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0, poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 2, poor = -99092070, good = -1379330323, perfect = 1963510418 },
    [386506078]    = { name = "Common Loon", givenItem = { "feather" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [-1098441944]  = { name = "Moose", givenItem = { "carne_alce" , "meat"}, givenAmount = { 1 ,1}, money = 0, gold = 0, rolPoints = 0, xp = 0, poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 2, poor = 1868576868, good = 1636891382, perfect = -217731719 },
    [-1134449699]  = { name = "American Muskrat", givenItem = { "meat" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [-861544272]   = { name = "Great Horned Owl", givenItem = { "feather" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0 },
    [556355544]    = { name = "Angus Ox", givenItem = { "animalfat" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0, poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 2, poor = 4623248928, good = 1208128650, perfect = 659601266 },
    [-1892280447]  = { name = "Alligator Small", givenItem = { "BigGameMeat" },givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0, poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 2, poor = 1806153689, good = -802026654, perfect = -1625078531 },
    [-2004866590]  = { name = "Alligator", givenItem = { "BigGameMeat" },givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0, poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 3, poor = -1243878166, good = nil, perfect = -1475338121 },
    [759906147]    = { name = "North American Beaver", givenItem = { "meat" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0, poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 2, poor = -1569450319, good = -2059726619, perfect = 854596618 },
    [730092646]    = { name = "American Black Bear", givenItem = { "meat" }, givenAmount = { 1 }, money = 0, gold = 0, rolPoints = 0, xp = 0, poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 2, poor = 1083865179, good = 1490032862, perfect = 663376218 },
    -- Fish
    [-711779521]   = { name = "Longnose Gar", givenItem = { "fish" }, givenAmount = { 0 }, money = 6, gold = 0, rolPoints = 0,xp = 1,  poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 2, poor = nil, good = nil, perfect = nil },
    [-1553593715]  = { name = "Muskie", givenItem = { "fish" }, givenAmount = { 0 }, money = 6, gold = 0, rolPoints = 0,xp = 1,  poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 2, poor = nil, good = nil, perfect = nil },
    [-300867788]   = { name = "Lake Sturgeon", givenItem = { "fish" }, givenAmount = { 0 }, money = 4, gold = 0, rolPoints = 0,xp = 1,  poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 2, poor = nil, good = nil, perfect = nil },
    [1538187374]   = { name = "Channel Catfish", givenItem = { "fish" }, givenAmount = { 0 }, money = 5, gold = 0, rolPoints = 0,xp = 1,  poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 2, poor = nil, good = nil, perfect = nil },
    [697075200]    = { name = "Northern Pike", givenItem = { "fish" }, givenAmount = { 0 }, money = 5, gold = 0, rolPoints = 0,xp = 1,  poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 2, poor = nil, good = nil, perfect = nil },
    [1867262572]   = { name = "Bluegill", givenItem = { "fish" }, givenAmount = { 0 }, money = 5, gold = 0, rolPoints = 0,xp = 1,  poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 2, poor = nil, good = nil, perfect = nil },
    [1493541632]   = { name = "Bullhead catfish", givenItem = { "fish" }, givenAmount = { 0 }, money = 5, gold = 0, rolPoints = 0,xp = 1,  poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 2, poor = nil, good = nil, perfect = nil },
    [3111984125]   = { name = "Chain Pickerl", givenItem = { "fish" }, givenAmount = { 0 }, money = 5, gold = 0, rolPoints = 0,xp = 1,  poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 2, poor = nil, good = nil, perfect = nil },
    [463643368]    = { name = "bigmouth bass", givenItem = { "fish" }, givenAmount = { 0 }, money = 4, gold = 0, rolPoints = 0,xp = 1,  poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 2, poor = nil, good = nil, perfect = nil },
    [3842742512]   = { name = "Perch", givenItem = { "fish" }, givenAmount = { 0 }, money = 3, gold = 0, rolPoints = 0,xp = 1,  poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 2, poor = nil, good = nil, perfect = nil },
    [134747314]    = { name = "Rainbow trout", givenItem = { "fish" }, givenAmount = { 0 }, money = 4, gold = 0, rolPoints = 0,xp = 1,  poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 2, poor = nil, good = nil, perfect = nil },
    [4051778898]   = { name = "Redfin Pickerl", givenItem = { "fish" }, givenAmount = { 0 }, money = 3, gold = 0, rolPoints = 0,xp = 1,  poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 2, poor = nil, good = nil, perfect = nil },
    [2313405824]   = { name = "Rock Bass", givenItem = { "fish" }, givenAmount = { 0 }, money = 4, gold = 0, rolPoints = 0,xp = 1,  poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 2, poor = nil, good = nil, perfect = nil },
    [2410477101]   = { name = "Smallmouth bass", givenItem = { "fish" }, givenAmount = { 0 }, money = 3, gold = 0, rolPoints = 0,xp = 1,  poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 2, poor = nil, good = nil, perfect = nil },
    [543892122]    = { name = "Salmon Redfish", givenItem = { "fish" }, givenAmount = { 0 }, money = 4, gold = 0, rolPoints = 0,xp = 1,  poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 2, poor = nil, good = nil, perfect = nil },
    [1702636991]   = { name = "Salmon sockeye", givenItem = { "fish" }, givenAmount = { 0 }, money = 4, gold = 0, rolPoints = 0,xp = 1,  poorQualityMultiplier = 1.0, goodQualityMultiplier = 1.5, perfectQualityMultiplier = 2, poor = nil, good = nil, perfect = nil },
}
