--ml
local campfire = 0
local tent = 0
local cauldron = 0
local hitch = 0
local Table = 0
local chair = 0
local still = 0


Citizen.CreateThread(function()
	local sexe =  IsPedMale(PlayerPedId())
    local checkbox2 = false
    WarMenu.CreateMenu('ml', "Acampamento")
    WarMenu.SetSubTitle('ml', 'Menu')
	
    WarMenu.CreateSubMenu('inv1', 'ml', 'Colocar')
    WarMenu.CreateSubMenu('inv2', 'ml', 'Desmontar')
    WarMenu.CreateSubMenu('inv3', 'ml', 'Desmontar Tudo')


    while true do
        Citizen.Wait(0)
        local ped = GetPlayerPed()
        local coords = GetEntityCoords(PlayerPedId())
		local sexe =  IsPedMale(PlayerPedId())
		
        if WarMenu.IsMenuOpened('ml') then
            
            if WarMenu.MenuButton('Colocar objetos', 'inv1') then
            end
            if WarMenu.MenuButton('Desmontar objetos', 'inv2') then
            end		
            if WarMenu.MenuButton('Desmontar Tudo', 'inv3') then
            end	

            if WarMenu.Button("Colete água suja") then TriggerEvent("ml_camping:Getwater") end

            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('inv1') then

            if WarMenu.Button('Colocar Fogueira') then
            TriggerEvent("ml_camping:setcampfire")
            elseif WarMenu.Button('Colocar Tenda') then
            TriggerEvent("ml_camping:settent")
            elseif WarMenu.Button('Colocar Tenda Indiana') then
            TriggerEvent("ml_camping:settentindi")
            elseif WarMenu.Button('Colocar Caldeirão') then 
            TriggerEvent("ml_camping:setcauldron")
            elseif WarMenu.Button('Colocar Estaca') then
            TriggerEvent("ml_camping:sethitch")

            end

            WarMenu.Display()
                
        elseif WarMenu.IsMenuOpened('inv2') then
            if WarMenu.Button('Remover fogueira') then
                TriggerEvent("ml_camping:delcampfire")
            elseif WarMenu.Button('Remover Tenda') then
                TriggerEvent("ml_camping:deltent")
            elseif WarMenu.Button('Remover Tenda Indiana') then
                TriggerEvent("ml_camping:deltentindi")
            elseif WarMenu.Button('Remover Caldeirão') then 
                TriggerEvent("ml_camping:delcauldron")
            elseif WarMenu.Button('Remover Estaca') then
                TriggerEvent("ml_camping:delhitch")
            
            end

            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('inv3') then
            if WarMenu.Button('Desmontar Tudo') then
                TriggerEvent("ml_camping:delfullcamp")
            end

            WarMenu.Display()
        end
    end
end)

RegisterNetEvent('lhrcampamentos:openmenu')
AddEventHandler('lhrcampamentos:openmenu', function() 
    WarMenu.OpenMenu('ml')
end)

--setting 

