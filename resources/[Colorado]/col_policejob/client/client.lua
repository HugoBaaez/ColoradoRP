local target = -1
local targetInventory = {}
local targetWeapons = {}
local isHandcuffed = false
local initialized = false
local isboss = false
local societyMenuOpened = false
local defaultVehicle = -1
local playerJob
local isDead = IsPedDeadOrDying(PlayerPedId())
local star = false
local timeinjail = 0
local playerid = 0
local fineamount = 0
local jailname = "None"
local jailid = "sk"
local tele = "true"
local autotele = true
local chore = "None"
local choreamount = "None"
local currentCheck
local notinjail = false
local jaillocation
local dragStatus = {}
dragStatus.isDragged = false
local InWagon = false
local jailed = false

local VORPcore = {}

TriggerEvent("getCore", function(core)
    VORPcore = core
end)

RegisterNetEvent("lawmen:onduty")
AddEventHandler("lawmen:onduty", function(duty)
    if not duty then
        policeOnDuty = false
    else
        policeOnDuty = true
    end
end)

WarMenu.CreateMenu('marshal_main', 'Police Menu')
WarMenu.CreateSubMenu('marshal_inventory', 'marshal_main')

RegisterNetEvent("lawmen:goonduty")
AddEventHandler("lawmen:goonduty", function()
    if policeOnDuty then
        TriggerEvent("vorp:TipRight", "Você já está em serviço", 2000)
    else
        TriggerServerEvent('lawmen:goondutysv', GetPlayers())
    end
end)

RegisterNetEvent("lawmen:gooffduty")
AddEventHandler("lawmen:gooffduty", function()
    TriggerServerEvent("lawmen:gooffdutysv")
end)
--------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function() -- In jail chores to reduce time in jail
    while true do
        Wait(10)
        if jailed then 
            doingchore = false
            for k,v in pairs(Config.jailchores) do 
            local blip = N_0x554d9d53f696d002(1664425300,v.x,v.y,v.z)
            SetBlipSprite(blip, 28148096, 1)
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, "Jail Chore")
            local coords = GetEntityCoords(PlayerPedId())
            local currentCheck = Vdist2(coords.x, coords.y, coords.z, v.x,v.y,v.z)
            local broom = Vdist2(GetHashKey("p_broom01x"), coords.x, coords.y, coords.z)
            if currentCheck < 3 then 
                DrawTxt('Press E to clean the courtyard', 0.38, 0.90, 0.4, 0.4, true, 255, 255, 255, 255, false)
                if IsControlJustReleased(0, 0xCEFD9220) and doingchore == false then
                    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_BROOM_WORKING'), 10000, true, false, false, false)
                    Wait(10000)
                    ClearPedTasksImmediately(PlayerPedId())
                    SetCurrentPedWeapon(PlayerPedId(), GetHashKey('WEAPON_UNARMED'), true) -- unarm player
                    jail_time = jail_time - 10
                    Wait(10000)
                end
            end
        end
        end
    end
end)


Citizen.CreateThread(function() -- Community Service Logic, including animations minigame difficulty and more
    while true do
        Wait(10)
        local coords = GetEntityCoords(PlayerPedId())
        if serviced then
            if not serviceblip then  
            serviceblip = N_0x554d9d53f696d002(1664425300,pos.x,pos.y,pos.z)
            SetBlipSprite(serviceblip, 28148096, 1)
            Citizen.InvokeNative(0x9CB1A1623062F402, serviceblip, "Community Service")
            end
                   currentCheck = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, pos.x,pos.y,pos.z, true)
                    if currentCheck < 1 then 
                            DrawTxt('Press E to clean the courtyard', 0.38, 0.90, 0.4, 0.4, true, 255, 255, 255, 255, false)
                        if IsControlJustReleased(0, 0xCEFD9220) then
                                if Config.minigame then
                                    local test = exports["syn_minigame"]:taskBar(3000,7) -- difficulty,skillGapSent
                                    if test == 100 then 
                                        ped = PlayerPedId()
                                        if IsPedMale(ped) then     
                                        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('PROP_HUMAN_REPAIR_WAGON_WHEEL_ON_SMALL'), 10000, true, false, false, false)
                                        else 
                                        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 10000, true, false, false, false)
                                        end
                                        Wait(12000)
                                        choreamount = choreamount - 1
                                        TriggerServerEvent("lawmen:updateservice")
                                    else
					VORPcore.NotifyBottomRight("You failed",4000)
                                    end
                                else
                                    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 10000, true, false, false, false)
                                    Wait(10000)
                                    SetCurrentPedWeapon(PlayerPedId(), GetHashKey('WEAPON_UNARMED'), true) -- unarm player
                                end
                                
                        end
                    end
        end

        if choreamount and choreamount == 0 then
            TriggerServerEvent("lawmen:endservice")
            serviced = false
            RemoveBlip(serviceblip) 
            serviceblip = nil  
		VORPcore.NotifyBottomRight("You have completed Community Service, straighten up",4000)
            break
        end

    end


end)

