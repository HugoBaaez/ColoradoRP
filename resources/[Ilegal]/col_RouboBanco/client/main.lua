local robtime = 140 -- Time to rob (in seconds) now its 3.3mins
local timerCount = robtime
local isRobbing = false
local speaked = false
local started = false
local maksettu = false
local Blowedynamite = false
local missionCompleted = false
local cooldown = 30*60
local active = true

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

RegisterNetEvent('isrobing')
AddEventHandler('isrobing', function(value)
	isRobbing = value
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

--Robbery startpoint VALENTINE
Citizen.CreateThread(function() 
    while true do
	Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local betweencoords = GetDistanceBetweenCoords(coords, -304.64, 775.8, 118.7, true)
		if betweencoords < 2.0 and isRobbing == false then
				DrawTxt("Pressione [~e~G~q~] para INICIAR O ROUBO", 0.50, 0.95, 0.7, 0.7, true, 255, 255, 255, 255, true)
				if IsControlJustReleased(0, 0x760A9C6F) then
                isRobbing = true 
				active = false   
				TriggerServerEvent("robbery:startrobbery", "Valentine")
				local tipo = "complaint"
				local msg = 'Roubo ao BANCO DE VALENTINE!'
				local chamado = true
				TriggerServerEvent("RedM:sendalert",'police', tipo, msg, coords, chamado)
			end
		end
	end
end)
--Robbery startpoint SAINT DENIS
Citizen.CreateThread(function() 
    while true do
	Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local betweencoords = GetDistanceBetweenCoords(coords, 2646.59, -1297.74, 52.25, true)
		if betweencoords < 2.0 and isRobbing == false then
				DrawTxt("Pressione [~e~G~q~] para INICIAR O ROUBO", 0.50, 0.95, 0.7, 0.7, true, 255, 255, 255, 255, true)
				if IsControlJustReleased(0, 0x760A9C6F) then
                isRobbing = true
				active = false     
				TriggerServerEvent("robbery:startrobbery", "Saint Denis")
				local tipo = "complaint"
				local msg = 'Roubo ao BANCO DE SAINT DENIS!'
				local chamado = true
				TriggerServerEvent("RedM:sendalert",'police', tipo, msg, coords, chamado)
			end
		end
	end
end)
--Robbery startpoint RHODES
Citizen.CreateThread(function() 
    while true do
	Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local betweencoords = GetDistanceBetweenCoords(coords, 1295.85, -1304.24, 77.04, true)
		if betweencoords < 2.0 and isRobbing == false then
				DrawTxt("Pressione [~e~G~q~] para INICIAR O ROUBO", 0.50, 0.95, 0.7, 0.7, true, 255, 255, 255, 255, true)
				if IsControlJustReleased(0, 0x760A9C6F) then
                isRobbing = true
				active = false     
				TriggerServerEvent("robbery:startrobbery", "Rhodes")
				local tipo = "complaint"
				local msg = 'Roubo ao BANCO DE RHODES!'
				local chamado = true
				TriggerServerEvent("RedM:sendalert",'police', tipo, msg, coords, chamado)
			end
		end
	end
end)
--Robbery startpoint Armadillo
Citizen.CreateThread(function() 
    while true do
	Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local betweencoords = GetDistanceBetweenCoords(coords, -3668.44, -2630.87, -13.69, true)
		if betweencoords < 2.0 and isRobbing == false then
				DrawTxt("Pressione [~e~G~q~] para INICIAR O ROUBO", 0.50, 0.95, 0.7, 0.7, true, 255, 255, 255, 255, true)
				if IsControlJustReleased(0, 0x760A9C6F) then
                isRobbing = true
				active = false     
				TriggerServerEvent("robbery:startrobberyArmadillo", "Armadillo")
				local tipo = "guerrilha"
				local msg = 'Roubo ao BANCO DE ARMADILLO!'
				local chamado = true
				TriggerServerEvent("RedM:sendalert",'guerrilha', tipo, msg, coords, chamado)
			end
		end
	end
end)
---SAINT DENIS
Citizen.CreateThread(function() 
    while true do
	Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local betweencoords = GetDistanceBetweenCoords(coords, 2643.33, -1306.54, 52.25, true)
		if betweencoords < 2.0 and isRobbing == true and not active then
				DrawTxt("Pressione [~e~G~q~] para USAR A DYNAMITE", 0.50, 0.95, 0.7, 0.7, true, 255, 255, 255, 255, true)
				if IsControlJustReleased(0, 0x760A9C6F) then
                isRobbing = true
				active = true    
				TriggerServerEvent("robbery:dynamite", coords)				
			end
		end
	end
end)
--- VALENTINE
Citizen.CreateThread(function() 
    while true do
	Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local betweencoords = GetDistanceBetweenCoords(coords, -309.06, 764.02, 118.70, true)
		if betweencoords < 2.0 and isRobbing == true and not active then
				DrawTxt("Pressione [~e~G~q~] para USAR A DYNAMITE", 0.50, 0.95, 0.7, 0.7, true, 255, 255, 255, 255, true)
				if IsControlJustReleased(0, 0x760A9C6F) then
                isRobbing = true 
				active = true   
				TriggerServerEvent("robbery:dynamite", coords)				
			end
		end
	end
end)
--- RHODES
Citizen.CreateThread(function() 
    while true do
	Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local betweencoords = GetDistanceBetweenCoords(coords, 1287.48, -1314.66, 77.04, true)
		if betweencoords < 2.0 and isRobbing == true and not active then
				DrawTxt("Pressione [~e~G~q~] para USAR A DYNAMITE", 0.50, 0.95, 0.7, 0.7, true, 255, 255, 255, 255, true)
				if IsControlJustReleased(0, 0x760A9C6F) then
                isRobbing = true 
				active = true   
				TriggerServerEvent("robbery:dynamite", coords)				
			end
		end
	end
end)
--- Armadillo
Citizen.CreateThread(function() 
    while true do
	Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local betweencoords = GetDistanceBetweenCoords(coords, -3665.534912109375, -2639.58349609375, -13.72997856140136, true)
		if betweencoords < 2.0 and isRobbing == true and not active then
				DrawTxt("Pressione [~e~G~q~] para USAR A DYNAMITE", 0.50, 0.95, 0.7, 0.7, true, 255, 255, 255, 255, true)
				if IsControlJustReleased(0, 0x760A9C6F) then
                isRobbing = true 
				active = true   
				TriggerServerEvent("robbery:dynamite", coords)				
			end
		end
	end
end)
RegisterNetEvent('robbery:startAnimation3')
AddEventHandler('robbery:startAnimation3', function(coords, BankName)	
	local _source = source
    local testplayer = exports["syn_minigame"]:taskBar(4000,7)
    local testplayer2
    local testplayer3
    local testplayer4
	local bank = tostring(BankName)
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
		active = true 
	local tipo = "complaint"
	local msg = 'Roubo ao BANCO DE '..bank..'!'
	local chamado = true
	if bank == 'Armadillo' then
		TriggerServerEvent("RedM:sendalert",'guerrilha', 'guerrilha', msg, coords, chamado)
	else
		TriggerServerEvent("RedM:sendalert",'police', tipo, msg, coords, chamado)

	end
	BlowDynamite(coords)
    TriggerServerEvent("robbery:loot", true, coords, BankName) 
		Blowedynamite = true                          
    elseif not testplayer then
		active = false 
		Blowedynamite = false 
		isRobbing = true
		speaked = false
		started = false
		maksettu = false     
		Citizen.Wait(6000)
		ClearPedTasksImmediately(PlayerPedId())
		ClearPedSecondaryTask(PlayerPedId())            
    end        
end)

RegisterNetEvent('robbery:loot2')
AddEventHandler('robbery:loot2', function(coords, BankName)	
	while true do
		Citizen.Wait(0)
        local _source = source    
		local playerPed = PlayerPedId()
		local coords2 = GetEntityCoords(playerPed)
		local betweencoords = GetDistanceBetweenCoords(coords2,coords.x, coords.y, coords.z, true)
		if betweencoords < 2.0 and Blowedynamite == true then
			DrawTxt("Pressione [~e~ENTER~q~] para pegar o dinheiro", 0.50, 0.90, 0.7, 0.7, true, 255, 255, 255, 255, true)
			if IsControlJustReleased(0, 0xC7B5340A) then
              TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 360000, true, false, false, false)
	          exports['progressBars']:startUI(360000, "Pegando tudo...")     
              Blowedynamite = false 
              isRobbing = false
              speaked = false
              started = false
              maksettu = false     
			  Citizen.Wait(360000)
	          ClearPedTasksImmediately(PlayerPedId())
	          ClearPedSecondaryTask(PlayerPedId())
	          TriggerServerEvent("robbery:payout", BankName)            
			end
		end
	end
end)

