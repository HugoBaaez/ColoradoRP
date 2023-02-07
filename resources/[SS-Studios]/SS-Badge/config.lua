--Author '🆂🅸🆁🅴🅲#0336'
-- REPORT ANY BUGS ON https://discord.gg/9XNBaQSmMd --

Config = {
Framework = "vorp", -- CHOICE FRAMEWORK vorp / redemrp !
Align = "right", -- IF NOT USING ITEM WHERE TO SHOW THE MENU ?   

UseItem = false, -- TRUE FOR ITEM / FALSE FOR COMMAND /badge
Item = "badge", -- NAME OF ITEM BADGE TO USE
UseLastname = true, -- USE LASTNAME OR FIRSTNAME ON BADGES ?    
Distance = 3, -- DISTANCE TO SHOW TO OTHER PEOPLE

Texts = {
 ["nobody_around"] = "Não há ninguém por perto!",               
 ["badge_title"] = "MENU DISTINTIVO",
 ["badge_menu_desc"] = "Opções de Distintivo...", 
 ["attach_badge"] = "Anexar / Retirar", 
 ["attach_badge_desc"] = "Anexar / Retirar distintivo !",
 ["show_badge"] = "Mostrar distintivo", 
 ["show_badge_desc"] = "Mostrar crachá para o jogador mais próximo", 
 ["no_badge"] = "Você não tem nenhum distintivo anexado !",        
        
 ["fix_badge"] = "FIX BADGE",
 ["fix_badge_desc"] = "Corrija a posição do seu crachá",   
 ["fix_pos"] = "Corrija a posição do crachá",
 ["fix_position"] = "Posição do crachá", 
 ["fix_position_desc"] = "Corrija e salve a posição do crachá",       
 ["fix_pos_desc"] = "Consertar a posição do crachá",
 ["save_pos"] = "SALVAR POSIÇÃO", 
 ["save_pos_desc"] = "Salvar posição deste crachá",        
 ["fix_up"] = "Acima",
 ["fix_left"] = "esquerda",
 ["fix_right"] = "direita",
 ["fix_down"] = "baixo",
 ["fix_forward"] = "Mover em frente",
 ["fix_back"] = "Mover para tras", 
 ["rotate_up"] = "Gire para cima",
 ["rotate_down"] = "Gire para baixo",
 ["rotate_right"] = "Gire para direita",
 ["rotate_left"] = "Gire para esquerda", 
 ["noallow_rank"] = "Você não tem o rank necessário para usar!",
 ["noallow_job"] = "Você não tem o trabalho necessário para usar!",
},

ServerName = "CAVALARIA DO COLORADO",
PolicesBadges = { -- EDIT BADGE AND JOBS
[1] = {
	Job = "police", -- SET JOB NAME
	Ranks = {
	[1] = { -- RANK 1
		Badge = "silverbadge", -- IMAGE NAME OF UI BADGE TO SHOW
		Prop = "s_badgepolice01x", -- PROP BADGE TO SHOW/ATTACH IN GAME 
		UseName = true, -- SHOW NAME ON BADGE
		UseServerName = true, -- SHOW SERVER NAME ON BADGE           
		},
	[2] = { -- RANK 2
		Badge = "bronzebadge",
		Prop = "s_badgepolice01x",
		UseName = true,
		UseServerName = true,            
        	}, 
	[4] = { -- RANK 4
		Badge = "goldbadge",
		Prop = "s_badgesherif01x",
		UseName = true,
		UseServerName = true,                 
        	}, 
	[6] = { -- RANK 4
		Badge = "goldbadge",
		Prop = "s_badgepinkerton01x",
		UseName = true,
		UseServerName = true,                 
			}, 
	[7] = { -- RANK 3
		Badge = "marshal",
		Prop = "s_badgeusmarshal01x",
		UseName = false,
		UseServerName = false,             
        	},                 
      },    
}, 
}
} -- END CONFIG
function NOTIFY(text) --SET YOUR NOTIFYCATIONS
if Config.Framework == "redem" then    
TriggerEvent('redem_roleplay:Tip', text, 5000)    
elseif Config.Framework == "vorp" then
TriggerEvent("vorp:TipBottom", text, 5000) 
end        
end 