RegisterNetEvent("lawmen:ServicePlayer") -- Assigns Chore amount and picks random coord for construcion
AddEventHandler("lawmen:ServicePlayer", function(chore,amount) 
        serviced = true
        choreamount = amount
        print(amount)
        pos = Config.construction[math.random(1, #Config.construction)]
        print(pos.x,pos.y,pos.z)
end)

 Citizen.CreateThread(function() -- Registers breakout of Community Service Area 
    while true do
        Wait(10)
        if serviced then 
            for k,v in pairs(Config.construction) do 
                local coords = GetEntityCoords(PlayerPedId())
                if GetDistanceBetweenCoords(coords, v.x,v.y,v.z, true) > Config.communityservicedistance then 
                    brokedistance = true
                else 
                    brokedistance = false
                end
             end
        end
    end
end)

Citizen.CreateThread(function() -- Update Jail Timer Logic 
    while true do
        Wait(10)
        if jailed then 
            Wait(Config.UpdateJailTime)
            TriggerServerEvent("lawmen:taketime")
        end
    end
end)

idinput = { -- Player ID input
    type = "enableinput", -- don't touch
    inputType = "input", -- input type
    button = "Confirmar", -- button name
    placeholder = "Player ID", -- placeholder name
    style = "block", -- don't touch
    attributes = {
        inputHeader = "Player ID", -- header
        type = "number", -- inputype text, number,date,textarea ETC
        pattern = "[0-9]", --  only numbers "[0-9]" | for letters only "[A-Za-z]+" 
        title = "numbers only", -- if input doesnt match show this message
        style = "border-radius: 10px; background-color: ; border:none;"-- style 
    }
}

FineAmount = { -- Fine Amount input
    type = "enableinput", -- don't touch
    inputType = "input", -- input type
    button = "Confirmar", -- button name
    placeholder = "Multa", -- placeholder name
    style = "block", -- don't touch
    attributes = {
        inputHeader = "Multa", -- header
        type = "number", -- inputype text, number,date,textarea ETC
        pattern = "[0-9]", --  only numbers "[0-9]" | for letters only "[A-Za-z]+" 
        title = "numbers only", -- if input doesnt match show this message
        style = "border-radius: 10px; background-color: ; border:none;"-- style 
    }
}

JailTime = { -- Jail time input
    type = "enableinput", -- don't touch
    inputType = "input", -- input type
    button = "Confirmar", -- button name
    placeholder = "Tempo de Prisão", -- placeholder name
    style = "block", -- don't touch
    attributes = {
        inputHeader = "Tempo de Prisão", -- header
        type = "number", -- inputype text, number,date,textarea ETC
        pattern = "[0-9]", --  only numbers "[0-9]" | for letters only "[A-Za-z]+" 
        title = "numbers only", -- if input doesnt match show this message
        style = "border-radius: 10px; background-color: ; border:none;"-- style 
    }
}

MenuData = {}
TriggerEvent("menuapi:getData",function(call)
    MenuData = call
end)

RegisterCommand(Config.openpolicemenu, function()
    if policeOnDuty and not isDead then
        OpenJailMenu()
    else
        return
    end
end)

function openPolicemenu() -- Base Police Menu Logic
	MenuData.CloseAll()
    local ped = PlayerPedId()
	local elements = {
		{label = Config.badgename, value = 'star' , desc = "Put On Your Star"},
		{label = "Cuff/Uncuff Citizen", value = 'cuff' , desc = "Cuff a Citizen"},
		{label = "Escort", value = 'escort' , desc = "Escort a Citizen"},
        {label = "Fine Menu", value = 'fine' , desc = "Fine a Citizen"},
        {label = "Jail Menu", value = 'jail' , desc = "Jail a Citizen"},
        {label = "Community Service Menu", value = 'community' , desc = "Community Service a Citizen"},
	}
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = Config.menuname,
		subtext    = "Actions",
		align    = 'top-left',
		elements = elements,
	},
	function(data, menu)
		if (data.current.value == 'star') then 
            if star == false then
			    if not IsPedMale(ped) then
                    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  0x1FC12C9C, true, true, true)
                    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false)
                else
                    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), 0xDB4C451D, true, false, true)
                    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false)
                end
		VORPcore.NotifyBottomRight("You have put on your star",4000)		
                star = true
            else
                if not IsPedMale(ped) then
                    Citizen.InvokeNative(0x0D7FFA1B2F69ED82, PlayerPedId(),  0x1FC12C9C, 0, 0)
                    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false)
                else
                    Citizen.InvokeNative(0x0D7FFA1B2F69ED82, PlayerPedId(), 0xDB4C451D, 0, 0)
                    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false)
                end
		VORPcore.NotifyBottomRight("You took your star off",4000)
                star = false
            end

        elseif (data.current.value == 'cuff') then
            HandcuffPlayer()

        elseif (data.current.value == 'escort') then
            local closestPlayer, closestDistance = GetClosestPlayer()
            if closestPlayer ~= -1 and closestDistance <= 3.0 then
                TriggerServerEvent('lawmen:drag', GetPlayers(closestPlayer))
            else
		VORPcore.NotifyBottomRight("Not close enough",4000)	
            
            end

        elseif (data.current.value == 'fine') then
            OpenFineMenu()

        elseif (data.current.value == 'jail') then
            OpenJailMenu()		

    elseif (data.current.value == 'community') then
        OpenCommunityMenu()
    end

    
	end,
	function(data, menu)
		menu.close()
	end)
end

function OpenJailMenu() -- Jail menu logic
	MenuData.CloseAll()
	local elements = {
		{label = "ID # : " .. "<span style='margin-left:10px; color: Red;'>" .. playerid .. '</span>', value = 'id' , desc = "ID do cidadão: "..playerid },
		{label = "Tempo :" .. "<span style='margin-left:10px; color: Red;'>" .. timeinjail .. '</span>' , value = 'time' , desc = "Tempo em minutos: "..timeinjail },
        {label = "Teletransporte: " ..tele , value = 'auto' , desc = "No caso de o Cidadão ser levado ou transportado manualmente" },
        {label = "Local da Prisão: " ..jailname, value = 'loc' , desc = "Local de prisão" },
        {label = "Prender", value = 'jail' , desc = "Se Teletransporte for falso, então você deve transportar o Cidadão, caso contrário, os locais o farão" },
        {label = "Soltar", value = 'unjail' , desc = "Libertar um Cidadão" },

	}
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = "Jail Menu",
		subtext    = "Actions",
		align    = 'top-left',
		elements = elements,
        lastmenu = "openPolicemenu"
	},
	function(data, menu)
        if data.current == "backup" then
            _G[data.trigger]()
         
		elseif (data.current.value == 'id') then 
            
            TriggerEvent("vorpinputs:advancedInput", json.encode(idinput), function(result)
                local amount = tonumber(result)
                if amount > 0 and amount then -- make sure its not empty or nil
                    playerid = amount
                    menu.close()
                    OpenJailMenu()
                else
                    print("it's empty?") --notify
                end
            end)

        elseif (data.current.value == 'time') then
            
            TriggerEvent("vorpinputs:advancedInput", json.encode(JailTime), function(result)
                local amount = result
                if result ~= "" and result then -- make sure its not empty or nil
                    timeinjail = amount
                    menu.close()
                    OpenJailMenu()
                else
                    print("it's empty?") --notify
                end
            end)

        elseif (data.current.value == 'jail') then
            TriggerServerEvent('lawmen:JailPlayer', tonumber(playerid), tonumber(timeinjail), jailid)

        elseif (data.current.value == 'auto') then
            if autotele == false then
                autotele = true
                tele = "True"
                menu.close()
                OpenJailMenu()
            else
                autotele = false
                tele = "False"
                menu.close()
                OpenJailMenu()
            end

        elseif (data.current.value == 'loc') then
            OpenSubJailMenu()

        elseif (data.current.value == 'unjail') then
            
            TriggerServerEvent('lawmen:unjail', playerid,jailid)

        end
	end,
	function(data, menu)
		menu.close()
	end)
