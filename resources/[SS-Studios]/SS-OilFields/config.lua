-- Author '🅱🅻🆄🅴🆈🅴🆂#1364' by Sirec Studio -- 
-- REPORT ANY BUGS ON https://discord.gg/9XNBaQSmMd --

Config = {

Avatar = "https://i.imgur.com/OAE8DpR.png",
Webhook = "",
Align = "right", --POSITION OF MENU "center" / "top-left" / "top-right"
XPEnabled = false,
--------------------------------------------------------------------------------------------------------------
--CONFIG BUTTONS TEXT
Button = " Pressione ", -- TRANSLATE BUTTON
Key = 0xD9D0E1C0, --KEY TO PRES > DEFAULT "SPACE" <
TakeWood = " INICIAR TRABALHO ", -- FIELD WORKER
PutWood = " COLOCAR ", -- FIELD WORKER
TakeBarrel = "PEGAR", -- OIL BARREL
PutBarrel = "COLOCAR", -- OIL BARREL    
Whistle = " CHAMAR CLIENTE ", -- OIL DELIVERY
Park = "ESTACIONAR", -- OIL DELIVERY    
Check = " CHECAR ", -- ENGINEER    
--------------------------------------------------------------------------------------------------------------
CancelCommands = true, -- IF PLAYER HAVE THE HATCHET EQUIPED, HE CANNOT USE THE COMMANDS BELOW. CHANGE THEM IF YOU USE OTHER COMMANDS
DisableControl1 = 0x07CE1E61, -- MOUSE1
DisableControl2 = 0xF84FA74F, -- MOUSE2
DisableControl3 = 0xAC4BD4F1, -- TAB
DisableControl4 = 0xCEFD9220, -- MOUNT
DisableControl5 = 0x4CC0E2FE, -- B
DisableControl6 = 0x8CC9CD42, -- X
DisableControl7 = 0x26E9DC00,-- Z
--------------------------------------------------------------------------------------------------------------
Jobs = {
	["1"] = {
    	name = "Campos de petróleo",
        desc  = "Programa de trabalho: ",
        blip = -1954662204,
        showblip = true,
positions = {
[1] = {name = "oilfieldsemployer", distance = 2.5, openHour = 0, closeHour = 24, doors = {}, npcmodel = "a_m_m_blwtownfolk_01", x = 498.262, y = 673.285, z = 120.042, h = 79.548, open = 1},
        },
	missions = {
     [1] = {  -- Field Worker
		pos = {477.959, 650.389, 114.490, 178.399}, -- POSITION TO START THE JOB
        jobnpc = "a_m_m_foreman", -- NPC YOU WILL FOLLOW WHEN CARRY THE PLANKS
        speednpc = 1.1, -- NPC WALK SPEED TO CHECKPOINTS
    	money = 0.2, -- REWARD FOR JOB
    	xp = 5, -- XP REWARD
        item = false, -- ITEM REWARD IN DATABASE
        label = false, -- NAME                        
        count = 1, -- HOW MANY ITEM'S TO RECEIVE
        chance = 50, -- 50% CHANCE TO RECEIVE THE ITEM
    	missionblip = -2039778370, -- BLIP
    	distance = 1.5, -- DISTANCE FOR BUTTON
        checkpointmin = 1, -- DON'T CHANGE
        checkpointmax = 8, -- NUMBER OF ALL CHECKPOINTS
    	checkpoints = {
    		[1] = {470.487, 618.304, 110.422},
        	[2] = {454.369, 620.643, 110.860},
        	[3] = {514.379, 556.134, 109.217},
        	[4] = {530.645, 585.837, 108.380},
        	[5] = {552.941, 575.453, 110.305},
        	[6] = {589.062, 711.684, 117.437},
        	[7] = {554.197, 567.344, 115.635},
        	[8] = {532.283, 577.745, 114.724},
            	}
			},
     [2] = {  -- Oil Barrel
		pos = {496.737, 694.725, 114.873, 331.323}, -- POSITION TO START THE JOB
        jobnpc = "s_m_m_cktworker_01", -- NPC YOU WILL FOLLOW WHEN CARRY THE PLANKS
        speednpc = 1.3, -- NPC WALK SPEED TO CHECKPOINTS
    	money = 0.2, -- REWARD FOR JOB
    	xp = 5, -- XP REWARD
        item = false, -- ITEM REWARD IN DATABASE
        label = false, -- NAME                        
        count = 1, -- HOW MANY ITEM'S TO RECEIVE
        chance = 50, -- 50% CHANCE TO RECEIVE THE ITEM
    	missionblip = -2039778370, -- BLIP
    	distance = 1.5, -- DISTANCE FOR BUTTON
        checkpointmin = 1, -- DON'T CHANGE
        checkpointmax = 13, -- NUMBER OF ALL CHECKPOINTS
    	checkpoints = {
    		[1] = {505.401, 659.863, 116.405, 94.720},
        	[2] = {491.546, 660.511, 116.386, 136.585},
        	[3] = {488.087, 663.403, 116.390, 92.981},
        	[4] = {473.245, 662.299, 116.407, 177.431},
        	[5] = {468.889, 669.859, 116.384, 359.737},
        	[6] = {464.771, 660.723, 116.368, 82.253},
        	[7] = {591.844, 681.257, 114.082, 255.144},
        	[8] = {589.869, 655.489, 114.133, 191.880},
            [9] = {551.687, 597.829, 110.287, 166.389},
            [10] = {542.909, 618.180, 108.586, 274.938},
            [11] = {588.708, 615.138, 112.081, 44.969},
            [12] = {603.824, 639.993, 112.761, 10.441},
            [13] = {628.383, 646.128, 116.132, 282.752}
            	}
			},           
     [3] = {  -- Oil Delivery
		spawn = {570.167, 686.821, 114.337, 80.337}, -- POSITION WHERE THE CART IS SPAWNED
		Zone = 15, -- IF IS A WAGON IN THIS ZONE, ANOTHER WAGON WILL NOT SPAWN!
        park = {512.458, 692.810, 114.741, 80.291},
        wagon = "oilWagon01x", -- WAGON MODEL
    	money = "0.004", -- MONEY TO RECEIVE > 0.002 x distance
    	xp = 10, -- BASIC XP FOR EVERY DELIVERY
    	missionblip = -2039778370, -- BLIP
        gpsroute = "COLOR_BLUE", -- GPS COLOUR        
    	distance = 10, -- DISTANCE FOR BUTTON
        deliverynpc = "a_m_m_asbtownfolk_01", -- DESTINATION NPC, WAIT YOU FOR DELIVERY
        checkpointmin = 1, -- DON'T CHANGE
        checkpointmax = 3, -- NUMBER OF ALL CHECKPOINTS
    	checkpoints = {
    		[1] = {782.66918945312, 850.16009521484, 117.64194488526, 304.3890991211},
        	[2] = {204.44163513184, 983.78771972656, 189.31385803222, 198.65003967286},
            [3] = {1108.525024414, 494.1491394043, 95.787475585938, 23.655073165894},
            	}
			},
     [4] = {  -- Engineer
    	money = 0.50, -- MONEY TO RECEIVE
    	xp = 25, -- BASIC XP FOR EVERY POINT
        item = false, -- REWARD NAME IN DATABASE
        label = false, -- NAME            
        count = 2, -- HOW MANY ITEM'S TO RECEIVE
        chance = 50, -- 50% TO FIX SOMETHING AT LOCATION
    	missionblip = -2039778370, -- BLIP
        gpsroute = "COLOR_YELLOW", -- GPS COLOUR
    	distance = 1, -- DISTANCE FOR BUTTON            
        checkpointmin = 1, -- DON'T CHANGE
        checkpointmax = 7, -- NUMBER OF ALL CHECKPOINTS
    	checkpoints = {
    		[1] = {483.33673095704, 675.9496459961, 117.3090133667, 328.85485839844},
        	[2] = {472.13760375976, 679.29522705078, 117.3086013794, 77.760787963868},
            [3] = {488.68563842774, 684.75213623046, 117.34169006348, 342.20581054688},
            [4] = {582.20886230468, 701.83953857422, 118.50693511962, 208.97067260742},
            [5] = {597.5654296875, 650.42218017578, 115.4482345581, 21.403717041016},
            [6] = {594.96044921875, 572.53204345704, 110.91260528564, 213.63525390625},   
            [7] = {554.32934570312, 586.798828125, 112.55361938476, 314.87194824218}
            	}
			}       
        }    
    },
},

Text = {
    -- MENU
	["of_fw"] = "Trabalhador de campo",
	["of_fw1"] = "1",
	["of_fwdesc"] = "Trabalhar e colocar as coisas em ordem",
	["of_ob"] = "Barril de óleo",
	["of_ob2"] = "2",
	["of_obdesc"] = "Mova todos os barris até a noite!",        
	["of_od"] = "Entrega de óleo",
	["of_od3"] = "3",
	["of_oddesc"] = "Entregue petróleo para completar a missão",
	["of_eng"] = "Engenheiro",
	["of_eng3"] = "4",
	["of_engdesc"] = "Verifique se a pressão do óleo está ok",
	
			
	["of_payout"] = "Pagamento",
	["of_payout1"] = "Finalizado!",
	["of_paydesc"] = "Você foi pago pelo trabalho!",
	["of_cancel"] = "Cancelar trabalho",
	["of_cancel1"] = "Tem certeza?",
	["of_canceldesc"] = "Cancelar se você não quiser trabalhar aqui!",
	["of_jobcancel"] = "Você cancelou o trabalho!", -- UPDATE 1.3
		-- GLOBAL TEXT
	["all_can'tdo"] = "Você não tem o nível necessário para fazer este trabalho!", -- For moment you don't need level to do it, it will be avalible soon...
	["fw_nospace"] = "Você não tem espaço em seu inventário para receber mais itens!",         
		-- FIELD WORKER
	["fw_goto"] = "Vá para o local para começar a trabalhar!",
	["fw_followme"]	= "John: Siga-me para mostrar onde colocá-lo!",
	["fw_puthere"]	= "John: Coloque a madeira aqui rapidamente, temos muito trabalho a fazer!",
	["fw_followmeback"]	= "John: Siga-me de volta para carregar mais madeiras!",
	["fw_youreceivedwood"] = "Você recebeu",
	["fw_inyourinventorywood"] = "e coloque-o em seu inventário!",
		-- OIL BARREL 
	["ob_goto"] = "Vá para o local para começar a trabalhar, os barris estão esperando!",
	["ob_followme"]	= "Bill: Siga-me para mostrar para onde movê-lo!",
	["ob_puthere"] = "Bill: Coloque o barril aqui, tenha cuidado para não quebrá-lo!",
	["ob_followmeback"]	= "Bill: Siga -me de volta, temos mais para nos mover!",
		-- OIL DELIVERY
	["od_gotocart"] = "Vá para o ponto de verificação para pegar a carroça e comece a entregar petróleo!",
	["od_gotocheck"] = "Vá para o destino para entregar, alguém precisa do nosso petróleo...",
	["od_gladto"] = "Olá senhor, fico feliz que você tenha conseguido chegar ao destino.",
	["od_gobackto"] = "Você pode sair agora, minha lata está cheia!",
	["od_nocart"] = "Você não veio de carroça, você veio a pé?Traga-me o óleo por favor...",
	["od_notincart"] = "Você não está na carroça, o que você quer estacionar?",
	["od_notparked"] = "Você não trouxe a carroça de volta, estacione e depois volte para o pagamento!",
	["od_payout"] = "Vá ao gerente para pagamento",
	["od_anothercart"] = "Outra carroça já nesta área, limpe a área para pegar outra!", -- UPDATE 1.4
			
		-- ENGINEER
	["en_goto"] = "Vá para o local para verificar as máquinas",
	["en_needrepair"] = "Há muito óleo aqui, temos que reduzir a pressão!",
	["en_gotonext"] = "Está tudo bem aqui, vá para a próxima máquina para verificar!",
	["en_checknext"] = "Está consertado, vá para a próxima máquina para verificar!",        
	["fw_youreceivedoil"] = "Você recebeu",
	["fw_inyourinventoryoil"] = "e coloque-o em seu inventário!",
		   
		-- FINISH JOBS
	["fw_youreceived"] = "Você recebeu",
	["fw_and"] = "$ e",
	["fw_tipexp"] = " experiência!",
	["fw_dollar"] = " $!",
	["fw_nopayout"] = "Você não completou nenhum trabalho, cancele o trabalho se não quiser trabalhar aqui!", -- UPDATE 1.4
		-- WEBHOOK
	["webh_oilfb"] = "Field Worker/ Oil Barrel",
	["webh_oilengineer"] = "Engineer",
	["webh_oildelivery"] = "Oil Delivery",
	["webh_finished"] = "has finished to work and received",
	["webh_and"] = "$ and",
	["webh_exp"] = "experience",
	["webh_received"] = "Received",
	["webh_hereceived"] = "received",
	["webh_inv"] = "in his inventory!",
	},
}   

function NOTIFY(text) --SET YOUR NOTIFYCATIONS
TriggerEvent("vorp:TipBottom", text, 5000)       
end