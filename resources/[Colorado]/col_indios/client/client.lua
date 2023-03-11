local keys = { ['G'] = 0x760A9C6F, ['S'] = 0xD27782E3, ['W'] = 0x8FD015D8, ['H'] = 0x24978A28, ['G'] = 0x5415BE48, ["ENTER"] = 0xC7B5340A, ['E'] = 0xDFF812F9,["BACKSPACE"] = 0x156F7119 }
local playerjob
local playerrank
local prompts = GetRandomIntInRange(0, 0xffffff)

RegisterNetEvent("indios:findjob")
AddEventHandler("indios:findjob", function(job,rank)
	playerjob = job
	playerrank = rank
end)
--menu
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
        local coords = GetEntityCoords(PlayerPedId())
        if (Vdist(coords.x, coords.y, coords.z, 466.4426, 2245.793, 248.28) < 1.0) then  --YOUR CHORDS FOR MENU HERE
        local label  = CreateVarString(10, 'LITERAL_STRING', "Criar")
        PromptSetActiveGroupThisFrame(prompts, label)
            if Citizen.InvokeNative(0xC92AC953F0A982AE,openmenu) then
                if IsControlJustReleased(0, 0xC7B5340A) then -- ENTER
                    TriggerServerEvent('indios:getjob')
                    if jobcheck(Config.job, playerjob) and tonumber(playerrank) >= Config.jobrankcraft then
                        TriggerEvent("indios:client:OpenMenu")
                    else
                        TriggerEvent("RedM:Notify",'notify', 'Você não tem permissão!')
                    end
                end
            end
        end
        if (Vdist(coords.x, coords.y, coords.z, -2690.11, -1497.07, 151.02) < 1.0) then  --YOUR CHORDS FOR MENU HERE
        local label  = CreateVarString(10, 'LITERAL_STRING', "Criar")
        PromptSetActiveGroupThisFrame(prompts, label)
            if Citizen.InvokeNative(0xC92AC953F0A982AE,openmenu) then
                if IsControlJustReleased(0, 0xC7B5340A) then -- ENTER
                    TriggerServerEvent('indios:getjob')
                    if jobcheck(Config.job, playerjob) and tonumber(playerrank) >= Config.jobrankcraft then
                        TriggerEvent("indios:client:OpenMenu")
                    else
                        TriggerEvent("RedM:Notify",'notify', 'Você não tem permissão!')
                    end
                end
            end
        end
        if (Vdist(coords.x, coords.y, coords.z, -2717.79, -2367.53, 46.05) < 1.0) then  --YOUR CHORDS FOR MENU HERE
            local label  = CreateVarString(10, 'LITERAL_STRING', "Criar")
            PromptSetActiveGroupThisFrame(prompts, label)
                if Citizen.InvokeNative(0xC92AC953F0A982AE,openmenu) then
                    if IsControlJustReleased(0, 0xC7B5340A) then -- ENTER
                        TriggerServerEvent('indios:getjob')
                        if jobcheck(Config.job, playerjob) and tonumber(playerrank) >= Config.jobrankcraft then
                            TriggerEvent("indios:client:OpenMenu")
                        else
                            TriggerEvent("RedM:Notify",'notify', 'Você não tem permissão!')
                        end
                    end
                end
            end
    end