end

function OpenSubJailMenu() -- Choosing Jail menu logic
	MenuData.CloseAll()
	local elements = {
		{label = "Valentine Sheriff Office", value = "val" , desc = "Prender Cidadão a Valentine Sheriff Office numa cela" },
        {label = "Blackwater Sheriff Office", value = 'bw' , desc = "Prender Cidadão a Blackwater Sheriff Office numa cela" },
		{label = "Saint Denis Sheriff Office", value = "sd" , desc = "Prender Cidadão a Saint Denis Sheriff Office numa cela" },
		{label = "Rhodes Sheriff Office", value = "rh" , desc = "Prender Cidadão a Rhodes Sheriff Office numa cela" },
		{label = "Strawberry Sheriff Office", value = "st" , desc = "Prender Cidadão a Strawberry Sheriff Office numa cela" },
        {label = "Armadillo Sheriff Office", value = "ar" , desc = "Prender Cidadão a Armadillo Sheriff Office numa cela" },
		{label = "Tumbleweed Sheriff Office", value = "tu" , desc = "Prender Cidadão a Tumbleweed Sheriff Office numa cela" },
		{label = "Annesburg Sheriff Office", value = "an" , desc = "Prender Cidadão a Annesburg Sheriff Office numa cela" },
        {label = "Sisika Prison", value = "sk" , desc = "Prender Cidadão a Sisika Prison" },


	}
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = "Jail Menu",
		subtext    = "Choose Jail",
		align    = 'top-left',
		elements = elements,
        lastmenu = "OpenJailMenu"
	},
	function(data, menu)
        if data.current == "backup" then
            _G[data.trigger]()
        
    elseif data.current.value then 
        jailname = data.current.label
        jailid = data.current.value
            print(jailname)
            print(jailid)
            menu.close()
            OpenJailMenu()
        end
	end,
	function(data, menu)
		menu.close()
	end)
end

function OpenFineMenu() -- Fine Menu logic
	MenuData.CloseAll()
	local elements = {
		{label = "ID # : " .. "<span style='margin-left:10px; color: Red;'>" .. playerid .. '</span>', value = 'id' , desc = "This is the citizens ID: "..playerid },		
        {label = "Amount of Fine :" .. "<span style='margin-left:10px; color: Red;'>" .. fineamount .. '</span>' , value = 'amount' , desc = "This is the amount of the fine: "..timeinjail },
        {label = "Bill (Society)", value = 'bill' , desc = "Bill the Citizen, allowing them to pay back later, to the society" },
        {label = "Fine (Non Society)", value = 'fine' , desc = "Fine the Citizen, Takes the cash from the citizen at the moment, even putting them negative" },
	}
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = "Fine Menu",
		subtext    = "Actions",
		align    = 'top-left',
		elements = elements,
        lastmenu = "openPolicemenu"
	},
	function(data, menu)
        if data.current == "backup" then
            _G[data.trigger]()
        
    elseif (data.current.value == 'id') then 
            
            TriggerEvent("vorpinputs:advancedInput", json.encode(idinput), function(result)
                local amount = result
                if result ~= "" and result then -- make sure its not empty or nil
                    playerid = amount
                    menu.close()
                    OpenFineMenu()
                else
                    print("it's empty?") --notify
                end
            end)

        elseif (data.current.value == 'amount') then
            
            TriggerEvent("vorpinputs:advancedInput", json.encode(FineAmount), function(result)
                local amount = result
                if result ~= "" and result then -- make sure its not empty or nil
                    fineamount = amount
                    menu.close()
                    OpenFineMenu()
                else
                    print("it's empty?") --notify
                end
            end)

        elseif (data.current.value == 'bill') then
            TriggerServerEvent("syn_society:bill", tonumber(fineamount), tonumber(playerid)) -- playerid

        elseif (data.current.value == 'fine') then
            print(playerid)
            print(fineamount)
            TriggerServerEvent("lawmen:FinePlayer", tonumber(playerid), tonumber(fineamount))
    end
	end,
	function(data, menu)
		menu.close()
	end)
end

function OpenCommunityMenu() -- Community service menu logic
    print(chore)
	MenuData.CloseAll()
	local elements = {
		{label = "ID # : " .. "<span style='margin-left:10px; color: Red;'>" .. playerid .. '</span>', value = 'id' , desc = "This is the citizens ID: "..playerid },		
        {label = "Chore: " ..chore, value = 'chore' , desc = "Chore Type" },
        {label = "Amount of Chores :" .. "<span style='margin-left:10px; color: Red;'>" .. choreamount .. '</span>' , value = 'amount' , desc = "This is the amount of chores to do: "..choreamount },
        {label = "Service", value = 'service' , desc = "Give the Citizen Community Service" },
	}
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = "Community Service Menu",
		subtext    = "Actions",
		align    = 'top-left',
		elements = elements,
        lastmenu = "openPolicemenu"
	},
	function(data, menu)
        if data.current == "backup" then
            _G[data.trigger]()
        
    elseif (data.current.value == 'id') then 
            
            TriggerEvent("vorpinputs:advancedInput", json.encode(idinput), function(result)
                local amount = result
                if result ~= "" and result then -- make sure its not empty or nil
                    playerid = amount
                    menu.close()
                    OpenCommunityMenu()
                else
                    print("it's empty?") --notify
                end
            end)

        elseif (data.current.value == 'amount') then
            
            TriggerEvent("vorpinputs:advancedInput", json.encode(FineAmount), function(result)
                local amount = result
                if result ~= "" and result then -- make sure its not empty or nil
                    choreamount = amount
                    menu.close()
                    OpenCommunityMenu()
                else
                    print("it's empty?") --notify
                end
            end)

        elseif (data.current.value == 'chore') then
            OpenChoreTypeMenu()
        elseif (data.current.value == 'service') then
            TriggerServerEvent("lawmen:CommunityService", tonumber(playerid), chore, tonumber(choreamount))
       
        end
	end,
	function(data, menu)
		menu.close()
	end)
end

function OpenChoreTypeMenu() -- Set chore menu logic
	MenuData.CloseAll()
	local elements = {
        {label = "Construction", value = 'cont' , desc = "Construction " },
	}
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = "Chore Menu",
		subtext    = "Actions",
		align    = 'top-left',
		elements = elements,
        lastmenu = "openPolicemenu"
	},
	function(data, menu)
        if data.current == "backup" then
            _G[data.trigger]()
        
    elseif data.current.label then 
           chore = data.current.label 
           print(chore)
           menu.close()
           OpenCommunityMenu()
    end
	end,
	function(data, menu)
		menu.close()
	end)
