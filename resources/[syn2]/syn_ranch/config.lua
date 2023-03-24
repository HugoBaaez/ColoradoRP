Config = {}

-- Change between cores
Config.redem = false -- RedEM:RP
Config.vorp = true -- VORP Core

Config.keys = {
    -- change the hashes to the keys u want, do not change the writings in qoutes. for example if u wana change B do ["B"] = (CHANGE THIS 0x8AAA0AD4), do not change whats inside those brackets > ["B"]
    ["B"] = 0x4CC0E2FE,
    ["G"] = 0x760A9C6F,
    ["ENTER"] = 0xC7B5340A,
    ["DOWN"] = 0x05CA7C52,
    ["UP"] = 0x6319DB71,
    ["LEFT"] = 0xA65EBAB4,
    ["RIGHT"] = 0xDEB34313,
    ["RIGHTBRACKET"] = 0xA5BDCD3C,
    ["LEFTBRACKET"] = 0x430593AA,
    ["BACKSPACE"] = 0x156F7119,
    ["ALT"] = 0x8AAA0AD4,
    ["CTRL"] = 0xDB096B85,
    ["1"] = 0xE6F612E4,
    ["2"] = 0x1CE6D9EB,
    ["3"] = 0x4F49CC4C,
    ["4"] = 0x8F9F9E58,
}

Config.webhook = "https://discord.com/api/webhooks/1042907695386202202/9l2-rTf1lQdi_rV0DyEHiM0THHTQCi8SVjP5491TvRepa8lhALEBt3X1SkLySNxD5BVn"

Config.command = "createranch"
Config.synsocietyjob = "Estado"
Config.reachedtimer = 30 -- 20 seconds after the first cattle is reached to finish herding (dont change if u dont know what ur doing)
Config.herdingcooldown = 1200 --2000 33 minutes, time between each herding trip. longer cool downs will encourage players to go on longer routes
Config.salecooldown = 800 -- 15 minutes between sales
Config.selltimer = 5250  -- timer for sale mission to fail 30 minutes
Config.ranchforsale = 552659337 -- ranch for sale blip
Config.playerranch = 263099185 -- owned ranch blip
Config.herdtimer = 3600 --  (30 minutes) from herding start to fail the herding if herd isnt delivered
Config.pvp = true -- setting this to true will reward players who kill other players cattle with half the price of each cattle type per kill on cattle.
Config.stray = 8 -- this means 3 out of 10 times the animals have a chance of straying. higher number = lower chance up to 9. if you want to disable set to 10
Config.straycooldownherd = 300000 -- in miliseconds. timer between each goat stray, lower timer more strays harder herding 
Config.straycooldownsale = 300000-- in miliseconds. timer between each goat stray, lower timer more strays harder herding 
Config.wolfcooldown = 150000-- in miliseconds. timer between each wolf spawn, lower timer more wolfs harder herding 
Config.wolf = 5 -- 1 out of 15 chance worlff will spawn. set to 15 to disable. lower number = higher chance of spawning.

Config.herdingdogcommand = "onme" -- doing /onme if you own a herding dog will bring all the herd animals to you while on a herding trail, can be used once every 5 minutes


--[Payout]
--[[
The Payout of a Sale is the ratio X Quality X herd number.
ration = Price of Cattle/100 . 
if the herd ratio is 1 in the following example that would be cows. the payout at max herd quality and number would be 
10,000 $. adjust as per your economy. 
]]
--------------------
Config.maxquality = 200
Config.maxherd = 4 -- max number of each herd not recommended to go over 10.
--------------------

----------------------------
Config.qualitybuff = true -- turn of if you want to buff quality gain on each herding trip 
Config.qualitybuffvalue = 0.5 -- this is a multiplyer. setting it to 2 will double the quality gain on trips. use as per your economy.
--- avoid changing max quality and max herd and instead play around with this multiplyer to adjust payout.
-- by default this is off. 

