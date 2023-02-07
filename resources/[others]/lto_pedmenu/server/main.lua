RegisterNetEvent("fixanimals:attack")
local VorpCore = {}
local wbhk = "https://discord.com/api/webhooks/992364227937435781/NIVVr7ZMx0UUxWxyN5SDa_noXNdu9SAJSMeiCRzE6RM7BeyNTQ1foFiUdR1rULiz0PQQ"

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

AddEventHandler("fixanimals:attack", function(target, entity)
	TriggerClientEvent("fixanimals:attack", target, source, entity)
end)

RegisterServerEvent('lto_pedmenu:groupcheck')
AddEventHandler('lto_pedmenu:groupcheck', function()
	local _source = source
	local User = VorpCore.getUser(_source) 
	local Character = User.getUsedCharacter         
    local ace = IsPlayerAceAllowed(_source, 'vorpcore.showAllCommands')
	
	if ace then
	
		TriggerClientEvent("lto_pedmenu:open",_source)
	else
		TriggerClientEvent("vorp:TipRight", _source, 'Você deve ser um administrador', 4000)
	end
end)
RegisterServerEvent('lto_pedanim:groupcheck')
AddEventHandler('lto_pedanim:groupcheck', function()
	local _source = source
	local User = VorpCore.getUser(_source) 
	local Character = User.getUsedCharacter    
	local first = Character.firstname
	local last = Character.lastname     
	if first == "James" and last == "Mazak" then
		TriggerClientEvent("lto_pedanim:open",_source)
	elseif first == "Hugo" and last == "Baez" then
		TriggerClientEvent("lto_pedanim:open",_source)
	elseif first == "Christopher" and last == "Singer" then
		TriggerClientEvent("lto_pedanim:open",_source)
	elseif first == "Olivia" and last == "Dutton" then
		TriggerClientEvent("lto_pedanim:open",_source)
	elseif first == "Evelynn" and last == "Alonso" then
		TriggerClientEvent("lto_pedanim:open",_source)
	elseif first == "Otto" and last == "Bellini" then
		TriggerClientEvent("lto_pedanim:open",_source)
	elseif first == "Guimera" and last == "Luzietti" then
		TriggerClientEvent("lto_pedanim:open",_source)
	elseif first == "Armando" and last == "Scott" then
		TriggerClientEvent("lto_pedanim:open",_source)
	elseif first == "Ezio" and last == "Picaretinha" then
		TriggerClientEvent("lto_pedanim:open",_source)
	elseif first == "Fabio" and last == "Lavalla" then
		TriggerClientEvent("lto_pedanim:open",_source)
	elseif first == "Nítev" and last == "BellWatcher" then
		TriggerClientEvent("lto_pedanim:open",_source)
	elseif first == "Eustacio" and last == "Louzada" then
		TriggerClientEvent("lto_pedanim:open",_source)
	elseif first == "Zira" and last == "Mo'Black" then
		TriggerClientEvent("lto_pedanim:open",_source)
	elseif first == "Rufus" and last == "Sol" then
		TriggerClientEvent("lto_pedanim:open",_source)
	elseif first == "Jhonny" and last == "Caramelo" then
		TriggerClientEvent("lto_pedanim:open",_source)
	elseif first == "Bob" and last == "Dark" then
		TriggerClientEvent("lto_pedanim:open",_source)
	elseif first == "Jack" and last == "Holliday" then
		TriggerClientEvent("lto_pedanim:open",_source)
	elseif first == "Erick" and last == "Pryde" then
		TriggerClientEvent("lto_pedanim:open",_source)
	elseif first == "Morgana" and last == "Sinclair" then
		TriggerClientEvent("lto_pedanim:open",_source)
	elseif first == "Alfredo" and last == "Lasanha" then
		TriggerClientEvent("lto_pedanim:open",_source)
	elseif first == "Chico" and last == "Cat" then
		TriggerClientEvent("lto_pedanim:open",_source)
	elseif first == "Harumi" and last == "Dutton" then
		TriggerClientEvent("lto_pedanim:open",_source)
	elseif first == "Caty" and last == "Jones" then
		TriggerClientEvent("lto_pedanim:open",_source)
	elseif first == "Max" and last == "Jones" then
		TriggerClientEvent("lto_pedanim:open",_source)
	elseif first == "Kemê" and last == "Thunpá" then
		TriggerClientEvent("lto_pedanim:open",_source)
	elseif first == "Nitev" and last == "BellWatcher" then
		TriggerClientEvent("lto_pedanim:open",_source)
	elseif first == "Apollo" and last == "Ortega" then
		TriggerClientEvent("lto_pedanim:open",_source)
	elseif first == "Amora" and last == "Collie" then
		TriggerClientEvent("lto_pedanim:open",_source)
	elseif first == "John" and last == "Miller" then
		TriggerClientEvent("lto_pedanim:open",_source)
	elseif first == "Hida" and last == "Cachorrinha" then
		TriggerClientEvent("lto_pedanim:open",_source)
	elseif first == "Lunna" and last == "Cremon" then
		TriggerClientEvent("lto_pedanim:open",_source)
	elseif first == "Horus" and last == "Bennett" then
		TriggerClientEvent("lto_pedanim:open",_source)
	elseif first == "Denver" and last == "Whisky" then
		TriggerClientEvent("lto_pedanim:open",_source)
	elseif first == "Koda" and last == "Kenai" then
		TriggerClientEvent("lto_pedanim:open",_source)
	elseif first == "Astra" and last == "Armani" then
		TriggerClientEvent("lto_pedanim:open",_source)
	elseif first == "jack" and last == "hartman" then
		TriggerClientEvent("lto_pedanim:open",_source)
	elseif first == "Cirdan" and last == "Elendil" then
		TriggerClientEvent("lto_pedanim:open",_source)
	elseif first == "Buzz" and last == "Michael" then
		TriggerClientEvent("lto_pedanim:open",_source)
	else
		TriggerClientEvent("vorp:TipRight", _source, 'Você não tem permissão!', 4000)
	end
end)

