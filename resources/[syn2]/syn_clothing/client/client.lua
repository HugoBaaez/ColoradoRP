local list = {}
local list_f = {}
local b_list = {}
local b_list_f = {}

local legs = nil
local legs2 = nil
local torso = nil
local torso2 = nil
local ComponentNumber = {}
local skininfoz

local cam = nil
local c_zoom = 2.8
local c_offset = -0.15
local isCreatorOpened = false
local prompts = GetRandomIntInRange(0, 0xffffff) --new

function ShowSkinCreator(enable)

    local _elements = list
    if not IsPedMale(PlayerPedId()) then
        _elements = list_f
    end
    SendNUIMessage({
        openSkinCreator = enable,
        elements = _elements,
        numbers = ComponentNumber,
        translation = Config.Label
    })
    SetNuiFocus(enable, enable)
    isCreatorOpened = enable
end


function reversedipairsiter(t, i)
    i = i - 1
    if i ~= 0 then
        return i, t[i]
    end
end

function reversedipairs(t)
    return reversedipairsiter, t, #t + 1
end

Citizen.CreateThread(function()
    for i,v in reversedipairs(cloth_hash_names) do
        if v.category_hashname ~= "BODIES_LOWER"
            and v.category_hashname ~= "BODIES_UPPER"
            and  v.category_hashname ~= "heads"
            and  v.category_hashname ~= "hair"
            --and  v.category_hashname ~= "teeth"
            and  v.category_hashname ~= "eyes"
            and  v.category_hashname ~= "beards_chin"
            and  v.category_hashname ~= "beards_chops"
            and  v.category_hashname ~= ""
            and  v.category_hashname ~= "beards_mustache" then
            if v.ped_type == "female" and v.is_multiplayer then
                ComponentNumber[v.category_hashname] = 1
                if list_f[v.category_hashname] == nil then
                    list_f[v.category_hashname] = {}
                end
                table.insert(list_f[v.category_hashname], v.hash)
            elseif v.ped_type == "male" and v.is_multiplayer then
                ComponentNumber[v.category_hashname] = 1
                if  list[v.category_hashname] == nil then
                    list[v.category_hashname] = {}
                end
                table.insert(list[v.category_hashname], v.hash)
            end
        end
    end   
end)

Citizen.CreateThread(function()
    Wait(500)
    print("started")
    getskin()
end)

function getskin()
    TriggerServerEvent("syn_clothing:getinfo")
    Wait(500)
end
RegisterNetEvent('syn_clothing:recinfo')
AddEventHandler('syn_clothing:recinfo', function(skininfo)
    skininfoz = json.decode(skininfo)
    torso = skininfoz.BodyType
    legs = skininfoz.LegsType
end)

RegisterNetEvent('syn_clothing:OpenClothingMenu')
AddEventHandler('syn_clothing:OpenClothingMenu', function(clothes)
    local _clothes = json.decode(clothes)
    local temp = ""
    getskin()
	for i,v  in pairs(_clothes) do
        if i =="Pant" then 
            temp = "pants"
        elseif i =="Accessories" then 
            temp = "accessories"
        elseif i =="Buckle" then 
            temp = "belt_buckles"
        elseif i =="Spurs" then 
            temp = "boot_accessories"
        elseif i =="Belt" then 
            temp = "belts"
        elseif i =="Boots" then 
            temp = "boots"
        elseif i =="Chap" then 
            temp = "chaps"
        elseif i =="Skirt" then 
            temp = "skirts"
        elseif i =="Gunbelt" then 
            temp = "gunbelts"
        elseif i =="CoatClosed" then 
            temp = "coats_closed"
        elseif i =="GunbeltAccs" then 
            temp = "gunbelt_accs"
        elseif i =="bow" then 
            temp = "hair_accessories"
        elseif i =="armor" then 
            temp = "armor"
        elseif i =="teeth" then 
            temp = "teeth"
        elseif i =="Satchels" then 
            temp = "satchels"
        elseif i =="Loadouts" then 
            temp = "loadouts"
        elseif i =="Gauntlets" then 
            temp = "gauntlets"
        elseif i =="Spats" then 
            temp = "spats"
        elseif i =="Holster" then 
            temp = "holsters_left"
        elseif i =="RingLh" then 
            temp = "jewelry_rings_left"
        elseif i =="RingRh" then 
            temp = "jewelry_rings_right"
        elseif i =="Glove" then 
            temp = "gloves"
        elseif i =="Cloak" then 
            temp = "cloaks"
        elseif i =="Poncho" then 
            temp = "ponchos"
        elseif i =="Coat" then 
            temp = "coats"
        elseif i =="Vest" then 
            temp = "vests"
        elseif i =="Suspender" then 
            temp = "suspenders"
        elseif i =="Shirt" then 
            temp = "shirts_full"
        elseif i =="NeckTies" then 
            temp = "neckties"
        elseif i =="NeckWear" then 
            temp = "neckwear"
        elseif i =="EyeWear" then 
            temp = "eyewear"
        elseif i =="Mask" then 
            temp = "masks"
        elseif i =="Hat" then 
            temp = "hats"
        elseif i =="Bracelet" then 
            temp = "jewelry_bracelets"
        end
        ComponentNumber[temp] = tonumber(v)
 
    end
    ShowSkinCreator(true)
    camera(2.8,-0.15)
    PromptSetVisible(openShop, false)--new
end)

