
VorpInv = exports.vorp_inventory:vorp_inventoryApi()

local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

RegisterServerEvent('vorp:itemreward')
AddEventHandler('vorp:itemreward', function()
	local _source = source
	local User = VorpCore.getUser(_source) 
    local Character = User.getUsedCharacter 

	math.randomseed(os.time())     
	local rng = math.random(1, 100)

	if rng == 1 then
		TriggerClientEvent("vorp:TipRight", _source, "Você não encontrou nada", 5000)
					
	elseif rng > 1 and rng < 20 then
		local count = VorpInv.getItemCount(_source, "rocks")
		if count >= 40 then
			TriggerClientEvent("vorp:TipRight", _source, "Você não tem espaço suficiente", 5000)
		else
			TriggerClientEvent("vorp:TipRight", _source, "Você encontrou pedra sedimentar", 5000)
			VorpInv.addItem(_source, 'rocks', math.random(3,5) )
		end
						
	elseif rng >= 21 and rng < 60 then
		local count = VorpInv.getItemCount(_source, "magnetite")
		if count >= 40 then
			TriggerClientEvent("vorp:TipRight", _source, "Você não tem espaço suficiente", 5000)
		else
			TriggerClientEvent("vorp:TipRight", _source, "Você encontrou magnetita", 5000)
			VorpInv.addItem(_source, 'magnetite', math.random(2,4))
		end
					
	elseif rng >= 61 and rng <= 100 then
		local count = VorpInv.getItemCount(_source, "grafite")
		if count >= 40 then
			TriggerClientEvent("vorp:TipRight", _source, "Você não tem espaço suficiente", 5000)
		else
			TriggerClientEvent("vorp:TipRight", _source, "Você encontrou grafite ", 5000)
			VorpInv.addItem(_source, 'grafite', math.random(2,4) )
		end
	end
end)

--------- PROCESSO ------
RegisterServerEvent("minatore:checkjob")
AddEventHandler("minatore:checkjob", function()
    local _source = source
	local User = VorpCore.getUser(_source) 
    local Character = User.getUsedCharacter  

	TriggerEvent('stress:getStress', _source, function(stress)
		if Character.job ~= "armariaValentine" or Character.job ~= "armariaSaintDenis" or Character.job ~= "rdguns" or Character.job ~= "armaria" or Character.job ~= "Bwguns" and stress < 99 then
			TriggerClientEvent("minatore:updatejob", _source)
		else
			TriggerClientEvent("vorp:TipRight", _source, "Você está cansado! Volte quando estiver descansado", 4000)
		end
	end)
	
	
end)

RegisterServerEvent("vane_processa:pietra")
AddEventHandler("vane_processa:pietra", function()
	local _source = source
	local count = VorpInv.getItemCount(source, "rocks")
	TriggerEvent('stress:getStress', _source, function(stress)

		if count > 5 and stress < 99 then 
			VorpInv.subItem(_source, "rocks", 5)
			TriggerClientEvent("progressbar:processo", _source)

			Wait(7000)
			VorpInv.addItem(_source, "carvao", 5)
			TriggerClientEvent("vorp:TipRight", _source, "Você processou as pedras", 4000)
			TriggerClientEvent('stress:modify', 0.5)
		else
			TriggerClientEvent("vorp:TipRight", _source, "Você está muito cansado ou não tem material suficiente", 4000)
		end
	end)
end)

RegisterServerEvent("vane_processa:ferro")
AddEventHandler("vane_processa:ferro", function()
	local _source = source
	local count = VorpInv.getItemCount(source, "magnetite")
	TriggerEvent('stress:getStress', _source, function(stress)

		if count >= 5 and stress < 99 then 

			VorpInv.subItem(_source, "magnetite", 5)
			TriggerClientEvent("progressbar:processo", _source)

			Wait(7000)
			VorpInv.addItem(_source, "ferro", 3)
			
			TriggerClientEvent("vorp:TipRight", _source, "Você criou x3 lingote de ferro", 4000)
			TriggerClientEvent('stress:modify', 0.5)
		else
			TriggerClientEvent("vorp:TipRight", _source, "Você está muito cansado ou não tem material suficiente", 4000)
		end
	end)
end)