end
RegisterNetEvent("lawmen:breakout") -- Event for breaking out
AddEventHandler("lawmen:breakout", function()
    local local_ped = PlayerPedId()
    local local_player = PlayerId()
    TriggerServerEvent('lawmen:jailbreak')
	VORPcore.NotifyBottomRight("You have been broken out from prison. Now Run!",4000)	
    jailed = false
    jail_time = 0
    SetPlayerInvincible(local_player, false)

end)

--------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('col_policejob:client:OpenMenu')
AddEventHandler('col_policejob:client:OpenMenu', function()
    showPoliceArmas = true
    local PoliceArmas = {
        {
            header = "Armas da Policia",
            txt = "Pegue uma por vez!",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            header = "Revolver Lemat",
            txt = "Revolver com 100 munições $ 1",
            params = {
                event = "weLemat",
            }
        },
        {
            header = "Laço",
            txt = "Laço comum",
            params = {
                event = "weLaco",
            }
        },
        {
            header = "Faca",
            txt = "Faca de caça",
            params = {
                event = "weFaca",
            }
        },
        {
            header = "Revolver Schofield",
            txt = "Revolver com 100 munições $ 1",
            params = {
                event = "weSchofield",
            }
        },
        {
            header = "Revolver Navy",
            txt = "Revolver com 100 munições $ 2",
            params = {
                event = "weNavy",
            }
        },
        {
            header = "Repetidor Evans",
            txt = "Repetidor com 100 munições $ 1.50",
            params = {
                event = "weEvans",
            }
        },
        {
            header = "Repetidor Winchester",
            txt = "Repetidor com 100 munições $ 2",
            params = {
                event = "weWinchester",
            }
        },
        {
            header = "Carabina de Repetição $ 2",
            txt = "Repetidor com 100 munições",
            params = {
                event = "weCarabina",
            }
        },
        {
            header = "Rifle de Ferrolho $ 2.50",
            txt = "Rifle com 80 munições",
            params = {
                event = "weFerrolho",
            }
        },
        {
            header = "Licença de Caçador de Recomp.",
            txt = "Licença para caçadores de recompensas",
            params = {
                event = "weRe",
            }
        },
        {
            header = "Licença Fort Mercer",
            txt = "Licença para investida ao forte",
            params = {
                event = "weForte",
            }
        },
        {
            header = "Fechar",
            params = {
                event = "col-menu:closeMenu",
            }
        },
    }
    exports['col-menu']:openMenu(PoliceArmas)
end)

RegisterNetEvent("weLemat")
AddEventHandler("weLemat", function()
    local ammo = {["AMMO_REVOLVER"] = 100}
    local comps = {['nothing'] = 0}
    local money = 1
    TriggerServerEvent("lawmen:guncabinet", "WEAPON_REVOLVER_LEMAT", ammo, comps, money) 
end) 
RegisterNetEvent("weLaco")
AddEventHandler("weLaco", function()
    local ammo = {["nothing"] = 0}
    local comps = {["nothing"] = 0}
    local money = 1
    TriggerServerEvent("lawmen:guncabinet", "WEAPON_LASSO", ammo, comps, money)
end) 
RegisterNetEvent("weFaca")
AddEventHandler("weFaca", function()
    local ammo = {["nothing"] = 0}
    local comps = {["nothing"] = 0}
    local money = 1
    TriggerServerEvent("lawmen:guncabinet", "WEAPON_MELEE_KNIFE", ammo, comps, money)
end)                       
RegisterNetEvent("weSchofield")
AddEventHandler("weSchofield", function()
    local ammo = {["AMMO_REVOLVER"] = 100}
    local comps = {["nothing"] = 0}
    local money = 1
    TriggerServerEvent("lawmen:guncabinet", "WEAPON_REVOLVER_SCHOFIELD", ammo, comps, money)
end)
RegisterNetEvent("weNavy")
AddEventHandler("weNavy", function()
    local ammo = {["AMMO_REVOLVER"] = 100}
    local comps = {["nothing"] = 0}
    local money = 2
    TriggerServerEvent("lawmen:guncabinet", "WEAPON_REVOLVER_NAVY", ammo, comps, money)
end)
RegisterNetEvent("weEvans")
AddEventHandler("weEvans", function()
    local ammo = {["AMMO_REPEATER"] = 100}
    local comps = {["nothing"] = 0}
    local money = 1.50
    TriggerServerEvent("lawmen:guncabinet", "WEAPON_REPEATER_EVANS", ammo, comps, money)
end)
RegisterNetEvent("weFerrolho")
AddEventHandler("weFerrolho", function()
    local ammo = {["AMMO_RIFLE"] = 80}
    local comps = {["nothing"] = 0}  
    local money = 2.5  
    TriggerServerEvent("lawmen:guncabinet", "WEAPON_RIFLE_BOLTACTION", ammo, comps, money)
end)
RegisterNetEvent("weWinchester")
AddEventHandler("weWinchester", function()
    local ammo = {["AMMO_REPEATER"] = 100}
    local comps = {["nothing"] = 0}
    local money = 2
    TriggerServerEvent("lawmen:guncabinet", "WEAPON_REPEATER_WINCHESTER", ammo, comps, money)
end)
RegisterNetEvent("weCarabina")
AddEventHandler("weCarabina", function()
    local ammo = {["AMMO_REPEATER"] = 100}
    local comps = {["nothing"] = 0}
    local money = 2
    TriggerServerEvent("lawmen:guncabinet", "WEAPON_REPEATER_CARBINE", ammo, comps, money)
end)
RegisterNetEvent("weRe")
AddEventHandler("weRe", function()
    TriggerServerEvent("lawmen:licence")
end)
RegisterNetEvent("weFort")
AddEventHandler("weFort", function()
    TriggerServerEvent("lawmen:fortmercer")
end)
-------------------------------------------------------------------------------------------------------
function whenKeyJustPressed(key)
    if Citizen.InvokeNative(0x580417101DDB492F, 0, key) then
        return true
    else
        return false
    end
