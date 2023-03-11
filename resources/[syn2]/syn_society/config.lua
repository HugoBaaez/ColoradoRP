
Config = {}

Config.vorp = true
Config.redem = false

-------- only have 1 enabled----------
Config.normaldrawtext = true -- 
Config.drawtext3d = false --
--------------------------------------
Config.discordid = true 
Config.webhook = true -- turn webhooks for each job on or off 
Config.adminwebhook = true -- turn admin webhook on or off 
Config.webhookavatar = "https://findicons.com/files/icons/2453/clipboard/1816/clipboard_paper.png"
Config.adminwebhooklink = "" -- input your webhook
Config.OpenMenu = 0x760A9C6F -- Key: G
Config.unemployed = "unemployed" --- make sure u set this up in vorp core config as well 
Config.salarytime = 30 -- every 30 minutes players get a salary from the jobs ledger (only if the job has a ledger set up and is included in the config below yes the money gets taken out of the ledger)
Config.maxsalary = 15 -- 30$ max salary --max salary job owners are allowed to set to ranks


Config.autocollect = false -- set to false if you dont want bills from the jobs mentioned below to be auto collected on the spot and instead go to the billing menu 
Config.autocollectjob = {"doctor","police"}

Config.Locations = { 
	--[[ Valentine = {	   -- you can add more job centers by copy pasting this 
        Pos = {x=-182.842, y=629.662, z=114.08}, -- location of job center 
        blipsprite = -272216216, -- blip sprite for job center
		Name = 'Job Center', -- blip name 
    },
     Valentine = {	   -- add more 
        Pos = {x=-182.842, y=629.662, z=114.08}, 
        blipsprite = -272216216, 
		Name = 'Job Center', 
	}, ]]
}

