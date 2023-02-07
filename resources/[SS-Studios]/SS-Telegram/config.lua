-- Author '🆂🅸🆁🅴🅲#0336'
-- REPORT ANY BUGS ON https://discord.gg/9XNBaQSmMd --

Config = {
    
Framework = "vorp", -- CHOICE YOUR FRAMEWORK vorp FOR VORP or redemrp FOR REDEM:RP !
Webhook = "https://discord.com/api/webhooks/1003834994449461338/4-H_5gOdUwUY5tu2VvsJTPR-bb9V4EZ6uYSLbPFOU5OmC8QyESmS5X62mDGPMW-8FQ5S", -- WEBHOOK OF TELEGRAM
WebhookTittle = "Um telegrama foi enviado.", -- TITTLE OF WEBHOOK
CustomDate = "01/1899",
    
MaxMoneyAmount = 500, -- MAX AMOUNT OF MONEY THAT CAN BE SEND BY TELEGRAM
    
Model = "A_C_Pigeon", -- BIRD MODEL EX: A_C_Pigeon
ModelAnonymouse = "a_c_crow_01", -- BIRD MODEL FOR ANONYMUSE TELEGRAM
Align = "right",
    
Item = "telegram", -- ITEM TO USE FOR TELEGRAM
AnonymousItem = "blacktelegram", -- BLACK TELEGRAM ITEM WITH ANONYMOUS NAME
Key = 0xD9D0E1C0,
    
Timeout = 10000, -- TIME to recall the telegram default 10000
TimeCheck = 10000, -- TIME to check for new telegram default 10000
ResetTelegram = 240000, -- TIME TO RESET BIRD TELEGRAM IF STUCK OR DIE DEFAULT 240000 (4 MIN) "false" TO TURN OFF !    

Texts = {
["button_key"] = "TELEGRAMA",
["write_telegram"] = "ESCREVA UM TELEGRAMA",
["read_telegram"] = "LEIA O TELEGRAMA",
["calltoyou"] = "CHAMAR PÁSSARO", 
        
["texttimeout"] = "Você deve esperar antes de enviar outro telegrama",
["notspawned"] = "Você não tem nenhum telegrama",
["cooming"] = "Espere o pombo chegar até você",
["newtelegram"] = "Você tem um novo telegrama",
["sendfail"] = "O destinatário não foi encontrado, certifique-se de escrever o primeiro e o último nome corretamente !",
["sendsuccess"] = "Seu telegrama foi enviado com sucesso !",
["anonymouse"] = "Telegrama anônimo",
--NEW
["money_toomuch"] = "Este valor excede o limite !",
["money_toosmall"] = "O valor não pode ser negativo !",
["receive_money"] = "Neste telegrama você recebeu ",
},    
}

function NOTIFY(text) --SET YOUR NOTIFYCATIONS
if Config.Framework == "redemrp" then    
TriggerEvent('redem_roleplay:Tip', text, 5000)    
elseif Config.Framework == "vorp" then
TriggerEvent("vorp:TipBottom", text, 5000) 
end        
end