end
local properties = { 
	{  x = -278.533, y = 805.3593, z = 119.38 }, --Valentine
	{  x = 2508.048, y = -1301.60, z = 48.953 }, --SDenis
	{  x = -767.801, y = -1266.57, z = 44.053 }, --BlackWater
	{  x = 1361.186, y = -1305.76, z = 77.760 }, --Rhodes
    {  x = -1813.49, y = -354.73, z = 164.65}, -- Strawberry
}
--[[Citizen.CreateThread(function()
    while true do
        Wait(0)
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        for k,v in pairs(properties) do
            if (Vdist2(coords, v.x, v.y, v.z) < 1.0) then 
                if policeOnDuty then 
                    TriggerEvent('enter:pd')
                    if IsControlJustReleased(0, 0x760A9C6F) then
                        TriggerEvent('col_policejob:client:OpenMenu')
                    end
                end
            end
        end
    end
end)]]

RegisterNetEvent('enter:pd')
AddEventHandler('enter:pd', function()
    SetTextScale(0.5, 0.5)
    SetTextFontForCurrentCommand(1)
    local msg =  ('[G] Abrir Menu de Armas')
    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", msg, Citizen.ResultAsLong())
    Citizen.InvokeNative(0xFA233F8FE190514C, str)
    Citizen.InvokeNative(0xE9990552DEC71600)
end)
-- Disable player actions
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if isHandcuffed then
			DisableControlAction(0, 0xB2F377E8, true) -- Attack
			DisableControlAction(0, 0xC1989F95, true) -- Attack 2
			DisableControlAction(0, 0x07CE1E61, true) -- Melee Attack 1
			DisableControlAction(0, 0xF84FA74F, true) -- MOUSE2
			DisableControlAction(0, 0xCEE12B50, true) -- MOUSE3
			DisableControlAction(0, 0x8FFC75D6, true) -- Shift
			DisableControlAction(0, 0xD9D0E1C0, true) -- SPACE
            DisableControlAction(0, 0xF3830D8E, true) -- J
            DisableControlAction(0, 0x80F28E95, true) -- L
            DisableControlAction(0, 0xDB096B85, true) -- CTRL
            DisableControlAction(0, 0xE30CD707, true) -- R
            DisableControlAction(0, 0x3C0A40F2, true) -- F6
        elseif isHandcuffed and IsPedDeadOrDying(PlayerPedId()) then
            isHandcuffed = false
            ClearPedSecondaryTask(PlayerPedId())
            SetEnableHandcuffs(PlayerPedId(), false)
            DisablePlayerFiring(PlayerPedId(), false)
            SetPedCanPlayGestureAnims(PlayerPedId(), true)
            
			Citizen.Wait(500)
		end
	end
end)

function GetPlayers()
    local players = {}

    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, GetPlayerServerId(i))
        end
    end
    
    return players
end

RegisterCommand("clockin", function(rawCommand)
    TriggerEvent("lawmen:goonduty")
end)

RegisterCommand("clockoff", function(rawCommand)
   TriggerEvent("lawmen:gooffduty")
end)

RegisterCommand("algemas", function()
    if policeOnDuty and not isDead then
        TriggerEvent("lawmen:cuffs")
    else
        return
    end
end)
--------------------------------------------------------------
RegisterCommand('P',function(source,rawCommand)
    if policeOnDuty and not isDead then
        TriggerEvent("vorpinputs:getInput", "Mensagem", "Mensagem",function(cb)
        local mensagem = tostring(cb)
        Citizen.Wait(1)
        animSendPombo()
        TriggerServerEvent("RedM:sendalert",'police', 'complaint', mensagem, false, false)
	    end)
    end
end)
function Anim(actor, dict, body, duration, flags, introtiming, exittiming)
    Citizen.CreateThread(function()
        RequestAnimDict(dict)
        local dur = duration or -1
        local flag = flags or 1
        local intro = tonumber(introtiming) or 1.0
        local exit = tonumber(exittiming) or 2.0
        timeout = 5
        while (not HasAnimDictLoaded(dict) and timeout>0) do
            timeout = timeout-1
            if timeout == 0 then
                print("Animation Failed to Load")
            end
            Citizen.Wait(300)
        end
        TaskPlayAnim(actor, dict, body, intro, exit, dur, flag --[[1 for repeat--]], 1, false, false, false, 0, true)
    end)
end
function animSendPombo()
    ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    Anim(ped,"script_common@mth_generic_enters@squat@in_place", "enter_lf", -1,0)
    Wait(2000)
    local npc = CreatePed(GetHashKey('A_C_Pigeon'), coords.x, coords.y+0.3, coords.z-1, GetEntityHeading(ped), true, true, 0, 0)
    Citizen.InvokeNative(0x283978A15512B2FE, npc, true) -- SetRandomOutfitVariation
    SetEntityNoCollisionEntity(PlayerPedId(), npc, false)
    Wait(2000)
    DeletePed(npc)
    DeleteEntity(npc)
end
--------------------------------------------------------------

RegisterCommand("carroca", function(source, rawCommand)
    local closestPlayer, closestDistance = GetClosestPlayer()
    local iscuffed = Citizen.InvokeNative(0x74E559B3BC910685, closestPlayer)
    print(iscuffed)
    if closestPlayer ~= -1 and closestDistance <= 3.0 then
        TriggerServerEvent('lawmen:GetPlayerWagonID', GetPlayerServerId(closestPlayer))
    else
        return
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        if InWagon then 
            SetRelationshipBetweenGroups(1, `PLAYER`, `PLAYER`)
        end
    end
end)

RegisterNetEvent('lawmen:PlayerInWagon') --Put in Vehicle logic, not in use currently
AddEventHandler('lawmen:PlayerInWagon', function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local closestWagon = GetClosestVehicle(coords)
    local vehicle = IsPedInVehicle(ped, closestWagon, 0)
    local seat = math.random(3,6)
    if ped ~= nil then
        if not vehicle then
            SetPedIntoVehicle(ped, closestWagon, seat)
            Wait(500)
            InWagon = true
        else
            TaskLeaveVehicle(ped, closestWagon, 16)
            Wait(5000)
            InWagon = false
        end
    end
end)

function GetClosestVehicle(coords)
    local ped = PlayerPedId()
    local objects = GetGamePool('CVehicle')
    local closestDistance = -1
    local closestObject = -1
    if coords then
    else
        coords = GetEntityCoords(ped)
    end
    for i = 1, #objects, 1 do
        local objectCoords = GetEntityCoords(objects[i])
        local distance = #(objectCoords - coords)
        if closestDistance == -1 or closestDistance > distance then
            closestObject = objects[i]
            closestDistance = distance
        end
    end
    return closestObject, closestDistance
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if InWagon == true then
            DisableControlAction(1, 0xFEFAB9B4, true)
            DisableControlAction(1, 0xE31C6A41, true)
            DisableControlAction(1, 0x4CC0E2FE, true)
        end
    end