end)
Citizen.CreateThread(function()
    Citizen.Wait(5000)
    local str = "Tonicos"
	openmenu = PromptRegisterBegin()
	PromptSetControlAction(openmenu, Config.keys["ENTER"])
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

function jobcheck(table, element)
	for k, v in pairs(table) do
        if v == element then
        	return true
		end
    end
return false
end

RegisterNetEvent('indios:client:OpenMenu')
AddEventHandler('indios:client:OpenMenu', function()
    showBruxas = true
    local Bruxas = {
        {
            header = "Tonicos",
            txt = "",
            isMenuHeader = true, --título, janela nao clicável
        },
		{
            header = "Tonico de Caça",
            txt = "Tonico para rastrear presas",
            params = {
                isServer = true,
                event = "wc_tonico_aug",
            }
        },
		{
            header = "Fechar",
            params = {
                event = "col-menu:closeMenu",
            }
        },
    }
    exports['col-menu']:openMenu(Bruxas)
end)

RegisterNetEvent('indiani:checkgroupcl')
AddEventHandler('indiani:checkgroupcl', function() 
    TriggerEvent("indiani:open")
end)


Citizen.CreateThread(function()
	local sexe =  IsPedMale(PlayerPedId())
    local checkbox2 = false
    WarMenu.CreateMenu('menu', "Indios")
    WarMenu.SetSubTitle('menu', 'Criação')
	
    WarMenu.CreateSubMenu('hgmake', 'menu', 'Tônico')
    
    WarMenu.SetMenuY('menu', 0.2)


    while true do

        local ped = GetPlayerPed()
        local coords = GetEntityCoords(PlayerPedId())
		local sexe =  IsPedMale(PlayerPedId())
		
        if WarMenu.IsMenuOpened('menu') then

           WarMenu.Display()

            if WarMenu.MenuButton('Tônico', 'hgmake') then
                end

            elseif WarMenu.IsMenuOpened('hgmake') then

                if WarMenu.Button('Extrato da terra') then
		
		        TriggerServerEvent("wc_tonico_aug")

                end
            WarMenu.Display()
			
        end
		
	
        Citizen.Wait(0)
    end
end)

--RegisterCommand("opentestmenu", function(source, args, rawCommand) -- slash COMMAND
AddEventHandler('indiani:open', function()
    local _source = source
    if weapsmith ~= 0 then
        SetEntityAsMissionEntity(weapsmith)
        DeleteObject(weapsmith)
        weapsmith = 0
    end
        local playerPed = PlayerPedId()
        Citizen.Wait(0)
        ClearPedTasksImmediately(PlayerPedId())
        
        WarMenu.OpenMenu('menu')
        TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_HAMMER_TABLE'), -1, true, false, false, false)
    
        local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
        --local prop = CreateObject(GetHashKey("p_cs_note01x"), x, y, z, true, false, true)
        SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
        PlaceObjectOnGroundProperly(prop)
        weapsmith = prop
    
    --end, false)
end)

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

RegisterNetEvent('progressbar:startIndiani')
AddEventHandler('progressbar:startIndiani', function()

    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, GetHashKey('PROP_CAMP_SEAT_CHAIR_CRAFT_POISON_KNIVES'), 27000, true, false, false, false)
    exports['progressBars']:startUI(27000, "Preparando...")
    Citizen.Wait(27000)
    ClearPedTasksImmediately(PlayerPedId())

end)


function whenKeyJustPressed(key)
    if Citizen.InvokeNative(0x580417101DDB492F, 0, key) then
        return true
    else
        return false
    end
end

RegisterNetEvent("wc_craftitem:prompt")
AddEventHandler("wc_craftitem:prompt", function(msg)
    SetTextScale(0.5, 0.5)
    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", msg, Citizen.ResultAsLong())
    Citizen.InvokeNative(0xFA233F8FE190514C, str)
    Citizen.InvokeNative(0xE9990552DEC71600)
end)


function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str, Citizen.ResultAsLong())
   SetTextScale(w, h)
   SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
   SetTextCentre(centre)
   if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
   Citizen.InvokeNative(0xADA9255D, 10);
   DisplayText(str, x, y)
end

function PerformRequest(hash)
    RequestModel(hash, 0)
    local bacon = 1
    while not Citizen.InvokeNative(0x1283B8B89DD5D1B6, hash) do
        Citizen.InvokeNative(0xFA28FE3A6246FC30, hash, 0)
        bacon = bacon + 1
        Citizen.Wait(0)
        if bacon >= 100 then break end
    end
end

function SetMonModel(name)
	local model = GetHashKey(name)
	local player = PlayerId()
	
	if not IsModelValid(model) then return end
	PerformRequest(model)
	
	if HasModelLoaded(model) then
		Citizen.InvokeNative(0xED40380076A31506, player, model, false)
		Citizen.InvokeNative(0x283978A15512B2FE, PlayerPedId(), true)
		SetModelAsNoLongerNeeded(model)
	end
end

RegisterCommand('lobo1', function (source, args, rawCommand)
    TriggerServerEvent('indios:getjob')
    if jobcheck(Config.job, playerjob) and tonumber(playerrank) >= Config.transformacao then
        local ped = PlayerPedId()
        TaskStartScenarioInPlace(ped, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 5000, true, false, false, false)
        exports['progressBars']:startUI(5000, "Aguarde...") Wait(5000)
        ClearPedTasksImmediately(ped)
        Citizen.InvokeNative(0xD3A7B003ED343FD9 , PlayerPedId(),  0x1FC12C9C, true, true, true)
        SetMonModel("MP_A_C_Wolf_01")
    else
        TriggerEvent("RedM:Notify",'notify', 'Você não tem permissão!')
    end
end)

RegisterCommand('coruja', function (source, args, rawCommand)
    TriggerServerEvent('indios:getjob')
    if jobcheck(Config.job, playerjob) and tonumber(playerrank) >= Config.transformacao then
        local ped = PlayerPedId()
        TaskStartScenarioInPlace(ped, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 5000, true, false, false, false)
        exports['progressBars']:startUI(5000, "Aguarde...") Wait(5000)
        ClearPedTasksImmediately(ped)
        Citizen.InvokeNative(0xD3A7B003ED343FD9 , PlayerPedId(),  0x1FC12C9C, true, true, true)
        SetMonModel("A_C_Owl_01")
    else
        TriggerEvent("RedM:Notify",'notify', 'Você não tem permissão!')
    end
end)