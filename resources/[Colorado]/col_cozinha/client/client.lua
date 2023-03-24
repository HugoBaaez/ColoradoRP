local keys = { ['G'] = 0x760A9C6F, ['S'] = 0xD27782E3, ['W'] = 0x8FD015D8, ['H'] = 0x24978A28, ['G'] = 0x5415BE48, ["ENTER"] = 0xC7B5340A, ['E'] = 0xDFF812F9,["BACKSPACE"] = 0x156F7119 }
local campfire = 0

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
}

--menu
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2)
		local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
		--local campfire = GetClosestObjectOfType(x, y, z, 3.0, GetHashKey("p_campfire02x"), true)
		--local cauldron = GetClosestObjectOfType(x, y, z, 3.0, GetHashKey("S_CAMPFIRECOMBINED01X"), true)
		
		local cauldron = DoesObjectOfTypeExistAtCoords(x, y, z, 1.5, GetHashKey("S_CAMPFIRECOMBINED01X"), true)
		local campfire = DoesObjectOfTypeExistAtCoords(x, y, z, 1.5, GetHashKey("p_campfire02x"), true)
		
		if cauldron or campfire then 
            TriggerEvent("vorp:Tip", "Pressione G para cozinhar", 1000)
			if IsControlJustReleased(0, 0x760A9C6F) then -- g
				TriggerEvent("def_cookfood:cookchad")
			end
		end
	end
end)

Citizen.CreateThread(function()
    WarMenu.CreateMenu('campfire', "Cozinha")
    WarMenu.SetSubTitle('campfire', 'Menu de cozinha')
    WarMenu.CreateSubMenu('cook', 'campfire', 'Comida')
    WarMenu.CreateSubMenu('cook2', 'campfire', 'Líquidos')
  

    while true do
        local ped = GetPlayerPed(-1)
        local coords = GetEntityCoords(PlayerPedId())

        if WarMenu.IsMenuOpened('campfire') then
            if WarMenu.MenuButton('Cozinhar carne', 'cook') then end
            if WarMenu.MenuButton('purificar a água', 'cook2') then
            end
            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('cook') then
            if WarMenu.Button('Cozinhar bife de javali') then
					TriggerServerEvent("def_cookfood:pork")
                    WarMenu.CloseMenu()
            elseif WarMenu.Button('Cozinhar carne de peru') then
                    TriggerServerEvent("def_cookfood:tacchino")
                    WarMenu.CloseMenu()
            elseif WarMenu.Button('Cozinhar carne de alce') then
                    TriggerServerEvent("def_cookfood:alce")
                    WarMenu.CloseMenu()
            elseif WarMenu.Button('Cozinhar carne de veado') then
                    TriggerServerEvent("def_cookfood:veado")
                    WarMenu.CloseMenu()
            elseif WarMenu.Button('Cozinhar Bluegill') then
                    TriggerServerEvent("def_cookfood:bluegill")
                    WarMenu.CloseMenu()
            end
            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('cook2') then 
            if WarMenu.Button('Purificar a água') then
                TriggerServerEvent("def_cookfood:getwater")
                WarMenu.CloseMenu()           

			end
   
            WarMenu.Display()
		
        end
        Citizen.Wait(0)
    end
end)

--RegisterCommand("cookfood", function(source, args, rawCommand) -- craft COMMAND
AddEventHandler('def_cookfood:cookchad', function()
    if campfire ~= 0 then
    SetEntityAsMissionEntity(campfire)
    DeleteObject(campfire)
    campfire = 0
    end
    local playerPed = PlayerPedId()
    Citizen.Wait(0)
    ClearPedTasksImmediately(PlayerPedId())
    WarMenu.OpenMenu('campfire')
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), -1, true, false, false, false)

    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
    --local prop = CreateObject(GetHashKey("p_campfire02x"), x, y, z, true, false, true)
    SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(prop)
    campfire = prop

--end, false)
end)


RegisterNetEvent('def_cookfood:clean')
AddEventHandler('def_cookfood:clean', function()

    local playerPed = PlayerPedId()
	cleanWater = true
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 28000, true, false, false, false)
    exports['progressBars']:startUI(28000, "Fervendo a água...")
    Citizen.Wait(28000)
    ClearPedTasksImmediately(PlayerPedId())

end)

RegisterNetEvent('def_cookfood:cookmeat')
AddEventHandler('def_cookfood:cookmeat', function()

    local playerPed = PlayerPedId()
    --TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 27000, true, false, false, false)
    exports['progressBars']:startUI(27000, "Cozinhando...")
   -- Citizen.Wait(27000)
   -- ClearPedTasksImmediately(PlayerPedId())

end)

function whenKeyJustPressed(key)
    if Citizen.InvokeNative(0x580417101DDB492F, 0, key) then
        return true
    else
        return false
    end
end
-----------------------------------------------------------COOKING 
local isAlreadyCollecting = false
RegisterNetEvent('ml_camping:Getwater')
AddEventHandler('ml_camping:Getwater', function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local Water = Citizen.InvokeNative(0x5BA7A68A346A5A91,coords.x+3, coords.y+3, coords.z)
    local canCollect = false
    for k,v in pairs(WaterTypes) do 
        if Water == WaterTypes[k]["waterhash"]  then
            canCollect = true           
            break            
        end
    end
    if canCollect and not isAlreadyCollecting then
        isAlreadyCollecting = true
        TaskStartScenarioInPlace(ped, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 20000, true, false, false, false)
		exports['progressBars']:startUI(20000, "Coletando água...")
		Citizen.Wait(20000)

        ClearPedTasksImmediately(ped)
        ClearPedSecondaryTask(ped)
        
        TriggerServerEvent("collect")
        isAlreadyCollecting = false
      
    else
        TriggerEvent("redemrp_notification:start", "Você não pode coletar água aqui!", 3)
    end
end)