RegisterCommand("closeui", function(source, args)
    ShowSkinCreator(false)
    destory()
    Wait(200)
    ExecuteCommand('rc')
    PromptSetVisible(openShop, 1) --new
end)

RegisterNUICallback('exit', function()
    ShowSkinCreator(false)
    destory()
    Wait(200)
    ExecuteCommand('rc')
    PromptSetVisible(openShop, 1) --new
end)

RegisterNUICallback('saveClothes', function(data)
    SetNuiFocus(false, false)
    local ped = PlayerPedId()
    local hashx = 0
    local clothingtostore = {}
    local saveOutfit = false
    local namex = ""
    for k,v in pairs(data) do
        if k == "name" then 
            namex = v
        end
        if IsPedMale(PlayerPedId()) then
            if v ~= nil and k ~= "name" then
                local temp 
                hashx = list[k][tonumber(v)]
                if k =="pants" then 
                    temp = "Pant"
                elseif k =="accessories" then 
                    temp = "Accessories"
                elseif k =="belt_buckles" then 
                    temp = "Buckle"
                elseif k =="boot_accessories" then 
                    temp = "Spurs"
                elseif k =="belts" then 
                    temp = "Belt"
                elseif k =="boots" then 
                    temp = "Boots"
                elseif k =="chaps" then 
                    temp = "Chap"
                elseif k =="hair_accessories" then 
                    temp = "bow"
                elseif k =="armor" then 
                    temp = "armor"
                elseif k =="teeth" then 
                    temp = "teeth"
                elseif k =="skirts" then 
                    temp = "Skirt"
                elseif k =="gunbelts" then 
                    temp = "Gunbelt"
                elseif k =="coats_closed" then 
                    temp = "CoatClosed"
                elseif k =="gunbelt_accs" then 
                    temp = "GunbeltAccs"
                elseif k =="satchels" then 
                    temp = "Satchels"
                elseif k =="loadouts" then 
                    temp = "Loadouts"
                elseif k =="gauntlets" then 
                    temp = "Gauntlets"
                elseif k =="spats" then 
                    temp = "Spats"
                elseif k =="holsters_left" then 
                    temp = "Holster"
                elseif k =="jewelry_rings_left" then 
                    temp = "RingLh"
                elseif k =="jewelry_rings_right" then 
                    temp = "RingRh"
                elseif k =="gloves" then 
                    temp = "Glove"
                elseif k =="cloaks" then 
                    temp = "Cloak"
                elseif k =="ponchos" then 
                    temp = "Poncho"
                elseif k =="coats" then 
                    temp = "Coat"
                elseif k =="vests" then 
                    temp = "Vest"
                elseif k =="suspenders" then 
                    temp = "Suspender"
                elseif k =="shirts_full" then 
                    temp = "Shirt"
                elseif k =="neckties" then 
                    temp = "NeckTies"
                elseif k =="neckwear" then  
                    temp = "NeckWear"
                elseif k =="eyewear" then 
                    temp = "EyeWear"
                elseif k =="masks" then 
                    temp = "Mask"
                elseif k =="hats" then 
                    temp = "Hat"
                elseif k =="jewelry_bracelets" then 
                    temp = "Bracelet"
                end 
                if v == "1" then 
                    clothingtostore[temp] = -1
                else
                    clothingtostore[temp] = hashx
                end
            end
        else
            if v ~= nil and k ~= "name" then
                local temp  
                hashx = list_f[k][tonumber(v)]
                if k =="pants" then 
                    temp = "Pant"
                elseif k =="accessories" then 
                    temp = "Accessories"
                elseif k =="belt_buckles" then 
                    temp = "Buckle"
                elseif k =="boot_accessories" then 
                    temp = "Spurs"
                elseif k =="belts" then 
                    temp = "Belt"
                elseif k =="boots" then 
                    temp = "Boots"
                elseif k =="chaps" then 
                    temp = "Chap"
                elseif k =="skirts" then 
                    temp = "Skirt"
                elseif k =="gunbelts" then 
                    temp = "Gunbelt"
                elseif k =="hair_accessories" then 
                    temp = "bow"
                elseif k =="armor" then 
                    temp = "armor"
                elseif k =="teeth" then 
                    temp = "teeth"
                elseif k =="coats_closed" then 
                    temp = "CoatClosed"
                elseif k =="gunbelt_accs" then 
                    temp = "GunbeltAccs"
                elseif k =="satchels" then 
                    temp = "Satchels"
                elseif k =="loadouts" then 
                    temp = "Loadouts"
                elseif k =="gauntlets" then 
                    temp = "Gauntlets"
                elseif k =="spats" then 
                    temp = "Spats"
                elseif k =="holsters_left" then 
                    temp = "Holster"
                elseif k =="jewelry_rings_left" then 
                    temp = "RingLh"
                elseif k =="jewelry_rings_right" then 
                    temp = "RingRh"
                elseif k =="gloves" then 
                    temp = "Glove"
                elseif k =="cloaks" then 
                    temp = "Cloak"
                elseif k =="ponchos" then 
                    temp = "Poncho"
                elseif k =="coats" then 
                    temp = "Coat"
                elseif k =="vests" then 
                    temp = "Vest"
                elseif k =="suspenders" then 
                    temp = "Suspender"
                elseif k =="shirts_full" then 
                    temp = "Shirt"
                elseif k =="neckties" then 
                    temp = "NeckTies"
                elseif k =="neckwear" then  
                    temp = "NeckWear"
                elseif k =="eyewear" then 
                    temp = "EyeWear"
                elseif k =="masks" then 
                    temp = "Mask"
                elseif k =="hats" then 
                    temp = "Hat"
                elseif k =="jewelry_bracelets" then 
                    temp = "Bracelet"
                end 
                if v == "1" then
                    clothingtostore[temp] = -1
                else
                    clothingtostore[temp] = hashx
                end
                
            end        
        end 
    end
    FreezeEntityPosition(ped, false)
    if IsPedMale(PlayerPedId()) then
        clothingtostore["Skirt"] = -1
        clothingtostore["bow"] = -1
    end
    destory()
    local clothz = json.encode(clothingtostore)
    TriggerServerEvent("syn_clothing:buyoutfit", clothz,namex)
    ShowSkinCreator(false)
    PromptSetVisible(openShop, true) --new
end)