end)
--[[RegisterCommand('vehicle',function(source,rawCommand)
    if policeOnDuty and not isDead then
    
        local coords = GetEntityCoords(PlayerPedId())
        local model = 'wagonPrison01x'
        CreateVehicle(model,coords.x+1.0, coords.y+1.0, coords.z, 30, true, true, false, false)
    end
end)

RegisterCommand('drag', function(source, args, rawCommand)
    local closestPlayer, closestDistance = GetClosestPlayer()
    if closestPlayer ~= -1 and closestDistance <= 3.0 then
        TriggerServerEvent('lawmen:drag', GetPlayerServerId(closestPlayer))
    else
        TriggerEvent("vorp:TipRight", "Não está perto o suficiente", 2000)
    end
end)]]
--------------------------------------------------------------------------               
Citizen.CreateThread(function()
    local wasDragged

    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        if isHandcuffed and dragStatus.isDragged then
            local targetPed = GetPlayerPed(GetPlayerFromServerId(dragStatus.CopId))

            if DoesEntityExist(targetPed) and IsPedOnFoot(targetPed) and not IsPedDeadOrDying(targetPed, true) then
                if not wasDragged then
                    AttachEntityToEntity(playerPed, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
                    wasDragged = true
                else
                    Citizen.Wait(1000)
                end
            else
                wasDragged = false
                dragStatus.isDragged = false
                DetachEntity(playerPed, true, false)
            end
        elseif wasDragged then
            wasDragged = false
            DetachEntity(playerPed, true, false)
        else
            Citizen.Wait(500)
        end
    end
end)

RegisterNetEvent('lawmen:drag')
AddEventHandler('lawmen:drag', function(copId)
    if isHandcuffed then
        dragStatus.isDragged = not dragStatus.isDragged
        dragStatus.CopId = copId
    end
end)

RegisterNetEvent("lawmen:JailPlayer") -- Jailing player event
AddEventHandler("lawmen:JailPlayer", function(time,loc)
    local ped = PlayerPedId()
    local time_minutes = math.floor(time/60)
    local jailid = loc
    jaillocation = loc
    serviced = false
print(autotele)
print(jailid)
        if not jailed then
            if autotele then
            DoScreenFadeOut(500)
            Citizen.Wait(600)
            if jailid == "sk" then
               SetEntityCoords(ped, Config.Jails.sisika.entrance.x, Config.Jails.sisika.entrance.y, Config.Jails.sisika.entrance.z)
            elseif jailid == "bw" then
                SetEntityCoords(ped, Config.Jails.blackwater.entrance.x, Config.Jails.blackwater.entrance.y, Config.Jails.blackwater.entrance.z)
            elseif jailid == "st" then
                SetEntityCoords(ped, Config.Jails.strawberry.entrance.x, Config.Jails.strawberry.entrance.y, Config.Jails.strawberry.entrance.z)
            elseif jailid == "val" then
                SetEntityCoords(ped, Config.Jails.valentine.entrance.x, Config.Jails.valentine.entrance.y, Config.Jails.valentine.entrance.z)
            elseif jailid == "ar" then
                SetEntityCoords(ped, Config.Jails.armadillo.entrance.x, Config.Jails.armadillo.entrance.y, Config.Jails.armadillo.entrance.z)
            elseif jailid == "tu" then
                SetEntityCoords(ped, Config.Jails.tumbleweed.entrance.x, Config.Jails.tumbleweed.entrance.y, Config.Jails.tumbleweed.entrance.z)
            elseif jailid == "rh" then
                SetEntityCoords(ped, Config.Jails.rhodes.entrance.x, Config.Jails.rhodes.entrance.y, Config.Jails.rhodes.entrance.z)
            elseif jailid == "sd" then
                SetEntityCoords(ped, Config.Jails.stdenis.entrance.x, Config.Jails.stdenis.entrance.y, Config.Jails.stdenis.entrance.z)
            elseif jailid == "an" then
                SetEntityCoords(ped, Config.Jails.annesburg.entrance.x, Config.Jails.annesburg.entrance.y, Config.Jails.annesburg.entrance.z)
            end

            FreezeEntityPosition(ped, true)
            jail_time = time
            jailed = true
            RemoveAllPedWeapons(ped, true)

            DoScreenFadeIn(500)
            Citizen.Wait(600)
		VORPcore.NotifyBottomRight("You have been imprisoned for " ..time_minutes.. " minutes",4000)
            FreezeEntityPosition(ped, false)
            TriggerEvent("police_job:wear_prison", ped)
            else 
                jail_time = time
                jailed = true
                Citizen.Wait(600)
                RemoveAllPedWeapons(ped, true)
		VORPcore.NotifyBottomRight("You have been imprisoned for " ..time_minutes.. " minutes",4000)
                TriggerEvent("police_job:wear_prison", ped)
            end
        end
end)

RegisterNetEvent("police_job:wear_prison") -- Wear prison outfit event
AddEventHandler("police_job:wear_prison", function()

    local ped = PlayerPedId()
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x9925C067, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x485EE834, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x18729F39, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x3107499B, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x3C1A74CD, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x3F1F01E5, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x3F7F3587, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x49C89D9B, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x4A73515C, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x514ADCEA, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x5FC29285, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x79D7DF96, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x7A96FACA, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x877A2CF7, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x9B2C8B89, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0xA6D134C6, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0xE06D30CE, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x662AC34, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0xAF14310B, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x72E6EF74, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0xEABE0032, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x2026C46D, true, true, true)
    
    if IsPedMale(ped) then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, ped, 0x5BA76CCF, true, true, true)
        Citizen.InvokeNative(0xD3A7B003ED343FD9, ped, 0x216612F0, true, true, true)
        Citizen.InvokeNative(0xD3A7B003ED343FD9, ped, 0x1CCEE58D, true, true, true)
    else
        Citizen.InvokeNative(0xD3A7B003ED343FD9, ped, 0x6AB27695, true, true, true)
        Citizen.InvokeNative(0xD3A7B003ED343FD9, ped, 0x75BC0CF5, true, true, true)
        Citizen.InvokeNative(0xD3A7B003ED343FD9, ped, 0x14683CDF, true, true, true)
    end 
    RemoveAllPedWeapons(ped, true, true) 
end)