RegisterServerEvent("vane_processa:barraaco")
AddEventHandler("vane_processa:barraaco", function()
	local _source = source
	local count2 = VorpInv.getItemCount(source, "grafite")
	TriggerEvent('stress:getStress', _source, function(stress)

		if count2 >= 5 and stress < 99 then 
			VorpInv.subItem(_source, "grafite", 5)
			TriggerClientEvent("progressbar:processo", _source)

			Wait(7000)
			VorpInv.addItem(_source, "barraaco", 3)
			
			TriggerClientEvent("vorp:TipRight", _source, "Você criou x3 barra de aço", 4000)
			TriggerClientEvent('stress:modify', 0.5)
		else
			TriggerClientEvent("vorp:TipRight", _source, "Você está muito cansado ou não tem material suficiente", 4000)
		end
	end)
end)


RegisterServerEvent("weaponsmith:checkp2")
AddEventHandler("weaponsmith:checkp2", function()
    local _source = source
    local User = VorpCore.getUser(_source) 
    local Character = User.getUsedCharacter 		
    
    if Character.job == "armariaValentine" or Character.job == "armariaSaintDenis" or Character.job == "rdguns" or Character.job == "armaria" or Character.job == "Bwguns" then
	    TriggerClientEvent('weaponsmith:openp2',_source)
	else
		TriggerClientEvent("vorp:TipRight", _source, 'Você não é um armeiro', 4000)
	end	
		
end)

RegisterServerEvent('miniera:processoarmeiro')
AddEventHandler('miniera:processoarmeiro', function(barraaco, ferro, item) 

    local _source = source
    local barraacoa = VorpInv.getItemCount(_source, "barraaco")
    local ferroa = VorpInv.getItemCount(_source, "ferro")

    if barraacoa >= barraaco and ferroa >= ferro then 
        TriggerClientEvent('miniera:animazionep2',_source)

        VorpInv.subItem(_source, "barraaco", tonumber(barraaco))
        VorpInv.subItem(_source, "ferro", tonumber(ferro))
		Wait(100000)
        VorpInv.addItem(_source, item, 1)

        TriggerClientEvent("vorp:TipRight", _source, 'Material processado!', 5000)
		TriggerClientEvent('stress:modify', 0.5)

    else
        TriggerClientEvent("vorp:TipRight", _source, 'não tem materiais suficientes!', 5000)
    end

end)

