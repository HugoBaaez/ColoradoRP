local game_during = false
local elements = {}
local ingame = false

RegisterNetEvent('lto_roulette:start')
AddEventHandler('lto_roulette:start', function(u_money)
	SendNUIMessage({type = "show_table",zetony = u_money})
	ingame = true
	SetNuiFocus(true, true)
	SendNUIMessage({type = "reset_bet"})
end)

RegisterNUICallback('exit', function(data, cb)
	cb('ok')
	SetNuiFocus(false, false)
    ingame = false
end)

RegisterNUICallback('roll', function(data, cb)
	cb('ok')
	TriggerEvent('lto_roulette:start_game', data.couleur, data.cota)
end)

RegisterNetEvent('InteractSound_CL:PlayOnOne')
AddEventHandler('InteractSound_CL:PlayOnOne', function(soundFile, soundVolume)
    SendNUIMessage({
        transactionType     = 'playSound',
        transactionFile     = soundFile,
        transactionVolume   = soundVolume
    })
end)

RegisterNetEvent('lto_roulette:start_game')
AddEventHandler('lto_roulette:start_game', function(action, amount)
	local amount = amount
	if game_during == false then
    TriggerServerEvent('lto_roulette:removemoney', amount)
	local couleur = action
		TriggerEvent("vorp:TipBottom", "Você apostou "..amount.." $ no "..couleur..". A roda vai girar...", 4000) -- The language of This line is not in the config language you need to change it here
		game_during = true
		local randomNumber = math.floor(math.random() * 36)
		SendNUIMessage({type = "show_roulette",hwButton = randomNumber})
		TriggerServerEvent('InteractSound_SV:PlayOnSource', 'betup', 1.0)
		Citizen.Wait(10000)
		local Red = {32,19,21,25,34,27,36,30,23,5,16,1,14,9,18,7,12,3};
		local Black = {15,4,2,17,6,13,11,8,10,24,33,20,31,22,29,28,35,26};
		local function has_value (tab, val)
			for index, value in ipairs(tab) do
				if value == val then
					return true
				end
			end
			return false
		end
		if action == 'Black' then
				local win = amount * 2
			if has_value(Black, randomNumber) then
				SendNUIMessage({type = 'hide_roulette'})
				SetNuiFocus(false, false)
			    ingame = false
				TriggerEvent("vorp:TipBottom", Config.Language.winblack, 4000) -- from client side
				TriggerServerEvent('lto_roulette:givemoney', action, amount )
			else				
				SendNUIMessage({type = 'hide_roulette'})
				SetNuiFocus(false, false)
				SendNUIMessage({type = "reset_bet"})
			    ingame = false
				TriggerEvent("vorp:TipBottom", Config.Language.losemoney, 4000) -- from client side
			end
		elseif action == 'Red' then
			        local win = amount * 2
			if has_value(Red, randomNumber) then
				SendNUIMessage({type = 'hide_roulette'})
				SetNuiFocus(false, false)
			    ingame = false
				TriggerEvent("vorp:TipBottom", Config.Language.winred, 4000) -- from client side
				TriggerServerEvent('lto_roulette:givemoney', action, amount )
			else
				SendNUIMessage({type = 'hide_roulette'})
				SetNuiFocus(false, false)
				SendNUIMessage({type = "reset_bet"})
			    ingame = false
				TriggerEvent("vorp:TipBottom", Config.Language.losemoney, 4000) -- from client side
			end
		elseif action == 'Green' then
				local win = amount * 14
			if randomNumber == 0 then
				SendNUIMessage({type = 'hide_roulette'})
				SetNuiFocus(false, false)
				SendNUIMessage({type = "reset_bet"})
			    ingame = false
				TriggerEvent("vorp:TipBottom", Config.Language.wingreen, 4000) -- from client side
				TriggerServerEvent('lto_roulette:givemoney', action, amount )
			else
				SendNUIMessage({type = 'hide_roulette'})
				SetNuiFocus(false, false)
			    ingame = false
                TriggerEvent("vorp:TipBottom", Config.Language.losemoney, 4000) -- from client side
			end
		end
		SendNUIMessage({type = 'hide_roulette'})
		SetNuiFocus(false, false)
		SendNUIMessage({type = "reset_bet"})
		ingame = false
		game_during = false
	else
		TriggerEvent("vorp:TipBottom", Config.Language.inprogress, 4000) -- from client side
	end
end)