RegisterNetEvent("lawmen:UnjailPlayer") -- Unjail player event
AddEventHandler("lawmen:UnjailPlayer", function()
    local local_ped = PlayerPedId()
    local local_player = PlayerId()
    local jailid = jaillocation
    ExecuteCommand('rc')
VORPcore.NotifyBottomRight("You have been released from prison. Now straighten up and fly right!",4000)
    jailed = false
    jail_time = 0
    if autotele then
        if jailid == "sk" then
            SetEntityCoords(local_ped, Config.Jails.sisika.exit.x, Config.Jails.sisika.exit.y, Config.Jails.sisika.exit.z)
            elseif jailid == "bw" then
             SetEntityCoords(local_ped, Config.Jails.blackwater.exit.x, Config.Jails.blackwater.exit.y, Config.Jails.blackwater.exit.z)
            elseif jailid == "st" then
             SetEntityCoords(local_ped, Config.Jails.strawberry.exit.x, Config.Jails.strawberry.exit.y, Config.Jails.strawberry.exit.z)
            elseif jailid == "val" then
             SetEntityCoords(local_ped, Config.Jails.valentine.exit.x, Config.Jails.valentine.exit.y, Config.Jails.valentine.exit.z)
            elseif jailid == "ar" then
             SetEntityCoords(local_ped, Config.Jails.armadillo.exit.x, Config.Jails.armadillo.exit.y, Config.Jails.armadillo.exit.z)
            elseif jailid == "tu" then
             SetEntityCoords(local_ped, Config.Jails.tumbleweed.exit.x, Config.Jails.tumbleweed.exit.y, Config.Jails.tumbleweed.exit.z)
            elseif jailid == "rh" then
             SetEntityCoords(local_ped, Config.Jails.rhodes.exit.x, Config.Jails.rhodes.exit.y, Config.Jails.rhodes.exit.z)
            elseif jailid == "sd" then
             SetEntityCoords(local_ped, Config.Jails.stdenis.exit.x, Config.Jails.stdenis.exit.y, Config.Jails.stdenis.exit.z)
            elseif jailid == "an" then
             SetEntityCoords(local_ped, Config.Jails.annesburg.exit.x, Config.Jails.annesburg.exit.y, Config.Jails.annesburg.exit.z)
        end
    SetPlayerInvincible(local_player, false)
    else 
        SetPlayerInvincible(local_player, false)
    end
end)

Citizen.CreateThread(function() --Display timer when in jail logic
    while true do
        Wait(0)
        if jailed then
            DrawTxt('Imprisoned: '..jail_time ..' seconds remaining', 0.38, 0.95, 0.4, 0.4, true, 255, 0, 0, 255, false)
        end

    end
end)

RegisterNetEvent('lawmen:putinoutvehicle') --Put in Vehicle logic, not in use currently
AddEventHandler('lawmen:putinoutvehicle', function()
    local ped = PlayerPedId()
    if IsPedSittingInAnyVehicle(ped) then
        local vehicle = GetVehiclePedIsIn(ped, false)
        TaskLeaveVehicle(ped, vehicle, 16)
    else
        local coords = GetEntityCoords(ped)
        local vehicle = GetVehicleCoords(coords)
        local seats = 1
        while seats <= 6 do
            if Citizen.InvokeNative(0xE052C1B1CAA4ECE4, vehicle, seats) then
                Citizen.InvokeNative(0xF75B0D629E1C063D, ped, vehicle, seats)
                break
            end
                if seats == 7 then
                    break
                end
            seats = seats + 1
        end
    end
end)
Citizen.CreateThread(function() -- Added time if over max distance/count down until unjailed logic
    while true do
        if jailed then
            local ped = PlayerPedId()
            local local_player = PlayerId()
            local player_coords = GetEntityCoords(ped, true)

            if not GetPlayerInvincible(local_player) then
                SetPlayerInvincible(local_player, true)
            end
            if jail_time < 1 then
                print(jaillocation)
                local player_server_id = GetPlayerServerId(PlayerId())
                TriggerServerEvent("lawmen:unjail", player_server_id,jaillocation)
            else

                jail_time = jail_time - 1

            end
            Citizen.Wait(1000)
        end
        Citizen.Wait(0)
    end
end)

RegisterNetEvent("lawmen:cuffs")
AddEventHandler("lawmen:cuffs", function()
    HandcuffPlayer() 
end)

RegisterNetEvent("lawmen:lockpick")
AddEventHandler("lawmen:lockpick", function()
    local closestPlayer, closestDistance = GetClosestPlayer()
    if closestPlayer ~= -1 and closestDistance <= 3.0 then
        local chance = math.random(1,100)
        print("chance", chance)
        if not isDead then
            if chance < 85 then
                local ped = PlayerPedId()
                local anim = "mini_games@story@mud5@cracksafe_look_at_dial@med_r@ped"
                local idle = "base_idle"
                local lr = "left_to_right"
                local rl = "right_to_left"
                RequestAnimDict(anim)
                while not HasAnimDictLoaded(anim) do
                    Citizen.Wait(50)
                end
                
                TaskPlayAnim(PlayerPedId(), anim, idle, 8.0, -8.0, -1, 32, 0, false, false, false)
                Citizen.Wait(1250)
                TaskPlayAnim(PlayerPedId(), anim, lr, 8.0, -8.0, -1, 32, 0, false, false, false)
                Citizen.Wait(325)
                TaskPlayAnim(PlayerPedId(), anim, idle, 8.0, -8.0, -1, 32, 0, false, false, false)
                Citizen.Wait(1250)
                TaskPlayAnim(PlayerPedId(), anim, rl, 8.0, -8.0, -1, 32, 0, false, false, false)
                Citizen.Wait(325)
                repeat
                    TriggerEvent("lawmen:lockpick")
                until(chance)
            end
            if chance >= 85 then
                local breakChance = math.random(1,10)
                print("breakChance", breakChance)
                if breakChance < 3 then
                    TriggerServerEvent("lawmen:lockpick:break")
                else
                    local ped = PlayerPedId()
                    local anim = "mini_games@story@mud5@cracksafe_look_at_dial@small_r@ped"
                    local open = "open"
                    RequestAnimDict(anim)
                    while not HasAnimDictLoaded(anim) do
                        Citizen.Wait(50)
                    end
                    TaskPlayAnim(PlayerPedId(), anim, open, 8.0, -8.0, -1, 32, 0, false, false, false)
                    Citizen.Wait(1250)
                    TriggerServerEvent('lawmen:lockpicksv', GetPlayerServerId(closestPlayer))
                end
            end
        end
    else
        TriggerEvent("vorp:TipRight", "Nenhum jogador nas proximidades", 3000)
        return
    end
    
end)

