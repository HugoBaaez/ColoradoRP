VorpInv = exports.vorp_inventory:vorp_inventoryApi()
local checkMED = 0
local VorpCore = {}
local MEDICO = 'https://discord.com/api/webhooks/1069376904416739428/5I4YXAZAWhSDCiUSuKTCmZBzhEt4OzGA7VIBiiPd34vR2kGKtFOXO4D0dxrCDupsrR_C'
local revive = 'https://discord.com/api/webhooks/989021729949118515/iIV9OvefJwD0xSNpaRwfs5pLo2N26Zn1nji9tZBy4PBmrB_bcAbhVYKTQ3xL76dRkhEt'

TriggerEvent("getCore",function(core)
    VorpCore = core
end)
function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

RegisterCommand('toogle', function(source, args, rawCommand)
    local _source = source
    local player = VorpCore.getUser(_source).getUsedCharacter
    local job = player.job
    local grade = player.jobGrade
	local playername = player.firstname.. ' ' ..player.lastname
        if job == "doctor" then
            player.setJob('off'.."doctor", grade)     
            TriggerClientEvent("vorp:NotifyLeft",_source, "Status","Saiu de Serviço", "generic_textures", "star_outline", 3000, "COLOR_WHITE")
			TriggerClientEvent("doctor:onduty", _source, false)
			SendWebhookMessage(MEDICO,"```prolog\n[Medicos]: ".. playername .." \n[=========== Saiu de Serviço ==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		elseif job == "offdoctor" then 
			player.setJob("doctor", grade) 
			TriggerClientEvent("vorp:NotifyLeft",_source, "Status","Entrou em Serviço", "generic_textures", "star", 3000, "COLOR_WHITE")
			TriggerClientEvent("doctor:onduty", _source, true)
			SendWebhookMessage(MEDICO,"```prolog\n[Medicos]: ".. playername .." \n[=========== Entrou em Serviço ==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
        end
end)

RegisterServerEvent('vorp_ml_doctorjob:healplayer')
AddEventHandler('vorp_ml_doctorjob:healplayer', function (target)
	local _source = source
	local target_source = target
	local TargetUser = VorpCore.getUser(target_source)
    local User = VorpCore.getUser(_source)
    local Character = User.getUsedCharacter
	local TargetCharacter = TargetUser.getUsedCharacter
    local job = Character.job 
	local playername = Character.firstname.. ' ' ..Character.lastname
	local targetname = TargetCharacter.firstname.. ' ' ..TargetCharacter.lastname
	if job == 'doctor' then
  		TriggerClientEvent('vorp_ml_doctorjob:healed', target)
		SendWebhookMessage(revive,"```prolog\n[HEAL]: ".. playername .." USOU HEAL NO PLAYER ".. targetname.. "  "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	else
		TriggerClientEvent('vorp:TipRight', _source, 'Você não tem permissão!', 3000)
	end
end)

RegisterServerEvent( "vorp_ml_doctorjob:reviveplayer" )
AddEventHandler( "vorp_ml_doctorjob:reviveplayer", function(target)
	local _source = source
	local _target = target
	local TargetUser = VorpCore.getUser(_target)
    local TargetCharacter = TargetUser.getUsedCharacter
	local targetname = TargetCharacter.firstname.. ' ' ..TargetCharacter.lastname

	local User = VorpCore.getUser(_source)
    local Character = User.getUsedCharacter
	local playername = Character.firstname.. ' ' ..Character.lastname
    local job = Character.job -- character table
	if job == 'doctor' then
		local medikit = VorpInv.getItemCount(_source, "seringa")
		if medikit > 0 then
			TriggerClientEvent('vorp:resurrectPlayer', _target)
			VorpInv.subItem(_source, "seringa", 1)
			TriggerClientEvent('ml_doctorjob:animation', _source)
			TriggerClientEvent('ml_doctorjob:revived', _target)
			SendWebhookMessage(revive,"```prolog\n[REVIVE]: ".. playername .." REVIVEU COM SERINGA O PLAYER ".. targetname.. "  "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		else
			TriggerClientEvent("vorp:TipRight", _source, "Você não tem uma seringa!", 3000)
		end
	else 
		TriggerClientEvent('vorp:TipRight', _source, 'Você não tem permissão!', 3000)
	end	
end)

RegisterServerEvent('doctor:buysiringhe')
AddEventHandler('doctor:buysiringhe', function(n) 

	local _source = source
	local price = 0.1
	local User = VorpCore.getUser(_source)
	local Character = User.getUsedCharacter
	
	if VorpInv.canCarryItems(_source, n) and VorpInv.getItemCount(_source, "seringa") + n <= 10 and Character.money >= n*price then 
		VorpInv.addItem(_source, "seringa", n)
		TriggerEvent('vorp:removeMoney', _source, 0, n*price)
	else

	end

end)

RegisterServerEvent('doctor:checkgroup')
AddEventHandler('doctor:checkgroup', function() 
	local _source = source
	local User = VorpCore.getUser(_source)
	local Character = User.getUsedCharacter

--	print(Character.job)
	if Character.job == "doctor" then 
		TriggerClientEvent('doctorjob:client:OpenMenu', _source)
	end
end)

RegisterServerEvent('Botanico:checkgroup')
AddEventHandler('Botanico:checkgroup', function() 
	local _source = source
	local User = VorpCore.getUser(_source)
	local Character = User.getUsedCharacter

--	print(Character.job)
	if Character.job == "Botanico" then 
		TriggerClientEvent('Botanico:client:OpenMenu', _source)
	end
end)

RegisterServerEvent('doctor:tonicovita')
AddEventHandler('doctor:tonicovita', function() 

	local _source = source

	local count = VorpInv.getItemCount(_source, "agua")
	local count1 = VorpInv.getItemCount(_source, "cogumelo")
	local count2 = VorpInv.getItemCount(_source, "ginseng_americano")

	--print(count,count1,count2)

	if count >= 1 and count1 >= 2 and count2 >= 3 and VorpInv.getItemCount(_source, "tonico_c1") + 1 <= 5 then 

		VorpInv.subItem(_source, "agua", 1)
		VorpInv.subItem(_source, "cogumelo", 2)
		VorpInv.subItem(_source, "ginseng_americano", 2)

		TriggerClientEvent("progressbar:startMedico", _source)

        Wait(20000)
		
		VorpInv.addItem(_source, "tonico_c1",1)
		TriggerClientEvent("vorp:TipRight", _source, 'Você criou um Tonico de Vida', 2000)
		TriggerClientEvent('stress:modify', 1.5)
	else
		TriggerClientEvent("vorp:TipRight", _source, 'Você precisa de: 1 Água, 2 Cogumelos, 2 Ginseng americano', 4500)
	end
end)

RegisterServerEvent('doctor:tonicovita1')
AddEventHandler('doctor:tonicovita1', function() 

	local _source = source

	local count = VorpInv.getItemCount(_source, "agua")
	local count1 = VorpInv.getItemCount(_source, "baunilha")
	local count2 = VorpInv.getItemCount(_source, "ginseng_alaska")

	if count >= 2 and count1 >= 3 and count2 >= 4 and VorpInv.getItemCount(_source, "tonico_c1") + 1 <= 5 then 

		VorpInv.subItem(_source, "agua", 2)
		VorpInv.subItem(_source, "baunilha", 2)
		VorpInv.subItem(_source, "ginseng_alaska", 2)

		TriggerClientEvent("progressbar:startMedico", _source)

        Wait(20000)
		
		VorpInv.addItem(_source, "tonico_c2",1)
		TriggerClientEvent("vorp:TipRight", _source, 'Você criou um Tonico de Vida+', 2000)
		TriggerClientEvent('stress:modify', 1.5)
	else
		TriggerClientEvent("vorp:TipRight", _source, 'Você precisa de: 2 Água, 2 Flor de baunilha, 2 Ginseng do Alaska', 4500)
	end
end)

RegisterServerEvent('doctor:elysirenergia')
AddEventHandler('doctor:elysirenergia', function() 

	local _source = source

	local count = VorpInv.getItemCount(_source, "agua")
	local count1 = VorpInv.getItemCount(_source, "cogumelo")
	local count2 = VorpInv.getItemCount(_source, "groselha")

	if count >= 1 and count1 >= 3 and count2 >= 5 and VorpInv.getItemCount(_source, "tonico_c1") + 1 <= 5 then 

		VorpInv.subItem(_source, "agua", 1)
		VorpInv.subItem(_source, "cogumelo", 2)
		VorpInv.subItem(_source, "groselha", 2)

		TriggerClientEvent("progressbar:startMedico", _source)

        Wait(20000)
		
		VorpInv.addItem(_source, "tonico_s1",1)
		TriggerClientEvent("vorp:TipRight", _source, 'Você criou um Elixir de Energia', 2000)
		TriggerClientEvent('stress:modify', 1.5)
	else
		TriggerClientEvent("vorp:TipRight", _source, 'Você precisa de: 1 Água, 2 Cogumelos, 2 Groselhas', 4500)
	end
end)

RegisterServerEvent('doctor:elysirenergia1')
AddEventHandler('doctor:elysirenergia1', function() 

	local _source = source

	local count = VorpInv.getItemCount(_source, "agua")
	local count1 = VorpInv.getItemCount(_source, "cogumelo")
	local count2 = VorpInv.getItemCount(_source, "groselha")

	if count >= 2 and count1 >= 4 and count2 >= 4 and VorpInv.getItemCount(_source, "tonico_c1") + 1 <= 5 then 

		VorpInv.subItem(_source, "agua", 2)
		VorpInv.subItem(_source, "cogumelo", 4)
		VorpInv.subItem(_source, "groselha", 4)

		TriggerClientEvent("progressbar:startMedico", _source)

        Wait(20000)

		VorpInv.addItem(_source, "tonico_s2", 1)
		TriggerClientEvent("vorp:TipRight", _source, 'Você criou um Elixir de Energia+', 2000)
		TriggerClientEvent('stress:modify', 1.5)
	else
		TriggerClientEvent("vorp:TipRight", _source, 'Você precisa de: 2 Água, 4 Cogumelos, 4 Groselhas', 4500)
	end
end)

RegisterServerEvent('doctor:estrattoveleno')
AddEventHandler('doctor:estrattoveleno', function() 

	local _source = source

	local count = VorpInv.getItemCount(_source, "agua")
	local count1 = VorpInv.getItemCount(_source, "snakepoison")
	local count2 = VorpInv.getItemCount(_source, "p_belladonna")

	if count >= 1 and count1 >= 5 and count2 >= 3 and VorpInv.getItemCount(_source, "tonico_c1") + 1 <= 5 then 

		VorpInv.subItem(_source, "agua", 1)
		VorpInv.subItem(_source, "snakepoison", 5)
		VorpInv.subItem(_source, "p_belladonna", 3)

		TriggerClientEvent("progressbar:startMedico", _source)

        Wait(20000)
		
		VorpInv.addItem(_source, "veleno_s",1)
		TriggerClientEvent("vorp:TipRight", _source, 'Você criou um Extrato de Veneno', 2000)
		TriggerClientEvent('stress:modify', 1.5)
	else
		TriggerClientEvent("vorp:TipRight", _source, 'Você precisa de: 1 Água, 5 Veneno de Cobra, 3 belladona', 4500)
	end
end)
---------------------------------------------------------------
RegisterServerEvent("clinics:pay")
AddEventHandler("clinics:pay", function() 
    local _source = source 
    local price = 7
    local User = VorpCore.getUser(_source) 
    local Character = User.getUsedCharacter
    if checkMED == 0 then
        if Character.money >= price then
            TriggerEvent("vorp:removeMoney", _source, 0, price)
            TriggerClientEvent("clinics:heal", _source)
        else
            TriggerClientEvent('vorp:NotifyLeft', _source, 'Falha', 'Você não tem dinheiro sulficiente, Precisa de  $7!', 'generic_textures', 'tick', 5000, 'COLOR_WHITE')
        end
    elseif checkMED >= 1 then
        TriggerClientEvent('vorp:NotifyLeft', _source, 'Há médicos', 'Procure um doutor para ser atendido!','generic_textures', 'tick', 5000, 'COLOR_WHITE')  
    end
end)

RegisterServerEvent("clinics:pay:revive")
AddEventHandler("clinics:pay:revive", function(closestPlayer)
    local _closestPlayer = closestPlayer 
	local _closestPlayertUser = VorpCore.getUser(_closestPlayer)
    local _closestPlayerCharacter = _closestPlayertUser.getUsedCharacter
	local targetname = _closestPlayerCharacter.firstname.. ' ' .._closestPlayerCharacter.lastname
    local _source = source 
    local price = 10
    
    local User = VorpCore.getUser(_source) 
    local Character = User.getUsedCharacter
	local job = Character.job  
	local playername = Character.firstname.. ' ' ..Character.lastname 
    if checkMED == 0 then
		if job == 'indios' or job == "indiosBW" then
			if Character.money >= 2 then
				--print(_source, _closestPlayer)
				TriggerEvent("vorp:removeMoney", _source, 0, 2)
				TriggerClientEvent('vorp:resurrectPlayer', _closestPlayer)
				TriggerClientEvent('ml_doctorjob:animation', _source)
				TriggerClientEvent('ml_doctorjob:revived', _closestPlayer)
				SendWebhookMessage(revive,"```prolog\n[REVIVE]: ".. playername .." REVIVEU NA FARMACIA O PLAYER ".. targetname.. " E PAGOU $2 (INDIOS) "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			else
				TriggerClientEvent('vorp:NotifyLeft', _source, 'Falha', 'Você não tem dinheiro sulficiente, Precisa de  $2!', 'generic_textures', 'tick', 5000, 'COLOR_WHITE')
			end
		else
			if Character.money >= price then
				--print(_source, _closestPlayer)
				TriggerEvent("vorp:removeMoney", _source, 0, price)
				TriggerClientEvent('vorp:resurrectPlayer', _closestPlayer)
				TriggerClientEvent('ml_doctorjob:animation', _source)
				TriggerClientEvent('ml_doctorjob:revived', _closestPlayer)
				SendWebhookMessage(revive,"```prolog\n[REVIVE]: ".. playername .." REVIVEU NA FARMACIA O PLAYER ".. targetname.. " E PAGOU $10  "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			else
				TriggerClientEvent('vorp:NotifyLeft', _source, 'Falha', 'Você não tem dinheiro sulficiente, Precisa de  $10!', 'generic_textures', 'tick', 5000, 'COLOR_WHITE')
			end
		end
    elseif checkMED >= 1 then
        TriggerClientEvent('vorp:NotifyLeft', _source, 'Há médicos', 'Procure um doutor para ser atendido!','generic_textures', 'tick', 5000, 'COLOR_WHITE')  
    end
end)

function CheckMedOnline()
    local users = GetPlayers()
    local medic = 0
    for _k,_v in pairs(users) do
        local users = VorpCore.getUser(_v)
		local character = users.getUsedCharacter

		if character.job == "doctor" then
			medic = medic + 1
		end
	end

	if medic >= 0 then
		return medic 
	end
	
end

function CheckPoliceOnline()
    local users = GetPlayers()
    local police = 0
    for _k,_v in pairs(users) do
        local users = VorpCore.getUser(_v)
        local character = users.getUsedCharacter
        
        if character.job == "police" then
           police = police + 1
        end   
    end
    
    if police >= 0 then
        return police
    end

end


RegisterCommand('meds', function(source, args, rawCommand)
    local _source = source
	local medsOnlime = CheckMedOnline()
    TriggerClientEvent('vorp:NotifyLeft', _source, 'Médicos', "Atualmente temos "..medsOnlime.." médicos no estado",'generic_textures', 'tick', 5000, 'COLOR_WHITE') 
end)
RegisterCommand('oficiais', function(source, args, rawCommand)
    local _source = source
	local PoliceOnline = CheckPoliceOnline()
    TriggerClientEvent('vorp:NotifyLeft', _source, 'Oficiais', "Atualmente temos "..PoliceOnline.." oficiais no estado",'generic_textures', 'tick', 5000, 'COLOR_WHITE') 
end)