-----------------------------
Config.maxscorelock = true -- setting to true will enable a max score on minigames. this will limit the modifier that players get on their enviroment
Config.maxscore = 10 -- max score for mini games, better to keep it off as it gives players who are better at the mini game an edge
-----------------------------
Config.taskresettimer = 1800000 -- 30 minutes. every 30 minutes randomized task reset will happen
-----------------------------------------------------------
Config.cowpencost = 2000 -- cost of the cow pen upgrade 
Config.milkingcooldown = 900 -- in seconds (900)
Config.milkitem = "milk"
Config.reducedmilk = true -- toggle to true if you want half the milk output. toggling on will make getting milk harder.
-- milkoutput is score * (ranch_q/100). if reducedmilk is true score is devided by 2 
Config.stopcheaters = true -- people who kill their own cows to farm them will get charged 100$
------------------------------------------------------------
Config.chickenpencost = 1500
Config.chickenscooldown = 900
Config.eggitem = "eggs"
Config.reducedeggs = true
-----------------------------------------------------------
Config.repo = true --- turn to false if you dont want a repo system
-- only set one of those true 
Config.monthlyrepo = true
Config.repotime ={ -- day, hour, and minute of monthly repo of ranches. when the server time matches these values. ranches that dont have money in their ledger = or more than the tax rate of the ranch will 
-- go on sale and their owner will lose their ownership. these ranches will be marked as repoed.
    day = 15,
    hour = 10,
    minute = 18
} 
Config.weeklyrepo = false
Config.repotime2 ={ -- day, hour, and minute of monthly repo of ranches. when the server time matches these values. ranches that dont have money in their ledger = or more than the tax rate of the ranch will 
-- go on sale and their owner will lose their ownership. these ranches will be marked as repoed.
    day1 = 3,
    day2 = 10,
    day3 = 17,
    day4 = 24,
    hour = 6,
    minute = 10
} 
-----------------------------------------------------------
Config.herdingdogs = { -- dogs will allow the onme command which brings all herd animals around you. 
-- dogs will also try to bring stray animals back to the group. this doesnt always work flawlessly and sometimes the player will have 
-- to fitch the animal themselves. but when it works its pretty cool
    ["Huskey"] = {model = "A_C_DogHusky_01",price = 1000},
    ["Chesbay Retriever"] = {model = "A_C_DogChesBayRetriever_01",price = 300},
    ["Labrador Retriever"] = {model = "A_C_DogLab_01",price = 300},
    ["Labrador Retriever 2"] = {model = "A_C_DogRufus_01",price = 300},
    ["Coon Hound"] = {model = "A_C_DogBluetickCoonhound_01",price = 300},
    ["Border Collie"] = {model = "A_C_DogCollie_01",price = 300},
    ["Ches Bay Retriever"] = {model = "A_C_DogChesBayRetriever_01",price = 300},
    ["Foxhound"] = {model = "A_C_DogAmericanFoxhound_01",price = 300},
    ["Catahoula Cur"] = {model = "a_c_dogcatahoulacur_01",price = 75},

}
----------------------------------------------------------------------
-- add more by finding the ped models here 
-- https://github.com/femga/rdr3_discoveries/blob/master/peds/peds_list.lua
-- make sure all 3 tables have the same naming, the naming can be whatever you want 

Config.cattletypes = { 
    ["goats"] = 'a_c_goat_01',
    ["sheep"] = 'a_c_sheep_01',
    ["Kentucky Saddle"] = 'A_C_Horse_KentuckySaddle_Black',
    ["cow"] = 'a_c_ox_01',
    ["chicken"] = 'a_c_chicken_01',
    ["pig"] = 'a_c_pig_01',
}

Config.joblock = {
    ["goats"] = 'none', -- keep at none if you want anyone to buy
    ["sheep"] = 'none', -- keep at none if you want anyone to buy
    --["Kentucky Saddle"] = 'horsetrainer', -- only players with the horsetrainer job can buy those 
    ["cow"] = 'none',
    ["chicken"] = 'none',
    ["pig"] = 'none',
}

Config.cattleprice = {
    ["goats"] = 20, -- 
    ["sheep"] = 30, -- 
    --[[ ["Kentucky Saddle"] = 100, ]] -- 5.0 ratio 
    ["cow"] = 50,
    ["chicken"] = 10,
    ["pig"] = 40,
}
----------------------------------------------------------------------------------
-- locations where players can sell cattle, add more by copy pasting the backets marked 

Config.cattlesale = {  
    -- copy from here
	Valentine = {	   
        Pos = {x = -1423.14, y = -226.05, z = 101.03}, 
        blipsprite = -569968788, 
        Name = 'Venda de animais',   
    }, -- to here 

    Guarma = {	   
        Pos = {x = 1351.61, y = -7006.85, z = 53.94}, 
        blipsprite = -569968788, 
        Name = 'Venda de animais',   
    },

    SaintDenis = {	   
        Pos = {x = 1219.68, y = -219.01, z = 100.67}, 
        blipsprite = -569968788, 
        Name = 'Venda de animais',   
    },
    Armadillo = {	   
        Pos = {x = -4361.73, y = -3065.41, z = -10.22}, 
        blipsprite = -569968788, 
        Name = 'Venda de animais',   
    },
}

