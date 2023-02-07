Citizen.CreateThread(function()
    while true do
        Citizen.Wait(30*60000)
        TriggerServerEvent('salario:pagamento')
    end
end)

CreateThread(function()
    while true do
        Citizen.Wait(2)
        if IsControlJustPressed(0, 0xA65EBAB4) then -- SETA ESQUERDA
            local myPed = PlayerPedId()
            SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
        end
    end
end)
-------------------- X
-------------------- X
CreateThread(function()
    while true do
        Citizen.Wait(2)
        if IsControlJustPressed(0, 0x8CC9CD42) then -- x
            local playerPed = PlayerPedId()
            if not IsEntityDead(playerPed) and not Citizen.InvokeNative(0x9682F850056C9ADE, playerPed) then
                local animDict = "script_proc@robberies@homestead@lonnies_shack@deception"

                if not IsEntityPlayingAnim(playerPed, animDict, "hands_up_loop", 3) then
                    if not HasAnimDictLoaded(animDict) then
                        RequestAnimDict(animDict)

                        while not HasAnimDictLoaded(animDict) do
                            Citizen.Wait(0)
                        end
                    end

                    TaskPlayAnim(playerPed, animDict, "hands_up_loop", 2.0, -2.0, -1, 67109393, 0.0, false, 1245184, false, "UpperbodyFixup_filter", false)
                    RequestAnimDict(animDict)
                else
                    ClearPedSecondaryTask(playerPed)
                end
            end
        end
    end        
end)
----------------------------------------- Chamados
local blips = {}
RegisterCommand('alertdoctor', function(source, args, rawCommand)
    if IsEntityDead(PlayerPedId()) then                    
        TriggerEvent('RedM:Notify', 'notify', 'Você não pode fazer isso!')
    else
        local chamado = true
        local tipo = "medic"
        local msg = 'Chamado medico, \n verifique as coordenadas'
        local coords = GetEntityCoords(PlayerPedId())
        TriggerServerEvent("RedM:sendalert",'doctor', tipo, msg, coords, chamado)                    
    end
end)
RegisterCommand('alertpolice', function(source, args, rawCommand)
    if IsEntityDead(PlayerPedId()) then                    
        TriggerEvent('RedM:Notify', 'notify', 'Você não pode fazer isso!')
    else
        local chamado = true
        local tipo = "complaint"
        local msg = 'Chamado policial,\n verifique as coordenadas'
        local coords = GetEntityCoords(PlayerPedId())
        TriggerServerEvent("RedM:sendalert",'police', tipo, msg, coords, chamado)                    
    end
end)

