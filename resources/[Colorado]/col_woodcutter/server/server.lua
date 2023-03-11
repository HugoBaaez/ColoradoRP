VorpInv = exports.vorp_inventory:vorp_inventoryApi()
local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

RegisterServerEvent('woodcutter:checkjob2')
AddEventHandler('woodcutter:checkjob2', function() 
	local _source = source
	local machado = VorpInv.getItem(_source, "machado")
	if machado ~= nil then
		TriggerEvent('stress:getStress', _source, function(stress)
			if stress < 99 then
				local meta =  machado["metadata"]
				if next(meta) == nil then 
					VorpInv.subItem(_source, "machado", 1,{})
					VorpInv.addItem(_source, "machado", 1,{description = "Durabilidade = 100", durability = 100})
					TriggerClientEvent('art_woodcutter:comienzo2',_source)
				else
					local durability = meta.durability - 1
					local description = "Durabilidade = "
					VorpInv.subItem(_source, "machado", 1,meta)
					if 0 >= durability then 
						local random = math.random(1,2)
						if random == 1 then 
							TriggerClientEvent("vorp:TipRight", _source, "Você quebrou a machado!", 2000)
						else
							VorpInv.addItem(_source, "machado", 1,{description = description.."1",durability = 1})
							TriggerClientEvent('art_woodcutter:comienzo2',_source)
						end
					else
						VorpInv.addItem(_source, "machado", 1,{description = description..durability,durability = durability})
						TriggerClientEvent('art_woodcutter:comienzo2',_source)
					end
				end
			else
				TriggerClientEvent("vorp:TipRight", _source, "Você está cansado! Volte quando estiver descansado", 4000)
			end
		end)
	else
		TriggerClientEvent("vorp:TipRight", _source, "Você não tem uma machado!", 4000)
	end
end)
RegisterServerEvent('woodcutter:checkjob')
AddEventHandler('woodcutter:checkjob', function() 
    local _source = source
	local machado = VorpInv.getItem(_source, "machado")
	if machado ~= nil then
		TriggerEvent('stress:getStress', _source, function(stress)
			if stress < 99 then
				local meta =  machado["metadata"]
				if next(meta) == nil then 
					VorpInv.subItem(_source, "machado", 1,{})
					VorpInv.addItem(_source, "machado", 1,{description = "Durabilidade = 100", durability = 100})
					TriggerClientEvent('art_woodcutter:comienzo',_source)
				else
					local durability = meta.durability - 1
					local description = "Durabilidade = "
					VorpInv.subItem(_source, "machado", 1,meta)
					if 0 >= durability then 
						local random = math.random(1,2)
						if random == 1 then 
							TriggerClientEvent("vorp:TipRight", _source, "Você quebrou a machado!", 2000)
						else
							VorpInv.addItem(_source, "machado", 1,{description = description.."1",durability = 1})
							TriggerClientEvent('art_woodcutter:comienzo',_source)
						end
					else
						VorpInv.addItem(_source, "machado", 1,{description = description..durability,durability = durability})
						TriggerClientEvent('art_woodcutter:comienzo',_source)
					end
				end
			else
				TriggerClientEvent("vorp:TipRight", _source, "Você está cansado! Volte quando estiver descansado", 4000)
			end
		end)
	else
		TriggerClientEvent("vorp:TipRight", _source, "Você não tem uma machado!", 4000)
	end
end)

RegisterServerEvent('art_woodcutter:cobrar')
AddEventHandler('art_woodcutter:cobrar', function()
    local _source = source
        
    local count = VorpInv.getItemCount(_source, "toco_pinho")
    local count1 = VorpInv.getItemCount(_source, "toco_cedro")
    local count2 = VorpInv.getItemCount(_source, "toco_abeto")

    

    if VorpInv.canCarryItems(_source, count+count1+count2) and VorpInv.getItemCount(_source, "tira_pinho") + count*2 <= 40 and VorpInv.getItemCount(_source, "tira_cedro") + count1*2 <= 40 and VorpInv.getItemCount(_source, "tira_abeto") + count2*2 <= 40 then

        VorpInv.subItem(_source, "toco_pinho", count)
        VorpInv.subItem(_source, "toco_cedro", count1)
        VorpInv.subItem(_source, "toco_abeto", count2)
        Wait(100)

        if count*2 > 0 then VorpInv.addItem(_source, "tira_pinho", count*2) end
        if count1*2> 0 then VorpInv.addItem(_source, "tira_cedro", count1*2) end
        if count2*2 > 0 then VorpInv.addItem(_source, "tira_abeto", count2*2) end
    else
        TriggerClientEvent("vorp:TipRight", _source, 'Você não tem espaço suficiente no inventário', 4000)
    end
    
end)



RegisterServerEvent('art_woodcutter:givewood')
AddEventHandler('art_woodcutter:givewood', function()
    local _source = source

    math.randomseed(os.time())
    local pino = math.random(5,7)
    local abete = math.random(3,5)
    local cedro = math.random(2,3)

    VorpInv.addItem(_source, "toco_pinho", pino)
    VorpInv.addItem(_source, "toco_abeto", abete)
    VorpInv.addItem(_source, "toco_cedro", cedro)

end)

RegisterServerEvent("checklogsv")
AddEventHandler("checklogsv", function()
    local _source = source
        local count = VorpInv.getItemCount(_source, "toco_pinho")
        local count1 = VorpInv.getItemCount(_source, "toco_cedro")
        local count2 = VorpInv.getItemCount(_source, "toco_abeto")
        if count > 0 or count1 > 0 or count2 > 0 then
            TriggerClientEvent("checklogcl", _source, true)
        else
            TriggerClientEvent("checklogcl", _source, false)
        end
end)

RegisterServerEvent("weaponsmith:checkp")
AddEventHandler("weaponsmith:checkp", function()
    local _source = source
    local User = VorpCore.getUser(_source) 
    local Character = User.getUsedCharacter 		
    
    if Character.job == "armaria" or Character.job == "armariaValentine" or Character.job == "armariaSaintDenis" or Character.job == "rdguns" or Character.job == "Bwguns" then
	    TriggerClientEvent('weaponsmith:openp',_source)
	else
		TriggerClientEvent("vorp:TipRight", _source, 'Você não é um armeiro', 4000)
	end	
		
end)

RegisterServerEvent('artwoodc:processoarmeiro')
AddEventHandler('artwoodc:processoarmeiro', function(pino, abete, cedro, item) 

    local _source = source
    local pinoa = VorpInv.getItemCount(_source, "tira_pinho")
    local abetea = VorpInv.getItemCount(_source, "tira_abeto")
    local cedra = VorpInv.getItemCount(_source, "tira_cedro")

    if pinoa >= pino and abetea >= abete and cedra >= cedro then 
        
        VorpInv.subItem(_source, "tira_pinho", tonumber(pino))
        VorpInv.subItem(_source, "tira_abeto", tonumber(abete))
        VorpInv.subItem(_source, "tira_cedro", tonumber(cedro))

        TriggerClientEvent('artwoodc:animazionep',_source)
        Wait(180000)

        VorpInv.addItem(_source, item, 1)

        TriggerClientEvent("vorp:TipRight", _source, 'Material processado!', 5000)

    else
        TriggerClientEvent("vorp:TipRight", _source, 'Você não tem materiais suficientes!', 5000)
    end

end)