local deliveryWeapon = false
local PlayerJob
local JobGrade
local npc

CreateThread(function()
    while true do
        itemInHand = 0
        prop = "p_letterbundle_01x"
        ped = PlayerPedId()
        coordPed = GetEntityCoords(ped)
        local sleep = 1000

        if not inDelivery then
            local distance = #(coordPed - Config.start)
            TriggerServerEvent('weapons_delivery:getjob')
            if distance < 2 and PlayerJob == 'police' and JobGrade == 7 then
                sleep = 5
                DrawText("Pressione [~e~E~q~] para Começar a Entrega de Armamento", 1, 0.5, 0.85, 0.10, 0.40, 255, 255, 255, 255)
                    if IsControlJustPressed(0, 0xCEFD9220) then -- Button you need to press.
                        RemoveBlip(selected)
                        selected = math.random(0, 11)
                        inDelivery = true
                        TriggerServerEvent("weapons_delivery:announce", "Transporte de armas da Cavalaria em andamento")
                        TriggerEvent("vorp:TipBottom", 'Você iniciou a entrega de armamentos, verifique o local no seu mapa de bolso', 5000)
                        createBlip(selected)
                        Wait(10000)
                        working()
                    end
            end
        end
        Wait(sleep)
    end
end)

-- TRABALHANDO
function working()
    CreateThread(function()
        setPed(selected)
        while inDelivery do
            ped = PlayerPedId()
            coordPed = GetEntityCoords(ped)
            local sleep = 1000
            delivery = Config.routes[selected]
            coordblipdelivery = vector3(delivery.x, delivery.y, delivery.z)
            local distancia = #(coordPed - coordblipdelivery)
            if distancia < 1 then
                sleep = 5
                TriggerEvent('enter:pd')
                if IsControlJustReleased(0, 0x760A9C6F) then
                    TriggerEvent('sellmenu:client:OpenMenu')
                end
            end
            Wait(sleep)
        end
    end)

    CreateThread(function()
        while inDelivery do
            Wait(5)
            if IsControlJustPressed(0, 0x156F7119) then
                inDelivery = false
                ClearPedTasks(ped)
                RemoveBlip(selected)
                selected = nil
			    SetGpsMultiRouteRender(false)
                DeletePed(npc)
                DeleteEntity(npc)
                TriggerEvent("vorp:TipBottom", 'Você saiu de serviço', 5000)
            end
        end
    end)
end
RegisterNetEvent('enter:pd')
AddEventHandler('enter:pd', function()
    SetTextScale(0.5, 0.5)
    SetTextFontForCurrentCommand(1)
    local msg =  ('[G] Abrir Menu para Vender')
    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", msg, Citizen.ResultAsLong())
    Citizen.InvokeNative(0xFA233F8FE190514C, str)
    Citizen.InvokeNative(0xE9990552DEC71600)
end)
--------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('sellmenu:client:OpenMenu')
AddEventHandler('sellmenu:client:OpenMenu', function()
    showPoliceArmas = true
    local PoliceArmas = {
        {
            header = "Venda de Armas",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            header = "Calibre 12",
            txt = "$400,00",
            params = {
                event = "weShotgun",
            }
        },
        {
            header = "Volcanic",
            txt = "$200,00",
            params = {
                event = "weVolcanic",
            }
        },
        {
            header = "Pistola Semi-Automática",
            txt = "$150,00",
            params = {
                event = "wePistol",
            }
        },
        {
            header = "Pistola 1899",
            txt = "$50,00",
            params = {
                event = "we1899",
            }
        },
        {
            header = "Banana de Dynamite",
            txt = "$300,00",
            params = {
                event = "weDynamite",
            }
        },
        {
            header = "Oppio",
            txt = "$2,50",
            params = {
                event = "weOppio",
            }
        },
        {
            header = "Moonshine Tropical",
            txt = "$6,00",
            params = {
                event = "weMoonshineT",
            }
        },
        {
            header = "Moonshine",
            txt = "$3,00",
            params = {
                event = "weMoonshine",
            }
        },
        -- {
        --     header = "Cocaina",
        --     txt = "$8,00",
        --     params = {
        --         event = "weCocaina",
        --     }
        -- },
        {
            header = "Lock Pick",
            txt = "$2,00",
            params = {
                event = "weLockpick",
            }
        },
        {
            header = "Fechar",
            params = {
                event = "col-menu:closeMenu",
            }
        },
    }
    exports['col-menu']:openMenu(PoliceArmas)
end)
local playerId = GetPlayerServerId(tonumber(PlayerId()))

