Config = {}

Config.vorp = true -- dont change 

Config.keys = {
    -- change the hashes to the keys u want, do not change the writings in qoutes. for example if u wana change B do ["B"] = (CHANGE THIS 0x8AAA0AD4), do not change whats inside those brackets > ["B"]
    ["B"] = 0x4CC0E2FE,
    ["G"] = 0x760A9C6F,
    ["ENTER"] = 0xC7B5340A,
    ["DOWN"] = 0x05CA7C52,
    ["SHIFT"] = 0x8FFC75D6,
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
Config.metadata = false -- set to true when using meta data inventory update 


Config.debug = true -- script is not supposed to be restarted on live server. put this to true if u want to restart script
Config.taxledger = true -- taxes will be taken from a special ledger that only allows players to deposit their tax amount and nothing more, use this to avoid houses that never go on sale because players put alot of money in their tax ledger and left the server
Config.renderdistance = 50
Config.timedupdate = 30 -- update db every 30 minutes
Config.bucketblock = 9959
-- this script requires syn_instancebucket to work correctly. 
Config.anticrashloop = true -- redm has an issue with exiting routing bucket. turn this to true if u have trouble crashing when exiting motel rooms
Config.furnitureitems = true -- turn to true if you want furniture to be items instead of having a buy furniture menu
Config.maxhouses = 3  -- max number of houses player can own (motels excluded)

Config.command = "createhouse" -- command to createhouses
Config.synsociety = true -- turn true only if using syn_society. make sure realestate job is registered in society config and in relevant databases, this is used to deposit money into the mentioned society
Config.synsocietyjob ="Estado" -- you can use this to allow for job creation by people with this job(does not require syn society)
Config.synsocietyjobrank = 2 -- minimum job rank to allow deletion of created houses (houses on sale can be deleted, owned houses cannot)(does not require syn society)
Config.sellpercentage = { -- percentages below will by multiplyed by sale price and result will be given to relevant party as mentioned below. make sure the total percentages amount does not go over 1
-- anything less than 1 the remaining money gets deleted from server. this is good to fight inflation of currency 
seller = 0.5, -- person selling the house agent or player, set to 0 if you dont want money to go to people. this also stops people from receving money for selling their homes.
society = 0.3, -- realestate society only use if syn_society is toggled on above and you own syn society. set to 0 if you dont want money to go to society
} -- in this case 50% of sale price goes to seller, 30% goes to society, 20% gets deleted from the server and goes to no one.

Config.teleporterhouses = { -- use your own mlos to make teleporter homes the ones below are just examples
    ["PoliceValentine"] = {location = {x = -291.336, y = 782.8279, z = 119.49}},
    ["Fazenda Rhodes"] = {location = {x = 1691.28, y = -1413.26, z = 11.0}},
    ["Bw-01"] = {location = {x = -807.03, y = -1501.17, z = 43.55}},
    ["Bw-02"] = {location = {x = -929.86, y = -1273.6, z = 32.37}},
    ["Bw-03"] = {location = {x = -967.11, y = -1254.22, z = 34.01}},
    ["Bw-04"] = {location = {x = -942.1, y = -1225.51, z = 33.54}},
    ["Fazenda Armadillo"] = {location = {x = -4790.62, y = -2723.48, z = -33.79}},
    ["Fazenda Emerald"] = {location = {x = 1458.9, y = 311.19, z = 70.6}},
    ["FortWalace"] = {location = {x = -4194.17, y = -3450.97, z = 17.17}},
    ["Arsenal"] = {location = {x = -4216.6, y = -3452.72, z = 17.2}},
}

Config.Locations = { -- money for houses bought goes here. sellers have it to collected from here. 
    Valentine = {	   -- you can add more job centers by copy pasting this 
    Pos = {x=-180.54, y=634.79, z=114.08}, -- location of job center 
    blipsprite = -1656531561, -- blip sprite for job center
    Name = 'Venda de Casas', -- blip name 
    },
}

Config.motellocation = { 
    Valentine = {
        PosEntrance = {x=-322.14, y=767.47, z=121.63}, 
        PosExit =  {x = -324.035, y = 766.8970, z = 121.63},   
        PosChangingroom = {x=-326.82, y=764.62, z=122.0866}, 
        PosInventory = {x=-325.4, y=767.02, z=122.0866}, 
        blipsprite = 1116438174, -- blip sprite for motel
        Name = 'Valentine Motel', -- blip name 
        price = 70, -- price to buy room
        inventorylimit = 100
    },
    Strawberry = {
        PosEntrance = {x = -1778.31, y = -375.02, z = 159.91}, 
        PosExit =  {x = -324.035, y = 766.8970, z = 121.63}, 
        PosChangingroom = {x=-326.82, y=764.62, z=122.0866}, 
        PosInventory = {x=-325.4, y=767.02, z=122.0866}, 
        blipsprite = 1116438174, -- blip sprite for motel
        Name = 'Strawberry Motel', -- blip name 
        price = 70, -- price to buy room
        inventorylimit = 100
    },
}
-------------------------------------------------------------------
Config.Storageupgrades = {  -- when building houses make sure u set their inventory limit to allow them to have the quantity of items below otherwise they wont be able to upgrade because the inventory cant 
-- hold the items. the storage upgrade system checks to see if the house inventory has the required items below to make the upgrade
    Upgrade1 = {	   
        num = 1, -- always use a number make sure each subsequent number is an addition by 1 not more, and make sure its not repeated.
        title = "Upgrade 1", 
        materials = {
            item1 = {name = "nails", label="nails", amount = 5},
            item2 = {name = "tira_cedro", label="tira_cedro", amount = 10},
            item3 = {name = "rocks", label="rocks", amount = 5},
        }, 
        slotamount = 25,  
    },
    Upgrade2 = {	   
        num = 2, 
        title = "Upgrade 2", 
        materials = {
            item1 = {name = "nails", label="nails", amount = 10},
            item2 = {name = "tira_cedro", label="tira_cedro", amount = 20},
            item3 = {name = "rocks", label="rocks", amount = 5},
        }, 
        slotamount = 25,  
    },
    Upgrade3 = {	   
        num = 3, 
        title = "Upgrade 3", 
        materials = {
            item1 = {name = "nails", label="nails", amount = 15},
            item2 = {name = "tira_cedro", label="tira_cedro", amount = 25},
            item3 = {name = "rocks", label="rocks", amount = 5},
        }, 
        slotamount = 50,  
    },
    Upgrade4 = {	   
        num = 4, 
        title = "Upgrade 4", 
        materials = {
            item1 = {name = "nails", label="nails", amount = 15},
            item2 = {name = "wooden_boards", label="wooden_boards", amount = 15},
            item3 = {name = "rocks", label="rocks", amount = 20},
        }, 
        slotamount = 100,  
    },
    Upgrade5 = {	   
        num = 5, 
        title = "Upgrade 5", 
        materials = {
            item1 = {name = "nails", label="nails", amount = 25},
            item2 = {name = "wooden_boards", label="wooden_boards", amount = 25},
            item3 = {name = "rocks", label="rocks", amount = 25},
        }, 
        slotamount = 100,  
    },
    Upgrade6 = {	   
        num = 6, 
        title = "Upgrade 6", 
        materials = {
            item1 = {name = "nails", label="nails", amount = 25},
            item2 = {name = "wooden_boards", label="wooden_boards", amount = 25},
            item3 = {name = "ironhammer", label="ironhammer", amount = 10},
        }, 
        slotamount = 200,  
    },
    Upgrade7 = {	   
        num = 7, 
        title = "Upgrade 7", 
        materials = {
            item1 = {name = "nails", label="nails", amount = 25},
            item2 = {name = "wooden_boards", label="wooden_boards", amount = 25},
            item3 = {name = "ironhammer", label="ironhammer", amount = 25},
        }, 
        slotamount = 200,  
    },
    Upgrade8 = {	   
        num = 8, 
        title = "Upgrade 8", 
        materials = {
            item1 = {name = "nails", label="nails", amount = 25},
            item2 = {name = "barrel", label="barrel", amount = 10},
            item3 = {name = "ironhammer", label="ironhammer", amount = 25},
        }, 
        slotamount = 300,  
    },
}

Config.housebliphash = -2024635066 -- unowned
Config.ownedhouseblip = 1586273744 -- owned
Config.showblipsforsale = true  -- show blips for houses on sale 

------------------------------------------
-- only set one of those true 

Config.monthlyrepo = true
Config.repotime ={ -- day, hour, and minute of monthly repo of houses. when the server time matches these values. houses that dont have money in their ledger = or more than the tax rate of the house will 
-- go on sale and their owner will lose their ownership. these houses will be marked as repoed and when bought the money spend on buying them will go to no one.
    day = 15,
    hour = 6,
    minute = 10
} 
Config.weeklyrepo = false
Config.repotime2 ={ -- day, hour, and minute of monthly repo of houses. when the server time matches these values. houses that dont have money in their ledger = or more than the tax rate of the house will 
-- go on sale and their owner will lose their ownership. these houses will be marked as repoed and when bought the money spend on buying them will go to no one.
    day1 = 3,
    day2 = 10,
    day3 = 17,
    day4 = 24,
    hour = 6,
    minute = 10
} 


Config.furniturelimit = 100
Config.furnituresellrate = 1.0 -- this is the rate at which furniture will sell for if ur not using furniture as items 

Config.furniture = { -- you can add more furniture by following the format and getting the hashes from http://rdr2.mooshe.tv/, use Model Hash (Signed)
-- i only added a few, fill them up with the items you like
["Cadeiras"] = {
    ["Cadeira de madeira"] = { cost = 10, hash = 325252933, item = "woodchair"},
    ["Cadeira de couro"] = { cost = 10, hash = 805425957, item = "leatherchair"},

},
["Mesas"] = {
    ["Mesa redonda"] = { cost = 20, hash = 1070917324, item = "roundtable"},
    ["Mesa"] = { cost = 20, hash = 85453683, item = "normaltable"},
    ["Mesa em retângulo"] = { cost = 20, hash = 1287780262, item = "rectable"},
    ["Mesa de madeira"] = { cost = 20, hash = 1624513686, item = "timbertable"},

},
["Fires"] = {
    ["Crafting Fire"] = { cost = 25, hash = -1279776992, item = "craftingfire"},
    ["Pot"] = { cost = 25, hash = 174418135, item = "pota"},

},
["Decoração"] = {
    ["Bomba de água"] = { cost = 500, hash = -40350080, item = "waterpump"},
    ["Caixas de flores"] = { cost = 5, hash = 456717314, item = "flowerboxes"},
    ["Decoração de caixão"] = { cost = 5, hash = 1373121931, item = "coffindecor"},
    ["Pele de veado"] = { cost = 10, hash = -944201792, item = "deerpelt"},
    ["Pele de coiote"] = { cost = 10, hash = -1156281048, item = "coyotepelt"},

    ["Vitrola"] = {cost = 10, hash = -1816726898, item = "vitrola"},

    ["Caixa de cobertor"] = { cost = 5, hash = -542120195, item = "blanketbox"},
    ["Barril da arma"] = { cost = 10, hash = 187048082, item = "gbarrelx"},
    ["Barril de maçã"] = { cost = 5, hash = -156060815, item = "applebarrel"},
    ["Cesta de maçã"] = { cost = 5, hash = 86968515, item = "applebasket"},
    ["Barril de comida"] = { cost = 5, hash = -589926798, item = "foodbarrel"},
    ["Banheira"]= { cost = 5, hash = 768802576, item = "washtub"},
    ["Varal de roupas"] = { cost = 5, hash = -25978087, item = "clothesline"},
    ["Tambor de ferramentas"] = { cost = 10, hash = -462883214, item = "toolbarrel"},
    ["Coyote Empalhado"] = { cost = 25, hash = 755719297, item = "coyotetaxi"},
    ["Faisão Empalhado"] = { cost = 10, hash = -139659644, item = "phestaxi"},
    ["Veado Empalhado"] = { cost = 15, hash = 270188936, item = "deertaxi"},
    ["Cougar Empalhado"] = { cost = 30, hash = 106531847, item = "cougartaxi"},
    ["Vulture Empalhado"] = { cost = 10, hash = 1751914218, item = "vulturetaxi"},

},
["Bancos"] = {
    ["Banco de urso"] = { cost = 30, hash = -191845882, item = "bearbench"},
    ["Banco de toras 1"] = { cost = 10, hash = -359794697, item = "logbench"},
    ["Banco de toras 2"] = { cost = 10, hash = 861210780, item = "logbechs"},
    ["Banco de pano"] = { cost = 15, hash = 964931263, item = "clothbench"},
    ["Banco de madeira"] = { cost = 20, hash = 1057555344, item = "woodbench"},
    ["Banco de vime"] = { cost = 25, hash = 1220939063, item = "wickerbench"},

},
["Aparador"] = {
    ["Madeira marrom"] = { cost = 25, hash = 614869605, item = "bwdresser"},
    ["Espelho marrom"] = { cost = 35, hash = -565436466, item = "bmdresser"},
    ["Mesa de cabeceira"] = { cost = 20, hash = -154796631, item = "nightstand"},
    ["Mesa lateral 1"] = { cost = 15, hash = 335118833, item = "sidetable"},
    ["Mesa lateral 2"] = { cost = 15, hash = -96741014, item = "sidetablea"},
    ["Mesa lateral 3"] = { cost = 15, hash = 341544623, item = "sidetableb"},
    
},
["Baús"] = {
    ["Baú 1"] = { cost = 50, hash = -576101586, item = "chesta"},
    ["Baú 2"] = { cost = 50, hash = 370527842, item = "chestb"},
    
},
["Luzes"] = {
    ["Lanterna"] = { cost = 10, hash = 319326044, item = "lanterna"},
    ["Dbl Vela"] = { cost = 5, hash = 1443543434, item = "dbcandle"},
    ["Vela"] = { cost = 5, hash = 526843578, item = "candlea"},
    ["Pequena Vela Derretida"] = { cost = 5, hash = -1200234060, item = "smallmcandle"},
    ["Vela de garrafa"] = { cost = 5, hash = -1012195445, item = "bcandle"},
    
},
["Camas"] = {
    ["Cama velha"] = { cost = 10, hash = -335869017, item = "obed"},
    ["Beliche"] = { cost = 20, hash = -661790979, item = "bunkbed"},
    ["Cama de solteiro"] = { cost = 30, hash = 1190865994, item = "singlebed"},
    ["Cama estravagante"] = { cost = 50, hash = 204817984, item = "fancydouble"},
    
},
["Outros"] = {
    ["Mesa de Festas"] = { cost = 500, hash = 258727601, item = "mesafestas" },
    ["Armario com Livros"] = { cost = 80, hash = -302968547, item = "ArmLivros" },
    ["FLORES COM MESINHA"] = { cost = 15, hash = 1242731839, item =  "flormesa"  },
    ["SUPORTE PARA PENDURAR CASACO"] = { cost = 40, hash = -1033712895, item = "suproupas"},
    ["Abajur"] = { cost = 30, hash = 811678375, item = "abajur" },
    ["VARAL DE PEIXE"] = { cost = 10, hash = -1390621783, item = "varalpeixe"},
    ["cadeira de veludo vermelha"] = { cost = 50, hash = -48905921, item = "Cadveludo"},
    ["Placa de nao ultrapasse"] = { cost = 15, hash = -1254571563, item = "naopasse"},
    ["Mesa redonda de jantar"] = { cost = 300, hash = -984934151, item = "mesared"},
    ["Mesa de escritorio pequena"] = { cost = 100, hash = -1231539219, item = "mesaescritP"},
    ["Mesa de escritorio média"] = { cost = 200, hash = 1615548247, item = "mesaescritM"},
    ["Cadeira de Escrtitório"] = { cost = 100, hash = 805425957, item = "cadescrit"},
    ["Suporte de canetas"] = { cost = 20, hash = 814967714, item = "supcanetas"},
    ["Guarda roupas"] = { cost = 40, hash = -370296889, item = "groupas"},
    ["Sofa de luxo"] = { cost = 500, hash = 1529403351, item = "sofaluxo"},
    ["Quadro de arte"] = { cost = 100, hash = 749327242, item = "qArte1"},
    ["Piano"] = { cost = 1000, hash = -114569684, item = "piano"},
    ["Mesa de espumante"] = { cost = 300, hash = -432586381, item = "mesaespu"},
    ["Pia com bomba d'agua"] = { cost = 30, hash = 1338551108, item = "pia"},
    ["Mesa retangular"] = { cost = 30, hash = 1329967722, item = "mesaretangular"},
    ["Cama de solteiro"] = { cost = 30, hash = -81698397, item = "camasolteiro"},
    ["Cortina para janela"] = { cost = 35, hash = 975100514, item = "cortina"},
    ["Relogio chique"] = { cost = 200, hash = -1275135033, item = "relogiocasa"},
    ["Sofa de luxo refinado"] = { cost = 500, hash = 987924370, item = "sofarefinado"},
    ["Cadeira de madeira"] = {cost = 10, hash = -384257010, item = "cadmadeira"},
    ["Armario de cozinha"] = { cost = 70, hash = -600811692, item = "armcozinha"},
    ["Caixa de charuto"] = { cost = 100, hash = 557151415, item = "cxcharuto"},
    ["Cadeira de madeira de luxo"] = { cost = 100, hash = -364093783, item = "cdluxo"},
    ["Cofre medio"] = { cost = 400, hash = -497717277, item = "cofreM"},
    ["Mesa de escritorio grande"] = { cost = 400, hash = 966315007, item = "mesaescritG"},
    ["Cesta de pao"] = { cost = 20, hash = -1110548311, item = "cestopao"},
    ["Caixa de espumante"] = { cost = 50, hash = 567396368, item = "cxespumante"},
    ["Quadro grande"] = { cost = 250, hash = -1030994765, item = "qArte2"},
    ["Items para escritorio"] = { cost = 40, hash = 899142050, item = "itensescrit"},
    ["Berrante"] = { cost = 30, hash = 1346417102, item = "berrante"},
    ["Luminaria lunar"] = { cost = 60, hash = 1084064611, item = "lumLunar"},
    ["Lampiao para cavalos"] = { cost = 50, hash = -1217232104, item = "lampcavalos"}, 
    ["Jacare empalhado"] = { cost = 40, hash = 908527399, item = "jacareemp"},
    ["Relogio pequeno"] = { cost = 60, hash = 1460441229, item = "relogiocasaP"},
    ["Cama de solteiro de luxo"] = { cost = 100, hash = 48968044, item = "camasoltluxo"},
    ["Aguia empalhada"] = { cost = 40, hash = 139224300, item = "aguiaemp"},
    ["Cranio de Veado"] = { cost = 30, hash = -1106525805, item = "cranioboi" },
    ["Cadeira branca e dourada"] = { cost = 70, hash = 519549403, item = "cadbranca"},
    ["Jacaré de jardim"] = { cost = 40, hash = 1536796168, item = "jacarejardim"},
    ["Lustre maguinifico"] = { cost = 100, hash = 908241896, item = "lustrem"},
    ["Boneca de brinquedo"] = { cost = 20, hash = -923990860, item = "bonecabrinq"},
    ["Cama de luxo"] = { cost = 300, hash = -719712911, item = "camaluxo"},
    ["Ventilador"] = { cost = 150, hash = 955044476, item = "ventilador"},
    ["Chifre de Parede"] = { cost = 600, hash = -1697851069, item = "p_horn01x"},
    ["Cabeça de Boi"] = { cost = 600, hash = -468521395, item = "p_skullcattle03x"},
    ["Pinico de Luxo"] = { cost = 400, hash = 158554511, item = "p_chamberpot01x"},
    ["Tamburete"] = { cost = 80, hash = 2016655359, item = "p_stool08x"},
    ["Jacaré Empalhado de Chapéu"] = { cost = 500, hash = 840028633, item = "p_tuxyoungaligator01x"},
},
}
---------------------------------------------------------
Config.Language = {
    ["qt"] = "Quantidade inválida",
    ["carry"] = "Você não pode carregar mais itens",
    ["limit"] = "Você atingiu o limite para este item",
    ["maxslots"] = "sua casa não pode armazenar mais itens, o limite de slot é ",
    ["aimingatdoor"] = "Pressione ~e~G~q~ Ao mirar na porta",
    ["nodoorhouse"] = "Pressione ~e~B~q~ para criar uma casa sem porta",
    ["createhousecancel"] = "Digite ~e~/createhouse~q~ Para Cancelar e Sair",
    ["pressenterconfirm"] = "Pressione ~e~Enter~q~ Para Confirmar",
    ["uparrowicon"] = "Pressione ~e~Seta para cima~q~ para mover o ícone",
    ["downarrowicon"] = "Pressione ~e~Seta para baixo~q~ Para mover o ícone",
    ["rightarrowicon"] = "Pressione ~e~Seta para a direita~q~ Para mover o ícone",
    ["leftarrowicon"] = "Pressione ~e~Seta para a esquerda~q~ Para mover o ícone",
    ["bracketrighticon"] = "Pressione ~e~]~q~ para mover o ícone",
    ["bracketlefticon"] = "Pressione ~e~[~q~ para mover o ícone",
    ["confirm"] = "Confirmar",
    ["outofrange"] = "~e~fora de alcance~q~",
    ["fourtocancel"] = "Pressione ~e~4~q~ Para Cancelar e Sair do posicionamento do item",
    ["gitemplace"] = "Pressione ~e~G~q~ Para colocar o item no lugar",
    ["bonground"] = "Pressione ~e~B~q~ Para colocar o item no chão corretamente",
    ["changemoverate"] = "Pressione ~e~3~q~ Para alterar a taxa de movimento do item",
    ["rotateitem1"] = "Pressione ~e~1~q~ para girar o item",
    ["rotateitem2"] = "Pressione ~e~2~q~ para girar o item",
    ["moveitem1"] = "Pressione ~e~Seta para cima~q~ para mover o item",
    ["moveitem2"] = "Pressione ~e~Seta para baixo~q~ Para mover o item",
    ["moveitem3"] = "Pressione ~e~Seta para a direita~q~ Para mover o item",
    ["moveitem4"] = "Pressione ~e~Seta para a esquerda~q~ Para mover o item",
    ["moveitem5"] = "Pressione ~e~]~q~ Para Mover Item",
    ["moveitem6"] = "Pressione ~e~[~q~ Para Mover Item",
    ["changerateinfo"] = "Alterar taxa de cada pressionamento (0,5) padrão, o máximo é 5",
    ["set"] = "Definir",
    ["notset"] = "Não definido",
    ["furnilimit"] = "Você não pode ter mais móveis, o limite é ",
    ["createhousemenu"] = "Criar Menu da Casa",
    ["buyhouse"] = "Comprar casa",
    ["managehouse"] = "Gerenciar casa",
    ["soldhomeledger"] = "Livro da casa vendida",
    ["buyfurni"] = "Comprar Móveis",
    ["changingroom"] = "Roupeiro",
    ["setupprimdoor"] = "Configuração da porta primária",
    ["extradoorsetup"] = "Configuração de portas extras",
    ["aresure"] = "Você tem certeza?",
    ["upstore"] = "Atualizar armazenamento",
    ["furni"] = "Móveis",
    ["furnicata"] = "Categoria de Móveis",
    ["sellfurni"] = "Vender Móveis",
    ["keyholders"] = "Keyholders",
    ["ledger"] = "Livro",
    ["cancel"] = "Cancelar",
    ["yes"] = "Sim",
    ["no"] = "Não",
    ["setupprimodoor"] = "Configurar a porta principal : ",
    ["setupotherdoors"] = "Configurar outras portas",
    ["range"] = "Faixa de móveis: ",
    ["furnirange"] = "Gama de Móveis",
    ["taxrate"] = "Taxa de imposto: ",
    ["taxrate2"] = "Taxa de imposto",
    ["price"] = "Preço",
    ["doorname"] = "Nome da porta: ",
    ["changedooriconloc"] = "Mudar a localização do ícone da porta",
    ["confirmdoor"] = "Confirmar porta",
    ["addadoor"] = "Adicionar uma porta",
    ["returntomainmenu"] = "Retornar ao Menu Principal",
    ["otherdoor"] = "Outra porta",
    ["addeditdoor"] = "Adicionar uma porta",
    ["inventoryspace"] = "Espaço de inventário",
    ["delhouse"] = "Remover casa",
    ["houseid"] = "ID da casa: ",
    ["givekey"] = "Dar Chaves",
    ["id"] = "ID",
    ["takekey"] = "Pegar chaves",
    ["setchangeroomloc"] = "Definir a localização do guarda roupas",
    ["setinvloc"] = "Definir localização do inventário",
    ["sellhouse"] = "Vender Casa",
    ["furni"] = "Móveis",
    ["price2"] = "/Preço: ",
    ["cost2"] = "/Custo: ",
    ["increaseby"] = "/Aumentar em: ",
    ["ledgercash"] = "Caixa contábil: ",
    ["dollar"] = "$",
    ["ledgerdepo"] = "Depósito contábil",
    ["tooclose"] = "alguém está muito perto",
    ["ledgerwithdraw"] = "Retirada do Razão",
    ["soldhouseid"] = "ID da casa vendida: ",
    ["profit"] = " / Lucro: ",
    ["nooutfits"] = "sem roupas",
    ["house"] = "Casa",
    ["presstobuy"] = "Comprar Casa",
    ["presstomanage"] = "Gerenciar Casa",
    ["pressforchangingroom"] = "Roupeiro",
    ["pressforinvent"] = "Inventário",
    ["pressforsold"] = "Pressione ~e~G~q~ Para Razão de Casas Vendidas",
    ["presstoexit"] = "Sair",
    ["presstobuyroom"] = "Comprar um quarto",
    ["presstoaccess"] = "Entrar",
    ["presstochangechangingroom"] = "Pressione ~e~G~q~ para salvar a mudança de localização do guarda roupas",
    ["presstochangeinv"] = "Pressione ~e~G~q~ para salvar o local do inventário",
    ["changingset"] = "Conjunto de localização da sala em mudança",
    ["invset"] = "Conjunto de localização do inventário",
    ["outofhouserange"] = "Fora do alcance da casa",
    ["youcreatedhouse"] = "Você criou uma casa",
    ["boughthome"] = "Você comprou uma casa",
    ["cantaffordhome"] = "Você não pode pagar por esta casa",
    ["puthomeforsale"] = "Você colocou uma casa à venda",
    ["youdepo"] = "Você depositou",
    ["intoledger"] = "$ no livro razão",
    ["intoledger2"] = "$ no livro de impostos",
    ["cantdepo"] = "Você não pode pagar este depósito",
    ["youwith"] = "Você retirou",
    ["fromledger"] = "$ from ledger",
    ["yougot"] = "Você tem ",
    ["forsold"] = "$ para sua casa vendida",
    ["youdelh"] = "Você excluiu a casa: ",
    ["homtax1h"] = "~e~Cobrança de imposto residencial em 1 hora",
    ["makesure"] = "~e~Certifique-se de que seu livro-razão inicial tem dinheiro suficiente para pagar impostos~q~",
    ["youupped"] = "Você atualizou o espaço do inventário da sua casa",
    ["nomat"] = "Você não tem material suficiente no inventário de sua casa para esta atualização",
    ["cantaffitem"] = "Você não pode comprar este item",
    ["gotitem"] = "Você comprou o item",
    ["itemsoldfor"] = "Você vendeu o item por ",
    ["gavekeysto"] = "Você Deu Chaves para ",
    ["gotkeys"] = "Você recebeu uma chave de casa",
    ["alreadykeys"] = "Você já tem chaves",
    ["wrongid"] = "Já tem chaves ou id errado",
    ["takekeysfrom"] = "Você pegou as chaves da casa de ",
    ["motelroomcantafford"] = "Você não pode pagar por este motel que custa ",
    ["nosold"] = "Nenhuma casa vendida",
    ["hsfrsale"] = "Casa à venda",
    ["mehome"] = "Minha casa",
    ["menuinuse"] = "O menu está em uso",
    ["nokeys"] = "Você não tem chaves",
    ["nosuchuser"] = "Nenhum usuário desse tipo",
    ["doorlock"] = "Fechadura da porta",
    ["open"] = "abrir",
    ["motel"] = "Motel",
    ["cantownmore"] = "Não é possível possuir mais casas no máximo: ",
    ["taxledger"] = "Conta fiscal: $",
    ["taxledger2"] = "Deposite dinheiro em seu livro de impostos. este livro só permite que você deposite",
    ["cantdepomore"] = "Não é possível depositar mais do que o valor do imposto: $",
    ["placefurniture"] = "Colocar Móveis",
    ["removefurni"] = "Remover Mobília",
    ["cantcarry"] = "Você não pode carregar mais itens",
    ["gotbackitem"] = "Você retirou o item: ",
    ["furnicantremove"] = "não consigo recuperar o item",
    ["nodoorhouse2"] = "Sem porta de casa",
    ["telehouse"] = "Teleporter House",
    ["typeoftele"] = "Tipo de teletransporte: ",
    ["enterhouse"] = "Entrar na casa",
    ["exithouse"] = "Sair",
    ["knockprompt"] = "Bater na porta",
    ["allowinprompt"] = "Permitir",
    ["declineprompt"] = "Ignorar",
    ["doorknocked"] = "A porta está batendo",
}
---------------------------------------------------------