RegisterNetEvent("RedM:createblip")
AddEventHandler("RedM:createblip", function(blip)
    local blipx =  N_0x554d9d53f696d002(1664425300, blip.x, blip.y, blip.z)
    SetBlipScale(blipx, 0.2)
    SetBlipSprite(blipx, 2119977580, 1) 
    Citizen.InvokeNative(0x9CB1A1623062F402, blipx, 'Chamado')
    Citizen.InvokeNative(0x662D364ABF16DE2F,blipx,0x6F85C3CE)
    table.insert(blips, {
      blipz = blipx
    })
end)
RegisterCommand('cblips', function(source, args, rawCommand)
    for k,v in pairs(blips) do 
        RemoveBlip(v.blipz)
    end
    blips = {}
end, false)
------------ Lavar-se 
------------ Lavar-se 
local keys = { ['G'] = 0x760A9C6F, ['S'] = 0xD27782E3, ['W'] = 0x8FD015D8, ['H'] = 0x24978A28, ['G'] = 0x5415BE48, ["ENTER"] = 0xC7B5340A, ['E'] = 0xDFF812F9,["BACKSPACE"] = 0x156F7119 }
local WaterTypes = {
    [1] =  {["name"] = "Sea of Coronado",       ["waterhash"] = -247856387, ["watertype"] = "lake"},
    [2] =  {["name"] = "San Luis River",        ["waterhash"] = -1504425495, ["watertype"] = "river"},
    [3] =  {["name"] = "Lake Don Julio",        ["waterhash"] = -1369817450, ["watertype"] = "lake"},
    [4] =  {["name"] = "Flat Iron Lake",        ["waterhash"] = -1356490953, ["watertype"] = "lake"},
    [5] =  {["name"] = "Upper Montana River",   ["waterhash"] = -1781130443, ["watertype"] = "river"},
    [6] =  {["name"] = "Owanjila",              ["waterhash"] = -1300497193, ["watertype"] = "river"},
    [7] =  {["name"] = "HawkEye Creek",         ["waterhash"] = -1276586360, ["watertype"] = "river"},
    [8] =  {["name"] = "Little Creek River",    ["waterhash"] = -1410384421, ["watertype"] = "river"},
    [9] =  {["name"] = "Dakota River",          ["waterhash"] = 370072007, ["watertype"] = "river"},
    [10] =  {["name"] = "Beartooth Beck",       ["waterhash"] = 650214731, ["watertype"] = "river"},
    [11] =  {["name"] = "Lake Isabella",        ["waterhash"] = 592454541, ["watertype"] = "lake"},
    [12] =  {["name"] = "Cattail Pond",         ["waterhash"] = -804804953, ["watertype"] = "lake"},
    [13] =  {["name"] = "Deadboot Creek",       ["waterhash"] = 1245451421, ["watertype"] = "river"},
    [14] =  {["name"] = "Spider Gorge",         ["waterhash"] = -218679770, ["watertype"] = "river"},
    [15] =  {["name"] = "O'Creagh's Run",       ["waterhash"] = -1817904483, ["watertype"] = "lake"},
    [16] =  {["name"] = "Moonstone Pond",       ["waterhash"] = -811730579, ["watertype"] = "lake"},
    [17] =  {["name"] = "Roanoke Valley",       ["waterhash"] = -1229593481, ["watertype"] = "river"},
    [18] =  {["name"] = "Elysian Pool",         ["waterhash"] = -105598602, ["watertype"] = "lake"},
    [19] =  {["name"] = "Heartland Overflow",   ["waterhash"] = 1755369577, ["watertype"] = "swamp"},
    [20] =  {["name"] = "Lagras",               ["waterhash"] = -557290573, ["watertype"] = "swamp"},
    [21] =  {["name"] = "Lannahechee River",    ["waterhash"] = -2040708515, ["watertype"] = "river"},
    [22] =  {["name"] = "Dakota River",         ["waterhash"] = 370072007, ["watertype"] = "river"},
    [23] =  {["name"] = "Random1",              ["waterhash"] = 231313522, ["watertype"] = "river"},
    [24] =  {["name"] = "Random2",              ["waterhash"] = 2005774838, ["watertype"] = "river"},
    [25] =  {["name"] = "Random3",              ["waterhash"] = -1287619521, ["watertype"] = "river"},
    [26] =  {["name"] = "Random4",              ["waterhash"] = -1308233316, ["watertype"] = "river"},
    [27] =  {["name"] = "Random5",              ["waterhash"] = -196675805, ["watertype"] = "river"},
}

--menu
local WashGroup = GetRandomIntInRange(0, 0xffffff)
local WashPrompt

function WashPrompt()    
    Citizen.CreateThread(function()
        local str ="Lavar-se"
        local wait = 0
        WashPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
        PromptSetControlAction(WashPrompt, 0x760A9C6F)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(WashPrompt, str)
        PromptSetEnabled(WashPrompt, true)
        PromptSetVisible(WashPrompt, true)
        PromptSetHoldMode(WashPrompt, true)
        PromptSetGroup(WashPrompt, WashGroup)
        PromptRegisterEnd(WashPrompt)        
    end)
end

Citizen.CreateThread(function()
    WashPrompt()
	while true do
	Citizen.Wait(1)
		local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local Water = Citizen.InvokeNative(0x5BA7A68A346A5A91,coords.x+3, coords.y+3, coords.z)
        for k,v in pairs(WaterTypes) do 
            if not IsPlayerDead(PlayerId()) then
                if Water == WaterTypes[k]["waterhash"]  then
                    if IsPedOnFoot(playerPed) then
                        if IsEntityInWater(playerPed) then
                            local Wash  = CreateVarString(10, 'LITERAL_STRING',"Água")
                            PromptSetActiveGroupThisFrame(WashGroup, Wash) 
                            if PromptHasHoldModeCompleted(WashPrompt) then
                            StartWash("amb_misc@world_human_wash_face_bucket@ground@male_a@idle_d", "idle_l")
                            end                                         
                        end                
                    end
                end
            end
        end
    end
end)

