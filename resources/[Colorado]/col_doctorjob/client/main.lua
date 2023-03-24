local isDead = IsPedDeadOrDying(PlayerPedId())

RegisterNetEvent("doctor:onduty")
AddEventHandler("doctor:onduty", function(duty2)
    if not duty2 then
        doctorOnDuty = false
    else
        doctorOnDuty = true
    end
end)

RegisterCommand('M',function(source,rawCommand)
    if doctorOnDuty and not isDead then
		TriggerEvent("vorpinputs:getInput", "Mensagem", "Anuncio",function(cb)
		local mensagem = tostring(cb)
		Citizen.Wait(1)
		TriggerServerEvent("RedM:sendalert",'doctor', 'medic', mensagem, false, false)
		end)
    end
end)

RegisterCommand('reanimar', function()
    local ped = GetPlayerPed()
    local coords = GetEntityCoords(PlayerPedId())
    local closestPlayer, closestDistance = GetClosestPlayer()
    if closestPlayer ~= -1 and closestDistance <= 3.0 and IsEntityDead(GetPlayerPed(closestPlayer)) then 
        TriggerServerEvent("vorp_ml_doctorjob:reviveplayer", GetPlayerServerId(closestPlayer))
    end
end)

RegisterCommand('tratamento', function()
    local ped = GetPlayerPed()
    local coords = GetEntityCoords(PlayerPedId())
    local closestPlayer, closestDistance = GetClosestPlayer()
    if closestPlayer ~= -1 and closestDistance <= 3.0 then
        TriggerServerEvent("vorp_ml_doctorjob:healplayer", GetPlayerServerId(closestPlayer))
     end
end)

function whenKeyJustPressed(key)
    if Citizen.InvokeNative(0x580417101DDB492F, 0, key) then
        return true
    else
        return false
    end
end

--Police Horse

local recentlySpawned = 0

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if recentlySpawned > 0 then
            recentlySpawned = recentlySpawned - 1
        end
    end
end)


RegisterNetEvent('vorp_ml_doctorjob:healed')
AddEventHandler('vorp_ml_doctorjob:healed', function()
    local closestPlayer, closestDistance = GetClosestPlayer()
    if closestPlayer ~= -1 and closestDistance <= 3.0 then
    local Health = GetAttributeCoreValue(PlayerPedId(), 0)
    local newHealth = Health + 100
    local Stamina = GetAttributeCoreValue(PlayerPedId(), 1)
    local newStamina = Stamina + 100
    local Health2 = GetEntityHealth(PlayerPedId())
    local newHealth2 = Health2 + 100
    Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 0, newHealth) --core
    Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 1, newStamina) --core
    SetEntityHealth(PlayerPedId(), newHealth2)
    end
end)

RegisterNetEvent('vorp_ml_doctorjob:revived')
AddEventHandler('vorp_ml_doctorjob:revived', function()
local closestPlayer, closestDistance = GetClosestPlayer()
    if closestPlayer ~= -1 and closestDistance <= 3.0 then
	local ply = PlayerPedId()
	local coords = GetEntityCoords(ply)
	
	DoScreenFadeOut(1000)
	Wait(1000)
	DoScreenFadeIn(1000)
	NetworkResurrectLocalPlayer(coords, true, true, false)
	ClearTimecycleModifier()
	ClearPedTasksImmediately(ply)
	SetEntityVisible(ply, true)
	NetworkSetFriendlyFireOption(true)


	SetCamActive(gameplaycam, true)
	DisplayHud(true)
	DisplayRadar(true)
    exports.spawnmanager:setAutoSpawn(false)
   end
end)

RegisterNetEvent('ml_doctorjob:animation')
AddEventHandler('ml_doctorjob:animation', function(cb)
	RequestAnimDict("mech_revive@unapproved")
	while not HasAnimDictLoaded("mech_revive@unapproved") do
		RequestAnimDict("mech_revive@unapproved")
		Citizen.Wait(1)
	end
	TaskPlayAnim(PlayerPedId(), "mech_revive@unapproved", "revive", 0.5, 0.5, 4000, 1, 0, false, false, false)
end)