RegisterNetEvent('syn_clothing:successfulpayment')
AddEventHandler('syn_clothing:successfulpayment', function(jsonCloths)
    local skinz = json.encode(skininfoz)
    TriggerEvent("vorpcharacter:loadPlayerSkin", skinz, jsonCloths)
    TriggerServerEvent("syn_clothing:setoutfit", jsonCloths) 
end)



RegisterNUICallback('updateClothes', function(data)
    for k,v in pairs(data) do
       if k ~= "name" then 
            if ComponentNumber[k] ~=  tonumber(v) and v ~= nil then
                ComponentNumber[k] = tonumber(v)
                if IsPedMale(PlayerPedId()) then
                    Change(v, list, k)
                else
                    Change(v, list_f, k)
                end
            end
        end
    end
end)

function Change(id, t , category)
    local hash = t[category][tonumber(id)]
    
    if ComponentNumber[category] <= 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), GetHashKey(category), 0)
        if category == "pants" or category == "boots" then
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),tonumber(legs),false,true,true)
        end

        if category == "shirts_full" then
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),tonumber(torso),false,true,true)
        end
    else
        Citizen.InvokeNative(0xD3A7B003ED343FD9 , PlayerPedId(),  tonumber(hash), false, true, true)
    end
    Citizen.InvokeNative(0x704C908E9C405136, PlayerPedId())
    Citizen.InvokeNative(0xAAB86462966168CE, PlayerPedId(), 1)
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
end