StartWash = function(dic, anim)
    LoadAnim(dic)
    TaskPlayAnim(PlayerPedId(), dic, anim, 1.0, 8.0, 5000, 0, 0.0, false, false, false)
    Citizen.Wait(5000)
    ClearPedTasks(PlayerPedId())
    Citizen.InvokeNative(0x6585D955A68452A5, PlayerPedId())
    Citizen.InvokeNative(0x9C720776DAA43E7E, PlayerPedId())
    Citizen.InvokeNative(0x8FE22675A5A45817, PlayerPedId())
end

LoadAnim = function(dic)
    RequestAnimDict(dic)

    while not (HasAnimDictLoaded(dic)) do
        Citizen.Wait(0)
    end
end

function whenKeyJustPressed(key)
    if Citizen.InvokeNative(0x580417101DDB492F, 0, key) then
        return true
    else
        return false
    end
end

function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str)
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
    SetTextCentre(centre)
    SetTextFontForCurrentCommand(15) 
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
    DisplayText(str, x, y)
end
-----------------------HOGTIE
-----------------------HOGTIE
local dontrelease = false 
local releasecheck = false 
local distancebreak = 25
local timetobreak = 20 * 1000
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
                --playerid = GetPlayerServerId(players[i])
                tgt1 = GetPlayerPed(players[i])
            end
        end
    end
    return closestPlayer, closestDistance
 end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if releasecheck then
            local player = PlayerPedId()
            local closestped, distance = GetClosestPlayer()
            if distance >= distancebreak then 
                Wait(timetobreak)
                dontrelease = false 
            else
                dontrelease = true
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if dontrelease then
            DisableControlAction(0, 0x295175BF, true)
        end
        DisableControlAction(0, 0x6E9734E8, true)
        DisableControlAction(0, 0x9CC7A1A4, true) -- disable special ability
        local size = GetNumberOfEvents(0)   
        if size > 0 then
            for i = 0, size - 1 do
                local eventAtIndex = GetEventAtIndex(0, i)
                if eventAtIndex == GetHashKey("EVENT_CHALLENGE_GOAL_COMPLETE") or eventAtIndex == GetHashKey("EVENT_CHALLENGE_REWARD") or eventAtIndex == GetHashKey("EVENT_DAILY_CHALLENGE_STREAK_COMPLETED") then 
                    Citizen.InvokeNative(0x6035E8FBCA32AC5E)
                end
            end
        end
        local player = PlayerPedId()
        local hogtied =  Citizen.InvokeNative(0x3AA24CCC0D451379, player)
        if hogtied then
            DisableControlAction(0, 0x3C0A40F2, true) -- F6
            releasecheck = true 
        else
            releasecheck = false 
        end
       --[[  Citizen.InvokeNative(0x5FB53015, 3) ]]
    end
end)
----------------
RegisterNetEvent('vorp:PlayerForceRespawn')
AddEventHandler('vorp:PlayerForceRespawn', function()
  TriggerServerEvent('col_core:delete') 
end)
----------------------------------------
Citizen.CreateThread(function() 
    ClearPedTasks(PlayerPedId())
    while true do 
        Wait(300)
        if IsControlJustReleased(0, 0xCEE12B50) then
            TriggerEvent('col_core:playnearestscenario')
        end
    end
end)

RegisterNetEvent('col_core:playnearestscenario')
AddEventHandler('col_core:playnearestscenario', function() 
    Wait(500)
    local pos = GetEntityCoords(PlayerPedId())
    starteds = not starteds
    if starteds then
        TaskUseNearestScenarioToCoord(PlayerPedId(),pos.x,pos.y,pos.z,2.0,-1,true,true,true,true)
    else
        ClearPedTasks(PlayerPedId())
    end

end)