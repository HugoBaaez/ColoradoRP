local inDelivery = false
local selected = 0

-- Start Service
CreateThread(function()
    while true do
        itemInHand = 0
        prop = "p_letterbundle_01x"
        ped = PlayerPedId()
        coordPed = GetEntityCoords(ped)
        local sleep = 1000
        local coordblip = vector3(2730.32, -1402.59, 46.18)
        local blip = N_0x554d9d53f696d002(1664425300, coordblip.x, coordblip.y, coordblip.z)
		SetBlipSprite(blip, 1861010125, 1)
        SetBlipScale(blip, 0.2)
        Citizen.InvokeNative(0x9CB1A1623062F402, blip, 'Entregador de Cartas')
        if not inDelivery then
            local distance = #(coordPed - coordblip)
            if distance < 1 then
                sleep = 5
                DrawText("Pressione [~e~E~q~] para Começar as Entregas do Correio", 1, 0.5, 0.85, 0.10, 0.40, 255, 255, 255, 255)
                    if IsControlJustPressed(0, 0xCEFD9220) then -- Button you need to press.
                        Anim(ped,"amb_camp@prop_camp_meat_bowl_pickup@male_a@stand_enter", "enter_lh", -1,0)
                        Wait(3000)
                        if prop ~= "" then
                            local pC = GetEntityCoords(PlayerPedId())
                            itemInHand = CreateObject(prop, pC.x, pC.y, pC.z, true, false, false)
                            AttachEntityToEntity(itemInHand, PlayerPedId(), GetEntityBoneIndexByName(PlayerPedId(), "SKEL_R_Finger12"), 0.00, 0.00, 0.04, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
                        end
                        Wait(2000)
                        ClearPedSecondaryTask(PlayerPedId())
                        if prop ~= "" then
                            deleteObj(itemInHand)
                        end
                        itemInHand = nil
                        RemoveBlip(selected)
                        selected = math.random(1, 25)
                        inDelivery = true
                        TriggerEvent("vorp:TipBottom", 'Você entrou em serviço, entregue as cartas nos locais marcados no seu mapa de bolso', 5000)
                        ClearPedTasks(ped)
                        createBlip(selected)
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
        while inDelivery do
            itemInHands = 0
            prop = "p_letterbundle_01x"
            ped = PlayerPedId()
            coordPed = GetEntityCoords(ped)
            local sleep = 1000
            delivery = Config.routes[selected]
            coordblipdelivery = vector3(delivery.x, delivery.y, delivery.z)
            local distancia = #(coordPed - coordblipdelivery)
            if distancia < 2 then
                sleep = 5
                DrawText("Pressione [~e~E~q~] para Entregar a Carta", 1, 0.5, 0.85, 0.10, 0.40, 255, 255, 255, 255)
                    if IsControlJustPressed(0, 0xCEFD9220) then -- Button you need to press.
                        if prop ~= "" then
                            local pC = GetEntityCoords(PlayerPedId())
                            itemInHands = CreateObject(prop, pC.x, pC.y, pC.z, true, false, false)
                            AttachEntityToEntity(itemInHands, PlayerPedId(), GetEntityBoneIndexByName(PlayerPedId(), "SKEL_R_Finger12"), 0.00, 0.00, 0.04, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
                        end
                        Wait(2000)
                        Anim(ped,"amb_generic@world_human_generic_prop_table_put_down@male_a@stand_enter", "enter_back_rf", -1,0)
                        Wait(3000)
                        ClearPedSecondaryTask(PlayerPedId())
                        if prop ~= "" then
                            deleteObj(itemInHands)
                        end
                        itemInHands = nil
                        RemoveBlip(selected)
                        selected = math.random(1, 25)
                        inDelivery = true
                        TriggerServerEvent("col_postoffice:addMoney", 0, 1.20)
                        TriggerEvent("vorp:TipBottom", 'Siga para a próxima entrega', 5000)
                        ClearPedTasks(ped)
                        createBlip(selected)
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

                TriggerEvent("vorp:TipBottom", 'Você saiu de serviço', 5000)
            end
        end
    end)
end


function deleteObj(obj)
    if DoesEntityExist(obj) then
        SetEntityAsMissionEntity(obj, false, true)
        NetworkRequestControlOfEntity(obj)
        local timeout = 0
        while not NetworkHasControlOfEntity(obj) and timeout < 5000 do
            timeout = timeout+100
            if timeout == 5000 then
            end
            Wait(100)
        end
        if NetworkHasControlOfEntity(obj) then
        end
        FreezeEntityPosition(obj , false)
        DeleteEntity(obj)
    end
end

function Anim(actor, dict, body, duration, flags, introtiming, exittiming)
    Citizen.CreateThread(function()
        RequestAnimDict(dict)
        local dur = duration or -1
        local flag = flags or 1
        local intro = tonumber(introtiming) or 1.0
        local exit = tonumber(exittiming) or 2.0
        timeout = 5
        while (not HasAnimDictLoaded(dict) and timeout>0) do
            timeout = timeout-1
            if timeout == 0 then
                print("Animation Failed to Load")
            end
            Citizen.Wait(300)
        end
        TaskPlayAnim(actor, dict, body, intro, exit, dur, flag --[[1 for repeat--]], 1, false, false, false, 0, true)
    end)
end

function createBlip(selected)
    StartGpsMultiRoute(GetHashKey("COLOR_YELLOW"), true, true)
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