RegisterNetEvent("weShotgun")
AddEventHandler("weShotgun", function()
    TriggerServerEvent("weapons_delivery:sellitems", "WEAPON_SHOTGUN_SEMIAUTO", "Shotgun", 74298, 400, 'weapon', playerId)
end)
RegisterNetEvent("weVolcanic")
AddEventHandler("weVolcanic", function()
    TriggerServerEvent("weapons_delivery:sellitems", "WEAPON_PISTOL_VOLCANIC", 'Pistola Volcanic', 74292, 200, 'weapon', playerId)
end)
RegisterNetEvent("wePistol")
AddEventHandler("wePistol", function()
    TriggerServerEvent("weapons_delivery:sellitems", "WEAPON_PISTOL_SEMIAUTO", 'Pistola Semi Automática', 74291, 150, 'weapon', playerId)
end)
RegisterNetEvent("we1899")
AddEventHandler("we1899", function()
    TriggerServerEvent("weapons_delivery:sellitems", "WEAPON_PISTOL_M1899", 'Pistola M1899', 74293, 50, 'weapon', playerId)
end)
RegisterNetEvent("weDynamite")
AddEventHandler("weDynamite", function()
    TriggerServerEvent("weapons_delivery:sellitems", "dynamite", 'Banana de Dynamite', nil, 300, 'item', playerId)
end)
RegisterNetEvent("weOppio")
AddEventHandler("weOppio", function()
    TriggerServerEvent("weapons_delivery:sellitems", "oppio", 'Oppio', nil, 2.50, 'item', playerId)
end)
RegisterNetEvent("weMoonshineT")
AddEventHandler("weMoonshineT", function()
    TriggerServerEvent("weapons_delivery:sellitems", "tropicalPunchMoonshine", 'Moonshine Tropical', nil, 6, 'item', playerId)
end)
RegisterNetEvent("weMoonshine")
AddEventHandler("weMoonshine", function()
    TriggerServerEvent("weapons_delivery:sellitems", "moonshine", 'Moonshine', nil, 3, 'item', playerId)
end)
RegisterNetEvent("weCocaina")
AddEventHandler("weCocaina", function()
    TriggerServerEvent("weapons_delivery:sellitems", "cocaina", 'Cocaina', nil, 8, 'item', playerId)
end)
RegisterNetEvent("weLockpick")
AddEventHandler("weLockpick", function()
    TriggerServerEvent("weapons_delivery:sellitems", "lockpick", 'Lockpick', nil, 2, 'item', playerId)
end)

-----------------------------------------
RegisterNetEvent("weapons_delivery:findjob")
AddEventHandler("weapons_delivery:findjob", function(job,rank)
	PlayerJob = job
	JobGrade = rank
end)
-------------
function createBlip(selected)
    StartGpsMultiRoute(GetHashKey("COLOR_BLUE"), true, true)
    -- Add the points
    AddPointToGpsMultiRoute(Config.routes[selected].x,Config.routes[selected].y, Config.routes[selected].z)

    -- Set the route to render
    SetGpsMultiRouteRender(true)
end

function DrawText(text, fontId, x, y, scaleX, scaleY, r, g, b, a)
    -- Draw Text
    SetTextScale(scaleX, scaleY);
    SetTextColor(r, g, b, a);
    SetTextCentre(true);
    Citizen.InvokeNative(0xADA9255D, fontId); -- Loads the font requested
    DisplayText(CreateVarString(10, "LITERAL_STRING", text), x, y);
end

function setPed(selected)
    local hashModel = GetHashKey("CS_captainmonroe")
	if IsModelValid(hashModel) then
		RequestModel(hashModel)
		while not HasModelLoaded(hashModel) do
			Wait(100)
		end
	end
	npc = CreatePed(hashModel, Config.routes[selected].x,Config.routes[selected].y, Config.routes[selected].z-1, Config.routes[selected].h, false, true, true, true)
	Citizen.InvokeNative(0x283978A15512B2FE, npc, true) -- SetRandomOutfitVariation
	SetEntityNoCollisionEntity(PlayerPedId(), npc, false)
	SetEntityCanBeDamaged(npc, false)
	SetEntityInvincible(npc, true)
	Wait(1000)
	FreezeEntityPosition(npc, true) -- NPC can't escape
	SetBlockingOfNonTemporaryEvents(npc, true) -- NPC can't be scared
end