Config.Language = {
    invalidamount = "Quantidade inválida",
    ranchname = "Nome do rancho: ",
    ranchprice = "Preço do rancho: ",
    confirm = "Confirmar",
    createranch = "Criar um rancho",
    sure = "Tem certeza ?",
    yes = "Sim",
    no = "Não",
    ranchforsale = "Rancho a venda",
    buyranch = "Pressione G para comprar o Rancho",
    ranchforsale = "Rancho a venda",
    boughtranch = "Você comprou um rancho",
    nocash = "O dinheiro não é suficiente",
    openranch = "Pressione G para o menu do rancho",
    ownedranch = "Rancho",
    settrail = "Defina a trilha do rebanho",
    trailset = "Trilha foi definido",
    herd = "Rebanho de Gado",
    buycattle = "Comprar Animais",
    buy = "Comprar ",
    amount = "Quantia:",
    cattlebought = "Você comprou Animais",
    owned = "Possui:",
    forr = " por ",
    dollar = " $",
    selectcattle = "Selecione o animal",
    killeda = "Você matou ",
    paid = " ,Recompensada: ",
    herdcooldown = "Pastoreo em recarga: ",
    seconds = " segundas",
    quality = "Qualidade: ",
    cattle = "Animal: ",
    viewcattle = "Ver Animais",
    sellcattle = "Vender Animais",
    paid2 = "Você vendeu animais por ",
    salecooldown = "Venda em recarga: ",
    choresloc = "Localização das tarefas: ",
    setchoreslocation = "Defina o local das tarefas",
    racking = "Ajuntar",
    pressg = "Pressione G para registrar o local",
    tasklocregistered = "Localização da nova tarefa registrada.",
    hayscope = "Pá",
    feed = "Alimento",
    hayspread = "Feno",
    water = "Balde de água",
    enviroment = "Ambiente: ",
    ranchchores = "Tarefas de rancho",
    gotoloc = "Vá para o local marcado para iniciar a tarefa",
    starttask = "Pressione G para iniciar a tarefa",
    finishedtask = "Você terminou uma tarefa",
    working = "Trabalhando...",
    failed = "Fracassado...",
    finished = "Finalizada.",
    upgrades = "Atualizações",
    cowpen = "Curral de vaca",
    chickenpen = "Galinheiro",
    locregistered = "Localização registrada",
    boughtpen = "Você comprou um curral de vaca",
    boughtpen2 = "Você comprou um galinheiro",
    changelocation = "Mudar localização",
    milkcows = "Vacas de leite",
    gotocow = "Vá para a vaca para começar a ordenhar",
    gotochicken = "Vá para galinhas para começar a coletar ovos",
    gtomilk = "Pressione G para começar a ordenhar",
    milkingcooldown = "Ordenha em recarga",
    yougot = "Adicionado ao seu rancho ",
    milk = " Leite",
    takemilk = "pegar leite",
    takeeggs = "pegar ovos",
    took = "Você pegou ",
    youkilledyourcow = "Você matou sua própria vaca e perdeu ",
    cantcarry = "Não posso carregar mais itens",
    herdingdog = "Cão de pastoreio",
    boughtdog = "Você comprou um cachorro de pastoreio",
    dogg = "Você tem um cão pastor. Digitando /",
    tome = " Enquanto o pastoreio trará todos os animais para você.",
    tooclose = "muito perto",
    outrange = "fora de alcance",
    dist = "Dist= ",
    ledger = "Caixa",
    withdraw = "Retirar",
    withdrew = "Você retirou ",
    deposit = "Depositar",
    deposited = "Você depositou ",
    ranchtax = "Tax: ",
    homtax1h = "~e~Cobrança de impostos em 1 hora~q~",
    makesure = "~e~Certifique-se de que o seu caixa tem dinheiro suficiente para pagar impostos~q~",
    herddie = "Um de seus animais do rebanho morreu",
    eggs = " Ovos",
    checkchickens = "Verifique as galinhas",
    chickencooldown = "Verificar frangos em recarga ",
    oncooldown = "Em Cool Down",
    loggedoffselling = " Registrado ao vender",
    loggedoffherding = " Registrado durante o pastoreio",
    killedherdanimal = " Matou um animal de rebanho",
    killedtheircow= "Matou sua própria vaca",
    killedplayercow = "Matou uma vaca de jogador",
    hire = "Contrate para fazenda",
    id = "Player ID",
    fire = "Demitir",
    bossactions = "Ações do chefe",
    hired = "Você contratou ",
    gothired = "Você foi contratado em um rancho.",
    alreadyhired = "Já contratado",
    wrongid = "ID Errado",
    fired = "Você Demitiu ",
    tooclose2 = "Alguém está muito perto",


    -------------------------- new lines 
    timerxz = "Tempo = ",
    presstospawn = "Pressione G para gerar o rebanho",
    ranchid = "Ranch ID: ",
}