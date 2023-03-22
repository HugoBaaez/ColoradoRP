local isDead = IsPedDeadOrDying(PlayerPedId())

RegisterNetEvent("guerrilha:onduty")
AddEventHandler("guerrilha:onduty", function(duty)
    if not duty then
        onDuty = false
    else
        onDuty = true
    end
end)

RegisterCommand('G',function(source,rawCommand)
    if onDuty and not isDead then
		TriggerEvent("vorpinputs:getInput", "Mensagem", "Mensagem",function(cb)
		local mensagem = tostring(cb)
		Citizen.Wait(1)
        animSendPombo()
		TriggerServerEvent("RedM:sendalert",'guerrilha', 'guerrilha', mensagem, false, false)
		end)
    end
end)


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
function animSendPombo()
    ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    Anim(ped,"script_common@mth_generic_enters@squat@in_place", "enter_lf", -1,0)
    Wait(2000)
    local npc = CreatePed(GetHashKey('A_C_Pigeon'), coords.x, coords.y+0.3, coords.z-1, GetEntityHeading(ped), true, true, 0, 0)
    Citizen.InvokeNative(0x283978A15512B2FE, npc, true) -- SetRandomOutfitVariation
    SetEntityNoCollisionEntity(PlayerPedId(), npc, false)
    Wait(2000)
    DeletePed(npc)
    DeleteEntity(npc)
end