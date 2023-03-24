-- Author '🆂🅸🆁🅴🅲#0336'
-- REPORT ANY BUGS ON https://discord.gg/9XNBaQSmMd --

Config = {
    
Framework = "vorp", -- DON'T CHANGE IT IN THIS VERSION    
    
ServerName = "Colorado", -- WILL BE THE SIGN ID ON IDENTITY CARD BOTTOM RIGHT
SSArchives = true, -- Put true TO MAKE PEOPLE PAY FINES FROM SS-ARCHIVES false IF YOU DON'T HAVE SS-ARCHIVES    
SynSociety = "police", -- WHERE TO GO THE MONEY FROM FINES ? PUT THE JOB OR false TO TURN OFF
BlackListJobs = {"police"}, -- What job's to don't show in IDENTITY CARD ?
ReplaceBlackListJobs = "Unemployed", -- What to show if they have BlackListJobs ?
FakeIdDefaultJob = "unemployed", -- What job to show on FAKE IDENTITY JOB ?    

ServerYear = 1899, -- ID CARDS WILL BE RELEASED IN THIS YEAR
MaxYears =  80, -- THE MAX YEARS A PLAYER CAN HAVE
MinYears =  18, -- THE MIN YEARS A PLAYER CAN HAVE  
Button = "PRESSIONE", -- BUTTON NAME
Key = 0xD9D0E1C0, -- KEY TO OPEN MENU
Align = "right", -- ALIGN MENU
    
UseAnimProp = true, -- DO ANIMATION AND PROP WHEN SHOW THE IDENTITY CARD

IdentityCardItem = "id", -- ITEM NAME OF IDENTITY CARD TO USE
PayRegistration = 5, -- TURN OFF WITH false OR INSERT PRICE OF IDENTITY CARD   
PayCopyRegistration = 1, -- TURN OFF WITH false OR INSERT PRICE OF IDENTITY CARD WHEN ASK FOR COPY
PayInfoUpdate = 1, --TURN OFF WITH false OR INSERT PROCE FOR CHANGINF IDENTITY CARD INFOS
    
FakeIdentityCardItem = "fakeid", -- ITEM NAME OF FAKE IDENTITY CARD TO USE
PayFakeId = 3000, -- TURN OFF WITH false OR INSERT PRICE OF IDENTITY CARD
PayFakeCopyId = 1500, --  -- TURN OFF WITH false OR INSERT PRICE OF IDENTITY CARD WHEN ASK FOR FAKE COPY

WebHook = "https://discord.com/api/webhooks/1000840339717890082/t03zIOBu4EYuQVLSeOhYujwWXbDFlyhN21k4-Vwb6-SYrSwGhS8e5V3LwfFtBkhT3SD7", -- FOR LOGS
WebHookInfo = "HAS REGISTERED HIS IDENTITY CARD ID WITH NR",    
    
NationalRegistration = {
    [1] = { 
        City = "Valentine", -- CITY NAME WILL SHOW ON ID WHERE WAS REGISTERED PUT ONLY CITY NAME
		FakeServices = false, -- PROVIDE FAKE SERVICES
        Name = "Valentine NR Office", -- BLIP NAME AND TITTLE MENU
        Desc = "IDENTITY REGISTRATION", -- SUBMENU DESCRIPTION   
        NpcModel = "S_M_M_VHTDEALER_01", -- NPC MODEL
        Pos = {-175.2606048584, 631.74407958984, 113.08966064454, 320.85287475586}, -- POS NPC/BLIP
        Distance = 3.0, -- DISTANCE TO OPEN MENU
        Blip = 587827268, -- BLIP MODEL
	},  
	[2] = { 
        City = "Blackwater",
		FakeServices = false,              
        Name = "BlackWater NR Office",
        Desc = "IDENTITY REGISTRATION",             
        NpcModel = "S_M_M_VHTDEALER_01",
        Pos = {-762.0810546875, -1272.1394042968, 43.050540924072, 86.552299499512},
        Distance = 3.0,
        Blip = 587827268,
	},  
	[3] = { 
        City = "Rhodes",
		FakeServices = false,
        Name = "Rhodes NR Office",
        Desc = "IDENTITY REGISTRATION",             
        NpcModel = "S_M_M_VHTDEALER_01",
        Pos = {1230.1987304688, -1298.5638427734, 75.904258728028, 232.19049072266},
        Distance = 3.0,
        Blip = 587827268,
	},         
	[4] = { 
        City = "Saint Denis",
		FakeServices = false,
        Name = "Saint Denis NR Office",
        Desc = "IDENTITY REGISTRATION",             
        NpcModel = "S_M_M_VHTDEALER_01",
        Pos = {2747.9025878906, -1396.4379882812, 46.183067321778, 24.291278839112},
        Distance = 3.0,
        Blip = 587827268,
	},
	[5] = { 
        City = "Armadillo",
		FakeServices = true,            
        Name = "Mrs Thomson",
        Desc = "REGISTRO DE IDENTIDADE",             
        NpcModel = "S_M_M_VHTDEALER_01",
        Pos = {-3729.09, -2601.32, -13.93, 178.22},
        Distance = 3.0,
        Blip = false,
	},        
},
    
Texts = {
--MENU BUTTONS        
["reg_id"] = "Registro de Identidade",
["reg_id_desc"] = "Registrar sua identidade",        
["ask_copy"] = "PEDIR COPIA",  
["ask_copy_desc"] = "Pedir uma cópia da Identidade",
["updateinfo"] = "ATUALIZAR INFORMAÇÕES",  
["deleteinfo"] = "REMOVER ID FALSO",   
["deleteinfo_desc"] = "Exclua seu ID falso, para que você possa criar um novo !",          
["updateinfo_desc"] = "Atualize suas informações como cabelo, olhos, peso, etc....",        
--REGISTRATION        
["info"] = "FORNECER INFORMAÇÕES", 
["fake_city"] = "Cidade de registro",        
["fake_firstname"] = "Primeiro nome ( FAKE )",
["fake_lastname"] = "Sobrenome ( FAKE )",
["dob"] = "Data de nascimento EX:(01-05-1845)",
["rday"] = "Seu aniversário ? EX( 04 )",
["rmonth"] = "Seu mês de nascimento ? EX( 07 )",
["ryears"] = "Qual é a sua idade ? EX( 32 )",        
["rkg"] = "Quantos Kg você tem? EX( 68 )",         
["reyes"] = "A cor dos seus olhos? EX( blue )",
["rhair"] = "Sua cor de cabelo? EX( black )",
["rcm"] = "Qual é a sua altura ? EX( 176 )",
["wrongage"] = "Sua idade é maior ou menor do que o habitual !", 
["wrongdates"] = "O mês ou dia é muito alto ou mais baixo do que o normal", 
["check_fines"] = "VERIFICAR MULTAS",
["check_finesdesc"] = "Confira e pague suas multas !", 
--NOTIFICATIONS   
["deletedfakeid"] = "Excluímos seu FAKE ID e ocultamos todas as informações falsas",          
["no_id"] = "Você não tem um CARTÃO DE IDENTIDADE para atualizar, registre-o primeiro !",     
["no_fakeid"] = "Você não tem um CARTÃO DE IDENTIDADE FALSO para excluir, compre um primeiro!",        
["no_fakeid1"] = "Você não tem um CARTÃO DE IDENTIDADE FALSO para pedir uma cópia, por favor compre um primeiro !",          
["i_wrong"] = "Algumas informações estão faltando ou estão erradas !",
["already_id"] = "Você já foi cadastrado ! ",
["not_reg"] = "Este ID ainda não está registrado, dirija-se ao Cartório Nacional de Registro mais próximo!",
["nobody_around"] = "Não há ninguém por perto, só você vê",   
["alreadyhave"] = "Você já tem um CARTÃO DE IDENTIDADE !",
["register_fakeidcard1"] = "Você cadastrou seu CARTÃO DE IDENTIDADE FALSO e pagou ",         
["register_idcard1"] = "Você cadastrou seu CARTÃO DE IDENTIDADE e pagou ",   
["register_idcard"] = "Você registrou seu CARTÃO DE IDENTIDADE !", 
["take_fakecopy1"] = "Você recebeu uma cópia de seu CARTÃO DE IDENTIDADE FALSO e pagou ",        
["take_copy1"] = "Você recebeu uma cópia do seu CARTÃO DE IDENTIDADE e pagou ",   
["take_copy"] = "Você recebeu uma cópia do seu CARTÃO DE IDENTIDADE!",  
["update1"] = "Suas informações pessoais foram atualizadas e você pagou ",   
["update"] = "Suas informações pessoais foram atualizadas! ", 
["no_money"] = "Você não tem dinheiro suficiente para pagar!",
["you_payed_fine"] = "Você pagou a multa ", 
["no_fines"] = "Você não tem nenhuma multa a pagar!",         
},
  
}

function NOTIFY(text) --SET YOUR NOTIFYCATIONS
TriggerEvent("vorp:TipBottom", text, 5000)       
end  