RegisterNetEvent('ml_doctorjob:revived')
AddEventHandler('ml_doctorjob:revived', function()
	Citizen.Wait(3500)
	local ply = PlayerPedId()
	local coords = GetEntityCoords(ply)
	
	DoScreenFadeOut(500)
	Wait(500)
	NetworkResurrectLocalPlayer(coords, true, true, false)
	ClearTimecycleModifier()
	ClearPedTasksImmediately(ply)
	SetEntityVisible(ply, true)
	NetworkSetFriendlyFireOption(true)

	SetCamActive(gameplaycam, true)
	DisplayHud(true)
	DisplayRadar(true)
	local dict = "amb_rest@world_human_sleep_ground@arm@player_temp@exit"
	while not HasAnimDictLoaded(dict) do
		RequestAnimDict(dict)
		Citizen.Wait(1)
	end
	TaskPlayAnim(PlayerPedId(), dict, "exit_right", 16.0, 2.0, 9500, 0, 0, true, 0, false, 0, false)
	Wait(500)
	DoScreenFadeIn(500)
end)


----MENU CLINICA DI VALENTINE----

Citizen.CreateThread(function() 

    while true do 
        Wait(0)
        local pos = GetEntityCoords(PlayerPedId())
        local distance = GetDistanceBetweenCoords(pos.x,pos.y,pos.z,-291.2,816.3,119.4,true)
        local distance2 = GetDistanceBetweenCoords(pos.x,pos.y,pos.z, 2728.96, -1229.21, 50.37,true)
        local StrawBerry = GetDistanceBetweenCoords(pos.x,pos.y,pos.z, -1807.58, -431.39, 158.83,true)
        local BlackWater = GetDistanceBetweenCoords(pos.x,pos.y,pos.z, -788.56, -1306.92, 31.32,true)
        local Armadillo = GetDistanceBetweenCoords(pos.x,pos.y,pos.z, -3693.06, -2749.13, -31.38,true)
        if distance < 1.0 then 
            local msg = "Pressione [G] para comprar seringas"
            local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", msg, Citizen.ResultAsLong())
        
            Citizen.InvokeNative(0xFA233F8FE190514C, str)
            Citizen.InvokeNative(0xE9990552DEC71600)

            if IsControlJustReleased(0, 0x760A9C6F) then 
                TriggerServerEvent('doctor:checkgroup')
            end
        end
        if distance2 < 1.0 then 
            local msg = "Pressione [G] para comprar seringas"
            local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", msg, Citizen.ResultAsLong())
        
            Citizen.InvokeNative(0xFA233F8FE190514C, str)
            Citizen.InvokeNative(0xE9990552DEC71600)

            if IsControlJustReleased(0, 0x760A9C6F) then 
                TriggerServerEvent('doctor:checkgroup')
            end
        end
        if StrawBerry < 1.0 then 
            local msg = "Pressione [G] para comprar seringas"
            local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", msg, Citizen.ResultAsLong())
        
            Citizen.InvokeNative(0xFA233F8FE190514C, str)
            Citizen.InvokeNative(0xE9990552DEC71600)

            if IsControlJustReleased(0, 0x760A9C6F) then 
                TriggerServerEvent('doctor:checkgroup')
            end
        end
        if BlackWater < 1.0 then 
            local msg = "Pressione [G] para comprar seringas"
            local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", msg, Citizen.ResultAsLong())
        
            Citizen.InvokeNative(0xFA233F8FE190514C, str)
            Citizen.InvokeNative(0xE9990552DEC71600)

            if IsControlJustReleased(0, 0x760A9C6F) then 
                TriggerServerEvent('doctor:checkgroup')
            end
        end
        if Armadillo < 1.0 then 
            local msg = "Pressione [G] para comprar seringas"
            local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", msg, Citizen.ResultAsLong())
        
            Citizen.InvokeNative(0xFA233F8FE190514C, str)
            Citizen.InvokeNative(0xE9990552DEC71600)

            if IsControlJustReleased(0, 0x760A9C6F) then 
                TriggerServerEvent('doctor:checkgroup')
            end
        end
    end

end)


---------- Criação de Tonico do Botanico
Citizen.CreateThread(function() 

    while true do 
        Wait(0)
        local pos = GetEntityCoords(PlayerPedId())
        local distance = GetDistanceBetweenCoords(pos.x,pos.y,pos.z,2721.09,-1226.71,50.37,true)
        if distance < 1.0 then 
            local msg = "Pressione [G] para Criar Tonicos"
            local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", msg, Citizen.ResultAsLong())
        
            Citizen.InvokeNative(0xFA233F8FE190514C, str)
            Citizen.InvokeNative(0xE9990552DEC71600)

            if IsControlJustReleased(0, 0x760A9C6F) then 
                TriggerServerEvent('Botanico:checkgroup')
            end
        end
    end

end)