----------------------------------------------------------------------------------------------------	FERREIRO
RegisterServerEvent("ferreiro:pregos")
AddEventHandler("ferreiro:pregos", function()
	local _source = source
	local count2 = VorpInv.getItemCount(source, "barraaco")
	TriggerEvent('stress:getStress', _source, function(stress)

		if count2 >= 1 and stress < 99  then 
			TriggerClientEvent('miniera:animazionep',_source)
			
			VorpInv.subItem(_source, "barraaco", 1)
			Wait(15000)
			VorpInv.addItem(_source, "nails", 5)
			TriggerClientEvent("vorp:TipRight", _source, "Você criou x5 Pregos", 4000)
			TriggerClientEvent('stress:modify', 0.5)
		else
			TriggerClientEvent("vorp:TipRight", _source, "Você precisa de x1 barra de aço ", 4000)
		end
	end)
end)
RegisterServerEvent("ferreiro:tabuas")
AddEventHandler("ferreiro:tabuas", function()
	local _source = source
	local count2 = VorpInv.getItemCount(_source, "tira_cedro")
	TriggerEvent('stress:getStress', _source, function(stress)

		if count2 >= 1 and stress < 99  then 
			TriggerClientEvent('miniera:animazionep',_source)
			
			VorpInv.subItem(_source, "tira_cedro", 1)
			Wait(15000)
			VorpInv.addItem(_source, "wooden_boards", 2)
			
			TriggerClientEvent("vorp:TipRight", _source, "Você criou x2 Tábuas", 4000)
			TriggerClientEvent('stress:modify', 0.5)
		else
			TriggerClientEvent("vorp:TipRight", _source, "Você precisa de x1 Tira de cedro", 4000)
		end
	end)
end)
RegisterServerEvent("ferreiro:martelo")
AddEventHandler("ferreiro:martelo", function()
	local _source = source
	local count2 = VorpInv.getItemCount(_source, "ferro")
	local count = VorpInv.getItemCount(_source, "tira_cedro")
	TriggerEvent('stress:getStress', _source, function(stress)

		if count2 >= 1 and count >= 1 and stress < 99  then 
			TriggerClientEvent('miniera:animazionep',_source)
			
			VorpInv.subItem(_source, "ferro", 1)
			VorpInv.subItem(_source, "tira_cedro", 1)
			Wait(15000)
			VorpInv.addItem(_source, "ironhammer", 1)
			
			TriggerClientEvent("vorp:TipRight", _source, "Você criou x1 Martelo", 4000)
			TriggerClientEvent('stress:modify', 0.5)
		else
			TriggerClientEvent("vorp:TipRight", _source, "Você precisa de x1 Ferro, x1 tira de cedro", 4000)
		end
	end)
end)
RegisterServerEvent("ferreiro:barril")
AddEventHandler("ferreiro:barril", function()
	local _source = source
	local count = VorpInv.getItemCount(_source, "nails")
	local count2 = VorpInv.getItemCount(_source, "wooden_boards")
	local count3 = VorpInv.getItemCount(_source, "ironhammer")
	TriggerEvent('stress:getStress', _source, function(stress)

		if count >= 10 and count2 >= 5 and count3 >= 1 and stress < 99 then 
			TriggerClientEvent('miniera:animazionep',_source)
			
			VorpInv.subItem(_source, "nails", 10)
			VorpInv.subItem(_source, "wooden_boards", 5)
			VorpInv.subItem(_source, "ironhammer", 1)
			Wait(15000)
			VorpInv.addItem(_source, "barrel", 1)
			
			TriggerClientEvent("vorp:TipRight", _source, "Você criou x1 Barril", 4000)
			TriggerClientEvent('stress:modify', 0.5)
		else
			TriggerClientEvent("vorp:TipRight", _source, "Você precisa de x10 Pregos, x5 Tábuas, x1 Martelo", 4000)
		end
	end)
end)

RegisterServerEvent('ferreiro:check')
AddEventHandler('ferreiro:check', function()
	local _source = source
	local User = VorpCore.getUser(_source)
	local Character = User.getUsedCharacter
	if Character.job == 'ferreiro' then
		TriggerClientEvent("ferreiro:openp",_source)
	end
end)

RegisterServerEvent('ferreiro2:check')
AddEventHandler('ferreiro2:check', function()
	local _source = source
	local User = VorpCore.getUser(_source)
	local Character = User.getUsedCharacter
	if Character.job == 'ferreiro2' then
		TriggerClientEvent("ferreiro:openp",_source)
	end
end)

RegisterServerEvent('ferreiro3:check')
AddEventHandler('ferreiro3:check', function()
	local _source = source
	local User = VorpCore.getUser(_source)
	local Character = User.getUsedCharacter
	if Character.job == 'ferreiro3' then
		TriggerClientEvent("ferreiro:openp",_source)
	end
end)

RegisterServerEvent("ferreiro:ferradura")
AddEventHandler("ferreiro:ferradura", function(price)
	local _source = source
	local User = VorpCore.getUser(_source)
	local Character = User.getUsedCharacter
	local money = Character.money
	if money >= price then 

		VorpInv.addItem(_source, "Horse_Shoe", 1)
		TriggerEvent("vorp:removeMoney", _source, 0, price)
		TriggerClientEvent("vorp:TipRight", _source, "Você comprou 1x Ferradura", 4000)
	else
		TriggerClientEvent("vorp:TipRight", _source, "Você precisa de $5" , 4000)
	end
end)
RegisterServerEvent("ferreiro:carroca")
AddEventHandler("ferreiro:carroca", function(price)
	local _source = source
	local User = VorpCore.getUser(_source)
	local Character = User.getUsedCharacter
	local money = Character.money
	if money >= price then 

		VorpInv.addItem(_source, "Repair_Kit", 1)
		TriggerEvent("vorp:removeMoney", _source, 0, price)
		TriggerClientEvent("vorp:TipRight", _source, "Você comprou 1x Reparador de Carroça", 4000)
	else
		TriggerClientEvent("vorp:TipRight", _source, "Você precisa de $5" , 4000)
	end
end)