Citizen.CreateThread(function() -- Timer for leaving community service logic, which jails player
    while true do
        Wait(0)
        local player = PlayerPedId()
        gametime = GetGameTimer()
        seconds = Config.communityservicetimer -- max time (seconds) you want to set
        printtime = seconds
        while brokedistance do
        Wait(0)
                local playerCoords = GetEntityCoords(PlayerPedId())       
            if printtime > 0 then
                diftime = GetGameTimer() - gametime
                printtime = math.floor(seconds - (diftime/1000))
                DrawTxt("You have  " .. printtime .. " seconds remaining to return before being jailed", 0.50, 0.95, 0.6, 0.6, true, 255, 255, 255, 255, true,10000)
            else
                Citizen.Wait(1000)
                brokedistance = false
                serviced = false
                autotele = true
                loc = "sk"
                local player_server_id = GetPlayerServerId(PlayerId())
                TriggerServerEvent('lawmen:JailPlayer', tonumber(player_server_id), tonumber(Config.leftserviceamount), jailid)
                TriggerServerEvent('lawmen:jailedservice',source)
                print("Brokedistance is false")
            end
        end   
     end
 end)

function DrawTxt(text, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", text)
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
	SetTextCentre(centre)
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
	Citizen.InvokeNative(0xADA9255D, 1);
    DisplayText(str, x, y)
end

function DrawText3D(x, y, z, text)
	local onScreen,_x,_y=GetScreenCoordFromWorldCoord(x, y, z)
	local px,py,pz=table.unpack(GetGameplayCamCoord())  
	local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
	local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
	if onScreen then
	  SetTextScale(0.30, 0.30)
	  SetTextFontForCurrentCommand(1)
	  SetTextColor(255, 255, 255, 215)
	  SetTextCentre(1)
	  DisplayText(str,_x,_y)
	  local factor = (string.len(text)) / 225
	  DrawSprite("feeds", "hud_menu_4a", _x, _y+0.0125,0.015+ factor, 0.03, 0.1, 35, 35, 35, 190, 0)
	end
end

function CreateVarString(p0, p1, variadic)
    return Citizen.InvokeNative(0xFA925AC00EB830B9, p0, p1, variadic, Citizen.ResultAsLong())
end

function CheckID()
    local player = tonumber(onscreenKeyboard('PLAYER_ID'))
    if not tonumber(player) then
        TriggerEvent("vorp:TipRight", "ID do jogador inválido.", 10000)
        return
    elseif not NetworkIsPlayerActive(GetPlayerFromServerId(player)) then
        TriggerEvent("vorp:TipRight", "Jogador não está online.", 10000)
        return
    end

    TriggerServerEvent('lawmen:GetID', tonumber(player))
end

function HandcuffPlayer()
    local closestPlayer, closestDistance = GetClosestPlayer()

    if closestPlayer ~= -1 and closestDistance <= 3.0 then
        TriggerServerEvent('lawmen:handcuff', GetPlayerServerId(closestPlayer))
    else
        TriggerEvent("vorp:TipRight", "Nenhum jogador nas proximidades", 10000)
        return
    end
end

function onscreenKeyboard(defaultTitle)
	local _return = nil

	DisplayOnscreenKeyboard(1,"FMMC_KEY_TIP8", "", defaultTitle, "", "", "", 9)
	while true do
		DisableAllControlActions(0)
		Citizen.Wait(0)

		if UpdateOnscreenKeyboard() == 1 then
			_return = GetOnscreenKeyboardResult()
			break
		elseif UpdateOnscreenKeyboard() == 2 or UpdateOnscreenKeyboard() == 3 then
			break
		end
	end

	return _return
end

function GetClosestPlayer()
    local players, closestDistance, closestPlayer = GetActivePlayers(), -1, -1
    local playerPed, playerId = PlayerPedId(), PlayerId()
    local coords, usePlayerPed = coords, false
    
    if coords then
        coords = vector3(coords.x, coords.y, coords.z)
    else
        usePlayerPed = true
        coords = GetEntityCoords(playerPed)
    end
    
    for i=1, #players, 1 do
        local tgt = GetPlayerPed(players[i])

        if not usePlayerPed or (usePlayerPed and players[i] ~= playerId) then

            local targetCoords = GetEntityCoords(tgt)
            local distance = #(coords - targetCoords)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = players[i]
                closestDistance = distance
            end
        end
    end
    return closestPlayer, closestDistance
end

RegisterNetEvent('lawmen:handcuff')
AddEventHandler('lawmen:handcuff', function()
	isHandcuffed = not isHandcuffed
	local playerPed = PlayerPedId()

	Citizen.CreateThread(function()
		if isHandcuffed then
			SetEnableHandcuffs(playerPed, true)
			DisablePlayerFiring(playerPed, true)
			SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
			SetPedCanPlayGestureAnims(playerPed, false)
        else
            ClearPedSecondaryTask(playerPed)
            SetEnableHandcuffs(playerPed, false)
            DisablePlayerFiring(playerPed, false)
            SetPedCanPlayGestureAnims(playerPed, true)
		end
	end)
end)

RegisterNetEvent('lawmen:lockpicked')
AddEventHandler('lawmen:lockpicked', function()
    local playerPed = PlayerPedId()
    ClearPedSecondaryTask(playerPed)
    SetEnableHandcuffs(playerPed, false)
    DisablePlayerFiring(playerPed, false)
    SetPedCanPlayGestureAnims(playerPed, true)
    isHandcuffed = false
end)

function lockpick()
    local ped = PlayerPedId()
    local anim = "mini_games@story@mud5@cracksafe_look_at_dial@med_r@ped"
    local idle = "base_idle"
    local lr = "left_to_right"
    local rl = "right_to_left"
    RequestAnimDict(anim)
    while not HasAnimDictLoaded(anim) do
        Citizen.Wait(50)
    end
    
    TaskPlayAnim(PlayerPedId(), anim, idle, 8.0, -8.0, -1, 32, 0, false, false, false)
    Citizen.Wait(1250)
    TaskPlayAnim(PlayerPedId(), anim, lr, 8.0, -8.0, -1, 32, 0, false, false, false)
    Citizen.Wait(325)
    TaskPlayAnim(PlayerPedId(), anim, idle, 8.0, -8.0, -1, 32, 0, false, false, false)
    Citizen.Wait(1250)
    TaskPlayAnim(PlayerPedId(), anim, rl, 8.0, -8.0, -1, 32, 0, false, false, false)
    Citizen.Wait(325)
end