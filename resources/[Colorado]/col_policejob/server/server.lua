local VORP_INV = exports.vorp_inventory:vorp_inventoryApi()
local wbhk = "https://discordapp.com/api/webhooks/1049149738756358144/jphUVovZZBF3am5K3_DMpouohlIWK5ir8ntV0mizJhjy2LMwRl_nT7IVnHqK9xu7T6L_"
local wbhkarmas = "https://discord.com/api/webhooks/968244742636830730/QOLyrLXwDF4ZOU_hWwKAJ0Kij3rv-MwCSuNLS0FvrjFNpEAQPl_qGSezeXaReuApiqHx"
local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

RegisterServerEvent("lawmen:goondutysv")
AddEventHandler("lawmen:goondutysv", function(ptable)
    local cops = 0

    for _,i in pairs(ptable) do
        local player = VorpCore.getUser(i).getUsedCharacter
        local pJob = player.job
        local grade = player.jobGrade

        for k,v in pairs(Marshal_Jobs) do
            if pJob == v then
                if (pJob == 'police') then
                    cops = cops + 1
                end
            end
        end
    end


    for k,v in pairs(OffDutyJobs) do
        local _source = source
        local player = VorpCore.getUser(_source).getUsedCharacter
        local job = player.job
        local grade = player.jobGrade
        local playername = player.firstname.. ' ' ..player.lastname
        if cops < Config.MaxCops then
            if job == 'offpolice' then
                player.setJob('police', grade)
                SendWebhookMessage(wbhk,"```prolog\n[Policia]: ".. playername .." \n[===========Entrou em Serviço==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                TriggerClientEvent("vorp:NotifyLeft",_source, "Status","Entrou em Serviço", "generic_textures", "star", 3000, "COLOR_WHITE")
                TriggerClientEvent("lawmen:onduty", _source, true)
            end
        else
            TriggerClientEvent("vorp:TipRight", _source, "Você não pode aceitar. Max policiais online.: "..Config.MaxCops, 2000)
        end
        break
    end
end)

RegisterServerEvent("lawmen:gooffdutysv")
AddEventHandler("lawmen:gooffdutysv", function()
    local _source = source
    local player = VorpCore.getUser(_source).getUsedCharacter
    local job = player.job
    local grade = player.jobGrade
    local weapons = player.getUserWeapons
    local playername = player.firstname.. ' ' ..player.lastname
    for k,v in pairs(Marshal_Jobs) do
        if v == job then
            player.setJob('off'..job, grade)
            SendWebhookMessage(wbhk,"```prolog\n[Policia]: ".. playername .." \n[===========Saiu de Serviço==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")        
            TriggerClientEvent("vorp:NotifyLeft",_source, "Status","Saiu de Serviço", "generic_textures", "star_outline", 3000, "COLOR_WHITE")
            TriggerClientEvent("lawmen:offdutycl", _source, false)
        end
        TriggerClientEvent("lawmen:onduty", _source, false)
    end
end)

RegisterServerEvent('lawmen:FinePlayer')
AddEventHandler('lawmen:FinePlayer', function(player, amount)
    local _source = source
    local User = VorpCore.getUser(player)
    local ranger = VorpCore.getUser(_source)
    local Target = User.getUsedCharacter
    local pCharacter = ranger.getUsedCharacter
    local fine = tonumber(amount)


    for i,v in pairs(Marshal_Jobs) do
        if v == pCharacter.job then
            pJob = v
            local Society_Account = pJob
            if pCharacter.job == Society_Account then
                if Target.money < fine then
                    Target.removeCurrency(0, Target.money)
                    exports.oxmysql:executeSync('UPDATE society_ledger SET ledger = ledger + @fine WHERE job = @job', { fine = Target.money, job = Society_Account})
                else
                    Target.removeCurrency(0, fine)
                    exports.oxmysql:executeSync('UPDATE society_ledger SET ledger = ledger + @fine WHERE job = @job', { fine = fine, job = Society_Account })
                end
                TriggerClientEvent("vorp:TipRight", _source, 'Você multou '..Target.firstname..' '..Target.lastname..' $'..amount, 10000)
                TriggerClientEvent("vorp:TipRight", player, 'Você recebeu uma multa de $'..fine, 10000)
            end
        end
    end
end)

RegisterServerEvent('lawmen:JailPlayer') --Jail player event
AddEventHandler('lawmen:JailPlayer', function(player, amount, loc)
    local _source = source
    local user_name = GetPlayerName(player)
    local User = VorpCore.getUser(player)
    local CharInfo = User.getUsedCharacter
    local steam_id = CharInfo.identifier
    local Character = CharInfo.charIdentifier


    print(player)
    print(loc)

    -- TIME
    local time_m = amount
    local amount = amount*60
    local timestamp = getTime() + amount

    exports.oxmysql:execute("INSERT INTO jail (identifier, characterid, name, time, time_s, jaillocation) VALUES (@identifier, @characterid, @name, @timestamp, @time, @jaillocation)", {["@identifier"] = steam_id, ["@characterid"] = Character, ["@name"] = user_name, ["@timestamp"] = timestamp, ["@time"] = amount, ["@jaillocation"] = loc})
    TriggerClientEvent("lawmen:JailPlayer",player, amount,loc)
end)

RegisterServerEvent("lawmen:unjail") --Unjail event
AddEventHandler("lawmen:unjail", function(target_id,loc)
    local _source = source
    local User = VorpCore.getUser(target_id)
    local CharInfo = User.getUsedCharacter
    local steam_id = CharInfo.identifier
    local Character = CharInfo.charIdentifier
    exports.oxmysql:execute("SELECT * FROM `jail` WHERE characterid = @characterid", {["@characterid"] = Character}, function(result)

        if result[1] then
            local loc = result[1]["jaillocation"]
            print(loc)
            TriggerClientEvent("lawmen:UnjailPlayer", target_id,loc)   
        end
    end)
    exports.oxmysql:execute("DELETE FROM jail WHERE identifier = @identifier AND characterid = @characterid", {["@identifier"] = steam_id, ["@characterid"] = Character})

end)

RegisterServerEvent('lawmen:CommunityService')--Start community Service event
AddEventHandler('lawmen:CommunityService', function(player, chore,amount)
    local _source = source
    local user_name = GetPlayerName(player)
    local User = VorpCore.getUser(player)
    local CharInfo = User.getUsedCharacter
    local steam_id = CharInfo.identifier
    local Character = CharInfo.charIdentifier

    exports.oxmysql:execute("INSERT INTO communityservice (identifier, characterid, name, communityservice, servicecount) VALUES (@identifier, @characterid, @name, @communityservice, @servicecount)", {["@identifier"] = steam_id, ["@characterid"] = Character, ["@name"] = user_name, ["@communityservice"] = chore, ["@servicecount"] = amount})

            print(amount)
            TriggerClientEvent("lawmen:ServicePlayer", player, chore, amount)
            TriggerClientEvent("vorp:TipRight", player, "You have been given Community Service", 2000)
		VorpCore.NotifyBottomRight(player,'You have been given Community Service',4000)
    
end)

RegisterServerEvent('lawmen:GetID')
AddEventHandler('lawmen:GetID', function(player)
    local _source = tonumber(source)

    local User = VorpCore.getUser(player)
    local Target = User.getUsedCharacter

    TriggerClientEvent("vorp:TipRight", _source, 'Name: '..Target.firstname..' '..Target.lastname, 10000)
    TriggerClientEvent("vorp:TipRight", _source, 'Job: '..Target.job, 10000)
end)



RegisterServerEvent('lawmen:handcuff')
AddEventHandler('lawmen:handcuff', function(player)
    TriggerClientEvent('lawmen:handcuff', player)
end)

RegisterServerEvent('lawmen:lockpicksv')
AddEventHandler('lawmen:lockpicksv', function(player)
    local _source = source
    local chance = math.random(1,100)
    local user = VorpCore.getUser(_source).getUsedCharacter
    if chance < 5 then
        VORP_INV.subItem(_source, 'lockpick', 1)
        TriggerClientEvent("vorp:TipBottom", _source, "~pa~"..user.firstname.." "..user.lastname.."~q~: Droga! Meu lockpick quebrou!", 2000)
    else
        TriggerClientEvent('lawmen:lockpicked', player)
    end
end)

RegisterServerEvent("lawmen:putinoutvehicle")-- Take out vehicle event not currently used
AddEventHandler("lawmen:putinoutvehicle", function(player)
    TriggerClientEvent('lawmen:putinoutvehicle', player)
end)

RegisterServerEvent("lawmen:updateservice")--Update chore amount when chore is completed event
AddEventHandler("lawmen:updateservice", function()
    local _source = source

    Citizen.Wait(2000)

    local User = VorpCore.getUser(_source)
    local CharInfo = User.getUsedCharacter
    local steam_id = CharInfo.identifier

    local Character = CharInfo.charIdentifier

    exports.oxmysql:execute("SELECT * FROM communityservice WHERE identifier = @identifier AND characterid = @characterid", {["@identifier"] = steam_id, ["@characterid"] = Character}, function(result)

        if result[1] ~= nil then
            local count = result[1]["servicecount"]
            local identifier = result[1]["identifier"]
            local charid = result[1]["characterid"]
            exports.oxmysql:execute("UPDATE communityservice SET servicecount = @count WHERE identifier = @identifier AND characterid = @characterid", {["@identifier"] = identifier, ["@characterid"] = charid, ["@count"] = count - 1})
        end
    end)
end)

RegisterNetEvent("lawmen:endservice")-- Finished Community Service Event
AddEventHandler("lawmen:endservice", function()
    local _source = source

    local User = VorpCore.getUser(_source)
    local CharInfo = User.getUsedCharacter
    local steam_id = CharInfo.identifier

    local Character = CharInfo.charIdentifier
    exports.oxmysql:execute("DELETE FROM communityservice WHERE identifier = @identifier AND characterid = @characterid", {["@identifier"] = steam_id, ["@characterid"] = Character}, function(result)
        if result[1] ~= nil then
      VorpCore.NotifyBottomRight(_source,"You have completed Community Service, straighten up",4000)

        end
    end)
end)

RegisterServerEvent('lawmen:drag')
AddEventHandler('lawmen:drag', function(target)
    local _source = source
    local user = VorpCore.getUser(_source).getUsedCharacter
    for i,v in pairs(Marshal_Jobs) do
        if user.job == v then
            TriggerClientEvent('lawmen:drag', target, _source)
        else
            print(('lawmen: %s attempted to drag a player (is not ranger)!'):format(GetPlayerName(_source)))
        end
    end
end)

RegisterServerEvent("lawmen:check_jail") --Check if jailed when selecting character event
AddEventHandler("lawmen:check_jail", function()
    local _source = source

    Citizen.Wait(2000)

    local User = VorpCore.getUser(_source)
    local CharInfo = User.getUsedCharacter
    local steam_id = CharInfo.identifier

    local Character = CharInfo.charIdentifier

    exports.oxmysql:execute("SELECT * FROM jail WHERE identifier = @identifier AND characterid = @characterid", {["@identifier"] = steam_id, ["@characterid"] = Character}, function(result)

        if result[1] ~= nil then
            local time = result[1]["time_s"]
            local identifier = result[1]["identifier"]
            exports.oxmysql:execute("UPDATE jail SET time = @time WHERE identifier = @identifier", {["@time"] = getTime() + time, ["@identifier"] = identifier})
            time = tonumber(time)
            TriggerClientEvent("lawmen:JailPlayer", _source, time)
            TriggerEvent("police_job:wear_prison", _source)
        end
    end)
end)

RegisterNetEvent("lawmen:jailbreak")--Jail break event, deletes time in jail
AddEventHandler("lawmen:jailbreak", function()
    local _source = source
    print('it worked?')
    Citizen.Wait(1000)

    local User = VorpCore.getUser(_source)
    local CharInfo = User.getUsedCharacter
    local steam_id = CharInfo.identifier

    local Character = CharInfo.charIdentifier

    exports.oxmysql:execute("DELETE FROM jail WHERE identifier = @identifier AND characterid = @characterid", {["@identifier"] = steam_id, ["@characterid"] = Character}, function(result)
        if result[1] ~= nil then
        print('jail broke')
            
        end
    end)
end)

RegisterServerEvent("lawmen:taketime")--Updates timer of how long left in jail defined by player
AddEventHandler("lawmen:taketime", function()
    local _source = source

    local User = VorpCore.getUser(_source)
    local CharInfo = User.getUsedCharacter
    local steam_id = CharInfo.identifier

    local Character = CharInfo.charIdentifier

    exports.oxmysql:execute("SELECT * FROM jail WHERE identifier = @identifier AND characterid = @characterid", {["@identifier"] = steam_id, ["@characterid"] = Character}, function(result)

        if result[1] ~= nil then
            local time = result[1]["time_s"]
            local newtime = time - 30
            local identifier = result[1]["identifier"]
            exports.oxmysql:execute("UPDATE jail SET time_s = @time WHERE identifier = @identifier", {["@time"] = newtime, ["@identifier"] = identifier})
        end
    end)
end)

RegisterCommand("fine", function(source, args, rawCommand)
    local _source = source -- player source
    local Character = VorpCore.getUser(_source).getUsedCharacter
    local target = args[1]
    local fine = args[2]
    print("target", target)
    print("fine", fine)
    if Character.group == "admin" or Character.job == "police" then
        TriggerEvent("lawmen:FinePlayer", tonumber(target), tonumber(fine))
    end
end)

RegisterCommand("jail", function(source, args, rawCommand)
    local _source = source -- player source
    local Character = VorpCore.getUser(_source).getUsedCharacter
    local target = args[1]
    local jailtime = args[2]
    local jailid = args[3]
    if Character.group == "admin" or Character.job == "police" then
        TriggerEvent('lawmen:JailPlayer', target, jailtime, jailid)
    else
        TriggerEvent("vorp:TipRight", "Not on duty", 2000)
    end
end)

RegisterServerEvent("lawmen:GetPlayerWagonID") -- Take out vehicle event not currently used
AddEventHandler("lawmen:GetPlayerWagonID", function(player)
    local _source = source
    if player ~= nil then
        TriggerClientEvent('lawmen:PlayerInWagon', player)
    end
end)

RegisterCommand('unjail', function(source, args, rawCommand)
	local _source = source -- player source
local Character = VorpCore.getUser(_source).getUsedCharacter
    local target = args[1]
    if Character.group == "admin" or Character.job == "police" then
        TriggerEvent("lawmen:unjail", tonumber(target))
    end
end)
--------------------------------------------------------------------------------------

RegisterServerEvent("lawmen:guncabinet")
AddEventHandler("lawmen:guncabinet", function(weapon, ammoList, compList, money)
    local _source = source
    local player = VorpCore.getUser(_source).getUsedCharacter
    local job = player.job
    local grade = player.jobGrade
    local playername = player.firstname.. ' ' ..player.lastname
    local p_money = player.money
    if p_money >= money then
    TriggerEvent("vorp:removeMoney", _source, 0, money)
    VORP_INV.createWeapon(_source, weapon, ammoList, compList)
    SendWebhookMessage(wbhkarmas,"```prolog\n[Policia]: ".. playername .." \n[Job] "..job.." \n[===========x PEGOU "..weapon.."  x==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
    else
        TriggerClientEvent('vorp:TipRight', _source, 'Você não tem dinheiro sulficiente', 3000)
    end
end)

function getTime ()
    return os.time(os.date("!*t"))
end

RegisterServerEvent("lawmen:fortmercer")
AddEventHandler("lawmen:fortmercer", function()
    local _source = source
    local user = VorpCore.getUser(_source).getUsedCharacter 
    VORP_INV.addItem(_source, "orden_presidente", 1)
end)

RegisterServerEvent("lawmen:licence")
AddEventHandler("lawmen:licence", function()
    local _source = source
    local user = VorpCore.getUser(_source).getUsedCharacter 
    VORP_INV.addItem(_source, "licencacacadorderecompensas", 1)
end)

RegisterServerEvent('lawmen:lockpick:break')
AddEventHandler('lawmen:lockpick:break', function()
    local _source = source
    local user = VorpCore.getUser(_source).getUsedCharacter
    VorpInv.subItem(_source, "lockpick", 1)
    TriggerClientEvent("vorp:TipBottom", "Droga!, Meu lockpick quebrou!", 2000) 
end)

VORP_INV.RegisterUsableItem("lockpick", function(data)
    VORP_INV.CloseInv(data.source)
    TriggerClientEvent("lawmen:lockpick", data.source)
end)

VORP_INV.RegisterUsableItem("handcuffs", function(data)
    VORP_INV.CloseInv(data.source)
    TriggerClientEvent("lawmen:cuffs", data.source)
end)
-----police notify-----------
RegisterServerEvent("RedM:sendalert")
AddEventHandler("RedM:sendalert", function(job, tipo, text, coords, chamado)
    local _source = source
    local users = GetPlayers()
    for each, player in ipairs(users) do
        TriggerEvent("vorp:getCharacter", player, function(user)
            if user ~= nil then   
                if user.job == job then
                    TriggerClientEvent('RedM:Notify', player, tipo, text)
                    if chamado then 
                        TriggerClientEvent('RedM:createblip', player, coords)
                    end
                end
            end
        end)
    end
end)

function checkPDreq()
    local users = GetPlayers()
    local coponline = 0
    local coponlinereq = 0

    for _k,_v in pairs(users) do
        local users = VorpCore.getUser(_v)
        local character = users.getUsedCharacter
        
        if character.job == 'police' then
            coponline = coponline + 1
        end   
    end
    
    if coponline < coponlinereq then
        return(0)
    end
    return(1)

end