Citizen.CreateThread(function()
    while not HasModelLoaded( GetHashKey("re_coachrobbery_females_01") ) do
        Wait(500)
        RequestModel( GetHashKey("re_coachrobbery_females_01") )
    end
    local npc = CreatePed(GetHashKey("re_coachrobbery_females_01"), 2675.51, -1237.48, 52.30, 292.83, false, false, 0, 0)
    while not DoesEntityExist(npc) do
        Wait(300)
    end
    Citizen.InvokeNative(0x283978A15512B2FE, npc, true)
    FreezeEntityPosition(npc, true)
    SetEntityInvincible(npc, true)
    TaskStandStill(npc, -1)
    SetEntityCanBeDamagedByRelationshipGroup(npc, false, `PLAYER`)
    SetEntityAsMissionEntity(npc, true, true)
    SetModelAsNoLongerNeeded(GetHashKey("re_coachrobbery_females_01"))
end)

function DrawTxt(text,x,y)
    SetTextScale(0.35,0.35)
    SetTextColor(255,255,255,255)--r,g,b,a
    SetTextCentre(true)
    SetTextDropshadow(1,0,0,0,200)
    SetTextFontForCurrentCommand(0)
    DisplayText(CreateVarString(10, "LITERAL_STRING", text), x, y)
