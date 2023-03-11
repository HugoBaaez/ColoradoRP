local keys = { ['G'] = 0x760A9C6F, ['S'] = 0xD27782E3, ['W'] = 0x8FD015D8, ['H'] = 0x24978A28, ['G'] = 0x5415BE48, ["ENTER"] = 0xC7B5340A, ['E'] = 0xDFF812F9,["BACKSPACE"] = 0x156F7119 }
local playerJob

RegisterNetEvent('saloon:findjob')
AddEventHandler('saloon:findjob', function(job)
    playerJob = job
end)
--menu

local prompts = GetRandomIntInRange(0, 0xffffff)
Citizen.CreateThread(function()
    Citizen.Wait(5000)
    local str = Config.Language.press
    openSaloon = PromptRegisterBegin()
    PromptSetControlAction(openSaloon, Config.keys["G"])
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(openSaloon, str)
    PromptSetEnabled(openSaloon, 1)
    PromptSetVisible(openSaloon, 1)
    PromptSetStandardMode(openSaloon, 1)
    PromptSetHoldMode(openSaloon, 1)
    PromptSetGroup(openSaloon, prompts)
    Citizen.InvokeNative(0xC5F428EE08FA7F2C, openSaloon, true)
    PromptRegisterEnd(openSaloon)
end)

Citizen.CreateThread(function()
    while true do
        local sleep = true
        for i, v in ipairs(Config.locais) do
            local playerCoords = GetEntityCoords(PlayerPedId())
            if Vdist(playerCoords, v.coords) <= v.radius then -- Checking distance between player and butcher

                sleep = false
                local label = CreateVarString(10, 'LITERAL_STRING', Config.Language.open)
                PromptSetActiveGroupThisFrame(prompts, label)

                if Citizen.InvokeNative(0xC92AC953F0A982AE, openSaloon) then
                    if Config.joblocked then
                        TriggerServerEvent("saloon:getJob")   

                        while playerJob == nil do
                            Wait(100)
                        end
                        if playerJob == v.saloonjob then
                            TriggerEvent("saloon:client:OpenMenu")
                            Citizen.Wait(200)
                        elseif playerJob == v.doceria then
                            TriggerEvent("doceria:client:OpenMenu")
                            Citizen.Wait(200)
                        else
                           TriggerEvent("vorp:TipRight", Config.Language.notasaloon .. " ", 4000)
                        end
                    else
                       
                        Citizen.Wait(200)
                    end
                    Citizen.Wait(1000)
                end
            end
        end
        if sleep then
            Citizen.Wait(500)
        end
        Citizen.Wait(1)
    end
end)
RegisterNetEvent('comidas:check')
AddEventHandler('comidas:check', function() 
    TriggerEvent("saloon:client:Comidas")
end)
RegisterNetEvent('bebidas:check')
AddEventHandler('bebidas:check', function() 
    TriggerEvent("saloon:client:Bebidas")
end)
RegisterNetEvent('saloon:armadillo')
AddEventHandler('saloon:armadillo', function() 
    TriggerEvent("saloon:client:ComidasA")
end)
RegisterNetEvent('saloon:valentine')
AddEventHandler('saloon:valentine', function() 
    TriggerEvent("saloon:client:ComidasV")
end)
RegisterNetEvent('saloon:rhodes')
AddEventHandler('saloon:rhodes', function() 
    TriggerEvent("saloon:client:Rhodes")
end)
RegisterNetEvent('saloon:bw')
AddEventHandler('saloon:bw', function() 
    TriggerEvent("saloon:client:Bw")
end)
RegisterNetEvent('saloon:sd')
AddEventHandler('saloon:sd', function() 
    TriggerEvent("saloon:client:SD")
end)
----------------------------------------------------------------------------------
RegisterNetEvent('saloon:client:OpenMenu')
AddEventHandler('saloon:client:OpenMenu', function()
    showsalooV = true
    local salooV = {
        {
            header = "Cozinha do Saloon",
            txt = "Prepare as melhores receitas",
            isMenuHeader = true, --título, janela nao clicável
        },
        {
            header = "🍾 Bebidas",
            txt = "",
            params = {
                isServer = true,
                event = "saloon:checkbebidas",
            }
        },
        {
            header = "🍵 Comidas",
            txt = "",
            params = {
                isServer = true,
                event = "saloon:checkcomidas",
            }
        },
        {
            header = "🍵 Especiais",
            txt = "",
            params = {
                isServer = true,
                event = "saloon:checkgroup",
            }
        },
        {
            header = "Fechar",
            params = {
                event = "col-menu:closeMenu",
            }
        },
    }
    exports['col-menu']:openMenu(salooV)
end)

