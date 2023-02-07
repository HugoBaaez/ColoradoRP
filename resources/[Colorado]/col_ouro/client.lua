local Config = {}
local panninglocations = Config.PanningLocations

local active = false
local ShopPrompt
local hasAlreadyEnteredMarker, lastZone
local currentZone = nil
local prompts = GetRandomIntInRange(0, 0xffffff)
--REQUEST CONFIG--
-- Allora, ti diverti a cercare le coordinate che sono state messe lato server? Genio :)
Citizen.CreateThread(function() 
	Wait(2000)
	TriggerServerEvent("cercaoro:requestconfig")
end)

RegisterNetEvent("cercaoro:saveconfig")
AddEventHandler("cercaoro:saveconfig", function(svConfig)
	Config = svConfig
end)

local setacciando = false
function playSuccessAnim()
	if not setacciando then
		Citizen.CreateThread(function()
			setacciando = true
			math.randomseed(GetGameTimer())
			x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), true))
			RequestAnimDict(Config.AnimDict)
			while not HasAnimDictLoaded(Config.AnimDict) do
				RequestAnimDict(Config.AnimDict)
				Citizen.Wait(1)
			end
			RequestModel(Config.PanObject)
			while not HasModelLoaded(Config.PanObject) do
			RequestModel(Config.PanObject)
			Citizen.Wait(1)
			end
			exports['progressBars']:startUI(10000, "Peneirando...")
			local object = CreateObject(Config.PanObject, x, y, z, true, true, true)
			AttachEntityToEntity(object, PlayerPedId(), GetEntityBoneIndexByName(PlayerPedId(), Config.Bone), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 1, 0, 0, 1)
			TaskPlayAnim(PlayerPedId(), Config.AnimDict, "search0"..tostring(math.random(1,4)), 1.0, 8.0, -1, 1, 0, false, false, false)
			Wait(10000)
			TriggerEvent('stress:modify', 1)
			DeleteObject(object)
			ClearPedTasks(PlayerPedId())
			TriggerEvent("checkgold", false)
			giveGold()
			setacciando = false
		end)
	end
end

function giveGold()
	TriggerServerEvent('vorp_goldpanning:successGiveGold', lastZone)
end

RegisterNetEvent('vorp_goldpanning:panPresent')
AddEventHandler('vorp_goldpanning:panPresent', function(test)
	
	TriggerEvent("checkgold", true)
	Wait(500)
	playSuccessAnim()
	
end)

function isPlayingAnimFishing(player) 
	local animations = {"search01","search02",}
end

AddEventHandler('vorp_goldpanning:hasEnteredMarker', function(zone)
	currentZone = zone
end)

AddEventHandler('vorp_goldpanning:hasExitedMarker', function(zone)
    
	currentZone = nil
end)

Citizen.CreateThread(function()
	Wait(5000)
    while true do
        Citizen.Wait(0)
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        local isInMarker, currentZone = false
		local Water = Citizen.InvokeNative(0x5BA7A68A346A5A91,coords.x+3, coords.y+3, coords.z)

		for k,v in pairs(Config.PanningLocations) do
			if not IsPlayerDead(PlayerId()) then
				local distance = GetDistanceBetweenCoords(v["x"],v["y"],v["z"],coords.x,coords.y,coords.z, true)
				if Water == Config.PanningLocations[k]["waterhash"] and IsEntityInWater(player) and IsPedOnFoot(player) and distance < v["radius"] then
					TriggerEvent("vorp:TipBottom", "~o~Há algo brilhando na água!", 3000)
					isInMarker  = true
					currentZone = k
					lastZone    = k
					break            
				end
			end
		end

		if isInMarker and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
			TriggerEvent('vorp_goldpanning:hasEnteredMarker', currentZone)
		end
		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('vorp_goldpanning:hasExitedMarker', lastZone)
		end
    end
end)

RegisterNetEvent('col_ouro:checkZone')
AddEventHandler('col_ouro:checkZone', function()
    if currentZone then
        if active == false then
            active = true
        end
		TriggerServerEvent('vorp_goldpanning:checkPan')
		Citizen.Wait(5000)
	else
		Citizen.Wait(500)
	end

end)

---- spawn ped 
Citizen.CreateThread(function()
    local hashModel = GetHashKey("RE_GOLDPANNER_MALES_01")  
        -- Loading Model
	if IsModelValid(hashModel) then 
		RequestModel(hashModel)
		while not HasModelLoaded(hashModel) do                
			Wait(100)
		end
	end        
	-- Spawn Ped
	local npc = CreatePed(hashModel, 1416.92, 273.55, 88.53, 198.26, false, true, true, true)
	Citizen.InvokeNative(0x283978A15512B2FE, npc, true) -- SetRandomOutfitVariation
	SetEntityNoCollisionEntity(PlayerPedId(), npc, false)
	SetEntityCanBeDamaged(npc, false)
	SetEntityInvincible(npc, true)
	Wait(1000)
	FreezeEntityPosition(npc, true) -- NPC can't escape
	SetBlockingOfNonTemporaryEvents(npc, true) -- NPC can't be scared
end)

RegisterNetEvent('ouro:client:OpenMenu')
AddEventHandler('ouro:client:OpenMenu', function()
    showOuro = true
    local Ouro = {
        {
            header = "Troca de Ouro",
            txt = "",
            isMenuHeader = true, --título, janela nao clicável
        },
		{
            header = "Ouro por Pepita",
            txt = "15 Pepitas mais $5 ",
            params = {
                isServer = true,
                event = "gold:vender",
            }
        },
		{
            header = "Fechar",
            params = {
                event = "col-menu:closeMenu",
            }
        },
	}
    exports['col-menu']:openMenu(Ouro)
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
        local coords = GetEntityCoords(PlayerPedId())
        if (Vdist(coords.x, coords.y, coords.z, 1417.4, 271.73, 89.52) < 1.0) then  --YOUR CHORDS FOR MENU HERE
			local label  = CreateVarString(10, 'LITERAL_STRING', "Troca de Ouro")
			PromptSetActiveGroupThisFrame(prompts, label)
			if Citizen.InvokeNative(0xC92AC953F0A982AE,openmenu) then
				if IsControlJustReleased(0, 0x760A9C6F) then -- g					
					TriggerEvent("ouro:client:OpenMenu")
				end
			end
        end
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(5000)
    local str = "Pressione para"
	openmenu = PromptRegisterBegin()
	PromptSetControlAction(openmenu, Config.keys["G"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(openmenu, str)
	PromptSetEnabled(openmenu, 1)
	PromptSetVisible(openmenu, 1)
	PromptSetStandardMode(openmenu,1)
    PromptSetHoldMode(openmenu, 1)
	PromptSetGroup(openmenu, prompts)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,openmenu,true)
	PromptRegisterEnd(openmenu)
end)