end

function BlowDynamite(coords)
			
	local playerPed = PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
	itemDynamiteprop = CreateObject(GetHashKey('p_dynamite01x'), x, y, z+0.2,  true,  true, true)
	AttachEntityToEntity(itemDynamiteprop, playerPed, GetPedBoneIndex(playerPed, 54565), 0.06, 0.0, 0.06, 90.0, 0.0, 0.0, true, true, false, true, 1, true)
	SetCurrentPedWeapon(playerPed, GetHashKey("WEAPON_UNARMED"),true)
	Citizen.Wait(700)
	FreezeEntityPosition(playerPed, true)
	TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 15000, true, false, false, false)
			
	exports['progressBars']:startUI(60000, "Colocando dinamite")
	Citizen.Wait(60000)
			
	ClearPedTasks(playerPed)
	DetachEntity(itemDynamiteprop)
	FreezeEntityPosition(playerPed, false)
	Citizen.Wait(500)
	
	
	
	exports['progressBars']:startUI(25000, "SUPORTE DE DINAMITE ACENDIDO")
	Citizen.Wait(25000)
			
	AddExplosion(coords.x, coords.y, coords.z, 25 , 5000.0 ,true , false , 27)
	Blowedynamite = false
	local playerPed2 = PlayerPedId()
    local coords = GetEntityCoords(playerPed2)	
end

Citizen.CreateThread(function()	
	while not HasModelLoaded( GetHashKey("CS_MysteriousStranger") ) do
    Wait(500)
    RequestModel( GetHashKey("CS_MysteriousStranger") )
    end
    local npc = CreatePed(GetHashKey("CS_MysteriousStranger"), -3665.534912109375, -2639.58349609375, -13.72997856140136, -177.46, false, false, 0, 0) -- VALENTINE
    while not DoesEntityExist(npc) do
    Wait(300)
    end
    Citizen.InvokeNative(0x283978A15512B2FE, npc, true)
    FreezeEntityPosition(npc, true)
    SetEntityInvincible(npc, true)
    TaskStandStill(npc, -1)
    SetEntityCanBeDamagedByRelationshipGroup(npc, false, `PLAYER`)
    SetEntityAsMissionEntity(npc, true, true)
	SetBlockingOfNonTemporaryEvents(npc, true)
    SetModelAsNoLongerNeeded(GetHashKey("CS_MysteriousStranger"))
end)