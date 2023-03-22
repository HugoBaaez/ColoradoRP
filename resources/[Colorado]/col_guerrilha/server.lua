TriggerEvent("getCore",function(core)
    VorpCore = core
end)

local wbk = 'https://discord.com/api/webhooks/1087563128629366866/AmXnZOEEQl81Nr2at6OvNw4MOM1extFCAy5shFgYYijsNgGQWIDHQ9mdWK8VXBSRFwib'

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

RegisterCommand('servico', function(source, args, rawCommand)
    local _source = source
    local player = VorpCore.getUser(_source).getUsedCharacter
    local job = player.job
    local grade = player.jobGrade
	local playername = player.firstname.. ' ' ..player.lastname
        if job == "guerrilha" then
            player.setJob("offguerrilha", grade)     
            TriggerClientEvent("vorp:NotifyLeft",_source, "Status","Saiu de Serviço", "generic_textures", "star_outline", 3000, "COLOR_WHITE")
			TriggerClientEvent("guerrilha:onduty", _source, false)
			SendWebhookMessage(wbk,"```prolog\n[Guerrilha]: ".. playername .." \n[=========== Saiu de Serviço ==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		elseif job == "offguerrilha" then 
			player.setJob("guerrilha", grade) 
			TriggerClientEvent("vorp:NotifyLeft",_source, "Status","Entrou em Serviço", "generic_textures", "star", 3000, "COLOR_WHITE")
			TriggerClientEvent("guerrilha:onduty", _source, true)
			SendWebhookMessage(wbk,"```prolog\n[Guerrilha]: ".. playername .." \n[=========== Entrou em Serviço ==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
        end
end)