-- PED1
RegisterServerEvent('ped1check')
AddEventHandler('ped1check', function()
	local _source = source
	local User = VorpCore.getUser(_source) 
	local Character = User.getUsedCharacter
	local job = Character.job 
	local rank = Character.jobGrade
	if job == "indios"  or job == "indiosBW" or job == "indiosAR" and rank >= 2 then
		TriggerClientEvent("1lobo",_source)
	else
		TriggerClientEvent("vorp:TipRight", _source, 'Você não tem permissão!', 4000)
	end
end)

-- PED2
RegisterServerEvent('ped3check')
AddEventHandler('ped3check', function()
	local _source = source
	local User = VorpCore.getUser(_source) 
	local Character = User.getUsedCharacter
	local job = Character.job 
	local rank = Character.jobGrade
	if job == "indios" or job == "indiosBW" or job == "indiosAR" and rank >= 2 then
		TriggerClientEvent("coruja",_source)
	else
		TriggerClientEvent("vorp:TipRight", _source, 'Você não tem permissão!', 4000)
	end
end)

-- PED4
RegisterServerEvent('ped4check')
AddEventHandler('ped4check', function()
	local _source = source
	local User = VorpCore.getUser(_source) 
	local Character = User.getUsedCharacter
	local job = Character.job 
	local playername = Character.firstname.. ' ' ..Character.lastname
	if job == "Herbalista" then
		TriggerClientEvent("ped4",_source)
		SendWebhookMessage(wbhk,"```prolog\n[BRUXAS]: ".. playername .." \nUsou transformação de Corvo " ..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	else
		TriggerClientEvent("vorp:TipRight", _source, 'Você não tem permissão!', 4000)
	end
end)
-- PED5
RegisterServerEvent('ped5check')
AddEventHandler('ped5check', function()
	local _source = source
	local User = VorpCore.getUser(_source) 
	local Character = User.getUsedCharacter
	local job = Character.job 
	local playername = Character.firstname.. ' ' ..Character.lastname
	if job == "Herbalista" then
		TriggerClientEvent("ped5",_source)
		SendWebhookMessage(wbhk,"```prolog\n[BRUXAS]: ".. playername .." \nUsou transformação de Puma " ..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	else
		TriggerClientEvent("vorp:TipRight", _source, 'Você não tem permissão!', 4000)
	end
end)

-- PED5
RegisterServerEvent('ped6check')
AddEventHandler('ped6check', function()
	local _source = source
	local User = VorpCore.getUser(_source) 
	local Character = User.getUsedCharacter
	local first = Character.firstname
	local last = Character.lastname
	if first == "" and last == "" then
		TriggerClientEvent("ped67",_source)
		TriggerClientEvent("able",_source)
	elseif first == "Stella" and last == "RoseGreen" then
		TriggerClientEvent("ped11",_source)
		TriggerClientEvent("able",_source)
	elseif first == "Morgana" and last == "Collins" then
		TriggerClientEvent("ped106",_source)
		TriggerClientEvent("able",_source)
	elseif Character.group == 'bandsinger' then
		TriggerClientEvent("ped19",_source)
		TriggerClientEvent("able",_source)
	elseif first == "Aurora" and last == "Danbury" then -- PedSadler 
		TriggerClientEvent("ped104",_source)
		TriggerClientEvent("able",_source)
	elseif first == "Sibelle" and last == "Schiffer" then
		TriggerClientEvent('ped22', _source)
		TriggerClientEvent("able",_source)
	--elseif Character.group == 'GermanSon' then
		--TriggerClientEvent('ped23', _source)
		--TriggerClientEvent("able",_source)
	elseif ace3 then
		TriggerClientEvent('ped24', _source)
		TriggerClientEvent("able",_source)
	elseif ace4 then
		TriggerClientEvent('ped25', _source)
		TriggerClientEvent("able",_source)
	elseif ace5 then
		TriggerClientEvent("ped27",_source)
		TriggerClientEvent("able",_source)
	elseif first == "Wagner" and last == "Lindemann" then
		TriggerClientEvent("ped28",_source)
		TriggerClientEvent("able",_source)
	elseif ace7 then
		TriggerClientEvent("ped29",_source)
		TriggerClientEvent("able",_source)
	elseif first == "Alice" and last == "Danbury" then
		TriggerClientEvent("ped37",_source)
		TriggerClientEvent("able",_source)
	elseif first == "Bianca" and last == "Black" then
		TriggerClientEvent("ped15",_source)
		TriggerClientEvent("able",_source)
	elseif first == "Frodo" and last == "MacGuire" then
		TriggerClientEvent("ped51", _source)
		TriggerClientEvent("able", _source)
	elseif first == "James" and last == "Mazak" then
		TriggerClientEvent("ped57", _source)
	elseif first == "Steve" and last == "MacGuire" then
		TriggerClientEvent("ped61", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Evelynn" and last == "Alonso" then
		TriggerClientEvent("ped7", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Astra" and last == "Armani" then
		TriggerClientEvent("ped7", _source)
		TriggerClientEvent("able", _source)
	elseif first == "John" and last == "Miller" then
		TriggerClientEvent("ped7", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Alejandro" and last == "McCarter" then
		TriggerClientEvent("ped63", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Nicoly" and last == "Pudim" then
		TriggerClientEvent("ped66", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Christopher" and last == "Singer" then
		TriggerClientEvent("ped57", _source)
		TriggerClientEvent("able", _source)
	elseif first == "João" and last == "Roberto" then
		TriggerClientEvent("ped77", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Olivia" and last == "Dutton" then
		TriggerClientEvent("ped78", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Denver" and last == "Whisky" then
		TriggerClientEvent("ped78", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Jhon" and last == "Dutton" then
		TriggerClientEvent("ped79", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Bret" and last == "Slade" then
		TriggerClientEvent("ped81", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Buck" and last == "Colt" then
		TriggerClientEvent("ped85", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Brisa" and last == "Dutton" then
		TriggerClientEvent("ped86", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Anakin" and last == "Calian" then
		TriggerClientEvent("ped87", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Katty" and last == "Wilson" then
		TriggerClientEvent("ped10", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Bibiana" and last == "Rosa" then
		TriggerClientEvent("ped20", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Brando" and last == "Banes" then
		TriggerClientEvent("ped67", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Thommy" and last == "Pudim" then
		TriggerClientEvent("ped90", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Clodoaldo" and last == "Pudim" then
		TriggerClientEvent("ped91", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Otto" and last == "Bellini" then
		TriggerClientEvent("ped97", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Hida" and last == "Cachorrinha" then
		TriggerClientEvent("ped97", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Guimera" and last == "Luzietti" then
		TriggerClientEvent("ped57", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Armando" and last == "Scott" then
		TriggerClientEvent("ped78", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Anna" and last == "Windsor" then
		TriggerClientEvent("ped8", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Ezio" and last == "Picaretinha" then
		TriggerClientEvent("ped58", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Carmina" and last == "Wesley" then
		TriggerClientEvent("ped94", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Fabio" and last == "Lavalla" then
		TriggerClientEvent("ped100", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Nítev" and last == "BellWatcher" then
		TriggerClientEvent("ped101", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Caty" and last == "Jones" then
		TriggerClientEvent("ped101", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Eustacio" and last == "Louzada" then
		TriggerClientEvent("ped102", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Calisto" and last == "Wilson" then
		TriggerClientEvent("ped9", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Zira" and last == "Mo'Black" then
		TriggerClientEvent("ped58", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Helena" and last == "Partash" then
		TriggerClientEvent("ped14", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Neil" and last == "Westfall" then
		TriggerClientEvent("ped103", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Rufus" and last == "Sol" then
		TriggerClientEvent("ped7", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Lyall" and last == "Crowler" then
		TriggerClientEvent("ped74", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Jhonny" and last == "Caramelo" then
		TriggerClientEvent("ped97", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Bob" and last == "Dark" then
		TriggerClientEvent("ped78", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Liliana" and last == "Escobar" then
		TriggerClientEvent("ped12", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Jack" and last == "Holliday" then
		TriggerClientEvent("ped58", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Erick" and last == "Pryde" then
		TriggerClientEvent("ped78", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Safira" and last == "Collins" then
		TriggerClientEvent("ped107", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Violet" and last == "Collins" then
		TriggerClientEvent("ped80", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Morgana" and last == "Sinclair" then
		TriggerClientEvent("ped58", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Erwin" and last == "Mars" then
		TriggerClientEvent("ped50", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Alfredo" and last == "Lasanha" then
		TriggerClientEvent("ped58", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Enzo" and last == "West" then
		TriggerClientEvent("ped41", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Chico" and last == "Cat" then
		TriggerClientEvent("ped58", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Esmeralda" and last == "Wesley" then
		TriggerClientEvent("ped68", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Stanley" and last == "McInlove" then
		TriggerClientEvent("ped47", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Harumi" and last == "Dutton" then
		TriggerClientEvent("ped108", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Max" and last == "Jones" then
		TriggerClientEvent("ped101", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Kemê" and last == "Thunpá" then
		TriggerClientEvent("ped58", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Billy" and last == "Howe" then
		TriggerClientEvent("ped23", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Nitev" and last == "BellWatcher" then
		TriggerClientEvent("ped101", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Apollo" and last == "Ortega" then
		TriggerClientEvent("ped57", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Ariella" and last == "Blackwood" then
		TriggerClientEvent("ped21", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Nina" and last == "Banes" then
		TriggerClientEvent("ped88", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Amora" and last == "Collie" then
		TriggerClientEvent("ped57", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Lunna" and last == "Cremon" then
		TriggerClientEvent("ped7", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Horus" and last == "Bennett" then
		TriggerClientEvent("ped57", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Koda" and last == "Kenai" then
		TriggerClientEvent("ped32", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Tulach" and last == "Belucci " then
		TriggerClientEvent("ped109", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Astra" and last == "Armani " then
		TriggerClientEvent("ped7", _source)
		TriggerClientEvent("able", _source)
	elseif first == "jack" and last == "hartman" then
		TriggerClientEvent("ped7", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Cirdan" and last == "Elendil" then
		TriggerClientEvent("ped58", _source)
		TriggerClientEvent("able", _source)
	elseif first == "Buzz" and last == "Michael" then
		TriggerClientEvent("ped78", _source)
		TriggerClientEvent("able", _source)
	else
		TriggerClientEvent("vorp:TipRight", _source, 'Você não tem permissão!', 4000)
	end
end)
-- PED7
RegisterServerEvent('ped7check')
AddEventHandler('ped7check', function()
	local _source = source
	local User = VorpCore.getUser(_source) 
	local Character = User.getUsedCharacter
	if Character.group == "PedHusky" then
		TriggerClientEvent("ped7",_source)
	else
		TriggerClientEvent("vorp:TipRight", _source, 'Você não tem permissão!', 4000)
	end
end)
-- PED9
RegisterServerEvent('ped9check')
AddEventHandler('ped9check', function()
	local _source = source
	local User = VorpCore.getUser(_source) 
	local Character = User.getUsedCharacter
	if Character.group == "PedMary" then
		TriggerClientEvent("ped9",_source)
		TriggerClientEvent("able",_source)
	else
		TriggerClientEvent("vorp:TipRight", _source, 'Você não tem permissão!', 4000)
	end
end)
-- PED10
RegisterServerEvent('ped10check')
AddEventHandler('ped10check', function()
	local _source = source
	local User = VorpCore.getUser(_source) 
	local Character = User.getUsedCharacter
	if Character.group == "PedSadler" then -- PedSadler 
		TriggerClientEvent("ped10",_source)
		TriggerClientEvent("able",_source)
	else
		TriggerClientEvent("vorp:TipRight", _source, 'Você não tem permissão!', 4000)
	end
end)
-- PED13
RegisterServerEvent('ped13check')
AddEventHandler('ped13check', function()
	local _source = source
	local User = VorpCore.getUser(_source) 
	local Character = User.getUsedCharacter
	if Character.job == "Bruxo" then
		TriggerClientEvent("ped13",_source)
		TriggerClientEvent("able",_source)
	else
		TriggerClientEvent("vorp:TipRight", _source, 'Você não tem permissão!', 4000)
	end
end)
RegisterServerEvent('ped14check')
AddEventHandler('ped14check', function()
	local _source = source
	local User = VorpCore.getUser(_source) 
	local Character = User.getUsedCharacter
	if Character.group == "Gunslinger" then
		TriggerClientEvent("ped14",_source)
		TriggerClientEvent("able",_source)
	else
		TriggerClientEvent("vorp:TipRight", _source, 'Você não tem permissão!', 4000)
	end
end)

RegisterServerEvent('ped15check')
AddEventHandler('ped15check', function()
	local _source = source
	local User = VorpCore.getUser(_source) 
	local Character = User.getUsedCharacter
	if Character.group == 'Belladonna' then
		TriggerClientEvent('ped18', _source)
		TriggerClientEvent("able",_source)
	else
		TriggerClientEvent("vorp:TipRight", _source, 'Você não tem permissão!', 4000)
	end
end)