RegisterNetEvent('saloon:client:Bebidas')
AddEventHandler('saloon:client:Bebidas', function()
    local BebidasV = {
        {
            header = "🍾 Bebidas",
            txt = "Prepare as melhores receitas",
            isMenuHeader = true, --título, janela nao clicável
        },
        {
            header = "🍾 Vodka",
            txt = "",
            params = {
                isServer = true,
                event = "wc_vodka",
            }
        },
        {
            header = "🍾 Whisky",
            txt = "",
            params = {
                isServer = true,
                event = "wc_wiskey",
            }
        },
        {
            header = "🍾 Cerveja",
            txt = "",
            params = {
                isServer = true,
                event = "wc_cerveja",
            }
        },
        {
            header = "🍾 Rum",
            txt = "",
            params = {
                isServer = true,
                event = "wc_rhum",
            }
        },
        {
            header = "🍾 Cidra",
            txt = "",
            params = {
                isServer = true,
                event = "wc_cidra",
            }
        },
        {
            header = "Fechar",
            params = {
                event = "col-menu:closeMenu",
            }
        },
    }
    exports['col-menu']:openMenu(BebidasV)
end)

RegisterNetEvent('saloon:client:Comidas')
AddEventHandler('saloon:client:Comidas', function()
    local ComidasV = {
        {
            header = "🍵 Comidas",
            txt = "Prepare as melhores receitas",
            isMenuHeader = true, --título, janela nao clicável
        },
        {
            header = "🥩 Ensopado de carne",
            txt = "",
            params = {
                isServer = true,
                event = "wc_stufatodicervo",
            }
        },
        {
            header = "🍵 Caldo de peixe",
            txt = "",
            params = {
                isServer = true,
                event = "wc_caldodepeixe",
            }
        },
        {
            header = "Fechar",
            params = {
                event = "col-menu:closeMenu",
            }
        },
    }
    exports['col-menu']:openMenu(ComidasV)
end)

