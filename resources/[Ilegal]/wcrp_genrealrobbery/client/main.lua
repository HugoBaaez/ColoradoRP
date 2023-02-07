local robtime = 120 -- Time to rob (in seconds) now its 3.3mins
local timerCount = robtime
local isRobbing = false
local timers = false
local storetimer = nil
local storenumber = nil

function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str)
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
	SetTextCentre(centre)
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
	Citizen.InvokeNative(0xADA9255D, 1);
    DisplayText(str, x, y)
end
local cooldown = 0

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(1000)
		if cooldown >= 0 then
			cooldown = cooldown - 1
		else
			cooldown = 0
		end
	end
end)
--Robbery startpoint
Citizen.CreateThread(function() 
    while true do
	Citizen.Wait(3)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local players =  GetPlayers()
		for i = 1, #Config.Shops do
			currentshop = i
			if GetDistanceBetweenCoords(coords, Config.Shops[currentshop].coords.x, Config.Shops[currentshop].coords.y, Config.Shops[currentshop].coords.z, true)  < 1.2 then
					DrawTxt(Config.rob, 0.50, 0.95, 0.7, 0.7, true, 255, 255, 255, 255, true)
					--print(cooldown)
				if IsControlJustReleased(0, 0xD9D0E1C0) then 
					if cooldown == 0 then
						TriggerServerEvent("wcrp_robbery:startToRob") 
						--isRobbing = true  
					end
				end
			end			
		end
	end
end)

RegisterNetEvent("wcrp:robOk")
AddEventHandler("wcrp:robOk",function()
	local _source = source
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local lock = exports['SS-Lockpick']:Lockpick()
	
	for i = 1, #Config.Shops do
		currentshop = i
		if GetDistanceBetweenCoords(coords, Config.Shops[currentshop].coords.x, Config.Shops[currentshop].coords.y, Config.Shops[currentshop].coords.z, true)  < 1.2 then
			if lock then 
			TriggerServerEvent("startanim")
			cooldown = 30*60
			Wait(Config.Policealert)        
		--	ExecuteCommand("alertpolice") --Chamando policia
			local text = 'Roubo a '.. Config.Shops[i].name.. ''
			TriggerServerEvent("RedM:sendalert",'police', 'complaint', text, coords, true)
		--	print("chamado policia")
			--Wait(Config.Cooldown)
			isRobbing = true  
			elseif not lock then 
			TriggerEvent("vorp:TipRight", "Você quebrou a lockpick", 5000)
			end
		end
	end

end)

RegisterNetEvent('wcrp_robbery:startAnimation')
AddEventHandler('wcrp_robbery:startAnimation', function()	
	local _source = source
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
    local testplayer = exports["syn_minigame"]:taskBar(4000,7)
    local testplayer2
    local testplayer3
    local testplayer4
    Wait(1000)
    if testplayer == 100 then
    testplayer2 = exports["syn_minigame"]:taskBar(3500,7)
    end
    Wait(1000)
    if testplayer2 == 100 then
    testplayer3 = exports["syn_minigame"]:taskBar(3200,7)
    end
    Wait(1000)
    if testplayer3 == 100 then
    testplayer4 = exports["syn_minigame"]:taskBar(2900,7)
    end
	Wait(1000)
    if testplayer4 == 100 then   
	TaskStartScenarioInPlace(playerPed, GetHashKey('world_human_shop_browse_counter'), 360000, true, false, false, false)
	exports['progressBars']:startUI(Config.LockpickTime, "Pegando Tudo...")
	FreezeEntityPosition(PlayerPedId(),true)
    Citizen.Wait(1000)
	Citizen.Wait(Config.LockpickTime)
	ClearPedTasksImmediately(PlayerPedId())
	ClearPedSecondaryTask(PlayerPedId())
	FreezeEntityPosition(PlayerPedId(),false)
    Citizen.Wait(1000)    
	TriggerServerEvent("wcrp_robbery:payout", function(playerPed, coords)
	end)
    elseif not testplayer then 
    isRobbing = false         
    end        
end)

function GetPlayers()
    local players = {}

    for i = 0, 128 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, GetPlayerServerId(i))
        end
    end

    return players
end
RegisterNetEvent("wcrp:sendPlayersToserver")
AddEventHandler("wcrp:sendPlayersToserver", function() 
	TriggerServerEvent("wcrp:countsceriffi")
end)