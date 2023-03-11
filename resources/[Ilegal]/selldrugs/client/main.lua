local keys = {
    -- Letters
    ["A"] = 0x7065027D,
    ["B"] = 0x4CC0E2FE,
    ["C"] = 0x9959A6F0,
    ["D"] = 0xB4E465B4,
    ["E"] = 0xCEFD9220,
    ["F"] = 0xB2F377E8,
    ["G"] = 0x760A9C6F,
    ["H"] = 0x24978A28,
    ["I"] = 0xC1989F95,
    ["J"] = 0xF3830D8E,
    -- Missing K, don't know if anything is actually bound to it
    ["L"] = 0x80F28E95,
    ["M"] = 0xE31C6A41,
    ["N"] = 0x4BC9DABB, -- Push to talk key
    ["O"] = 0xF1301666,
    ["P"] = 0xD82E0BD2,
    ["Q"] = 0xDE794E3E,
    ["R"] = 0xE30CD707,
    ["S"] = 0xD27782E3,
    -- Missing T
    ["U"] = 0xD8F73058,
    ["V"] = 0x7F8D09B8,
    ["W"] = 0x8FD015D8,
    ["X"] = 0x8CC9CD42,
    -- Missing Y
    ["Z"] = 0x26E9DC00,

    -- Symbol Keys
    ["RIGHTBRACKET"] = 0xA5BDCD3C,
    ["LEFTBRACKET"] = 0x430593AA,
    -- Mouse buttons
    ["MOUSE1"] = 0x07CE1E61,
    ["MOUSE2"] = 0xF84FA74F,
    ["MOUSE3"] = 0xCEE12B50,
    ["MWUP"] = 0x3076E97C,
    -- Modifier Keys
    ["CTRL"] = 0xDB096B85,
    ["TAB"] = 0xB238FE0B,
    ["SHIFT"] = 0x8FFC75D6,
    ["SPACEBAR"] = 0xD9D0E1C0,
    ["ENTER"] = 0xC7B5340A,
    ["BACKSPACE"] = 0x156F7119,
    ["LALT"] = 0x8AAA0AD4,
    ["DEL"] = 0x4AF4D473,
    ["PGUP"] = 0x446258B6,
    ["PGDN"] = 0x3C3DD371,
    -- Function Keys
    ["F1"] = 0xA8E3F467,
    ["F4"] = 0x1F6D95E5,
    ["F6"] = 0x3C0A40F2,
    -- Number Keys
    ["1"] = 0xE6F612E4,
    ["2"] = 0x1CE6D9EB,
    ["3"] = 0x4F49CC4C,
    ["4"] = 0x8F9F9E58,
    ["5"] = 0xAB62E997,
    ["6"] = 0xA1FDE2A6,
    ["7"] = 0xB03A913B,
    ["8"] = 0x42385422,
    -- Arrow Keys
    ["DOWN"] = 0x05CA7C52,
    ["UP"] = 0x6319DB71,
    ["LEFT"] = 0xA65EBAB4,
    ["RIGHT"] = 0xDEB34313,
}

local TbacGroup
local OldTbacGroup
local TbacGroupName = 'Venda de mercadorias'
local Wprompt
local IsTargetting
local OldEnt

local key1, key2, key3, key4, key5 = keys['E'], keys['R'], keys['G'], keys['Z'],keys['ENTER']



function whenKeyJustPressed(key)
    if Citizen.InvokeNative(0x580417101DDB492F, 0, key) then;        return true
    else;        return false;    end
end

Citizen.CreateThread(function()
    while true do

        Citizen.Wait(5)
        local ped = PlayerPedId()
        local IsTargetting = Citizen.InvokeNative(0x4605C66E0F935F83,PlayerId())
        if IsTargetting then
            local target, entity  = GetPlayerTargetEntity(PlayerId())
            TbacGroup = Citizen.InvokeNative(0xB796970BD125FCE8,entity) --getgroupid
            local Ped = Ped()
            local Coords = GetEntityCoords(Ped)
            local EntCoords = GetEntityCoords(entity)
            local Dis = GetDistance(Coords,EntCoords )
            local OnFoot = IsPedOnFoot(entity)
            if OnFoot then
                local Combat = IsPedInMeleeCombat(entity)
                local PedType = GetPedType(entity)
                if PedType == 4 or PedType == 5 and not Combat then
                    if Dis <= 2.5 then
                        if not created then
                            Wprompt = SetupPrompt(1, key3, TbacGroup, TbacGroupName)
                            created = true
                        end

                        if PromptHasStandardModeCompleted(Wprompt) then
                            if OldEnt ~= entity then
                                local r = math.random(1,100)
                                PromptDelete(Wprompt)
                                ClearPedTasks(entity)
                                SetBlockingOfNonTemporaryEvents(entity, true)
                                Wait(3000)
                                TurnPedAndAnimateBoth(entity)
                                if r <= 50 then
                                    Wait(7000)
                                    ClearPedTasks(Ped)
                                    ClearPedTasks(entity)
                                    Coords = GetEntityCoords(Ped)
                                    EntCoords = GetEntityCoords(entity)
                                    local D = GetDistance(Coords,EntCoords)
                                    local DeadBruh = IsEntityDead(entity)
                                    local KnockedOut = Citizen.InvokeNative(0x61914209C36EFDDB,entity)
                                    if D <= 2.5 and not DeadBruh or KnockedOut then 
                                        TriggerServerEvent("FrankieSellToNPC:CheckTabAndSellItMyGuy", Coords)
                                    else
                                        TriggerEvent("vorp:TipBottom", 'Você está muito longe!', 6000)    
                                    end
                                    ClearPedTasks(entity)
                                    SetBlockingOfNonTemporaryEvents(entity, false)
                                    TaskWanderStandard(entity, 10.0, 10)
                                    created = false
                                    OldEnt = entity
                                else
                                    SetBlockingOfNonTemporaryEvents(entity, true)
                                    Wait(4000)
                                    ClearPedTasks(Ped)
                                    ClearPedTasks(entity)
                                    SetBlockingOfNonTemporaryEvents(entity, false)
                                    TaskWanderStandard(entity, 10, 10)
                                    created = false
                                    OldEnt = entity
                                end
                            end
                        end
                    else
                        PromptDelete(Wprompt)
                        created = false
                    end
                end
            end
		end   
    end
end)