Citizen.CreateThread(function()
    -- Roulette
	RequestModel(GetHashKey('p_roulettetable01x'))
	while not HasModelLoaded(GetHashKey('p_roulettetable01x')) do
		Citizen.Wait(0)
	end
	RouletteTable1 = CreateObject(GetHashKey('p_roulettetable01x'), 3288.53, -1311.77, 41.75, 0.00, true, false)
	SetEntityAsMissionEntity(RouletteTable1)
	SetEntityHeading(RouletteTable1, -90.00)
	
	-- Blackjack/Slot Tables
	RequestModel(GetHashKey('p_tablepoker01x'))
	while not HasModelLoaded(GetHashKey('p_tablepoker01x')) do
		Citizen.Wait(0)
	end
	BJTable1 = CreateObject(GetHashKey('p_tablepoker01x'), 3288.53, -1317.48, 41.75, 0.00, true, false)
	SlotTable1 = CreateObject(GetHashKey('p_tablepoker01x'), 3288.53, -1324.17, 41.75, 0.00, true, false)
	SetEntityAsMissionEntity(SlotTable1)
	SetEntityAsMissionEntity(BJTable1)
	SetEntityHeading(BJTable1, 180.00)
	SetEntityHeading(SlotTable1, 180.00)
	
	
	-- Slot machine on table
	RequestModel(GetHashKey('p_register06x'))
	while not HasModelLoaded(GetHashKey('p_register06x')) do
		Citizen.Wait(0)
	end
	Slot1 = CreateObject(GetHashKey('p_register06x'), 3288.97, -1324.15, 42.57, 0.00, true, false)
	Slot2 = CreateObject(GetHashKey('p_register06x'), 3288.08, -1324.15, 42.57, 0.00, true, false)
	Slot3 = CreateObject(GetHashKey('p_register06x'), 3288.52, -1324.60, 42.57, 0.00, true, false)
	Slot4 = CreateObject(GetHashKey('p_register06x'), 3288.52, -1323.75, 42.57, 0.00, true, false)
	SetEntityAsMissionEntity(Slot1)
	SetEntityAsMissionEntity(Slot2)
	SetEntityAsMissionEntity(Slot3)
	SetEntityAsMissionEntity(Slot4)
	SetEntityHeading(Slot1, 90.00)
	SetEntityHeading(Slot2, -90.00)
	SetEntityHeading(Slot3, 0.00)
	SetEntityHeading(Slot4, 180.00)
	
    -- Chairs
--[[	RequestModel(GetHashKey('p_chaircomfy05x'))
	while not HasModelLoaded(GetHashKey('p_chaircomfy05x')) do
		Citizen.Wait(0)
	end
	Chair1 = CreateObject(GetHashKey('p_chaircomfy05x'), 3288.48, -1318.75, 41.76, 0.00, true, false)
    Chair2 = CreateObject(GetHashKey('p_chaircomfy05x'), 3288.48, -1316.25, 41.76, 0.00, true, false)
    Chair3 = CreateObject(GetHashKey('p_chaircomfy05x'), 3287.21, -1317.50, 41.76, 0.00, true, false)
    Chair4 = CreateObject(GetHashKey('p_chaircomfy05x'), 3289.75, -1317.50, 41.76, 0.00, true, false)
	Chair5 = CreateObject(GetHashKey('p_chaircomfy05x'), 3288.48, -1325.50, 41.76, 0.00, true, false)
	Chair6 = CreateObject(GetHashKey('p_chaircomfy05x'), 3288.48, -1323.00, 41.76, 0.00, true, false)
    Chair7 = CreateObject(GetHashKey('p_chaircomfy05x'), 3287.21, -1324.15, 41.76, 0.00, true, false)
    Chair8 = CreateObject(GetHashKey('p_chaircomfy05x'), 3289.75, -1324.15, 41.76, 0.00, true, false)
	SetEntityAsMissionEntity(Chair1)
	SetEntityAsMissionEntity(Chair2)
	SetEntityAsMissionEntity(Chair3)
	SetEntityAsMissionEntity(Chair4)
	SetEntityAsMissionEntity(Chair5)
	SetEntityAsMissionEntity(Chair6)
	SetEntityAsMissionEntity(Chair7)
	SetEntityAsMissionEntity(Chair8)
	SetEntityHeading(Chair1, 180.00)
	SetEntityHeading(Chair2, 0.00)
	SetEntityHeading(Chair3, 90.00)
	SetEntityHeading(Chair4, -90.00)
	SetEntityHeading(Chair5, 180.00)
	SetEntityHeading(Chair6, 0.00)
	SetEntityHeading(Chair7, 90.00)
	SetEntityHeading(Chair8, -90.00)]]
	
	-- NPC St-Denis Port to go on the Boat
	while not HasModelLoaded( GetHashKey("S_M_M_STGSAILOR_01") ) do
    Wait(500)
    RequestModel( GetHashKey("S_M_M_STGSAILOR_01") )
    end
    local Sailor = CreatePed(GetHashKey("S_M_M_STGSAILOR_01"),2852.49, -1379.08, 44.27, 10.60, false, false, 0, 0) -- st-denis port
    while not DoesEntityExist(Sailor) do
    Wait(300)
    end
    Citizen.InvokeNative(0x283978A15512B2FE, Sailor, true)
    FreezeEntityPosition(Sailor, true)
    SetEntityInvincible(Sailor, true)
    TaskStandStill(Sailor, -1)
    SetEntityCanBeDamagedByRelationshipGroup(Sailor, false, `PLAYER`)
    SetEntityAsMissionEntity(Sailor, true, true)
	SetBlockingOfNonTemporaryEvents(Sailor, true)
    SetModelAsNoLongerNeeded(GetHashKey("S_M_M_STGSAILOR_01"))
	
	-- NPC Sailor on Boat to Go to st-denis
	while not HasModelLoaded( GetHashKey("S_M_M_STGSAILOR_01") ) do
    Wait(500)
    RequestModel( GetHashKey("S_M_M_STGSAILOR_01") )
    end
    local Sailor = CreatePed(GetHashKey("S_M_M_STGSAILOR_01"), 3288.52, -1271.35, 43.83, 180.00, false, false, 0, 0) -- st-denis port
    while not DoesEntityExist(Sailor) do
    Wait(300)
    end
    Citizen.InvokeNative(0x283978A15512B2FE, Sailor, true)
    FreezeEntityPosition(Sailor, true)
    SetEntityInvincible(Sailor, true)
    TaskStandStill(Sailor, -1)
    SetEntityCanBeDamagedByRelationshipGroup(Sailor, false, `PLAYER`)
    SetEntityAsMissionEntity(Sailor, true, true)
	SetBlockingOfNonTemporaryEvents(Sailor, true)
    SetModelAsNoLongerNeeded(GetHashKey("S_M_M_STGSAILOR_01"))
	
	
	while true do
      	local ped = GetPlayerPed(-1)
      	local coords = GetEntityCoords(PlayerPedId())
		-- St-Denis Port Teleport
		if (Vdist(coords.x, coords.y, coords.z, 2852.49, -1379.08, 44.27) < 2.0) then
		DrawTxt(Config.Language.teleportA, 0.50, 0.85, 0.7, 0.5, true, 255, 255, 255, 255, true)
		if IsControlJustReleased(0,0xD9D0E1C0) then
        TriggerServerEvent("lto_roulette:BoatMoney")
		end
		-- Casino Boat Teleport
		elseif (Vdist(coords.x, coords.y, coords.z, 3288.52, -1271.35, 43.83) < 2.0) then
		DrawTxt(Config.Language.teleportB, 0.50, 0.85, 0.7, 0.5, true, 255, 255, 255, 255, true)
		if IsControlJustReleased(0,0xD9D0E1C0) then
        TriggerEvent("lto_roulette:TeleportBack")
		end
		-- Play Roulette
        elseif not ingame and (Vdist(coords.x, coords.y, coords.z, 3288.53, -1311.77, 42.75) < 1.5) then
		DrawTxt(Config.Language.playroulette, 0.50, 0.85, 0.7, 0.5, true, 255, 255, 255, 255, true)
        if IsControlJustReleased(0,0xD9D0E1C0) then
        TriggerServerEvent("lto_roulette:Bets")
        end
		end
	Citizen.Wait(0)
	end
end)

RegisterNetEvent('lto_roulette:Teleport')
AddEventHandler('lto_roulette:Teleport', function()
	local ped = PlayerPedId()
	DoScreenFadeOut(2000)
	Wait(5000)
	DoScreenFadeIn(3000)
	SetEntityCoords(ped, 3288.48, -1276.25, 44.33)
    SetEntityHeading(ped, 180.00)
end)

RegisterNetEvent('lto_roulette:TeleportBack')
AddEventHandler('lto_roulette:TeleportBack', function()
	local ped = PlayerPedId()
	DoScreenFadeOut(2000)
	Wait(5000)
	DoScreenFadeIn(3000)
	SetEntityCoords(ped, 2670.40, -1546.66, 45.96)
	SetEntityHeading(ped, 360.00)
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