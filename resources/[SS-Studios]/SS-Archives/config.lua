-- Author '🆂🅸🆁🅴🅲#0336'
-- REPORT ANY BUGS ON https://discord.gg/9XNBaQSmMd --
Config = {
    
Dev = false,     
    
Framework = "vorp", --DON'T TOUCH ON THIS VERSION 
WebHook = "", -- FOR LOGS    
    
Align = "right", -- ALIGN MENU   
Button = "PRESSIONE", -- BUTTON NAME
Key = 0xD9D0E1C0, -- KEY TO OPEN
ServerYear = "1899", -- YOUR SERVER PLAYABLE YEAR
    
DrinkItem = "agua_consumivel", -- THE DRINK FOR CANTEEN
FoodItem = "pao", -- THE FOOD FOR CANTEEN
    
BountyHunter = false, -- IF YOU HAVE SS-BOUNTYHUNTER YOU CAN ADD BOUNTY FROM SHERIFF ARCHIVE AND REMOVE IT
PayFromSheriff = false, -- true TAKE MONEY FROM SHERIFF WHEN ADD BOUNTY 
    
AllowedJobs = {"police"}, -- JOBS THAT CAN OPEN THE ARCHIVES
    
AutoFine = false, -- PUT true TO TAKE MONEY INSTANTLY FROM PLAYERS AND DON'T NEED TO PAY THEM TO SS-IDENTITYCARD NATIONAL OFFICES 
AutoEject = true, -- EJECT CITIZENS IF THEY ENTER INTO PENITENTIARY ZONE !   
AutoTeleport = true, -- TELEPORT BACK IN PRISON IF PRISONER ESCAPE
AutoDoors = true, -- PUT true TO CLOSE ALL DOORS OF PENITENTIARY, 1 TIME HE WILL NOT CONFLICT WITH YOUR DOORLOCKS SCRIPT !    
NoteBook = "book", -- ITEM TO OPEN SHERIFF'S ARCHIVES
    
TimeToCheckJail = 60000, --CHECK EXPIRED JAIL            
AutoJail = true,
-- AUTOJAIL: IF true the player will be instantly teleported into JAIL once detention added, if false police must bring it mannualy at JAILS doors, if they can't/fail the player will be teleported instantly on next player rejoin ! 
        
Offices = {     
    [1] = {
    	Name = "Blackwater Archive", -- NAME OF BLIP/BUTTON
		Pos = {-761.92901611328, -1266.8898925782, 44.050498962402, 170.40016174316}, -- POS FOR BLIP/MENU
		Blip = 587827268, -- false TO HIDE THE BLIP
    	Distance = 2.0, -- DISTANCE TO OPEN MENU                  
	}    
},
    
Penintetiary = {
    Name = "Penitenciaria de Sisika", -- PENITENTIARY NAME
    Blip = -1489164512, -- PENITENTIARY BLIP / false TO HIDE    
	Pos = {3363.4689941406, -681.2964477539, 46.466829681396}, -- CENTER OF PENITENTIARY
    CanteenEnter = {3364.3696289062, -701.83612060546, 44.53014755249, 229.82414245606},    
    CanteenExit = {3370.509765625, -651.33990478516, 34.507205963134, 28.595823287964},        
    Canteen = {3375.0607910156, -657.0014038086, 35.507205963134, 281.05603027344}, -- CANTEEN POSITION
    CanteenName = "Cantina", -- CANTEEN NAME    
    CanteenBlip = -1138864184, -- CANTEEN BLIP / false TO HIDE    
    CanteenDistance = 2.0, -- CANTEEN DISTANCE
    ReleasePos = {2685.7255859375, -1454.185913086, 46.278060913086, 187.82933044434}, -- POSITION WHEN PRISONERS ARE RELEASED
    JailDistance = 45, -- FOR MANUAL JAIL / TO TAKE THEM INSIDE IF CLOSED
    Range = 100, -- RANGE TO TP INSIDE IF ESCAPE
    NpcMenuModel = "s_m_m_ambientblwpolice_01", -- NPC 1 / false TO HIDE
    NpcMenu = {3353.7534179688, -641.92889404296, 44.29126739502, 13.36182308197}, -- POS NPC 1
    --Distance = 2.0,
    NpcGuardModel = "s_m_m_skpguard_01", -- NPC 2 / false TO HIDE
    NpcGuard = {3347.1630859375, -643.75970458984, 44.291255950928, 23.405473709106}, -- POS NPC 2
},
    
Texts = {
["noinfo"] = "DELETED",        
["youjailed"] = "Prender ",
["youjailed2"] = "Você estabeleceu uma sentença para ",        
["youhavejailed"] = "Você foi PRESO, seu dossiê é nº ",
["adddossier"] = "Você adicionou DOSSIER para ",
["you_registered"] = "você registrou ",
["already_register"] = "Esta pessoa já está registrada sob o nome de ",
["no_user"] = "Esta pessoa não existe, verifique se o ID da pessoa é válido !",
["youhavecharged"] = "Você recebeu uma MULTA e foi cobrado ",
["already_released"] = "Você foi libertado da penitenciária, seu lugar não é mais aqui !",
["spawnin_jail"] = "Parece que você deve terminar sua sentença antes de poder sair !",
["alreadyhavefood"] = "Você já tem um pouco de comida, coma para ter mais !",
["alreadyhavedrink"] = "Você ainda tem uma bebida, beba para ter mais !",
["yougetfood"] = "Você pegou algo para comer !",
["yougetdrink"] = "Você pegou algo para beber !",
["inv_full"] = "Você não tem espaço para carregar mais ",
["jailed_text"] = "PRESO", 
["jailed_textdesc"] = "Você agora é um preso na Penitenciária de Sisika",  
["not_allowed"] = "Não é permitido chegar tão perto dessa ÁREA !", 
["nomoney_bounty"] = "Você não tem dinheiro suficiente para adicionar essas Recompensa!",
["error_insert"] = "A MULTA ou Recompensa está incorreta, favor verifique!", 
["jailtime"] = "TEMPO:", 
["days"] = "Dias",         
["hours"] = "Horas",  
["minutes"] = "Minutos",   
["seconds"] = "Segundos",
["m"] = "M",    
["f"] = "F",    
--MENU
["canteen"] = "Cantina",
["canteendesc"] = "Alimentos para os presos",
["takefood"] = "Pegar Comida",
["takefooddesc"] = "Pegue algo para comer",
["takedrink"] = "Pegar Bebidas",
["takedrinkdesc"] = "Pegue algo para beber",
}
}

function NOTIFY(text) --SET YOUR NOTIFYCATIONS
TriggerEvent("vorp:TipBottom", text, 5000)       
end 