function SetupPrompt(name, key, group, text)
    if not PromptIsValid(name) then
        name = PromptRegisterBegin()
        PromptSetControlAction(name, key)
        local str = CreateVarString(10, 'LITERAL_STRING', text)
        PromptSetText(name, str)
        PromptSetEnabled(name, 1)
        PromptSetVisible(name, 1)
        Citizen.InvokeNative(0xCC6656799977741B,name, 1) --stand mode
        PromptSetGroup(name, group)
        PromptRegisterEnd(name)
    --    print('Created New Prompt: ' .. text)
    end
    return name
end

function GetPlayers()
    local players = {}

    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, GetPlayerServerId(i))
        end
    end

    return players
end

function TurnPedAndAnimateBoth(E)
local luck = math.random(1,100)
local playerPed = PlayerPedId()
local coords = GetEntityCoords(playerPed)
    TaskTurnPedToFaceEntity(E,PlayerPedId(),-1)
    --Wait(4000)
	if luck <= 45 then
	TriggerServerEvent("RedM:sendalert", "police", "complaint", "Venda de Drogas denunciada!", coords, true)
    --ExecuteCommand('alertpolice')
	end
    ClearPedTasks(E)
    local dict = "script_re@new_love@give_ring"
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
            Citizen.Wait(10)
    end
    TaskPlayAnim(E, dict, "give_ring_player", 1.0, 8.0, -1, 1, 0, false, false, false)

    local dict = "script_re@new_love@give_ring"
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
            Citizen.Wait(10)
    end
    TaskPlayAnim(PlayerPedId(), dict, "give_ring_player", 1.0, 8.0, -1, 1, 0, false, false, false)
end

--------------------------------------------------------------- CRIAR MOONSHINE
--------------------------------------------------------------- CRIAR MOONSHINE
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2)
		local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))		
        if GetDistanceBetweenCoords(x,y,z, -1092.0, 713.76, 81.04,false) < 2.0 then
            DrawText3D(-1092.0, 713.76, 81.04, "Pressione G para fazer moonshine")
            if IsControlJustReleased(0, 0x760A9C6F) and active == false then -- g
                TriggerEvent("moonshiner:client:OpenMenu")
                active = true
            end
        end
	end
end)
active = false
RegisterNetEvent('moonshiner:client:OpenMenu')
AddEventHandler('moonshiner:client:OpenMenu', function()
    showmoonshiner = true
    local moonshiner = {
        {
            header = "Destilaria",
            txt = "",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            header = "Criar Bebidas",
            txt = "",
            params = {
                event = "moonshiner:client:Bebidas",
            }
        },
        {
            header = "Criar Misturas",
            txt = "",
            params = {
                event = "moonshiner:client:Misturas",
            }
        },
        {
            header = "Fechar",
            params = {
                event = "col-menu:closeMenu",
                active = false,
            }
            
        },
    }
    exports['col-menu']:openMenu(moonshiner)
end)

RegisterNetEvent('moonshiner:client:Misturas')
AddEventHandler('moonshiner:client:Misturas', function()
    showmoonshiner2 = true
    local moonshiner2 = {
        {
            header = "Destilaria",
            txt = "",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        
        {
            header = "Criar Alcool",
            txt = "",
            params = {
                isServer = true,
                event = "moonshiner:alcool",
            }
        },
        {
            header = "Criar Mosto de Ginseng",
            txt = "",
            params = {
                isServer = true,
                event = "moonshiner:mosto",
            }
        },
        {
            header = "Fechar",
            params = {
                event = "col-menu:closeMenu",
                active = false,
            }
            
        },
    }
    exports['col-menu']:openMenu(moonshiner2)
end)

RegisterNetEvent('moonshiner:client:Bebidas')
AddEventHandler('moonshiner:client:Bebidas', function()
    showmoonshiner3 = true
    local moonshiner3 = {
        {
            header = "Destilaria",
            txt = "",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            header = "Criar Moonshine Original",
            txt = "",
            params = {
                isServer = true,
                event = "moonshiner:original",
            }
        },
        {
            header = "Criar Moonshine Tropical",
            txt = "",
            params = {
                isServer = true,
                event = "moonshiner:tropical",
            }
        },
        {
            header = "Fechar",
            params = {
                event = "col-menu:closeMenu",
                active = false,
            }
        },
    }
    exports['col-menu']:openMenu(moonshiner3)
end)


RegisterNetEvent('shiner:moonshine')
AddEventHandler('shiner:moonshine', function()
    local playerPed = PlayerPedId()
    
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
    
    exports['progressBars']:startUI(30000, "Cozinhando moonshine...")
    Wait(30000)
    active = false
end)
RegisterNetEvent('shiner:mistura')
AddEventHandler('shiner:mistura', function()
    local playerPed = PlayerPedId()
    
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
    
    exports['progressBars']:startUI(30000, "Cozinhando misturas...")
    Wait(30000)
    active = false
end)