local headingss = 334.00
RegisterNUICallback('heading', function(data)
    local playerPed = PlayerPedId()
    headingss = headingss + data.value
    SetEntityHeading(playerPed, headingss)
end)


RegisterNUICallback('camera', function(data)
    if data.zoom ~= nil then
        if c_zoom + data.zoom < 2.8 and  c_zoom + data.zoom > 0.7 then
            c_zoom = c_zoom + data.zoom
        end
    end
    if data.offset ~= nil then
        if  c_offset + data.offset < 1.2 and  c_offset + data.offset > -1.0 then
            c_offset = c_offset + data.offset
        end
    end
    camera(c_zoom ,c_offset)
end)

RegisterNUICallback('defcam', function(data)
    camera(2.8,-0.15)
    c_zoom = 2.8
    c_offset = -0.15
end)

function destory()
    SetCamActive(cam, false)
    RenderScriptCams(false, true, 500, true, true)
    DisplayHud(true)
    DisplayRadar(true)
    DestroyAllCams(true)
    cam = nil
end

function camera(zoom, offset)
    DestroyAllCams(true)
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)
    local heading = 45.0
    local zoomOffset = zoom
    local camOffset = offset
    local angle = heading * math.pi / 180.0
    local theta = {
        x = math.cos(angle),
        y = math.sin(angle)
    }
    local pos = {
        x = coords.x + (zoomOffset * theta.x),
        y = coords.y + (zoomOffset * theta.y)
    }
    local angleToLook = heading - 140.0
    if angleToLook > 360 then
        angleToLook = angleToLook - 360
    elseif angleToLook < 0 then
        angleToLook = angleToLook + 360
    end
    angleToLook = angleToLook * math.pi / 180.0
    local thetaToLook = {
        x = math.cos(angleToLook),
        y = math.sin(angleToLook)
    }
    local posToLook = {
        x = coords.x + (zoomOffset * thetaToLook.x),
        y = coords.y + (zoomOffset * thetaToLook.y)
    }
    local add = (1.3*zoom)
    SetEntityHeading(playerPed, headingss)
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", pos.x, pos.y, coords.z + camOffset, 300.00,0.00,0.00, 40.00, false, 0)
    PointCamAtCoord(cam, posToLook.x-add, posToLook.y, coords.z + camOffset)
    SetCamActive(cam, true)
    RenderScriptCams(true, true, 500, true, true)
    DisplayHud(false)
    DisplayRadar(false)
end

Citizen.CreateThread(function()
    for k,v in pairs(Config.Zones) do
        if v.blip then 
            local blip = N_0x554d9d53f696d002(1664425300, v.x,v.y,v.z)
            SetBlipSprite(blip, Config.BlipSprite, 1)
            SetBlipScale(blip, Config.BlipScale)
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, Config.BlipName)
        end
    end
    for k,v in pairs(Config.Cloakroom) do
        if v.blip then 
            local blip = N_0x554d9d53f696d002(1664425300, v.x,v.y,v.z)
            SetBlipSprite(blip, Config.BlipSpriteCloakRoom, 1)
            SetBlipScale(blip, Config.BlipScale)
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, Config.BlipNameCloakRoom)
        end
    end
end)





local Outfits_tab = {}
RegisterNetEvent('syn_clothing:OpenOutfits')
AddEventHandler('syn_clothing:OpenOutfits', function()
    getskin()
    TriggerServerEvent('syn_clothing:getOutfits')
end)

RegisterNetEvent('syn_clothing:putInTable')
AddEventHandler('syn_clothing:putInTable', function(outfit)
    Outfits_tab = {}
    for i, k in pairs(outfit) do
        table.insert(Outfits_tab, {title = outfit[i].title, comps = outfit[i].comps, id = outfit[i].id})
    end
    Outfits()
end)