RegisterNetEvent('ml_camping:setcampfire')
AddEventHandler('ml_camping:setcampfire', function()
if campfire ~= 0 then
        SetEntityAsMissionEntity(campfire)
        DeleteObject(campfire)
        campfire = 0
    end
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
    exports['progressBars']:startUI(30000, "Montando uma fogueira...")
    Citizen.Wait(30000)
    ClearPedTasksImmediately(PlayerPedId())
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
    local prop = CreateObject(GetHashKey("p_campfire02x"), x, y, z, true, false, true)
    SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(prop)
    campfire = prop

end)
RegisterNetEvent('ml_camping:settent')
AddEventHandler('ml_camping:settent', function()
 if tent ~= 0 then
        SetEntityAsMissionEntity(tent)
        DeleteObject(tent)
        tent = 0
    end
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
    exports['progressBars']:startUI(30000, "Montando uma Tenda...")
    Citizen.Wait(30000)
    ClearPedTasksImmediately(PlayerPedId())
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
    local prop = CreateObject(GetHashKey("mp005_s_posse_tent_bountyhunter07x"), x, y, z, true, false, true)
    SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(prop)
    tent = prop

end)
RegisterNetEvent('ml_camping:settentindi')
AddEventHandler('ml_camping:settentindi', function()
 if tent ~= 0 then
        SetEntityAsMissionEntity(tent)
        DeleteObject(tent)
        tent = 0
    end
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
    exports['progressBars']:startUI(30000, "Montando uma Tenda Indiana...")
    Citizen.Wait(30000)
    ClearPedTasksImmediately(PlayerPedId())
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
    local prop = CreateObject(GetHashKey("p_ambtentoilskin01x"), x, y, z, true, false, true)
    SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(prop)
    tent = prop

end)
RegisterNetEvent('ml_camping:setcauldron')
AddEventHandler('ml_camping:setcauldron', function()
if cauldron ~= 0 then
        SetEntityAsMissionEntity(cauldron)
        DeleteObject(cauldron)
        cauldron = 0
    end
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
    exports['progressBars']:startUI(30000, "Montando um Caldeirão...")
    Citizen.Wait(30000)
    ClearPedTasksImmediately(PlayerPedId())
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
    local prop = CreateObject(GetHashKey("S_CAMPFIRECOMBINED01X"), x, y, z, true, false, true)
    SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(prop)
    cauldron = prop

end)
RegisterNetEvent('ml_camping:sethitch')
AddEventHandler('ml_camping:sethitch', function()
if hitch ~= 0 then
        SetEntityAsMissionEntity(hitch)
        DeleteObject(hitch)
        hitch = 0
    end
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
    exports['progressBars']:startUI(30000, "Montando uma Estaca...")
    Citizen.Wait(30000)
    ClearPedTasksImmediately(PlayerPedId())
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
    local prop = CreateObject(GetHashKey("P_HITCHINGPOST05X"), x, y, z, true, false, true)
    SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(prop)
    hitch = prop

end)

--deleting

RegisterNetEvent('ml_camping:delcampfire')
AddEventHandler('ml_camping:delcampfire', function()
if campfire == 0 then
        print("Não há fogueira.")
    else
        SetEntityAsMissionEntity(campfire)
        DeleteObject(campfire)
        campfire = 0
    end

end)
RegisterNetEvent('ml_camping:deltent')
AddEventHandler('ml_camping:deltent', function()
if tent == 0 then
        print("Não há tenda.")
    else
        SetEntityAsMissionEntity(tent)
        DeleteObject(tent)
        tent = 0
    end

end)
RegisterNetEvent('ml_camping:deltentindi')
AddEventHandler('ml_camping:deltentindi', function()
if tent == 0 then
        print("Não há tenda.")
    else
        SetEntityAsMissionEntity(tent)
        DeleteObject(tent)
        tent = 0
    end

end)
RegisterNetEvent('ml_camping:delcauldron')
AddEventHandler('ml_camping:delcauldron', function()
if cauldron == 0 then
        print("Não há caldeirão.")
    else
        SetEntityAsMissionEntity(cauldron)
        DeleteObject(cauldron)
        cauldron = 0
    end

end)
RegisterNetEvent('ml_camping:delhitch')
AddEventHandler('ml_camping:delhitch', function()
if hitch == 0 then
        print("Não há Estacas.")
    else
        SetEntityAsMissionEntity(hitch)
        DeleteObject(hitch)
        hitch = 0
    end

end)
-- deleting all

RegisterNetEvent('ml_camping:delfullcamp')
AddEventHandler('ml_camping:delfullcamp', function()
    TriggerEvent("ml_camping:delcampfire")
    Citizen.Wait(0)
    TriggerEvent("ml_camping:deltent")
    Citizen.Wait(0)
    TriggerEvent("ml_camping:deltent2")
    Citizen.Wait(0)
    TriggerEvent("ml_camping:deltent3")
    Citizen.Wait(0)
    TriggerEvent("ml_camping:deltentindi")
    Citizen.Wait(0)
    TriggerEvent("ml_camping:deltentindi2")
    Citizen.Wait(0)
    TriggerEvent("ml_camping:deltentindi3")
    Citizen.Wait(0)
    TriggerEvent("ml_camping:deltentindi4")
    Citizen.Wait(0)
    TriggerEvent("ml_camping:delcauldron")
    Citizen.Wait(0)
    TriggerEvent("ml_camping:delhitch")
    Citizen.Wait(0)
    TriggerEvent("ml_camping:deltable")
    Citizen.Wait(0)
    TriggerEvent("ml_camping:delchair")

end)