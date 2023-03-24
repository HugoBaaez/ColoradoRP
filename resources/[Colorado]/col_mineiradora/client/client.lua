local mining = false
------ BLIP IN MAPPA ------

local blips = {
    { name = 'Mina', sprite = 1220803671, x = 2786.2, y = 1339.1, z = 71.4 },
    { name = 'Mina', sprite = 1220803671, x = -5965.43, y = -3172.62, z = -20.9},
    { name = 'Processo de Minérios', sprite = 2107754879, x = -6045.61, y = -3258.47, z = -18.84 },
    { name = 'Processo de Minérios', sprite = 2107754879, x = 2950.5, y = 1378.9, z = 56.3 },
}
Citizen.CreateThread(function()
    for _, info in pairs(blips) do
        local blip = N_0x554d9d53f696d002(1664425300, info.x, info.y, info.z)
        SetBlipSprite(blip, info.sprite, 1)
        SetBlipScale(blip, 0.2)
        Citizen.InvokeNative(0x9CB1A1623062F402, blip, info.name)
    end  
end)
----- LAVORO ---------
----- BLIP 1 ---------
RegisterNetEvent("minatore:updatejob")
AddEventHandler("minatore:updatejob", function()
    mining = true 
    animazione()
    TriggerServerEvent("vorp:itemreward")
    TriggerEvent('stress:modify', 0.5)
    mining = false
end)
Citizen.CreateThread(function()
    while true do
        Wait(0)
        local pos = GetEntityCoords(PlayerPedId())
        Citizen.InvokeNative(0x2A32FAA57B937173, 0x6903B113, Config.Zonas['Miniera1'].x, Config.Zonas['Miniera1'].y, Config.Zonas['Miniera1'].z - 1.0, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
        if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Miniera1'].x, Config.Zonas['Miniera1'].y, Config.Zonas['Miniera1'].z) < 2.0) and not mining then
            DrawText3D(Config.Zonas['Miniera1'].x, Config.Zonas['Miniera1'].y, Config.Zonas['Miniera1'].z, Language.translate[Config.lang]['premi'])
            -- DrawTxt(Language.translate[Config.lang]['premi'], 0.4, 0.90, 0.7, 0.7, true, 255, 255, 255, 255, false)
            if IsControlJustPressed(0, 0xC7B5340A) then
                TriggerServerEvent("minatore:checkjob")
            end
        end
       
    end
end)
--- BLIP 2 ----------
Citizen.CreateThread(function()
    while true do
        Wait(0)
        local pos = GetEntityCoords(PlayerPedId())
            Citizen.InvokeNative(0x2A32FAA57B937173, 0x6903B113, Config.Zonas['Miniera2'].x, Config.Zonas['Miniera2'].y, Config.Zonas['Miniera2'].z - 1.0, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Miniera2'].x, Config.Zonas['Miniera2'].y, Config.Zonas['Miniera2'].z) < 2.0) and not mining then
                --DrawTxt(Language.translate[Config.lang]['premi'], 0.3, 0.95, 0.4, 0.4, true, 255, 255, 255, 150, false)
                DrawText3D(Config.Zonas['Miniera2'].x, Config.Zonas['Miniera2'].y, Config.Zonas['Miniera2'].z, Language.translate[Config.lang]['premi'])
               -- DrawTxt(Language.translate[Config.lang]['premi'], 0.5, 0.95, 0.7, 0.7, true, 255, 255, 255, 255, false)
                if IsControlJustPressed(0, 0xC7B5340A) then
                    TriggerServerEvent("minatore:checkjob")
                end
            end
       
            end
end)
--- BLIP 3 ----------
Citizen.CreateThread(function()
    while true do
        Wait(0)
        local pos = GetEntityCoords(PlayerPedId())
        Citizen.InvokeNative(0x2A32FAA57B937173, 0x6903B113, Config.Zonas['Miniera3'].x, Config.Zonas['Miniera3'].y, Config.Zonas['Miniera3'].z - 1.0, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
        if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Miniera3'].x, Config.Zonas['Miniera3'].y, Config.Zonas['Miniera3'].z) < 2.0) and not mining then
            -- DrawTxt(Language.translate[Config.lang]['premi'], 0.3, 0.95, 0.4, 0.4, true, 255, 255, 255, 150, false)
            DrawText3D(Config.Zonas['Miniera3'].x, Config.Zonas['Miniera3'].y, Config.Zonas['Miniera3'].z, Language.translate[Config.lang]['premi'])
            -- DrawTxt(Language.translate[Config.lang]['premi'], 0.5, 0.95, 0.7, 0.7, true, 255, 255, 255, 255, false)
            if IsControlJustPressed(0, 0xC7B5340A) then
                TriggerServerEvent("minatore:checkjob")
            end
        end
       
    end
end)
--- BLIP 4 ----------
Citizen.CreateThread(function()
    while true do
        Wait(0)
        local pos = GetEntityCoords(PlayerPedId())
        Citizen.InvokeNative(0x2A32FAA57B937173, 0x6903B113, Config.Zonas['Miniera4'].x, Config.Zonas['Miniera4'].y, Config.Zonas['Miniera4'].z - 1.0, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
        if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Miniera4'].x, Config.Zonas['Miniera4'].y, Config.Zonas['Miniera4'].z) < 2.0) and not mining then
            -- DrawTxt(Language.translate[Config.lang]['premi'], 0.3, 0.95, 0.4, 0.4, true, 255, 255, 255, 150, false)
            DrawText3D(Config.Zonas['Miniera4'].x, Config.Zonas['Miniera4'].y, Config.Zonas['Miniera4'].z, Language.translate[Config.lang]['premi'])
            -- DrawTxt(Language.translate[Config.lang]['premi'], 0.5, 0.95, 0.7, 0.7, true, 255, 255, 255, 255, false)
            if IsControlJustPressed(0, 0xC7B5340A) then
                TriggerServerEvent("minatore:checkjob")
            end
        end
       
    end
end)
--- BLIP 5 ----------
Citizen.CreateThread(function()
    while true do
        Wait(0)
        local pos = GetEntityCoords(PlayerPedId())
        Citizen.InvokeNative(0x2A32FAA57B937173, 0x6903B113, Config.Zonas['Miniera5'].x, Config.Zonas['Miniera5'].y, Config.Zonas['Miniera5'].z - 1.0, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
        if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Miniera5'].x, Config.Zonas['Miniera5'].y, Config.Zonas['Miniera5'].z) < 2.0) and not mining then
            -- DrawTxt(Language.translate[Config.lang]['premi'], 0.3, 0.95, 0.4, 0.4, true, 255, 255, 255, 150, false)
            DrawText3D(Config.Zonas['Miniera5'].x, Config.Zonas['Miniera5'].y, Config.Zonas['Miniera5'].z, Language.translate[Config.lang]['premi'])
            -- DrawTxt(Language.translate[Config.lang]['premi'], 0.5, 0.95, 0.7, 0.7, true, 255, 255, 255, 255, false)
            if IsControlJustPressed(0, 0xC7B5340A) then
                TriggerServerEvent("minatore:checkjob")
            end
        end
       
    end
end)
--- BLIP 6 ----------
Citizen.CreateThread(function()
    while true do
        Wait(0)
        local pos = GetEntityCoords(PlayerPedId())
        Citizen.InvokeNative(0x2A32FAA57B937173, 0x6903B113, Config.Zonas['Miniera6'].x, Config.Zonas['Miniera6'].y, Config.Zonas['Miniera6'].z - 1.0, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
        if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Miniera6'].x, Config.Zonas['Miniera3'].y, Config.Zonas['Miniera6'].z) < 2.0) and not mining then
            -- DrawTxt(Language.translate[Config.lang]['premi'], 0.3, 0.95, 0.4, 0.4, true, 255, 255, 255, 150, false)
            DrawText3D(Config.Zonas['Miniera6'].x, Config.Zonas['Miniera6'].y, Config.Zonas['Miniera6'].z, Language.translate[Config.lang]['premi'])
            -- DrawTxt(Language.translate[Config.lang]['premi'], 0.5, 0.95, 0.7, 0.7, true, 255, 255, 255, 255, false)
            if IsControlJustPressed(0, 0xC7B5340A) then
                TriggerServerEvent("minatore:checkjob")
            end
        end
       
    end
end)
--- BLIP 7 ----------
Citizen.CreateThread(function()
    while true do
        Wait(0)
        local pos = GetEntityCoords(PlayerPedId())
        Citizen.InvokeNative(0x2A32FAA57B937173, 0x6903B113, Config.Zonas['Miniera7'].x, Config.Zonas['Miniera7'].y, Config.Zonas['Miniera7'].z - 1.0, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
        if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Miniera7'].x, Config.Zonas['Miniera7'].y, Config.Zonas['Miniera7'].z) < 2.0) and not mining then
            -- DrawTxt(Language.translate[Config.lang]['premi'], 0.3, 0.95, 0.4, 0.4, true, 255, 255, 255, 150, false)
            DrawText3D(Config.Zonas['Miniera7'].x, Config.Zonas['Miniera7'].y, Config.Zonas['Miniera7'].z, Language.translate[Config.lang]['premi'])
            -- DrawTxt(Language.translate[Config.lang]['premi'], 0.5, 0.95, 0.7, 0.7, true, 255, 255, 255, 255, false)
            if IsControlJustPressed(0, 0xC7B5340A) then
                TriggerServerEvent("minatore:checkjob")
            end
        end
       
    end
end)
--- BLIP 8 ----------
Citizen.CreateThread(function()
    while true do
        Wait(0)
        local pos = GetEntityCoords(PlayerPedId())
        Citizen.InvokeNative(0x2A32FAA57B937173, 0x6903B113, Config.Zonas['Miniera8'].x, Config.Zonas['Miniera8'].y, Config.Zonas['Miniera8'].z - 1.0, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
        if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Miniera8'].x, Config.Zonas['Miniera3'].y, Config.Zonas['Miniera8'].z) < 2.0) and not mining then
            -- DrawTxt(Language.translate[Config.lang]['premi'], 0.3, 0.95, 0.4, 0.4, true, 255, 255, 255, 150, false)
            DrawText3D(Config.Zonas['Miniera8'].x, Config.Zonas['Miniera8'].y, Config.Zonas['Miniera8'].z, Language.translate[Config.lang]['premi'])
            -- DrawTxt(Language.translate[Config.lang]['premi'], 0.5, 0.95, 0.7, 0.7, true, 255, 255, 255, 255, false)
            if IsControlJustPressed(0, 0xC7B5340A) then
                TriggerServerEvent("minatore:checkjob")
            end
        end
       
    end
end)

---- FUNZIONI ----
function animazione()
    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_PICKAXE_WALL'), 20000, true, false, false, false)
    exports['progressBars']:startUI(20000, Language.translate[Config.lang]['mining'])
    Wait(20000)
    ClearPedTasks(PlayerPedId())
end

function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str)


    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
	SetTextCentre(centre)
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
	Citizen.InvokeNative(0xADA9255D, 1);
    DisplayText(str, x, y)
end

function CreateVarString(p0, p1, variadic)
    return Citizen.InvokeNative(0xFA925AC00EB830B9, p0, p1, variadic, Citizen.ResultAsLong())
end
----------------------------------- PROCESSO ----------------------------------------------
Citizen.CreateThread(function()
    WarMenu.CreateMenu('perso', 'Minérios')
    WarMenu.CreateSubMenu('perso', 'Minérios')
	WarMenu.CreateSubMenu('pp', 'perso', 'Processo de pedra')
	WarMenu.CreateSubMenu('pf', 'perso', 'Processo de Ferro')
    WarMenu.CreateSubMenu('pf2', 'perso', 'Processo de Aço')
	 while true do

        local ped = GetPlayerPed()
        local coords = GetEntityCoords(PlayerPedId())
-- Open
    if WarMenu.IsMenuOpened('perso') then
--	1 layer
		if WarMenu.MenuButton('Processe a Pedra Sedimentar', 'pp') then
		end
		if WarMenu.MenuButton('Processar Magnetita', 'pf') then
		end
        if WarMenu.MenuButton('Processar Grafite', 'pf2') then
		end
		if WarMenu.Button('Fechar') then
			Citizen.InvokeNative(0x7D9EFB7AD6B19754, ped, false)
			WarMenu.CloseMenu()
            FreezeEntityPosition(PlayerPedId(),false)
		end	
--	1.1 layer	
		WarMenu.Display()
	elseif WarMenu.IsMenuOpened('pp') then
			if WarMenu.Button('Processar') then
				TriggerServerEvent('vane_processa:pietra')
				FreezeEntityPosition(PlayerPedId(),true)
			end
			if WarMenu.Button('Fechar') then
				Citizen.InvokeNative(0x7D9EFB7AD6B19754, ped, false)
				WarMenu.CloseMenu()
                FreezeEntityPosition(PlayerPedId(),false)
			end	
--- 1.2 layer			
				WarMenu.Display()
	elseif WarMenu.IsMenuOpened('pf') then
			if WarMenu.Button('Processar') then
				TriggerServerEvent('vane_processa:ferro')
				FreezeEntityPosition(PlayerPedId(),true)
			end
			if WarMenu.Button('Fechar') then
				Citizen.InvokeNative(0x7D9EFB7AD6B19754, ped, false)
				WarMenu.CloseMenu()
                FreezeEntityPosition(PlayerPedId(),false)
			end	
-- 1.3 layer		
            WarMenu.Display()
    elseif WarMenu.IsMenuOpened('pf2') then
            if WarMenu.Button('Processar') then
            TriggerServerEvent('vane_processa:barraaco')
            FreezeEntityPosition(PlayerPedId(),true)
            end
            if WarMenu.Button('Fechar') then
                Citizen.InvokeNative(0x7D9EFB7AD6B19754, ped, false)
                WarMenu.CloseMenu()
                FreezeEntityPosition(PlayerPedId(),false)
            end
-- blip		
			WarMenu.Display()
    elseif (Vdist(coords.x, coords.y, coords.z, 2950.5, 1378.9, 56.3) < 1.0) then 
            TriggerEvent("enter:processominerali")
            if whenKeyJustPressed(key) and not WarMenu.IsMenuOpened('perso') then
                TriggerEvent('vane_miniera:open')
            end 
    elseif (Vdist(coords.x, coords.y, coords.z, -6043.92, -3260.38, -17.98) < 1.0) then
            TriggerEvent("enter:processominerali")
            if whenKeyJustPressed(key) and not WarMenu.IsMenuOpened('perso') then
                TriggerEvent('vane_miniera:open')
            end		
	end
	Citizen.Wait(0)
		
	end	
end)

RegisterNetEvent("enter:processominerali")
  AddEventHandler("enter:processominerali", function()
    SetTextScale(0.5, 0.5)
    --SetTextFontForCurrentCommand(1)
    local msg = 'Pressione [G] para trabalhar'
    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", msg, Citizen.ResultAsLong())

    Citizen.InvokeNative(0xFA233F8FE190514C, str)
    Citizen.InvokeNative(0xE9990552DEC71600)
end)

RegisterNetEvent('vane_miniera:open')
AddEventHandler('vane_miniera:open', function(cb)

	WarMenu.OpenMenu('perso')
    FreezeEntityPosition(PlayerPedId(),true)
end)
	
function whenKeyJustPressed(key)
    if Citizen.InvokeNative(0x580417101DDB492F, 0, 0x760A9C6F) then
        return true
    else
        return false
    end
end
---- FUNZIONI ----
RegisterNetEvent('progressbar:processo')
AddEventHandler('progressbar:processo', function()

    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('PROP_HUMAN_SACK_STORAGE_IN'), 7000, true, false, false, false) 
    exports['progressBars']:startUI(7000, "Processando...")
    Wait(7000)
    ClearPedTasksImmediately(PlayerPedId())
end)

---Processo mineral de armeiro---

Citizen.CreateThread(function()
    while true do
        Wait(0)
        Citizen.InvokeNative(0x2A32FAA57B937173, 0x07DCE236, 2951.1, 1316.2, 44.8 - 1.0, 0, 0, 0, 0, 0, 0, 4.0, 4.0, 1.5, 255, 23, 23, 155, 0, 0, 2, 0, 0, 0, 0)
        local pos = GetEntityCoords(PlayerPedId())
        if (Vdist(pos.x, pos.y, pos.z, 2951.1, 1316.2, 44.8) < 1.0) then
            DrawTxt("Pressione [ENTER] para abrir o processo de armeiro", 0.3, 0.95, 0.4, 0.4, true, 255, 255, 255, 150, false)
            if IsControlJustReleased(0, 0xC7B5340A) then
                Wait(50)
                TriggerServerEvent('weaponsmith:checkp2')
                
            end
        end
    end
end)


RegisterNetEvent('weaponsmith:openp2')
AddEventHandler('weaponsmith:openp2', function() 
    WarMenu.OpenMenu('processom')
end)

Citizen.CreateThread(function() 

    WarMenu.CreateMenu("processom", "Processo de mina")
    
    while true do
        Wait(0)
        if WarMenu.IsMenuOpened('processom') then

            if WarMenu.Button("Criar corpo de Rifle") then

                TriggerServerEvent('miniera:processoarmeiro', 8, 15, "corporifle")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Criar corpo de pistola") then

                TriggerServerEvent('miniera:processoarmeiro', 5, 10, "corpopistola")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Criar cano de Rifle") then

                TriggerServerEvent('miniera:processoarmeiro', 15, 5, "canorifle")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Criar cano de pistola") then 

                TriggerServerEvent('miniera:processoarmeiro', 10, 5, "canopistola")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Fechar") then
                WarMenu.CloseMenu()
            end
            WarMenu.Display()
        end
    end

end)

RegisterNetEvent('miniera:animazionep')
AddEventHandler('miniera:animazionep', function() 
    animacion3()
end)
RegisterNetEvent('miniera:animazionep2')
AddEventHandler('miniera:animazionep2', function() 
    animacion2()
end)

function animacion3()
    RequestAnimDict("amb_work@world_human_wood_plane@working@male_a@base")
    while not HasAnimDictLoaded("amb_work@world_human_wood_plane@working@male_a@base") do
        Citizen.Wait(1)
		RequestAnimDict("amb_work@world_human_wood_plane@working@male_a@base")
    end
	while not HasModelLoaded("p_woodplane01x") do
	   RequestModel("p_woodplane01x")
	   Citizen.Wait(1)
	end
    TaskPlayAnim(PlayerPedId(), "amb_work@world_human_wood_plane@working@male_a@base", "base", 1.0, 8.0, -1, 1, 0, false, 0, false, 0, false)
	local object = CreateObject("p_woodplane01x", x, y, z, true, true, true)
	AttachEntityToEntity(object, PlayerPedId(), GetEntityBoneIndexByName(PlayerPedId(), "PH_R_Hand"), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 1, 0, 0, 1)
	--TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('PROP_HUMAN_SACK_STORAGE_IN'), 7000, true, false, false, false)
    exports['progressBars']:startUI(15000, 'Processando...')
    Wait(15000)
	DeleteObject(object)
	ClearPedTasks(PlayerPedId())
end
function animacion2()
    RequestAnimDict("amb_work@world_human_wood_plane@working@male_a@base")
    while not HasAnimDictLoaded("amb_work@world_human_wood_plane@working@male_a@base") do
        Citizen.Wait(1)
		RequestAnimDict("amb_work@world_human_wood_plane@working@male_a@base")
    end
	while not HasModelLoaded("p_woodplane01x") do
	   RequestModel("p_woodplane01x")
	   Citizen.Wait(1)
	end
    TaskPlayAnim(PlayerPedId(), "amb_work@world_human_wood_plane@working@male_a@base", "base", 1.0, 8.0, -1, 1, 0, false, 0, false, 0, false)
	local object = CreateObject("p_woodplane01x", x, y, z, true, true, true)
	AttachEntityToEntity(object, PlayerPedId(), GetEntityBoneIndexByName(PlayerPedId(), "PH_R_Hand"), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 1, 0, 0, 1)
	--TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('PROP_HUMAN_SACK_STORAGE_IN'), 7000, true, false, false, false)
    exports['progressBars']:startUI(100000, 'Processando...')
    Wait(100000)
	DeleteObject(object)
	ClearPedTasks(PlayerPedId())
end

function DrawText3D(x, y, z, text)
    local onScreen,_x,_y=GetScreenCoordFromWorldCoord(x, y, z)
    local px,py,pz=table.unpack(GetGameplayCamCoord())
    
    SetTextScale(0.35, 0.35)
    SetTextFontForCurrentCommand(1)
    SetTextColor(255, 255, 255, 215)
    local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
    SetTextCentre(1)
    DisplayText(str,_x,_y)
    local factor = (string.len(text)) / 150
    --DrawSprite("generic_textures", "hud_menu_4a", _x, _y+0.0125,0.015+ factor, 0.03, 0.1, 100, 1, 1, 190, 0)
end

---------------------------------------------------------------------------------------------------------   EMPREGO NOVO
---Processo mineral de armeiro---

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local pos = GetEntityCoords(PlayerPedId())
        if (Vdist(pos.x, pos.y, pos.z, -368.603, 796.2593, 116.20) < 1.0) then
            DrawTxt("Pressione [G] para o menu de ferreiro", 0.3, 0.95, 0.4, 0.4, true, 255, 255, 255, 150, false)
            if IsControlJustReleased(0, 0x760A9C6F) then
                Wait(5) 
                TriggerServerEvent('ferreiro:check')                  
            end
        end
        if (Vdist(pos.x, pos.y, pos.z, -1820.19,-567.99, 156.0) < 1.0) then
            DrawTxt("Pressione [G] para o menu de ferreiro", 0.3, 0.95, 0.4, 0.4, true, 255, 255, 255, 150, false)
            if IsControlJustReleased(0, 0x760A9C6F) then
                Wait(5) 
                TriggerServerEvent('ferreiro2:check')                  
            end
        end
        if (Vdist(pos.x, pos.y, pos.z, -5515.19,-3039.38, -2.39) < 1.0) then 
            DrawTxt("Pressione [G] para o menu de ferreiro", 0.3, 0.95, 0.4, 0.4, true, 255, 255, 255, 150, false)
            if IsControlJustReleased(0, 0x760A9C6F) then
                Wait(5) 
                TriggerServerEvent('ferreiro3:check')                  
            end
        end
    end
end)

RegisterNetEvent('ferreiro:openp')
AddEventHandler('ferreiro:openp', function() 
    WarMenu.OpenMenu('ferreiro')
end)

Citizen.CreateThread(function() 

    WarMenu.CreateMenu("ferreiro", "Ferreiro")
    WarMenu.CreateMenu('ferreiro:Metais', 'Metais')
    WarMenu.CreateMenu('ferreiro:Madeiras', 'Madeiras')
    WarMenu.CreateMenu('ferreiro:Martelos', 'Martelo')
    WarMenu.CreateMenu('ferreiro:Cavalos', 'Cavalos')
    WarMenu.CreateMenu('ferreiro:wknife', 'Facas')
    while true do
        Wait(0)
        if WarMenu.IsMenuOpened('ferreiro') then

            if WarMenu.Button("Processo de Metais") then
                WarMenu.OpenMenu('ferreiro:Metais')
            elseif WarMenu.Button("Processo de Madeiras") then
                WarMenu.OpenMenu('ferreiro:Madeiras')
            elseif WarMenu.Button('Criar Martelo') then
                WarMenu.OpenMenu('ferreiro:Martelos')
            elseif WarMenu.Button('Items de Cavalos/Carroças') then
                WarMenu.OpenMenu('ferreiro:Cavalos')
            elseif WarMenu.Button('Criar Facas') then
                WarMenu.OpenMenu('ferreiro:wknife') 
            elseif WarMenu.Button("Fechar") then
                WarMenu.CloseMenu()
            end
            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('ferreiro:Metais') then
            if WarMenu.Button('Criar Pregos') then
                TriggerServerEvent('ferreiro:pregos')
                WarMenu.CloseMenu()
            elseif WarMenu.Button('Criar Lamina Pequena') then
                TriggerServerEvent('ferreiro:laminap')
                WarMenu.CloseMenu()
            elseif WarMenu.Button('Criar Lamina Grande') then
                TriggerServerEvent('ferreiro:laminag')
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Fechar") then
                WarMenu.CloseMenu()
            end
            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('ferreiro:Madeiras') then
            if WarMenu.Button('Criar Tábuas') then
                TriggerServerEvent('ferreiro:tabuas') 
                WarMenu.CloseMenu()
            elseif WarMenu.Button('Criar Barril') then
                    TriggerServerEvent('ferreiro:barril') 
                    WarMenu.CloseMenu()
            elseif WarMenu.Button("Fechar") then
                WarMenu.CloseMenu()
            end 
            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('ferreiro:Martelos') then
            if WarMenu.Button('Criar Martelo') then
                TriggerServerEvent('ferreiro:martelo')
            elseif WarMenu.Button("Fechar") then
                WarMenu.CloseMenu()
            end 
            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('ferreiro:Cavalos') then
            if WarMenu.Button('Comprar Ferraduras $5') then
                TriggerServerEvent('ferreiro:ferradura', 5)
            elseif WarMenu.Button('Comprar Reparo de Carroça $ 5') then
                TriggerServerEvent('ferreiro:carroca', 5)
            elseif WarMenu.Button("Fechar") then
                WarMenu.CloseMenu()
            end 
            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('ferreiro:wknife') then
            if WarMenu.Button('Criar Faca') then
                TriggerServerEvent('ferreiro:faca')
            elseif WarMenu.Button('Criar Facão') then
                TriggerServerEvent('ferreiro:facao')
            elseif WarMenu.Button("Fechar") then
                WarMenu.CloseMenu()
            end 
            WarMenu.Display()
        end
    end

end)