RegisterServerEvent("ferreiro:laminap")
AddEventHandler("ferreiro:laminap", function()
	local _source = source
	local count2 = VorpInv.getItemCount(_source, "barraaco")
	local count = VorpInv.getItemCount(_source, "ferro")
	TriggerEvent('stress:getStress', _source, function(stress)

		if count2 >= 2 and count >= 1 and stress < 99 then 
			TriggerClientEvent('miniera:animazionep',_source)
			
			VorpInv.subItem(_source, "barraaco", 2)
			VorpInv.subItem(_source, "ferro", 1)
			Wait(15000)
			VorpInv.addItem(_source, "laminap", 1)
			
			TriggerClientEvent("vorp:TipRight", _source, "Você criou x1 Lamina pequena", 4000)
			TriggerClientEvent('stress:modify', 0.5)
		else
			TriggerClientEvent("vorp:TipRight", _source, "Você precisa de x2 barra de aço, x1 Ferro", 4000)
		end
	end)
end)
RegisterServerEvent("ferreiro:laminag")
AddEventHandler("ferreiro:laminag", function()
	local _source = source
	local count2 = VorpInv.getItemCount(_source, "barraaco")
	local count = VorpInv.getItemCount(_source, "ferro")
	TriggerEvent('stress:getStress', _source, function(stress)

		if count2 >= 4 and count >= 2 and stress < 99 then 
			TriggerClientEvent('miniera:animazionep',_source)
			
			VorpInv.subItem(_source, "barraaco", 4)
			VorpInv.subItem(_source, "ferro", 2)
			Wait(15000)
			VorpInv.addItem(_source, "laminag", 1)
			
			TriggerClientEvent("vorp:TipRight", _source, "Você criou x1 Lamina grande", 4000)
			TriggerClientEvent('stress:modify', 0.5)
		else
			TriggerClientEvent("vorp:TipRight", _source, "Você precisa de x4 barra de aço, x2 Ferro", 4000)
		end
	end)
end)

RegisterServerEvent('ferreiro:faca')
AddEventHandler('ferreiro:faca', function()
	local _source= source
	local count = VorpInv.getItemCount(_source,'laminap')
	local ammo = {["nothing"] = 0}
    local comps = {["nothing"] = 0}
	TriggerEvent('stress:getStress', _source, function(stress)
	if count >= 2 and stress < 99 then
		TriggerClientEvent('miniera:animazionep',_source)
		VorpInv.subItem(_source,'laminap', 2)
		Wait(15000)
		VorpInv.createWeapon(_source,'WEAPON_MELEE_KNIFE', ammo, comps )
		TriggerClientEvent('vorp:TipRight', _source, 'Você criou uma faca', 3000)
		TriggerClientEvent('stress:modify', 0.5)
	else 
		TriggerClientEvent('vorp:TipRight', _source, ' Você não tem os materiais necessários', 3000)
	end
end)
end)

RegisterServerEvent('ferreiro:facao')
AddEventHandler('ferreiro:facao', function()
	local _source= source
	local count2 = VorpInv.getItemCount(_source,'laminag')
	local ammo = {["nothing"] = 0}
    local comps = {["nothing"] = 0}
	TriggerEvent('stress:getStress', _source, function(stress)
	if count2 >= 4 and stress < 99 then
		TriggerClientEvent('miniera:animazionep',_source)
		VorpInv.subItem(_source,'laminag', 4)
		Wait(15000)
		VorpInv.createWeapon(_source,'WEAPON_MELEE_MACHETE', ammo, comps )
		TriggerClientEvent('vorp:TipRight', _source, 'Você criou um facao',3000)
		TriggerClientEvent('stress:modify', 0.5)
	else 
		TriggerClientEvent('vorp:TipRight', _source, 'Você não tem os materiais necessários', 3000)
	end
end)
end)