--------------------------------------------------------------------------------------------------
RegisterNetEvent('doctorjob:client:OpenMenu')
AddEventHandler('doctorjob:client:OpenMenu', function()
    showDoctorjob = true
    local Doctorjob = {
        {
            header = "Laboratório Médico",
            txt = "Comprar equipamentos",
            isMenuHeader = true, --título, janela nao clicável
        },
        {
            header = "Comprar seringas",
            txt = "Seringas esterilizadas",
            params = {
                event = "doctor:seringas",
            }
        },
        {
            header = "Fechar",
            params = {
                event = "col-menu:closeMenu",
            }
        },
    }
    exports['col-menu']:openMenu(Doctorjob)
end)

-------- Botanico
RegisterNetEvent('Botanico:client:OpenMenu')
AddEventHandler('Botanico:client:OpenMenu', function()
    showBotanico = true
    local Botanico = {
        {
            header = "Laboratório",
            txt = "Criar Tônicos",
            isMenuHeader = true, --título, janela nao clicável
        },
        {
            header = "Tônico de Vida",
            txt = "Tônico capaz de restaurar a saúde",
            params = {
                isServer = true,
                event = "doctor:tonicovita",
            }
        },
        {
            header = "Tônico de Vida+",
            txt = "Tônico capaz de restaurar a saúde",
            params = {
                isServer = true,
                event = "doctor:tonicovita1",
            }
        },
        {
            header = "Tônico de Energia",
            txt = "Tônico capaz de restaurar energia",
            params = {
                isServer = true,
                event = "doctor:elysirenergia",
            }
        },
        {
            header = "Tônico de Energia+",
            txt = "Tônico capaz de restaurar energia",
            params = {
                isServer = true,
                event = "doctor:elysirenergia1",
            }
        },
        {
            header = "Extrato de Veneno",
            txt = "Retira o veneno de cobras",
            params = {
                isServer = true,
                event = "doctor:estrattoveleno",
            }
        },
        {
            header = "Fechar",
            params = {
                event = "col-menu:closeMenu",
            }
        },
    }
    exports['col-menu']:openMenu(Botanico)
end)

-----------------------
RegisterNetEvent('doctor:seringas')
AddEventHandler('doctor:seringas', function(seringas)
    local siringhe = tonumber(textEntry("Quantas seringas você quer comprar?"))
    TriggerServerEvent('doctor:buysiringhe', siringhe)
end)
------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
	local playerPed = PlayerPedId()
        Citizen.Wait(0)
		
        if whenKeyJustPressed(keys['BACKSPACE']) then
            if weapsmith ~= 0 then
            SetEntityAsMissionEntity(weapsmith)
            DeleteObject(weapsmith)
			ClearPedTasksImmediately(PlayerPedId())
            weapsmith = 0
            end
        end
	end
end)

RegisterNetEvent('progressbar:startMedico')
AddEventHandler('progressbar:startMedico', function()

    local playerPed = PlayerPedId()
    exports['progressBars']:startUI(20000, "Preparando...")
    animazionemedicine()
    Citizen.Wait(20000)
    ClearPedTasksImmediately(PlayerPedId())

end)


function DrawTxt(str, x, y, size, enableShadow, r, g, b, a, centre, font)
    local str = CreateVarString(10, "LITERAL_STRING", str)
    SetTextScale(1, size)
    SetTextColor(math.floor(r), math.floor(g), math.floor(b), math.floor(a))
    SetTextCentre(centre)
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
    SetTextFontForCurrentCommand(font)
    DisplayText(str, x, y)
end

function textEntry(text) 
    AddTextEntry("FMMC_MPM_TYP8", text)
        DisplayOnscreenKeyboard(1, "FMMC_MPM_TYP8", "", "", "", "", "", 30)
                
    while (UpdateOnscreenKeyboard() == 0) do
        DisableAllControlActions(0);
            Citizen.Wait(0);
    end

    if (GetOnscreenKeyboardResult()) then
        return GetOnscreenKeyboardResult()
    end
end

function animazionemedicine()
    
    RequestAnimDict("amb_work@world_human_mortar_pestle@female_b@wip_base")

    while not HasAnimDictLoaded("amb_work@world_human_mortar_pestle@female_b@wip_base") do
        Citizen.Wait(1)
		RequestAnimDict("amb_work@world_human_mortar_pestle@female_b@wip_base")
    end
	
    TaskPlayAnim(PlayerPedId(), "amb_work@world_human_mortar_pestle@female_b@wip_base", "wip_base", 1.0, 8.0, -1, 1, 0, false, 0, false, 0, false)
    
    Wait(20000)
	
	ClearPedTasks(PlayerPedId())
end