Config.jobs = { 
	police = {	   
        Pos = { 
            {x=-279.21, y=809.9, z=119.3},
            {x=1361.56, y=-1303.22, z=77.76},
            {x=2508.43, y=-1308.72, z=48.95},
            {x=-763.41, y=-1271.52, z=43.99},
            {x = -3621.87, y = -2603.71, z = -13.34}, -- Armadillo
            {x = -1807.88, y = -349.9, z = 164.66},
          --  {x=-3624.99, y=-2601.39, z=-13.39},
          --  {x=2907.72, y=1312.85, z=44.93},
          --  {x=-1807.44, y=-348.05, z=164.70},

    
        }, -- position of blip
        jobmenu = { 
            {x=-279.21, y=809.9, z=119.3},
            {x=1361.56, y=-1303.22, z=77.76},
            {x=2508.43, y=-1308.72, z=48.95},
            {x=-763.41, y=-1271.52, z=43.99},
            {x = -3625.31, y = -2601.65, z = -13.34},-- Armadillo
            {x = -1807.88, y = -349.9, z = 164.66},
          --  {x=-3624.99, y=-2601.39, z=-13.39},
          --  {x=2907.72, y=1312.85, z=44.93},
          --  {x=-1807.44, y=-348.05, z=164.70},
        }, -- position of job menu
        blipsprite = -1154452417, -- sprite of blip. find more here https://filmcrz.github.io/blips/
        showblip = true, -- new line
		Name = 'Police', -- name of blip
        recruitmentrank = 4,
        bossrank = 7, -- the boss rank, able to hire/fire/set salaries (make sure you add the ranks as i did in the database table called society from 0 to the boss rank)
        containerid = 1, -- this has to be a unique number that matches the number set on the database table container ! 
        containername = "Police Inv.", -- the name displayed when the container is open
        billing = true, -- allow players with this job to use billing by doing /bill amount
        webhook = "https://discord.com/api/webhooks/989019931209252894/PceWaDGCFq7Tgs8YxMFg6OCqv99i5qQdaAEANDMj7hCEUp31FIOf8POIJ9lBhtrpgUyO", -- if you have webhook enabled all the information important to this job will be logged both in the admin webhook and here 
        salary = true, -- (added line) enable/disable salary system.
    },

    indios = {	   
        Pos = { 
            {x = 436.5832, y = 2241.879, z = 248.26},
            --{x=-279.21, y=809.9, z=119.3},
            --{x=-279.21, y=809.9, z=119.3},
    
        }, -- position of blip
        jobmenu = { 
            {x = 436.5832, y = 2241.879, z = 248.26},
            --{x=-279.21, y=809.9, z=119.3},
            --{x=-279.21, y=809.9, z=119.3},
    
        }, -- position of job menu
        blipsprite = 1202244626, -- sprite of blip. find more here https://filmcrz.github.io/blips/
        showblip = false, -- new line
		Name = 'Tribo Indigena', -- name of blip
        recruitmentrank = 3,
        bossrank = 3, -- the boss rank, able to hire/fire/set salaries (make sure you add the ranks as i did in the database table called society from 0 to the boss rank)
        containerid = 15, -- this has to be a unique number that matches the number set on the database table container ! 
        containername = "Indios Inv.", -- the name displayed when the container is open
        billing = false, -- allow players with this job to use billing by doing /bill amount
        webhook = "https://discord.com/api/webhooks/989020065229860924/xbT2jXR8aEEyTsqDVbvLiY4GT0DRhvhMSG66uay8kC3ZKsef4VfJ6AHE2Y2BpYmFNc--", -- if you have webhook enabled all the information important to this job will be logged both in the admin webhook and here 
        salary = false, -- (added line) enable/disable salary system.
    },

    
    indiosBW = {	   
        Pos = { 
            {x = -2695.8, y = -1498.89, z = 151.78},
        }, -- position of blip
        jobmenu = { 
            {x = -2695.8, y = -1498.89, z = 151.78},
        }, -- position of job menu
        blipsprite = 1202244626, -- sprite of blip. find more here https://filmcrz.github.io/blips/
        showblip = false, -- new line
		Name = 'Tribo Indigena de BW', -- name of blip
        recruitmentrank = 3,
        bossrank = 3, -- the boss rank, able to hire/fire/set salaries (make sure you add the ranks as i did in the database table called society from 0 to the boss rank)
        containerid = 16, -- this has to be a unique number that matches the number set on the database table container ! 
        containername = "Indios BW Inv.", -- the name displayed when the container is open
        billing = false, -- allow players with this job to use billing by doing /bill amount
        webhook = "https://discordapp.com/api/webhooks/1047896199920893954/aB04TVbkzG9sHgUDyvBcrz8CtKIsauLIy_KsMBFa0fVODuTJMjtGMC4aFeUw0hMia1wU", -- if you have webhook enabled all the information important to this job will be logged both in the admin webhook and here 
        salary = false, -- (added line) enable/disable salary system.
    },
    
    horsetrainer = {	   
        Pos = { 
            {x=-5513.87, y=-3039.92, z=-2.38},
            --{x=-279.21, y=809.9, z=119.3},
            --{x=-279.21, y=809.9, z=119.3},
    
        }, 
        jobmenu = { 
            {x = 2512.338, y = -1456.47, z = 46.312},
            --{x=-279.21, y=809.9, z=119.3},
            --{x=-279.21, y=809.9, z=119.3},
        },
        blipsprite = -963916715,
        showblip = false,
		Name = 'Treinador de Cavalos',
        recruitmentrank = 3,
        bossrank = 3,
        containerid = 3,
        containername = "Treinador de Cavalos Inv.",
        billing = true,
        webhook = "https://discord.com/api/webhooks/990475617780789269/1PbodsUKq_4eiBLdQgI6exoByv9QpGG5iIeUNwGHb0s64YX1NZfrKV1He0o4zgijh5sc",
        salary = false,

    }, 
    horsetrainerBW = {	   
        Pos = { 
            {x=-5513.87, y=-3039.92, z=-2.38},
            --{x=-279.21, y=809.9, z=119.3},
            --{x=-279.21, y=809.9, z=119.3},
    
        }, 
        jobmenu = { 
            {x = -878.454, y = -1364.75, z = 43.527},
            --{x=-279.21, y=809.9, z=119.3},
            --{x=-279.21, y=809.9, z=119.3},
        },
        blipsprite = -963916715,
        showblip = false,
		Name = 'Treinador de Cavalos',
        recruitmentrank = 3,
        bossrank = 3,
        containerid = 5,
        containername = "Treinador de Cavalos Inv.",
        billing = true,
        webhook = "https://discord.com/api/webhooks/990476536144625704/pj-orrpHb8l2kawXclFluFBYNnUZqPVhsMb8OgZm2UF59CBQ6mDit902JG12B5EAt5rc",
        salary = false,

    }, 
    horseStrawberry = {	   
        Pos = { 
            {x = -1820.03, y = -564.39, z = 156.15},
            --{x=-279.21, y=809.9, z=119.3},
            --{x=-279.21, y=809.9, z=119.3},
    
        }, 
        jobmenu = { 
            {x = -1820.03, y = -564.39, z = 156.15},
            --{x=-279.21, y=809.9, z=119.3},
            --{x=-279.21, y=809.9, z=119.3},
        },
        blipsprite = -963916715,
        showblip = false,
		Name = 'Treinador de Cavalos',
        recruitmentrank = 3,
        bossrank = 3,
        containerid = 2,
        containername = "Treinador de Cavalos Inv.",
        billing = true,
        webhook = "",
        salary = false,

    }, 

 --[[   bvs = {	   
        Pos = { 
            {x=-2558.47, y=396.16, z=148.10},
            --{x=-279.21, y=809.9, z=119.3},
            --{x=-279.21, y=809.9, z=119.3},
    
        }, 
        jobmenu = { 
            {x=-2558.47, y=396.16, z=148.10},
            --{x=-279.21, y=809.9, z=119.3},
            --{x=-279.21, y=809.9, z=119.3},
        },
        blipsprite = -963916715,
        showblip = true,
		Name = 'Hemlock Stables',
        recruitmentrank = 2,
        bossrank = 2,
        containerid = 26,
        containername = "Trainer Inv.",
        billing = true,
        webhook = "https://discord.com/api/webhooks/984249956875501638/C1Jj_Dm5mUGrIn7oa95H364sb9zHnodBkjcBnAZx55tjJWPo2O0ysminmxgTO3_dK99f",
        salary = true,

    },]]

    doctor = {	   
        Pos = { 
            {x = -287.426, y = 806.9997, z = 119.38},
            {x = 2726.7, y = -1231.86, z = 50.37},
            {x = -1803.36, y = -430.36, z = 158.83},
            {x = -3666.41, y = -2600.85, z = -13.58},
        }, 
        jobmenu = { 
            {x = -284.307, y = 810.9274, z = 119.38},
            {x = 2726.7, y = -1231.86, z = 50.37},
            {x = -1806.09, y = -429.01, z = 158.83},
            {x = -3692.82, y = -2752.30, z = -31.38},
        },
        blipsprite = -592068833,
		Name = 'Medico',
        recruitmentrank = 3,
        bossrank = 3,
        containerid = 4,
        containername = "Medicos Inv.",
        billing = true,
        webhook = "https://discord.com/api/webhooks/989020197174247465/8QmIwmLwTWQ88GUoypbGJ6uUglLWsAXDrXNiSkgn4DNMlg4pZ2UH0zjz1zemrrbtAMjV",
        salary = true,

    },

    Botanico = {	   
        Pos = { 
            {x = 2721.35, y = -1232.85, z = 50.37},    
        }, 
        jobmenu = { 
            {x = 2721.35, y = -1232.85, z = 50.37},
        },
        blipsprite = -592068833,
        showblip = false,
		Name = 'Botanico',
        recruitmentrank = 2,
        bossrank = 3,
        containerid = 6,
        containername = "Botanico Inv.",
        billing = true,
        webhook = "https://discordapp.com/api/webhooks/1047894029704122398/QCY6bX0UtB-1lSpRUQ-woP-BanlrXaWuTZkFy50he4kS3VJ1W1stDofWwKSvW3ujahVW",
        salary = false,

    },

    bastille = {	   
        Pos = { 
            {x=2640.08, y=-1222.74, z=53.38},    
        }, 
        jobmenu = { 
            {x=2640.08, y=-1222.74, z=53.38},
        },
        blipsprite = 1654787099,
		Name = 'Saloon da bastilha',
        recruitmentrank = 2,
        bossrank = 2,
    --    containerid = 6,
        showblip = true,
        containername = "Bar Inv.",
        billing = true,
        webhook = "https://discord.com/api/webhooks/989020334495789077/Ne1ZH9K6ac-NzXi9TWEyAJaoPaIKQLjV3M2tMV09X2zm7btOLAdoBwPviY4srQR_0Ccw",
        salary = false,

    },
  --[[  sgs = {	   
        Pos = { 
            {x=-1795.06, y=-385.79, z=157.08},
            --{x=-279.21, y=809.9, z=119.3},
            --{x=-279.21, y=809.9, z=119.3},
    
        }, 
        jobmenu = { 
            {x=-1795.06, y=-385.79, z=157.08},
            --{x=-279.21, y=809.9, z=119.3},
            --{x=-279.21, y=809.9, z=119.3},
        },
        blipsprite = -1954662204,
		Name = 'Popalone Brothers General',
        recruitmentrank = 5,
        bossrank = 5,
        containerid = 7,
        showblip = false,
        containername = "General Store Inv.",
        billing = true,
        webhook = "https://discord.com/api/webhooks/902613925495984209/3jJdMtOA9pYQE1UJNhyeyziD9-WgNbmpKHuWrUSiu7aOinstrZf9n1NDdeZLpF7t6DrA",
        salary = true,

    },]]
    rdguns = {	   
        Pos = { 
            {x=1323.77, y=-1321.71, z=77.88},
        }, 
        jobmenu = { 
            {x = 1320.209, y = -1326.08, z = 77.884},
        },
        blipsprite = -888054767,
		Name = 'Armaria de Rhodes',
        recruitmentrank = 2,
        bossrank = 2,
    --    containerid = 8,
        showblip = true,
        containername = "Armaria de Rhodes Inv.",
        billing = true,
        webhook = "https://discord.com/api/webhooks/989020478687547412/dSxZRh9xR6PlvQDH-kMGed2h4yZjV8weZtvNbmsAZ4Ppx0ps2RXiZ1-dXBxTg8zHu4dp",
        salary = false,

    },

    armariaSaintDenis = {	   
        Pos = { 
            {x = 2716.183, y = -1284.09, z = 49.630},
        }, 
        jobmenu = { 
            {x = 2712.709, y = -1290.07, z = 49.630},
        },
        blipsprite = -888054767,
		Name = 'Armaria de Saint Denis',
        recruitmentrank = 2,
        bossrank = 2,
    --    containerid = 27,
        showblip = true,
        containername = "Armaria de Saint Denis Inv",
        billing = true,
        webhook = "https://discord.com/api/webhooks/989020602830561290/4S6nYV2RxbES6WXE-OZO-2KANVDO3JmsZrvRS-JCYoVUzyBn3a-LwmOW1xleYABPjyOa",
        salary = false,

    },

    armariaValentine = {	   
        Pos = { 
            {x = -280.806, y = 780.7141, z = 119.52},
            --{x=-279.21, y=809.9, z=119.3},
            --{x=-279.21, y=809.9, z=119.3},
    
        }, 
        jobmenu = { 
            {x = -283.627, y = 778.1817, z = 119.50},
            --{x=-279.21, y=809.9, z=119.3},
            --{x=-279.21, y=809.9, z=119.3},
        },
        blipsprite = -888054767,
        showblip = true,
		Name = 'Armaria de Valentine',
        recruitmentrank = 2,
        bossrank = 2,
    --    containerid = 16,
        containername = "Armaria de Valentine Inv.",
        billing = true,
        webhook = "https://discord.com/api/webhooks/989020760213438474/IUhVK48gvWCB_jzMIeswgFfpaw3XKYGvMo95_RjIgLiyW_f5rNHKgabbZwGe5mpxVe0H",
        salary = false,

    },
    
    Bwguns = {	   
        Pos = { 
            {x = -831.475, y = -1266.73, z = 44.424},
            --{x=-279.21, y=809.9, z=119.3},
            --{x=-279.21, y=809.9, z=119.3},
    
        }, 
        jobmenu = { 
            {x = -831.475, y = -1266.73, z = 44.424},
            --{x=-279.21, y=809.9, z=119.3},
            --{x=-279.21, y=809.9, z=119.3},
        },
        blipsprite = -888054767,
        showblip = true,
		Name = 'Armaria de BlackWater',
        recruitmentrank = 2,
        bossrank = 2,
    --    containerid = 16,
        containername = "Armaria de BlackWater Inv.",
        billing = true,
        webhook = "https://discord.com/api/webhooks/1020789770722480310/Unw0ktVXZHq8EWxM6eI__1av1N7J_cVn2Z4htZw8R6TGjTpleCh8T-47jabO9rAvsScr",
        salary = false,

    },
    armsaloon = {	   
        Pos = { 
            {x = -3705.01, y = -2594.20, z = -13.31},   
        }, 
        jobmenu = { 
            {x = -3698.42, y = -2594.82, z = -13.31},
        },
        blipsprite = 1654787099,
        showblip = true,
		Name = 'Saloon de Armadillo',
        recruitmentrank = 2,
        bossrank = 2,
    --    containerid = 29,
        containername = "Saloon de Armadillo Inv",
        billing = true,
        webhook = "https://discord.com/api/webhooks/1022888045856440401/757RkOlnFXH1Zsv8BKYwWDsOFCbmOFeShT_0Orfvixk4Gk071WT6yRvdg0Xk72Ohyybf",
        salary = false,

    },

    armaria = {	   
        Pos = { 
            {x = -5506.55, y = -2963.71, z = -0.636},
    
        }, 
        jobmenu = { 
            {x = -5506.55, y = -2963.71, z = -0.636},

        },
        blipsprite = 2107754879,
        showblip = false,
		Name = 'Bando',
        recruitmentrank = 2,
        bossrank = 2,
        containerid = 19,
        containername = "Bando Inv.",
        billing = true,
        webhook = "https://discord.com/api/webhooks/989020878509580348/Uud6zMHGveoJfsOwyjq0axRa4_viu2YooGaaXONwlrfjD3oPDbuYoBlxyQinL3u2ovwT",
        salary = false,

    },

    Herbalista = {	   
        Pos = { 
            {x = 2586.270, y = -1010.45, z = 44.239},
    
        }, 
        jobmenu = { 
            {x = 2586.270, y = -1010.45, z = 44.239},

        },
        blipsprite = 2107754879,
        showblip = false,
		Name = 'Bruxa',
        recruitmentrank = 2,
        bossrank = 2,
        containerid = 31,
        containername = "Bruxa Inv.",
        billing = true,
        webhook = "https://discord.com/api/webhooks/992364227937435781/NIVVr7ZMx0UUxWxyN5SDa_noXNdu9SAJSMeiCRzE6RM7BeyNTQ1foFiUdR1rULiz0PQQ",
        salary = false,

    },

    valsaloon = {	   
        Pos = { 
            {x = -309.500, y = 806.3518, z = 118.97},  
        }, 
        jobmenu = { 
            {x = 1784.830, y = -816.677, z = 189.40},
        },
        blipsprite = 1654787099,
        showblip = true,
		Name = 'Saloon de Valentine',
        recruitmentrank = 2,
        bossrank = 2,
    --    containerid = 25,
        containername = "Saloon de Valentine Inv",
        billing = true,
        webhook = "https://discord.com/api/webhooks/989020990686248970/8WzFjsr-pwbyRkMdteix7YOONSJEPa_e_pghDmQ7x5LV_DMQP0tnBgMHuKhsf6PrxObR",
        salary = false,

    },


    bwsaloon = {	   
        Pos = { 
            {x = -815.761, y = -1319.55, z = 43.678},   
        }, 
        jobmenu = { 
            {x = -819.807, y = -1321.07, z = 43.678},
        },
        blipsprite = 1654787099,
        showblip = true,
		Name = 'Saloon de BlackWater',
        recruitmentrank = 2,
        bossrank = 2,
    --    containerid = 28,
        containername = "Saloon de BlackWater Inv",
        billing = true,
        webhook = "https://discord.com/api/webhooks/989021115848486922/UhsHzk0CfNKBYq8UArVV5hVdstZxAyzU75sGsXoajCCj7_vUoT7t6HrWGgeLuXWsRSzv",
        salary = false,

    },

    rhodessaloon = {	   
        Pos = { 
            {x = 1343.469, y = -1374.51, z = 80.488},   
        }, 
        jobmenu = { 
            {x = 1338.18, y = -1368.74, z = 80.49},
        },
        blipsprite = 1654787099,
        showblip = true,
		Name = 'Saloon de Rhodes',
        recruitmentrank = 2,
        bossrank = 2,
    --    containerid = 29,
        containername = "Saloon de Rhodes Inv",
        billing = true,
        webhook = "https://discord.com/api/webhooks/1051500224520142919/7KZh3zDtet8O2c8nsAP4cHnh1RZ4tkuWhFbTVFzLOh0a2FDPZMW74eV5pKl6xzzIzWNI",
        salary = false,

    },

    ferreiro = {	   
        Pos = { 
            {x=-878.96, y=-1368.10, z=43.52},    
        }, 
        jobmenu = { 
            {x=-365.22, y=795.95, z=116.22},
        },
        blipsprite = 2107754879,
        showblip = false,
		Name = 'Ferreiro',
        recruitmentrank = 2,
        bossrank = 2,
    --    containerid = 31,
        containername = "Ferreiro Inv.",
        billing = true,
        webhook = "https://discord.com/api/webhooks/1042904563969179738/HcGmSAMRXcf-Wbc6wluo9jo1fAzIFvP1UFwUsUCKD84_p8vgeVr6sqplFXghVG4VQSKy",
        salary = false,

    }, 
    ferreiro2 = {	   
        Pos = { 
            {x = -1816.04, y = -567.46, z = 155.99}
        }, 
        jobmenu = { 
            {x = -1816.04, y = -567.46, z = 155.99}
        },
        blipsprite = 2107754879,
        showblip = false,
		Name = 'Ferreiro2',
        recruitmentrank = 2,
        bossrank = 2,
    --    containerid = 31,
        containername = "Ferreiro 2 Inv.",
        billing = true,
        webhook = "https://discord.com/api/webhooks/1042904654398357544/Lne7BWfq5XyF2FIclGRruUuzeeIZbBzyZ16E9J5un_Jf8J6gqZ_SIT_Hn1sU6rdhpf9a",
        salary = false,

    },

    ferreiro3 = {	   
        Pos = { 
            {x = -5517.89, y = -3042.03, z = -2.39}
        }, 
        jobmenu = { 
            {x = -5517.89, y = -3042.03, z = -2.39}
        },
        blipsprite = 2107754879,
        showblip = false,
		Name = 'Ferreiro3',
        recruitmentrank = 2,
        bossrank = 2,
    --    containerid = 31,
        containername = "Ferreiro 3 Inv.",
        billing = true,
        webhook = "https://discord.com/api/webhooks/1049343388178194514/F_DfcxLqjv3sS6RefgND07nJR5FjJvXi7GU-N4ipqKmjw9V7FZNojvy30LT8WayVupJ9",
        salary = false,

    },

  --[[  DocotorValentine = {	   
        Pos = { 
            {x = -287.426, y = 806.9997, z = 119.38},
    
        }, 
        jobmenu = { 
            {x = -284.307, y = 810.9274, z = 119.38},

        },
        blipsprite = 1109348405,
        showblip = true,
		Name = 'Medico Valentine',
        recruitmentrank = 3,
        bossrank = 4,
        containerid = 32,
        containername = "Medico Valentine Inv.",
        billing = true,
        webhook = "",
        salary = true,

    },

    DoctorSD = {	   
        Pos = { 
            {x = 2719.761, y = -1230.86, z = 50.367},
    
        }, 
        jobmenu = { 
            {x = 2722.859, y = -1234.20, z = 50.368},

        },
        blipsprite = 1109348405,
        showblip = true,
		Name = 'Medico Sd',
        recruitmentrank = 2,
        bossrank = 2,
        containerid = 33,
        containername = "Medico Sd Inv.",
        billing = true,
        webhook = "",
        salary = true,

    },]]

    newspaper = {	   
        Pos = { 
            {x = 2615.12, y = -1341.9, z = 50.12},
            --{x=-279.21, y=809.9, z=119.3},
            --{x=-279.21, y=809.9, z=119.3},
    
        }, 
        jobmenu = { 
            {x = 2615.12, y = -1341.9, z = 50.12},
            --{x=-279.21, y=809.9, z=119.3},
            --{x=-279.21, y=809.9, z=119.3},
        },
        blipsprite = 587827268,
        showblip = true,
		Name = 'Newspaper Co',
        recruitmentrank = 2,
        bossrank = 2,
        containerid = 64,
        containername = "Baú Jornalista",
        billing = true,
        webhook = "https://discord.com/api/webhooks/1000471104097357824/g8NfD4xt-i_hOjCJ471xcT1Cv5Eb6Y8zgyt32udryCrxsShtglDWAWuxdb3nfj4PYN84",
        salary = true,

    },
    mineirador = {	   
        Pos = { 
            {x = -1815.7, y = -427.92, z = 160.05},
            --{x=-279.21, y=809.9, z=119.3},
            --{x=-279.21, y=809.9, z=119.3},
    
        }, 
        jobmenu = { 
            {x = -1819.3, y = -432.65, z = 160.05},
            --{x=-279.21, y=809.9, z=119.3},
            --{x=-279.21, y=809.9, z=119.3},
        },
        blipsprite = 2107754879,
        showblip = true,
		Name = 'Companhia EVDERN',
        recruitmentrank = 4,
        bossrank = 4,
        containerid = 74,
        containername = "Baú Mineirador",
        billing = true,
        webhook = "https://discord.com/api/webhooks/1030729219308781650/4musazcLyUxPbqRc9QPJB9mX5zdtek6XpITDqmitvmBce-CKPb-4ZxFnVsrBk7cVbSwm",
        salary = true,

    },
    hotel = {	   
        Pos = { 
            {x = -1817.30, y = -370.636, z = 163.29},
            --{x=-279.21, y=809.9, z=119.3},
            --{x=-279.21, y=809.9, z=119.3},
    
        }, 
        jobmenu = { 
            {x = -1817.30, y = -370.636, z = 163.29},
            --{x=-279.21, y=809.9, z=119.3},
            --{x=-279.21, y=809.9, z=119.3},
        },
        blipsprite = 2107754879,
        showblip = false,
		Name = 'Hotel/Saloon',
        recruitmentrank = 2,
        bossrank = 2,
        containerid = 70,
        containername = "Baú Mineirador",
        billing = false,
        webhook = "",
        salary = false,

    },
    Estado = {	   
        Pos = { 
            {x = 1018.46, y = -1778.29, z = 47.78},
    
        }, 
        jobmenu = { 
            {x = 1018.46, y = -1778.29, z = 47.78},
        },
        blipsprite = 2107754879,
        showblip = false,
		Name = 'Estado',
        recruitmentrank = 2,
        bossrank = 2,
        containerid = 75,
        containername = "Baú Estado",
        billing = true,
        webhook = "https://discord.com/api/webhooks/1067262509477793803/19oATXL8M_tLhjEhBh9lZ4mxy5aqJ3lsA_wOFuyzic1WxBUkKn58NzTuUlzC8tgJMA4c",
        salary = true,

    },
    indiosAR = {	   
        Pos = { 
            {x = -2725.76, y = -2389.83, z = 45.1},
    
        }, 
        jobmenu = { 
            {x = -2725.76, y = -2389.83, z = 45.1},
        },
        blipsprite = 2107754879,
        showblip = false,
		Name = 'Indios',
        recruitmentrank = 3,
        bossrank = 3,
        containerid = 77,
        containername = "Baú Indios Armadillo",
        billing = false,
        webhook = "https://discord.com/api/webhooks/1069754119511875725/ugRimQ4F5dV3dlzJja4KLMGCZlOKEfDazocWbkAZAXc0vugBZhqwApL_RXxVk78jZWeI",
        salary = false,

    },
    Padeiro = {	   
        Pos = { 
            {x = 2673.67, y = -1157.3, z = 50.79},    
        }, 
        jobmenu = { 
            {x = 2673.67, y = -1157.3, z = 50.79},
        },
        blipsprite = 2107754879,
        showblip = false,
		Name = 'Padaria',
        recruitmentrank = 3,
        bossrank = 3,
        containerid = 90,
        containername = "Baú Padaria",
        billing = true,
        webhook = "https://discord.com/api/webhooks/1075521902816272507/w9gUwNBT7za73bb_a3Y256oKLWxme5kJxZlnytSfUnOrLf-qXRqkhJvoTnrzq6WPy7yH",
        salary = false,

    },
    Confeiteiro = {	   
        Pos = { 
            {x = -787.56, y = -1293.99, z = 43.74},    
        }, 
        jobmenu = { 
            {x = -787.56, y = -1293.99, z = 43.74},
        },
        blipsprite = 2107754879,
        showblip = false,
		Name = 'Confeiteiro',
        recruitmentrank = 3,
        bossrank = 3,
        containerid = 95,
        containername = "Baú Doceria",
        billing = true,
        webhook = "https://discord.com/api/webhooks/1075521989168594984/rkDv4kP4jHZbggIvlHLYBfJGvUpZ6kwgsIcPM13gRq8YWdzj-pBiP1NbT9IyOuKKOWrs",
        salary = false,

    },
}
-------------------
Config.alertsfunction = false 

