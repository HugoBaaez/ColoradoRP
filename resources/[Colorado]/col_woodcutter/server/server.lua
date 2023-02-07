VorpInv = exports.vorp_inventory:vorp_inventoryApi()
local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

RegisterServerEvent('woodcutter:checkjob2')
AddEventHandler('woodcutter:checkjob2', function() 
    local _source = source
    local User = VorpCore.getUser(_source)
    local Character = User.getUsedCharacter

    TriggerEvent('stress:getStress', _source, function(stress)
        if stress < 80 then 
            TriggerClientEvent('art_woodcutter:comienzo2',_source)
        else
            TriggerClientEvent("vorp:TipRight", _source, "Você está cansado!volte quando você estiver descansado", 4000)
        end
    end)
end)
RegisterServerEvent('woodcutter:checkjob')
AddEventHandler('woodcutter:checkjob', function() 
    local _source = source
    local User = VorpCore.getUser(_source)
    local Character = User.getUsedCharacter

    TriggerEvent('stress:getStress', _source, function(stress)
        if stress < 80 then 
            TriggerClientEvent('art_woodcutter:comienzo',_source)
        else
            TriggerClientEvent("vorp:TipRight", _source, "Você está cansado!volte quando você estiver descansado", 4000)
        end
    end)
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