canHeal = false


local blips = {
    { name = 'Clinica', sprite = -1739686743, x = 1369.4, y = -1310.3, z = 77.9 },
    { name = 'Clinica', sprite = -1739686743, x = -289.5, y =807.9, z = 119.6 },
    { name = 'Clinica', sprite = -1739686743, x = -786.617, y = -1306.23, z = 31.318 },
    { name = 'Clinica', sprite = -1739686743, x = 2731.89, y = -1231.67, z = 50.37 },
    { name = 'Clinica', sprite = -1739686743, x = -1803.54, y = -430.78, z = 158.83 }, --- St
    { name = 'Clinica', sprite = -1739686743, x = -3667.64, y = -2600.50, z = -13.76 }, --- Armadillo
    { name = 'Tenda da vida', sprite = 1109348405, x = 441.8, y = 2221.3, z = 247.6 }, -- Indios
    { name = 'Tenda da vida', sprite = 1109348405, x = -2676.42, y = -1479.06, z = 147.21 }, -- indios BW
}
local curar = {
    { x = 1369.4, y = -1310.3, z = 77.9 },
    { x = -289.5, y =807.9, z = 119.6 },
    { x = -786.617, y = -1306.23, z = 31.318 },
    { x = 2731.89, y = -1231.67, z = 50.37 },
    { x = -1803.54, y = -430.78, z = 158.83 }, --- St
    { x = -3689.21, y = -2748.92, z = -31.39 }, -- Armadillo
    { x = 442.13, y = 2221.35, z = 247.56}, -- indios
    { x = -2676.42, y = -1479.06, z = 147.21}, -- indiosBW
}

function DrawTxt(str, x, y, w, h, col1, col2, col3, a, center)
	local str = CreateVarString(10, "LITERAL_STRING", str)
	SetTextScale(w, h)
	SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
	SetTextCentre(center)
	SetTextDropshadow(1, 0, 0, 0, 255)
	Citizen.InvokeNative(0xADA9255D, 1)
	DisplayText(str, x, y)
end

Citizen.CreateThread(function()
    for _, info in pairs(blips) do
        local blip = N_0x554d9d53f696d002(1664425300, info.x, info.y, info.z)
        SetBlipSprite(blip, info.sprite, 1)
        SetBlipScale(blip, 0.2)
        Citizen.InvokeNative(0x9CB1A1623062F402, blip, info.name)
    end  
end)

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(500)
        for _, info in pairs(curar) do 
            local playerPos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.0, 0.0)
            local dist = GetDistanceBetweenCoords(playerPos, info.x, info.y, info.z, true)
            while dist < 1 do
                Citizen.Wait(0)
                local health = GetEntityHealth(PlayerPedId())
                playerPos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.0, 0.0)
                dist = GetDistanceBetweenCoords(playerPos, info.x, info.y, info.z, true)
                DrawTxt("Pressione E para se curar ou pressione G para reanimar seu parceiro.", 0.5, 0.9, 0.5, 0.5, 255, 255, 255, 255, true)

                if IsControlJustReleased(0, 0xCEFD9220) then
                    if health <= 100 then
                        TriggerServerEvent("clinics:pay")
                    else
                        TriggerEvent("vorp:NotifyLeft", "Atenção", "Você não pode se curar agora!", "generic_textures", "tick", 3000, "COLOR_WHITE")
                    end
                elseif IsControlJustReleased(0, 0x760A9C6F) then
                    if not IsPedDeadOrDying(PlayerPedId()) then
                        local closestPlayer, closestDistance = GetClosestPlayer()
                        if closestPlayer ~= -1 and closestDistance < 3 and IsPedDeadOrDying(GetPlayerPed(closestPlayer), true) then
                            TriggerServerEvent("clinics:pay:revive", GetPlayerServerId(closestPlayer))
                        else
                            TriggerEvent("vorp:NotifyLeft", "Atenção", "Sem companheiros para reanimar!","generic_textures", "tick", 3000, "COLOR_WHITE")
                        end
                    else
                        TriggerEvent("vorp:NotifyLeft", "Atenção", "Você não pode reviver!", "generic_textures", "tick", 3000, "COLOR_WHITE")
                    end
                end
            end
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

RegisterNetEvent("clinics:heal")
AddEventHandler("clinics:heal", function()
    Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 0, 300)
    TriggerEvent("vorp:NotifyLeft", "Atenção", "Recebeu tratamento médico!", "generic_textures", "tick", 3000, "COLOR_WHITE")
    canHeal = false
    TriggerEvent("clinics:wait")
end)


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