RegisterServerEvent('ferreiro:picareta')
AddEventHandler('ferreiro:picareta', function()
	local _source= source
	local count2 = VorpInv.getItemCount(_source,'laminag')
	local count1 = VorpInv.getItemCount(_source,'cabomadeira')
	TriggerEvent('stress:getStress', _source, function(stress)
		if count2 >= 2 and count1 >= 2 and stress < 99 then
			TriggerClientEvent('miniera:animazionep',_source)
			VorpInv.subItem(_source,'laminag', 2)
			VorpInv.subItem(_source,'cabomadeira', 2)
			Wait(15000)
			VorpInv.addItem(_source, "picareta", 2,{description = "Durabilidade = 100", durability = 100})
			TriggerClientEvent('vorp:TipRight', _source, 'Você criou 2x picareta',3000)
			TriggerClientEvent('stress:modify', 0.5)
		else 
			TriggerClientEvent('vorp:TipRight', _source, 'Você precisa de 2x Lamina Grande e 2 Cabos de Madeira', 3000)
		end
	end)
end)

RegisterServerEvent('ferreiro:machado')
AddEventHandler('ferreiro:machado', function()
	local _source= source
	local count2 = VorpInv.getItemCount(_source,'laminag')
	local count1 = VorpInv.getItemCount(_source,'cabomadeira')
	TriggerEvent('stress:getStress', _source, function(stress)
		if count2 >= 2 and count1 >= 2 and stress < 99 then
			TriggerClientEvent('miniera:animazionep',_source)
			VorpInv.subItem(_source,'laminag', 2)
			VorpInv.subItem(_source,'cabomadeira', 2)
			Wait(15000)
			VorpInv.addItem(_source, "machado", 2,{description = "Durabilidade = 100", durability = 100})
			TriggerClientEvent('vorp:TipRight', _source, 'Você criou 2x machado',3000)
			TriggerClientEvent('stress:modify', 0.5)
		else 
			TriggerClientEvent('vorp:TipRight', _source, 'Você precisa de 2x Lamina Grande e 2 Cabos de Madeira', 3000)
		end
	end)
end)
RegisterServerEvent('ferreiro:cabomadeira')
AddEventHandler('ferreiro:cabomadeira', function()
	local _source= source
	local count1 = VorpInv.getItemCount(_source,'tira_cedro')
	TriggerEvent('stress:getStress', _source, function(stress)
		if count1 >= 3 and stress < 99 then
			TriggerClientEvent('miniera:animazionep',_source)
			VorpInv.subItem(_source,'tira_cedro', 3)
			Wait(15000)
			VorpInv.addItem(_source, "cabomadeira", 3)
			TriggerClientEvent('vorp:TipRight', _source, 'Você criou 3x cabo de madeira',3000)
			TriggerClientEvent('stress:modify', 0.5)
		else 
			TriggerClientEvent('vorp:TipRight', _source, 'Você precisa de 3x Tiras de Cedro!', 3000)
		end
	end)
end)

--------------------------------------------------------- CHECK PICARETA
RegisterServerEvent('mining:checkpicareta')
AddEventHandler('mining:checkpicareta', function()
	local _source = source
	local picareta = VorpInv.getItem(_source, "picareta")
	if picareta ~= nil then
		TriggerEvent('stress:getStress', _source, function(stress)
			if stress < 99 then
				local meta =  picareta["metadata"]
				if next(meta) == nil then 
					VorpInv.subItem(_source, "picareta", 1,{})
					VorpInv.addItem(_source, "picareta", 1,{description = "Durabilidade = 100", durability = 100})
					TriggerClientEvent("minatore:updatejob", _source)
				else
					local durability = meta.durability - 0.02
					local description = "Durabilidade = "
					VorpInv.subItem(_source, "picareta", 1,meta)
					if 0 >= durability then 
						local random = math.random(1,2)
						if random == 1 then 
							TriggerClientEvent("vorp:TipRight", _source, "Você quebrou a picareta!", 2000)
						else
							VorpInv.addItem(_source, "picareta", 1,{description = description.."1",durability = 1})
							TriggerClientEvent("minatore:updatejob", _source)
						end
					else
						VorpInv.addItem(_source, "picareta", 1,{description = description..durability,durability = durability})
						TriggerClientEvent("minatore:updatejob", _source)
					end
				end
			else
				TriggerClientEvent("vorp:TipRight", _source, "Você está cansado! Volte quando estiver descansado", 4000)
			end
		end)
	else
		TriggerClientEvent("vorp:TipRight", _source, "Você não tem uma picareta!", 4000)
	end
end)