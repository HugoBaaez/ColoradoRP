Config = {}
Config.keys = {
    -- change the hashes to the keys u want, do not change the writings in qoutes. for example if u wana change B do ["B"] = (CHANGE THIS 0x8AAA0AD4), do not change whats inside those brackets > ["B"]
    ["G"] = 0x760A9C6F,
    ["1"] = 0xE6F612E4,
    ["2"] = 0x1CE6D9EB,
    ["3"] = 0x4F49CC4C,
    ["4"] = 0x8F9F9E58,
}

---------------------- new line
Config.syndual = false --- true if you own syn dual. 
-----------------------
Config.updatedinventoryammo = true -- use if using updated inventory with new ammo system 

Config.adminwebhook = "https://discord.com/api/webhooks/991436409686736927/iznIgJdZUMtwEyAy83-v1RX-AvDZOfcJ5IXnjRFMctBTdZafMb9UO-NYyMZYq6ftWkMX"
Config.jobonly = true -- only players with mentioned jobs below can access crafting/customization station
Config.job ={ "indios", "indiosBW", "rdguns", "armariaSaintDenis", "armariaValentine", "armaria", "ferreiro", "Bwguns", "Herbalista", "ferreiro2", "ferreiro3", "indiosAR"}
Config.jobrankcustomization = 2
Config.jobrankcrafting = 0

Config.weaponshops = true -- endable or disable weapon shops

Config.craftinganimations = "WORLD_HUMAN_CROUCH_INSPECT" -- animation for crafting
Config.customizationanimation = "WORLD_HUMAN_WRITE_NOTEBOOK" -- animations for customizations

Config.customizationLocations = { 
    Valentine = {	   
        Pos = {x= -277.22, y=778.922, z=119.50}, -- location weapon customization station
        Pos2 = {x= -276.47, y=778.922, z=119.80}, -- location spawned weapon 3d model
    },
    Rhodes = {	   
        Pos = {x= 1327.09, y=-1321.91, z=77.88}, -- location weapon customization station
        Pos2 = {x= 1326.09, y=-1321.91, z=78.28}, -- location spawned weapon 3d model
    },
    SD ={
        Pos = {x = 2709.659, y = -1285.56, z = 49.625},
        Pos2 = {x = 2708.659, y = -1285.56, z = 50.025},
    },
    ValFerreiro = {
        Pos = {x = -360.96, y = 801.85, z = 116.76},
        Pos2 = {x = -359.96, y = 801.85, z = 116.96},
    },
    Bw = {
        Pos = {x = -827.546, y = -1275.12, z = 44.059},
        Pos2 = {x = -828.073, y = -1274.59, z = 44.059}
    },
    FerreiroSTB = {
        Pos = {x = -1817.98, y = -570.29, z = 155.97},
        Pos2 = {x = -1819.049, y = -569.5943, z = 156.2037}
    },
    FerreiroTU = {
        Pos = {x = -5517.56, y = -3041.59, z = -2.39},
        Pos2 = {x = -5517.169, y = -3040.386, z = -2.581709}
    },
    BandoIlegal = {
        Pos = {x = -5505.93, y = -2965.84, z = -0.64},
        Pos2 = {x = -5506.854, y = -2966.053, z = -0.5064524}
    }

}

Config.craftinglocation = { 
    Valentine = {	   
        Pos = {x= -277.0, y=780.689, z=119.68}, -- location weapon crafting station
    },
    Rhodes = {	   
        Pos = {x= 1329.68, y=-1320.9, z=77.88}, -- location weapon crafting station
    },
    Indio = {
        Pos = { x = 465.4, y = 2249.8, z = 248.3}, --location weapon crafting station
    },
    Bando = {
        Pos = {x = -5507.69, y = -2968.64, z = -0.632},
    },
    SD = {
        Pos = {x = 2710.663, y = -1287.97, z = 49.486},
    },
    Bw = {
        Pos = {x = -828.573, y = -1278.66, z = 44.057},
    },
    IndiosBW = {
        Pos = {x = -2694.45, y = -1484.8, z = 148.49},
    },
    Bruxas = {
        Pos = {x = 2619.13, y = -1017.25, z = 44.29},
    },
    indiosAR = {
        Pos = {x = -2693.4, y = -2369.33, z = 45.99},
    },
}


----------- DO NOT CHANGE THE LABELS IN THE WEPCOMP.JSON FILE ! IF YOU SO YOU WILL BREAK THE SCRIPT!!!!!!!!!!!
Config.customizationcurrency = 0 -- 0 for cash, 1 for gold.
Config.price = {
    variant = 100,
    griptype = 20,
    gripdecal = 10,
    decalframe = 15,
    decalbarrel = 20,
    decalextra = 15,
    wrapcolor = 5,
    sight = 100,
    rifling = 50,
    barrel = 50,
    wrap = 15,
    gold = 40,
    silver = 30,
    bluesteel = 25,
    brownsteel = 25,
    blacksteel = 25,
    copper = 10,
    nickle = 10,
    brass = 10,
    iron = 10
}

---------------------------------------------------------