Config.alerts = { 
    police = { -- job name
        command = "alertpolice",
        jobs = {"police"}, -- jobs the alert is sent to
        msg = "Ajuda Policial requisitada, verifique o mapa", -- alert sent to the players with the job name 
        isdoctor = false,
        blip = {
            blipsprite = 2119977580,
            Name = 'Alerta Policial',
        }
    },
    doctor = {
        command = "alertdoctor",
        jobs = {"doctor"},
        msg = "Ajuda médica necessária, verifique o mapa",
        isdoctor = true,
        blip = {
            blipsprite = 2119977580,
            Name = 'Alerta médico',
        }
    },
}
Config.medicresponse = "resp"
Config.cancelblipcommand = "calert" -- removes alert blips
Config.alertcooldown = 20 -- seconds
Config.viewonduty = "viewduty" -- allows admins or job boss rank to viw who is on duty. for boss rank players its just /viewduty, for admins its /viewduty jobname
Config.ondutycommand = "onduty"
Config.offdutycommad = "offduty"
Config.checkduty = "checkduty"
Config.nosalaryoffduty = true -- dont pay salary to off duty players for the jobs listed below 
Config.dutyjobs = {"Estado", 'police', 'doctor'}
Config.afkoffdutytimer = 20 -- go off duty if you are alerted and afk for 20 minutes
Config.ondutyinstant = true -- instantly go on duty when command is used 
Config.ondutytime = 2.5 -- minutes 
Config.dutywebhooks = { 
    doctor = "https://discord.com/api/webhooks/1069376904416739428/5I4YXAZAWhSDCiUSuKTCmZBzhEt4OzGA7VIBiiPd34vR2kGKtFOXO4D0dxrCDupsrR_C",
    police = "https://discord.com/api/webhooks/989021615654309908/M2tlH2JaDLWo1sUM8AgjNRcttluHkt5xG-ZsKRsB6W3TL7CZamQR51sBxAODs-cbnIo4",
    Estado = "https://discord.com/api/webhooks/1067262509477793803/19oATXL8M_tLhjEhBh9lZ4mxy5aqJ3lsA_wOFuyzic1WxBUkKn58NzTuUlzC8tgJMA4c"
}
----------------
Config.Language = {
    SelectedJob = "Você selecionou o trabalho :", 
    changingroom = "Vestiário",
    manageemployees = "Gerenciar funcionários",
    jobmenu = "Menu de Trabalho",
    nooutfits = "Nenhuma roupa salva",
    outfits = "Outfits",
    yourjobis = "seu cargo é : ",
    hire = "Contratar",
    fire = "Despedir",
    setsalary = "Definir salário",
    setrank = "Definir classe",
    cantfire = "Não pode despedir você mesmo",
    canthire = "Não pode contratar você mesmo",
    youhired = "Você contratou ",
    youfired = "Você demitiu ",
    hired = "Você foi contratado como ",
    fired = "Você foi demitido de ",
    changerank = "Você mudou a classe de trabalho de ",
    rankchanged = "sua classe de trabalho foi alterada para ",
    cantchangerank = "Você não pode mudar sua própria classe",
    highestrank = "Você não pode classificar acima ou igual à classe mais alta, classe: ",
    Torank = " Classe: ",
    listrank = " // Classe: ",
    confirm = "Confirmar",
    playerid = "Player ID",
    rank = "Classe",
    salarys = "Salario",
    salary = "Você recebeu um pagamento de salário de: ",
    maxsalary = "Não pode exceder o salário máximo de : ",
    salaryupdated = "Você atualizou o salário da classe ",
    to = " para ",
    from = " de ",
    noledgercash = "O caixa da sua sociedade não tem dinheiro suficiente para pagar o salário",
    ledger = "caixa",
    ledgercash = "Dinheiro do caixa : ",
    depositcash = "Depositar Dinheiro",
    withdrawcash = "Retirar o dinheiro",
    deposited = "Você depositou : ",
    invalidamount = "Montante inválido",
    withdrew = "Você retirou : ",
    inventory = "Inventário",
    qt = "Quantidade inválida",
    carry = "Você não pode carregar mais itens",
    limit = "Você atingiu o limite para este item",
    someoneisclose = "Alguém está muito perto de você",
    noplayer = "Nenhuma pessoa por perto",
    finesent = "Você enviou um valor de fatura de :",
    finerecieve = "Você recebeu um valor de fatura de :",
    bills = "Suas contas:",
    billpaid = "Você pagou um valor de fatura de: ",
    takena = " Tirou um ",
    taken = " Foi Retirado ",
    put = " Depositado ",
    issuedbill = " Emitiu um valor de fatura de ",
    paidbill = " Pagou um valor de fatura de",
    withdrews = " @here Retirou uma quantidade de ",
    deposits = " Depositou uma quantia de ",
    billss = "Contas:",
    viewbills = "Ver as contas",
    drawtextjobmenu = "Pressione G para o menu de trabalho", 
    drawtextjobcenter = "Pressione G para o centro de trabalho", 
    nocash1 = "Você não tem dinheiro suficiente", 
    maxslots = "Não consigo armazenar mais itens, o limite de slot é ", -- newline	
    dothis = "~e~faça /",
    toremovenoti = " para remover notificações",
    needsyourhelp = "Alguém precisa da sua ajuda, verifique seu mapa ~e~(/",
    needsyourhelp2 = "~e~Alguém precisa da sua ajuda, verifique seu mapa",
    torespond = ")~q~ para responder", 
    docontheway = "~e~Médico está a caminho",
    nodoc = "~e~ Nenhum médico disponível",
    youonduty = "~e~ Você está em serviço",
    youoffduty = "~e~ Você está de folga",
    duty = " Em serviço",
    offD = " De folga",
    serverid = "Server ID: ",
    noneavailable = "Não disponível", 
    waitafew = "Cant Spam Wait a Few", 
    alertsent = "Alerta enviado", 
    afkoffduty = "Você foi retirado de serviço por ser AFK",
    wentonduty = "Está de plantão",
    wentoffduty = "Está de folga",
    cantgoonduty = "Não pode trabalhar se estiver amarrado, morto ou algemado"
}