RegisterNetEvent('saloon:client:ComidasV')
AddEventHandler('saloon:client:ComidasV', function()
    local Valentine = {
        {
            header = "🍵 Especiais",
            txt = "Prepare as melhores receitas",
            isMenuHeader = true, --título, janela nao clicável
        },
        {
            header = "🍵 Pure de batata com linguiça",
            txt = "",
            params = {
                isServer = true,
                event = "wc_batatacomL",
            }
        },
        {
            header = "Fechar",
            params = {
                event = "col-menu:closeMenu",
            }
        },
    }
    exports['col-menu']:openMenu(Valentine)
end)
RegisterNetEvent('saloon:client:ComidasA')
AddEventHandler('saloon:client:ComidasA', function()
    local Armadillo = {
        {
            header = "🍵 Especiais",
            txt = "Prepare as melhores receitas",
            isMenuHeader = true, --título, janela nao clicável
        },
        {
            header = "🍵 Bisteca ao creme de milho",
            txt = "",
            params = {
                isServer = true,
                event = "wc_bistecaCMilho",
            }
        },
        {
            header = "Fechar",
            params = {
                event = "col-menu:closeMenu",
            }
        },
    }
    exports['col-menu']:openMenu(Armadillo)
end)
RegisterNetEvent('saloon:client:Rhodes')
AddEventHandler('saloon:client:Rhodes', function()
    local Rhodes = {
        {
            header = "🍵 Especiais",
            txt = "Prepare as melhores receitas",
            isMenuHeader = true, --título, janela nao clicável
        },
        {
            header = "🍵 Peixe com batatas",
            txt = "",
            params = {
                isServer = true,
                event = "rd_peixebtt",
            }
        },
        {
            header = "🍾 Chá",
            txt = "",
            params = {
                isServer = true,
                event = "rd_cha",
            }
        },
        {
            header = "Fechar",
            params = {
                event = "col-menu:closeMenu",
            }
        },
    }
    exports['col-menu']:openMenu(Rhodes)
end)
RegisterNetEvent('saloon:client:Bw')
AddEventHandler('saloon:client:Bw', function()
    local Bw = {
        {
            header = "🍵 Especiais",
            txt = "Prepare as melhores receitas",
            isMenuHeader = true, --título, janela nao clicável
        },
        {
            header = "🍵 Torta de carne",
            txt = "",
            params = {
                isServer = true,
                event = "bw_tortadecarne",
            }
        },
        {
            header = "Fechar",
            params = {
                event = "col-menu:closeMenu",
            }
        },
    }
    exports['col-menu']:openMenu(Bw)
end)
RegisterNetEvent('saloon:client:SD')
AddEventHandler('saloon:client:SD', function()
    local SD = {
        {
            header = "🍵 Especiais",
            txt = "Os melhores drink's da cidade",
            isMenuHeader = true, --título, janela nao clicável
        },
        {
            header = "🍸 Daiquiri",
            txt = "Rum ",
            params = {
                isServer = true,
                event = "bd_daiquiri",
            }
        },
        {
            header = "🥃 Old Fashioned",
            txt = "Whysky ",
            params = {
                isServer = true,
                event = "bd_old",
            }
        },
        {
            header = "🥃 Planter's Punch",
            txt = "Rum ",
            params = {
                isServer = true,
                event = "bd_planter",
            }
        },
        {
            header = "🍸 Vodka Martini",
            txt = "Vodka",
            params = {
                isServer = true,
                event = "bd_vodkam",
            }
        },
        {
            header = "🍹 Mojito",
            txt = "Rum",
            params = {
                isServer = true,
                event = "bd_mojito",
            }
        },
        {
            header = "Fechar",
            params = {
                event = "col-menu:closeMenu",
            }
        },
    }
    exports['col-menu']:openMenu(SD)
end)
----------------------------------------------------------------------------------------------------
RegisterNetEvent('progressbar:startSaloon')
AddEventHandler('progressbar:startSaloon', function()

    local playerPed = PlayerPedId()
    --TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CANNED_FOOD_COOKING'), -1, true, false, false, false)
    exports['progressBars']:startUI(20000, "Preparando...")
    animazionecucina()
    Citizen.Wait(20000)
    ClearPedTasksImmediately(PlayerPedId())

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

function animazionemenu()    
    RequestAnimDict("amb_camp@prop_camp_foodprep@resting@male_b@idle_d")
    while not HasAnimDictLoaded("amb_camp@prop_camp_foodprep@resting@male_b@idle_d") do
        Citizen.Wait(1)
		RequestAnimDict("amb_camp@prop_camp_foodprep@resting@male_b@idle_d")
    end	
    TaskPlayAnim(PlayerPedId(), "amb_camp@prop_camp_foodprep@resting@male_b@idle_d", "idle_l", 1.0, 8.0, -1, 1, 0, false, 0, false, 0, false)    
    Wait(20000)	
	ClearPedTasks(PlayerPedId())
end

function animazionecucina()    
    RequestAnimDict("amb_camp@prop_camp_foodprep@working@seasoning@male_b@idle_c")
    while not HasAnimDictLoaded("amb_camp@prop_camp_foodprep@working@seasoning@male_b@idle_c") do
        Citizen.Wait(1)
		RequestAnimDict("amb_camp@prop_camp_foodprep@working@seasoning@male_b@idle_c")
    end	
     TaskPlayAnim(PlayerPedId(), "amb_camp@prop_camp_foodprep@working@seasoning@male_b@idle_c", "idle_h", 1.0, 8.0, -1, 1, 0, false, 0, false, 0, false)
    Wait(20000)
	ClearPedTasks(PlayerPedId())
end

------------------------------------------------------------------------
------------------------------------------------------------------------
RegisterNetEvent('doceria:client:OpenMenu')
AddEventHandler('doceria:client:OpenMenu', function()
    local Doceria = {
        {
            header = "Doceria",
            txt = "Prepare as melhores receitas",
            isMenuHeader = true, --título, janela nao clicável
        },
        {
            header = "Bebidas",
            txt = "",
            params = {
                isServer = true,
                event = "doceria:checkbebidas",
            }
        },
        {
            header = "Comidas",
            txt = "",
            params = {
                isServer = true,
                event = "doceria:checkcomidas",
            }
        },
        {
            header = "Fechar",
            params = {
                event = "col-menu:closeMenu",
            }
        },
    }
    exports['col-menu']:openMenu(Doceria)
end)

RegisterNetEvent('doceria:menuComidas')
AddEventHandler('doceria:menuComidas', function()
    TriggerEvent('doceria:client:Comidas')
end)

RegisterNetEvent('doceria:client:Comidas')
AddEventHandler('doceria:client:Comidas', function()
    local DoceriaComidas = {
        {
            header = "Comidas",
            txt = "Prepare as melhores receitas",
            isMenuHeader = true, --título, janela nao clicável
        },
        {
            header = "Bolo de Chocolate",
            txt = "",
            params = {
                isServer = true,
                event = "doceria:chocolate",
            }
        },
        {
            header = "Bolo de Cenoura",
            txt = "",
            params = {
                isServer = true,
                event = "doceria:cenoura",
            }
        },
        {
            header = "Bala de Amora",
            txt = "",
            params = {
                isServer = true,
                event = "doceria:amora",
            }
        },
        {
            header = "Pirulito",
            txt = "",
            params = {
                isServer = true,
                event = "doceria:pirulito",
            }
        },
        {
            header = "Barra de Chocolate",
            txt = "",
            params = {
                isServer = true,
                event = "doceria:barrachocolate",
            }
        },
        {
            header = "Sorvete de Hortelã",
            txt = "",
            params = {
                isServer = true,
                event = "doceria:sorvHortela",
            }
        },
        {
            header = "Fechar",
            params = {
                event = "col-menu:closeMenu",
            }
        },
    }
    exports['col-menu']:openMenu(DoceriaComidas)
end)
------------------------------------------------------
RegisterNetEvent('padaria:menuComidas')
AddEventHandler('padaria:menuComidas', function()
    TriggerEvent('padaria:client:Comidas')
end)
RegisterNetEvent('padaria:client:Comidas')
AddEventHandler('padaria:client:Comidas', function()
    local PadariaComidas = {
        {
            header = "Comidas",
            txt = "Prepare as melhores receitas",
            isMenuHeader = true, --título, janela nao clicável
        },
        {
            header = "Croassant de Porco",
            txt = "",
            params = {
                isServer = true,
                event = "padaria:CroassantP",
            }
        },
        {
            header = "Croassant de Animal",
            txt = "",
            params = {
                isServer = true,
                event = "padaria:CroassantA",
            }
        },
        {
            header = "Cachorro Quente",
            txt = "",
            params = {
                isServer = true,
                event = "padaria:hotdog",
            }
        },
        {
            header = "Fechar",
            params = {
                event = "col-menu:closeMenu",
            }
        },
    }
    exports['col-menu']:openMenu(PadariaComidas)
end)

RegisterNetEvent('padaria:menuBebidas')
AddEventHandler('padaria:menuBebidas', function()
    TriggerEvent('padaria:client:Bebidas')
end)

RegisterNetEvent('padaria:client:Bebidas')
AddEventHandler('padaria:client:Bebidas', function()
    local PadariaBebidas = {
        {
            header = "Bebidas",
            txt = "Prepare as melhores receitas",
            isMenuHeader = true, --título, janela nao clicável
        },
        {
            header = "MilkShake de Groselha",
            txt = "",
            params = {
                isServer = true,
                event = "padaria:MSgroselha",
            }
        },
        {
            header = "MilkShake de Beterraba",
            txt = "",
            params = {
                isServer = true,
                event = "padaria:MSbeterraba",
            }
        },
        {
            header = "Suco de Hortelã",
            txt = "",
            params = {
                isServer = true,
                event = "padaria:sucoHortela",
            }
        },
        {
            header = "Suco de Amora",
            txt = "",
            params = {
                isServer = true,
                event = "padaria:sucoAmora",
            }
        },
        {
            header = "Fechar",
            params = {
                event = "col-menu:closeMenu",
            }
        },
    }
    exports['col-menu']:openMenu(PadariaBebidas)
end)
------------------------------------------------------
RegisterNetEvent('doceria:animação')
AddEventHandler('doceria:animação', function()
    cozinhando()
end)

function cozinhando() 
    FreezeEntityPosition(PlayerPedId(), true)
    exports['progressBars']:startUI(20000, "Preparando...")  
    RequestAnimDict("amb_camp@prop_camp_foodprep@working@seasoning@male_b@idle_c")
    while not HasAnimDictLoaded("amb_camp@prop_camp_foodprep@working@seasoning@male_b@idle_c") do
        Citizen.Wait(1)
		RequestAnimDict("amb_camp@prop_camp_foodprep@working@seasoning@male_b@idle_c")
    end	
     TaskPlayAnim(PlayerPedId(), "amb_camp@prop_camp_foodprep@working@seasoning@male_b@idle_c", "idle_h", 1.0, 8.0, -1, 1, 0, false, 0, false, 0, false)
    Wait(20000)
    FreezeEntityPosition(PlayerPedId(), false)
	ClearPedTasks(PlayerPedId())
end