MenuData = {}
TriggerEvent("menuapi:getData",function(call)
    MenuData = call
end)

function Outfits()
    local elements_outfits = {}

    if Outfits_tab ~= nil then
        for j, z in pairs(Outfits_tab) do
            table.insert (elements_outfits , {label = Outfits_tab[j].title, value = Outfits_tab[j].comps , desc =  Outfits_tab[j].id })
        end
    end


    MenuData.CloseAll()


    MenuData.Open(

        'default', GetCurrentResourceName(), 'outfits_menu',

        {

            title    = 'Outfits',

            subtext    = 'Choose your outfit',

            align    = 'top-left',

            elements = elements_outfits,

        },

        function(data, menu)
            OutfitsManage(data.current)
        end,

        function(data, menu)

            menu.close()
           

        end
        
    )
    
end
local elements_outfits_manage = {
    {label = "Put On", value = "SetOutfits" , desc =  "Put on your outfit" },
    {label = "Delete Outfit", value = "DeleteOutfit" , desc =  "Delete your outfit" },



}
function OutfitsManage(outfit)

    MenuData.CloseAll()
    MenuData.Open(
        'default', GetCurrentResourceName(), 'outfits_menu_manage',

        {

            title    = 'Outfits',

            subtext    = 'Actions',

            align    = 'top-left',

            elements = elements_outfits_manage,

        },
      
        function(data, menu)
            menu.close()
            if(data.current.value == 'SetOutfits') then
                TriggerEvent("syn_clothing:setoutfit",outfit)
            end
            if(data.current.value == 'DeleteOutfit') then
                TriggerServerEvent("syn_clothing:DeleteOutfit",outfit)
            end
          
        end,

        function(data, menu)

            Outfits()


        end

    )
 
end
RegisterNetEvent('syn_clothing:setoutfit')
AddEventHandler('syn_clothing:setoutfit', function(jsonCloths)
    local skinz = json.encode(skininfoz)
    TriggerEvent("vorpcharacter:loadPlayerSkin", skinz, jsonCloths.value)
    TriggerServerEvent("syn_clothing:setoutfit", jsonCloths.value)
end)
local active = false
local target


Citizen.CreateThread(function()
    while true do
        Wait(1)
        local canwait = true
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        if isCreatorOpened then
            DrawLightWithRange(coords.x+1 , coords.y+1 , coords.z + 1, 255, 255, 255, 2.5 ,10.0)
        end
        for k,v in pairs(Config.Zones) do
            local dist =  Vdist(coords, v.x,v.y,v.z)
            if dist < 2 then
                if dist  < 20 then
                    canwait = false
                end
                local label  = CreateVarString(10, 'LITERAL_STRING', Config.store)--new
                PromptSetActiveGroupThisFrame(prompts, label) --new
                if Citizen.InvokeNative(0xC92AC953F0A982AE,openShop) then --new
                
                    TriggerServerEvent("syn_clothing:loadClothes")
                end
           
                
            end
        end
        if canwait then
            Wait(1000)
        end

    end
end)

--prompt
Citizen.CreateThread(function()
    Citizen.Wait(5000)
    local str = Config.open
	openShop = PromptRegisterBegin()
	PromptSetControlAction(openShop, Config.OpenKey)
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(openShop, str)
	PromptSetEnabled(openShop, 1)
	PromptSetVisible(openShop, 1)
	PromptSetStandardMode(openShop,1)
    PromptSetHoldMode(openShop, 1)
	PromptSetGroup(openShop, prompts)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,openShop,true)
	PromptRegisterEnd(openShop)
end)



local active2 = false
local target2
Citizen.CreateThread(function()
    while true do
        Wait(1)
        local canwait = true
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        for k,v in pairs(Config.Cloakroom) do
            local dist =  Vdist(coords, v.x,v.y,v.z)
            if dist < 2 then
                if dist  < 20 then
                    canwait = false
                end
                
                local label  = CreateVarString(10, 'LITERAL_STRING', Config.room)--new
                PromptSetActiveGroupThisFrame(prompts, label)--new
                if Citizen.InvokeNative(0xC92AC953F0A982AE,openShop) then--new
                
                    TriggerEvent('syn_clothing:OpenOutfits')
                end
           
            end
        end
        if canwait then
            Wait(1000)
        end
    end
end)

