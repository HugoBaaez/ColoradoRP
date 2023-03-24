local robtime = 140 -- Time to rob (in seconds) now its 3.3mins
local timerCount = robtime
local isRobbing = false
local speaked = false
local started = false
local maksettu = false
local Blowedynamite = false
local missionCompleted = false
local cooldown = 30*60


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


Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local betweencoords = GetDistanceBetweenCoords(coords,-404.98327636719, 663.14361572266, 114.55465698242, true)
		if betweencoords < 2.0 and speaked == false  then
			DrawTxt("PRESSIONE [~e~ENTER~q~] PARA INICIAR ", 0.50, 0.90, 0.7, 0.7, true, 255, 255, 255, 255, true)
			if IsControlJustReleased(0, 0xC7B5340A) and cooldown == 0 then
				speaked = true
                started = true 
				cooldown = 10*60   
				TriggerServerEvent("Heist:countsceriffi", GetPlayers())

			end
		end
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

RegisterNetEvent('mushy_robbery:info')
AddEventHandler('mushy_robbery:info', function()	
    while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local betweencoords = GetDistanceBetweenCoords(coords,-404.98327636719, 663.14361572266, 114.55465698242, true)
		if betweencoords < 2.0 and maksettu == false and started == true then
			DrawTxt(" PRESSIONE [~e~ENTER~q~] ACEITAR ", 0.50, 0.90, 0.7, 0.7, true, 255, 255, 255, 255, true)
			if IsControlJustReleased(0, 0xC7B5340A) then
            started = true
		    maksettu = true 
            isRobbing = true        
			TriggerServerEvent("mushy_robbery:pay", function()                
			end)
			end
		end
	end
end)

RegisterNetEvent('mushy_robbery:go')
AddEventHandler('mushy_robbery:go', function()	
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
	if started == true then
		DrawTxt("", 0.50, 0.50, 0.7, 0.7, true, 255, 255, 255, 255, true)
		Citizen.InvokeNative(0x3D3D15AF7BCAAF83, 6, true, true)
		Citizen.InvokeNative(0x64C59DD6834FA942, 1290.0882568359, -1312.4019775391, 76.039939880371)
		Citizen.InvokeNative(0x4426D65E029A4DC0, true) 
	end
end)

function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str)
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
	SetTextCentre(centre)
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
	Citizen.InvokeNative(0xADA9255D, 1);
    DisplayText(str, x, y)
end

--Robbery startpoint
Citizen.CreateThread(function() 
    while true do
	Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local betweencoords = GetDistanceBetweenCoords(coords,1290.0882568359, -1312.4019775391, 76.039939880371, true)
		if betweencoords < 2.0 and isRobbing == true then
				DrawTxt(Config.rob, 0.50, 0.95, 0.7, 0.7, true, 255, 255, 255, 255, true)
				if IsControlJustReleased(0, 0x760A9C6F) then
                isRobbing = false    
				TriggerServerEvent("mushy_robbery:startrobbery")      
				ExecuteCommand('alertpolice') 
			end
		end
	end
end)


RegisterNetEvent('mushy_robbery:startAnimation2')
AddEventHandler('mushy_robbery:startAnimation2', function()	
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
    if testplayer4 == 100 then   
	BlowDynamite()
    TriggerServerEvent("mushy_robbery:loot", function()
    maksettu = false 
    started = true
    Blowedynamite = true                
    end)                
    elseif not testplayer then 
    Blowedynamite = false 
    isRobbing = false
    speaked = false
    started = false
    maksettu = false     
	Citizen.Wait(6000)
	ClearPedTasksImmediately(PlayerPedId())
	ClearPedSecondaryTask(PlayerPedId())            
    end        
end)

RegisterNetEvent('mushy_robbery:loot2')
AddEventHandler('mushy_robbery:loot2', function()	
	while true do
		Citizen.Wait(0)
        local _source = source    
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local betweencoords = GetDistanceBetweenCoords(coords,1290.0882568359, -1312.4019775391, 76.039939880371, true)
		if betweencoords < 2.0 and Blowedynamite == true then
			DrawTxt("Pressione [~e~ENTER~q~] para pegar o dinheiro", 0.50, 0.90, 0.7, 0.7, true, 255, 255, 255, 255, true)
			if IsControlJustReleased(0, 0xC7B5340A) then
              TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 120000, true, false, false, false)
	          exports['progressBars']:startUI(120000, "Pegando tudo...")     
              Blowedynamite = false 
              isRobbing = false
              speaked = false
              started = false
              maksettu = false     
			  Citizen.Wait(120000)
	          ClearPedTasksImmediately(PlayerPedId())
	          ClearPedSecondaryTask(PlayerPedId())
	          TriggerServerEvent("mushy_robbery:payout", function()
              end)            
			end
		end
	end
end)              
            


Citizen.CreateThread(function()
    while not HasModelLoaded( GetHashKey("CS_johnmarston") ) do
        Wait(500)
        RequestModel( GetHashKey("CS_johnmarston") )
    end
    local npc = CreatePed(GetHashKey("CS_johnmarston"), -404.98327636719, 663.14361572266, 114.55465698242, false, false, 0, 0)
    while not DoesEntityExist(npc) do
        Wait(300)
    end
    Citizen.InvokeNative(0x283978A15512B2FE, npc, true)
    FreezeEntityPosition(npc, true)
    SetEntityInvincible(npc, true)
    TaskStandStill(npc, -1)
    SetEntityCanBeDamagedByRelationshipGroup(npc, false, `PLAYER`)
    SetEntityAsMissionEntity(npc, true, true)
    SetModelAsNoLongerNeeded(GetHashKey("CS_johnmarston"))
end)

function DrawTxt(text,x,y)
    SetTextScale(0.35,0.35)
    SetTextColor(255,255,255,255)--r,g,b,a
    SetTextCentre(true)
    SetTextDropshadow(1,0,0,0,200)
    SetTextFontForCurrentCommand(0)
    DisplayText(CreateVarString(10, "LITERAL_STRING", text), x, y)
end

function BlowDynamite()
			
	local playerPed = PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
	itemDynamiteprop = CreateObject(GetHashKey('p_dynamite01x'), x, y, z+0.2,  true,  true, true)
	AttachEntityToEntity(itemDynamiteprop, playerPed, GetPedBoneIndex(playerPed, 54565), 0.06, 0.0, 0.06, 90.0, 0.0, 0.0, true, true, false, true, 1, true)
	SetCurrentPedWeapon(playerPed, GetHashKey("WEAPON_UNARMED"),true)
	Citizen.Wait(700)
	FreezeEntityPosition(playerPed, true)
	TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 15000, true, false, false, false)
			
	exports['progressBars']:startUI(5500, "Colocando dinamite")
	Citizen.Wait(5500)
			
	ClearPedTasks(playerPed)
	DetachEntity(itemDynamiteprop)
	FreezeEntityPosition(playerPed, false)
	Citizen.Wait(500)
	
	
	
	exports['progressBars']:startUI(25000, "SUPORTE DE DINAMITE ACENDIDO")
	Citizen.Wait(25000)
			
	AddExplosion(1290.0882568359, -1312.4019775391, 76.039939880371, 25 , 5000.0 ,true , false , 27)
	Blowedynamite = true
	local playerPed2 = PlayerPedId()
    local coords = GetEntityCoords(playerPed2)        
	
end