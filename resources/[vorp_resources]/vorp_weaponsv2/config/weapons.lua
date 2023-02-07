Config4 = {}
Config4.weapons = {  
    ["Melee"] = {
        ["Faca da Guerra Civil"] = {	
            hashname = "WEAPON_MELEE_KNIFE_CIVIL_WAR",     
            letcraft = true, --show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable 
            jobonly = true,
            jobs = {},
            materials = {
                item1 = {name = "iron", amount = 2},
                item2 = {name = "wood", amount = 1},
                item3 = {name = "Small_Leather", amount = 1},
            }, 
        },
        ["Lanterna De Hallowen"] = {	
            hashname = "WEAPON_MELEE_LANTERN_HALLOWEEN",     
            letcraft = true, --show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable 
            jobonly = true,
            jobs = {"rdguns"},
            materials = {
                item1 = {name = "ferro", amount = 1},
                item2 = {name = "barraaco", amount = 1},
                item3 = {name = "animalfat", amount = 1},
            }, 
        },
    },
    ["Arcos"] = {
        ["Arco"] = {	
            hashname = "WEAPON_BOW",
            jobonly = true,
            jobs = {"indios", "indiosBW", "rdguns", "armariaSaintDenis", "armariaValentine","Bwguns","indiosAR"},     
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            materials = {
                item1 = {name = "toco_pinho", amount = 10},
                item2 = {name = "barraaco", amount = 4},
            }, 
        },
        ["Arco Melhorado"] = {	
            hashname = "WEAPON_BOW_IMPROVED",   
            jobonly = true,
            jobs = {"indios", "indiosBW","indiosAR"},  
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            materials = {
                item1 = {name = "toco_pinho", amount = 10},
                item2 = {name = "barraaco", amount = 4},
                item3 = {name = "tira_abeto", amount = 5},
            }, 
        },
    },
    ["Rifles"] = {
        ["Rifle de ferrolho"] = {	
            hashname = "WEAPON_RIFLE_BOLTACTION",  
            jobonly = true,
            jobs = {"rdguns", "armariaSaintDenis", "armariaValentine","Bwguns"},
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable   
            materials = {
                item1 = {name = "coronhariflemelhorado", amount = 1},
                item2 = {name = "corporifle", amount = 1},
                item3 = {name = "canorifle", amount = 1},
                item4 = {name = "boltblueprint", amount = 1},
            }, 
        },
    },
    ["Shotgun"] = {
        ["Escopeta Semi-Automática"] = {
            hashname = "WEAPON_SHOTGUN_SEMIAUTO",
            jobonly = true,
            jobs = {"armaria"},
            letcraft = true,
            materials = {
                item1 = {name = "coronhariflemelhorado", amount = 1},
                item2 = {name = "corporifle", amount = 1},
                item3 = {name = "canorifle", amount = 1},
                item4 = {name = "shotgunblueprint", amount = 1},
            },
        },
    },
    ["Repetidores"] = {
        ["Repetidor Winchester"] = {	
            hashname = "WEAPON_REPEATER_WINCHESTER",   
            jobonly = true,
            jobs = {"rdguns", "armariaSaintDenis", "armariaValentine","Bwguns"}, 
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable 
            materials = {
                item1 = {name = "coronhariflemelhorado", amount = 1},
                item2 = {name = "corporifle", amount = 1},
                item3 = {name = "canorifle", amount = 1},
                item4 = {name = "winchesterblueprint", amount = 1},
            }, 
        },
        ["Repetidor Henry"] = {	
            hashname = "WEAPON_REPEATER_HENRY", 
            jobonly = true,
            jobs = {"rdguns", "armariaSaintDenis", "armariaValentine","Bwguns"},    
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            materials = {
                item1 = {name = "coronharifle", amount = 1},
                item2 = {name = "corporifle", amount = 1},
                item3 = {name = "canorifle", amount = 1},
                item4 = {name = "henryblueprint", amount = 1},
            }, 
        },
        ["Carabina de Repetição"] = {	
            hashname = "WEAPON_REPEATER_CARBINE",   
            jobonly = true,
            jobs = {"rdguns", "armariaSaintDenis", "armariaValentine","Bwguns"}, 
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable 
            materials = {
                item1 = {name = "coronharifle", amount = 1},
                item2 = {name = "corporifle", amount = 1},
                item3 = {name = "canorifle", amount = 1},
                item4 = {name = "carabineblueprint", amount = 1},
            }, 
        },
    },
    ["Pistolas"] = {
            ["Pistola Semi-Automatica"] = {	
            hashname = "WEAPON_PISTOL_SEMIAUTO",   
            jobonly = true,
            jobs = {"armaria"},  
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            materials = {
                item1 = {name = "coronhapistolamelhorado", amount = 1},
                item2 = {name = "corpopistola", amount = 1},
                item3 = {name = "canopistola", amount = 1},
                item4 = {name = "semiautoblueprint", amount = 1},
            }, 
        },
        ["Pistola Volcanic"] = {	
            hashname = "WEAPON_PISTOL_VOLCANIC",   
            jobonly = true,
            jobs = {"armaria"}, 
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            materials = {
                item1 = {name = "coronhapistolamelhorado", amount = 1},
                item2 = {name = "corpopistola", amount = 1},
                item3 = {name = "canopistola", amount = 1},
                item4 = {name = "volcanicblueprint", amount = 1},
            }, 
        },
        ["Pistola M1899"] = {	
            hashname = "WEAPON_PISTOL_M1899",  
            jobonly = true,
            jobs = {"armaria"},   
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            materials = {
                item1 = {name = "coronhapistolamelhorado", amount = 1},
                item2 = {name = "corpopistola", amount = 1},
                item3 = {name = "canopistola", amount = 1},
                item4 = {name = "m1899blueprint", amount = 1},
            }, 
        },
        
    }, 
    ["Revolvers"] = {
        ["Revólver Schofield"] = {	
            hashname = "WEAPON_REVOLVER_SCHOFIELD",  
            jobonly = true,
            jobs = {"rdguns", "armariaSaintDenis", "armariaValentine","Bwguns"}, 
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable  
            materials = {
                item1 = {name = "coronhapistolapadrao", amount = 1},
                item2 = {name = "corpopistola", amount = 1},
                item3 = {name = "canopistola", amount = 1},
                item4 = {name = "schofieldblueprint", amount = 1},
            }, 
        },
        ["Revolver Lemat "] = {	
            hashname = "WEAPON_REVOLVER_LEMAT",   
            jobonly = true,
            jobs = {"rdguns", "armariaSaintDenis", "armariaValentine","Bwguns"}, 
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            materials = {
                item1 = {name = "coronhapistolapadrao", amount = 1},
                item2 = {name = "corpopistola", amount = 1},
                item3 = {name = "canopistola", amount = 1},
                item4 = {name = "lematblueprint", amount = 1},
            }, 
        },
        ["Revolver Cattleman"] = {	
            hashname = "WEAPON_REVOLVER_CATTLEMAN",  
            jobonly = true,
            jobs = {"rdguns", "armariaSaintDenis", "armariaValentine","Bwguns"},   
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            materials = {
                item1 = {name = "coronhapistolapadrao", amount = 1},
                item2 = {name = "corpopistola", amount = 1},
                item3 = {name = "canopistola", amount = 1},
                item4 = {name = "cattleblueprint", amount = 1},
            }, 
        },
    },
    ["Arremessáveis"] = { -- Due to vorp bug, using this weapon never runs out of ammo if u requip. 
    -- in order for throwables to work. the player must buy the throwable weapon then buy and use the related ammo box
    -- only then will the throwable show up in their weapon wheel 
        ["Tomahawk"] = {	
            hashname = "WEAPON_THROWN_TOMAHAWK",  
            jobonly = true,
            jobs = {"indios", "indiosBW","indiosAR"},  
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            materials = {
                item1 = {name = "toco_pinho", amount = 1},
                item2 = {name = "ferro", amount = 2},
                item3 = {name = "barraaco", amount = 3},
            }, 
        },
        ["Poison Bottle"] = {	
            hashname = "weapon_thrown_poisonbottle", 
            jobonly = true,
            jobs = {"Herbalista"},   
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            craftcost = 0,
            materials = {
                item1 = {name = "moonshine", amount = 1},
                item2 = {name = "feather", amount = 1},
                item3 = {name = "veleno_s", amount = 2},
            }, 
        },
       --[[ ["Bolas"] = {	
            hashname = "weapon_thrown_bolas",  
            jobonly = true,
            jobs = {"rdguns", "armariaSaintDenis", "armariaValentine","Bwguns", "Herbalista"},   
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            craftcost = 0,
            materials = {
                item1 = {name = "Small_Leather", amount = 0},
                item2 = {name = "wood", amount = 0},
                item3 = {name = "rock", amount = 0},
            }, 
        },]]
    }, 
}