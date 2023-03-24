----------------------------REDEMRP_MENU----------------------------
MenuData = {}
TriggerEvent("menuapi:getData",function(call)
    MenuData = call
end)
----------------------------END REDEMRP_MENU----------------------------

----------------------------NATIVES----------------------------
function TaskFlyingCircle(ped, f1, v3,f2,f3)
    return Citizen.InvokeNative(0x72997893BFB8ECCC,ped, f1, v3,f2,f3)
end
--------------------------------------------------------
function TaskFlyToCoord(ped, f1, x, y, z, p1, p2)
    return Citizen.InvokeNative(0xD6CFC2D59DA72042, ped, f1, x, y, z, p1, p2)
end
--------------------------------------------------------
function IsEntityFrozen(ped)
    return Citizen.InvokeNative(0x083D497D57B7400F, ped)
end
--------------------------------------------------------
function SetBlockingOfNonTemporaryEvents(ped, toggle)
    return Citizen.InvokeNative(0x9F8AA94D6D97DBF4, ped, toggle)
end
--------------------------------------------------------
function TaskFlyAway(ped, ped2)
    return Citizen.InvokeNative(0xE86A537B5A3C297C, ped, ped2)
end
--------------------------------------------------------
function IsPedClimbingLadder(ped)
    return Citizen.InvokeNative(0x59643424B68D52B5,ped)
end
--------------------------------------------------------
function IsPedHogtying(ped)
    return Citizen.InvokeNative(0x42429C674B61238B,ped)
end
--------------------------------------------------------
function IsPedHogtied(ped)
    return Citizen.InvokeNative(0x3AA24CCC0D451379,ped)
end
--------------------------------------------------------
function IsThisModelAHorse(model)
    return Citizen.InvokeNative(0x772A1969F649E902, model)
end
--------------------------------------------------------
function StopCurrentPlayingAmbientSpeech()
    return Citizen.InvokeNative(0xB8BEC0CA6F0EDB0F, 8, 400)
end
--------------------------------------------------------
function StopCurrentPlayingSpeech()
    return Citizen.InvokeNative(0x79D2F0E66F81D90D, 8, 200) 
end
----------------------------VARIABLES----------------------------
local playerCoords = nil
local playerDead = nil
local menuOpen = false

local CalledBird = nil
local attachConfig = nil
local BirdName = nil

local birdOnShoulder = false
local birdIsFollowing = false
local birdIsFlytoPed = false
local birdisFlyingHome = false
local birdisHunting = false

local preyID = nil
local preyXP

local tempBird = nil

local Camera = nil
local MENUTEXTS = Config.Texts.Menu
local TEXTURES = Config.Textures

local BirdShopBlips = {}
local ownedBirds = {}
local CalledBirdData = {}

local selectedScavItem = nil

local AreaC = Citizen.InvokeNative(0xB3FB80A32BAE3065, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 2.0)
local itemS = CreateItemset(1)
local nearby = false
local deathEntities = {}

local selling = false
local SellPointsC = {}

local talking = false
----------------------------PROMPTS----------------------------
local BirdShopPrompt
local ShopPrompts = GetRandomIntInRange(0, 0xffffff)
--------------------------------------------------------
local OnShoulderPrompts = GetRandomIntInRange(0, 0xffffff)
local SendHomePrompt
local FollowPrompt
local BirdSellPrompt
local HuntPrompt
local TalkPrompt
--------------------------------------------------------
local OnFollowPrompts = GetRandomIntInRange(0, 0xffffff)
local FlyBackPrompt
local CameraPrompt 
--------------------------------------------------------
local StopSellPrompt
local SellPrompts = GetRandomIntInRange(0, 0xffffff)
--------------------------------------------------------
local BuyBirdPrompt
local BuyBirdPrompts = GetRandomIntInRange(0, 0xffffff)
--------------------------------------------------------
function SetupBirdPrompts()

    local strt = Config.Prompts.Talk[2]
    TalkPrompt = PromptRegisterBegin()
    PromptSetControlAction(TalkPrompt, Config.Prompts.Talk[1])
    strt = CreateVarString(10, 'LITERAL_STRING', strt)
    PromptSetText(TalkPrompt, strt)
    PromptSetEnabled(TalkPrompt, 1)
    PromptSetVisible(TalkPrompt, 1)
	PromptSetStandardMode(TalkPrompt,1)
	PromptSetGroup(TalkPrompt, OnShoulderPrompts)
    Citizen.InvokeNative(0xC5F428EE08FA7F2C,TalkPrompt,true)
	PromptRegisterEnd(TalkPrompt)

    local str = Config.Prompts.Home[2]
    SendHomePrompt = PromptRegisterBegin()
    PromptSetControlAction(SendHomePrompt, Config.Prompts.Home[1])
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(SendHomePrompt, str)
    PromptSetEnabled(SendHomePrompt, 1)
    PromptSetVisible(SendHomePrompt, 1)
	PromptSetStandardMode(SendHomePrompt,1)
	PromptSetGroup(SendHomePrompt, OnShoulderPrompts)
	PromptRegisterEnd(SendHomePrompt)

    Citizen.Wait(1)

    local str2 = Config.Prompts.Follow[2]
    FollowPrompt = PromptRegisterBegin()
    PromptSetControlAction(FollowPrompt, Config.Prompts.Follow[1])
    str2 = CreateVarString(10, 'LITERAL_STRING', str2)
    PromptSetText(FollowPrompt, str2)
    PromptSetEnabled(FollowPrompt, 1)
    PromptSetVisible(FollowPrompt, 1)
	PromptSetStandardMode(FollowPrompt,1)
	PromptSetGroup(FollowPrompt, OnShoulderPrompts)
    Citizen.InvokeNative(0xC5F428EE08FA7F2C,FollowPrompt,true)
	PromptRegisterEnd(FollowPrompt)

    Citizen.Wait(1)

    local str3 = Config.Prompts.Hunt[2]
    HuntPrompt = PromptRegisterBegin()
    PromptSetControlAction(HuntPrompt, Config.Prompts.Hunt[1])
    str3 = CreateVarString(10, 'LITERAL_STRING', str3)
    PromptSetText(HuntPrompt, str3)
    PromptSetEnabled(HuntPrompt, 1)
    PromptSetVisible(HuntPrompt, 1)
	PromptSetStandardMode(HuntPrompt,1)
	PromptSetGroup(HuntPrompt, OnShoulderPrompts)
    Citizen.InvokeNative(0xC5F428EE08FA7F2C,HuntPrompt,true)
	PromptRegisterEnd(HuntPrompt)

    Citizen.Wait(1)

    local str4 = Config.Prompts.FlyBack[2]
    FlyBackPrompt = PromptRegisterBegin()
    PromptSetControlAction(FlyBackPrompt, Config.Prompts.FlyBack[1])
    str4 = CreateVarString(10, 'LITERAL_STRING', str4)
    PromptSetText(FlyBackPrompt, str4)
    PromptSetEnabled(FlyBackPrompt, 1)
    PromptSetVisible(FlyBackPrompt, 1)
	PromptSetStandardMode(FlyBackPrompt,1)
	PromptSetGroup(FlyBackPrompt, OnFollowPrompts)
    Citizen.InvokeNative(0xC5F428EE08FA7F2C,FlyBackPrompt,true)
	PromptRegisterEnd(FlyBackPrompt)

 --[[   Citizen.Wait(1)

    local str5 = Config.Prompts.Camera[2]
    CameraPrompt = PromptRegisterBegin()
    PromptSetControlAction(CameraPrompt, Config.Prompts.Camera[1])
    str5 = CreateVarString(10, 'LITERAL_STRING', str5)
    PromptSetText(CameraPrompt, str5)
    PromptSetEnabled(CameraPrompt, 1)
    PromptSetVisible(CameraPrompt, 1)
	PromptSetStandardMode(CameraPrompt,1)
	PromptSetGroup(CameraPrompt, OnFollowPrompts)
    Citizen.InvokeNative(0xC5F428EE08FA7F2C,CameraPrompt,true)
	PromptRegisterEnd(CameraPrompt)]]

    Citizen.Wait(1)

    local str6 = Config.Prompts.ShopOpen[2]
    BirdShopPrompt = PromptRegisterBegin()
    PromptSetControlAction(BirdShopPrompt, Config.Prompts.ShopOpen[1])
    str6 = CreateVarString(10, 'LITERAL_STRING', str6)
    PromptSetText(BirdShopPrompt, str6)
    PromptSetEnabled(BirdShopPrompt, 1)
    PromptSetVisible(BirdShopPrompt, 1)
	PromptSetStandardMode(BirdShopPrompt,1)
	PromptSetGroup(BirdShopPrompt, ShopPrompts)
    Citizen.InvokeNative(0xC5F428EE08FA7F2C,BirdShopPrompt,true)
	PromptRegisterEnd(BirdShopPrompt)

    Citizen.Wait(1)

    local str7 = Config.Prompts.Sell[2]
    BirdSellPrompt = PromptRegisterBegin()
    PromptSetControlAction(BirdSellPrompt,Config.Prompts.Sell[1])
    str7 = CreateVarString(10, 'LITERAL_STRING', str7)
    PromptSetText(BirdSellPrompt, str7)
    PromptSetEnabled(BirdSellPrompt, 1)
    PromptSetVisible(BirdSellPrompt, 1)
    PromptSetStandardMode(BirdSellPrompt,1)
    PromptSetGroup(BirdSellPrompt, OnShoulderPrompts)
    Citizen.InvokeNative(0xC5F428EE08FA7F2C,BirdSellPrompt,true)
    PromptRegisterEnd(BirdSellPrompt)
end

function SetupSellPrompt()
    local strst = Config.Prompts.StopSell[2]
    StopSellPrompt = PromptRegisterBegin()
    PromptSetControlAction(StopSellPrompt, Config.Prompts.StopSell[1])
    strst = CreateVarString(10, 'LITERAL_STRING', strst)
    PromptSetText(StopSellPrompt, strst)
    PromptSetEnabled(StopSellPrompt, 1)
    PromptSetVisible(StopSellPrompt, 1)
    PromptSetStandardMode(StopSellPrompt,1)
    PromptSetGroup(StopSellPrompt, SellPrompts)
    Citizen.InvokeNative(0xC5F428EE08FA7F2C,StopSellPrompt,true)
    PromptRegisterEnd(StopSellPrompt)

    local strbb = Config.Prompts.BuyBird[2]
    BuyBirdPrompt = PromptRegisterBegin()
    PromptSetControlAction(BuyBirdPrompt, Config.Prompts.BuyBird[1])
    strbb = CreateVarString(10, 'LITERAL_STRING', strbb)
    PromptSetText(BuyBirdPrompt, strbb)
    PromptSetEnabled(BuyBirdPrompt, 1)
    PromptSetVisible(BuyBirdPrompt, 1)
    PromptSetStandardMode(BuyBirdPrompt,1)
    PromptSetGroup(BuyBirdPrompt, BuyBirdPrompts)
    Citizen.InvokeNative(0xC5F428EE08FA7F2C,BuyBirdPrompt,true)
    PromptRegisterEnd(BuyBirdPrompt)
end
----------------------------BASIC----------------------------
function GetAreaInfo(cc)
    local area = Citizen.InvokeNative(0x43AD8FC02B429D33 ,cc.x,cc.y,cc.z,12)
  for i,v in pairs(Config.Areas) do
      if area == v[3] then
          local infoa = {
              name = v[6],
              hash = v[3],
              list = v[5],
              activity = v[4],
          }
          return infoa
      end
  end
  return nil
end
--------------------------------------------------------
function GetAreaInfo2(cc)
    local area = Citizen.InvokeNative(0x43AD8FC02B429D33 ,cc.x,cc.y,cc.z,11)
  for i,v in pairs(Config.Districts) do
      if area == v[3] then
          local infoa = {
              name = v[6],
              hash = v[3],
              list = v[5],
              activity = v[4],
          }
          return infoa
      end
  end
  return nil
end
--------------------------------------------------------
function GetAreaInfo3(cc)
    local area = Citizen.InvokeNative(0x43AD8FC02B429D33 ,cc.x,cc.y,cc.z,10)
  for i,v in pairs(Config.Districts2) do
      if area == v[3] then
          local infoa = {
              name = v[6],
              hash = v[3],
              list = v[5],
              activity = v[4],
          }
          return infoa
      end
  end
  return nil
end
--------------------------------------------------------
function PlayerArea()
    local a1, a2, a3 = GetAreaInfo(playerCoords), GetAreaInfo2(playerCoords), GetAreaInfo3(playerCoords)
    local an1 = "none"
    local an2 = "none"
    local an3 = "none"
    if a1 ~= nil then
        an1 = a1.name
    end
    if a2 ~= nil then
        an2 = a2.name
    end
    if a3 ~= nil then
        an3 = a3.name
    end
    --print(an1, an2, an3)
    local area = GetAreaInfo(playerCoords) or GetAreaInfo2(playerCoords) or GetAreaInfo3(playerCoords) or "None"
    return area
end
--------------------------------------------------------
function IsBirdOfPrey(entity)
    local model = GetEntityModel(entity)
    for i,v in pairs(Config.BirdOfPreys) do
        if v == model then
            return true
        end
    end
    return false
end
--------------------------------------------------------
function IsBirdScavenger(entity)
    local model = GetEntityModel(entity)
    for i,v in pairs(Config.Scavengers) do
        if v == model then
            return true
        end
    end
    return false
end
--------------------------------------------------------
function IsBirdFisher(entity)
    local model = GetEntityModel(entity)
    for i,v in pairs(Config.FishingBirds) do
        if v == model then
            return true
        end
    end
    return false
end
----------------------------THREADS----------------------------
Citizen.CreateThread(function()

    for i, v in pairs(Config.BirdShops) do
        if v.blip.enabled == true then
            local nr = #BirdShopBlips+1
            BirdShopBlips[nr] = N_0x554d9d53f696d002(1664425300, v.pos.x, v.pos.y, v.pos.z)
            SetBlipSprite(BirdShopBlips[nr], v.blip.sprite, 1)
            SetBlipScale(BirdShopBlips[nr], 0.2)
            Citizen.InvokeNative(0x9CB1A1623062F402, BirdShopBlips[nr], v.name)
        end
    end 
    TriggerServerEvent("huntingbirds:sell:getpoints")
    SetupSellPrompt()
    SetupBirdPrompts()
    while true do
        Citizen.Wait(500)
        if PlayerPedId() then
            playerCoords = GetEntityCoords(PlayerPedId())
            playerDead = IsEntityDead(PlayerPedId())
        end
        if playerDead == 1 and CalledBird ~= nil and birdisFlyingHome == false then
            SendBirdHome(1)
        end
        if CalledBird ~= nil then
            deathEntities = {}
            if AreaC then
                Citizen.InvokeNative(0x541B8576615C33DE, AreaC, playerCoords.x, playerCoords.y, playerCoords.z)
                local found = Citizen.InvokeNative(0x886171A12F400B89, AreaC, itemS, 1)
                if found then
                    n = 0
                    while n < found do
                        deathEntities[(GetIndexedItemInItemset(n, itemS))] = true
                        n = n + 1
                    end
                end
                Citizen.InvokeNative(0x20A4BF0E09BEE146, itemS) 
            end
        end
    end
end)
--------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        if CalledBird ~= nil then
            CheckEntities()
        end
    end
end)

--------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        if birdOnShoulder == true then
            if IsPedClimbing(PlayerPedId()) 
            or IsPedClimbingLadder(PlayerPedId())
            or IsPedFalling(PlayerPedId())
            or IsPedHogtied(PlayerPedId())
            or IsPedHogtying(PlayerPedId())
            or IsPedRagdoll(PlayerPedId())
            or IsPedSwimming(PlayerPedId()) then
                FollowPlayer()
            end
        end
    end
end)
--------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if birdOnShoulder == true and menuOpen == false and birdisFlyingHome == false and nearby == false and birdisHunting == false and selling == false then
            local label  = CreateVarString(10, 'LITERAL_STRING', BirdName)
            PromptSetActiveGroupThisFrame(OnShoulderPrompts, label)
            if Citizen.InvokeNative(0xC92AC953F0A982AE,SendHomePrompt) then
                SendBirdHome(0)
            end
            if Citizen.InvokeNative(0xC92AC953F0A982AE,FollowPrompt) then
                FollowPlayer()
            end
            if Citizen.InvokeNative(0xC92AC953F0A982AE,HuntPrompt) then
                TriggerServerEvent("huntingbirds:checkhunt")
            end
            if Citizen.InvokeNative(0xC92AC953F0A982AE,TalkPrompt) then
                TriggerEvent("huntingbirds:checktalk")
            end
            if Citizen.InvokeNative(0xC92AC953F0A982AE,BirdSellPrompt) then
                if selling == false then
                    StartSellBird()
                end
            end
        end
        if birdIsFollowing == true and menuOpen == false and birdisFlyingHome == false and nearby == false and birdisHunting == false then
            local label  = CreateVarString(10, 'LITERAL_STRING', BirdName)
            PromptSetActiveGroupThisFrame(OnFollowPrompts, label)
            if Citizen.InvokeNative(0xC92AC953F0A982AE,FlyBackPrompt) then
                FlyToPlayer()
            end
          --[[if Citizen.InvokeNative(0xC92AC953F0A982AE,CameraPrompt) then
                BirdCamera()
            end]]
        end
    end
end)
--------------------------------------------------------
--[[Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if birdIsFollowing == true and menuOpen == false and birdisFlyingHome == false and nearby == false then
            local label  = CreateVarString(10, 'LITERAL_STRING', BirdName)
            PromptSetActiveGroupThisFrame(OnFollowPrompts, label)
            if Citizen.InvokeNative(0xC92AC953F0A982AE,FlyBackPrompt) then
                FlyToPlayer()
            end
            if Citizen.InvokeNative(0xC92AC953F0A982AE,CameraPrompt) then
                BirdCamera()
            end
        end
    end
end)]]
--------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2000)
        if PlayerPedId() and CalledBird ~= nil and not IsEntityFrozen(CalledBird) and birdOnShoulder == false and birdIsFlytoPed == false and birdIsFollowing == true and birdisFlyingHome == false then
            local ccc = GetEntityCoords(PlayerPedId())
            local ccp = GetEntityCoords(CalledBird)
            local cca = vector3(ccc.x,ccc.y, ccp.z)
            TaskFlyingCircle(CalledBird, 4.0, cca, 3.1, 4.1)
        end
    end
end)
--------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if playerCoords ~= nil and menuOpen == false then
            if playerDead == false then
                for i, v in pairs(Config.BirdShops) do
                    local dist = GetDistanceBetweenCoords(playerCoords.x,playerCoords.y,playerCoords.z,v.pos.x, v.pos.y, v.pos.z, true)
                    if dist < 15.0 then
                        Citizen.InvokeNative(0x2A32FAA57B937173, 0x6903B113, v.pos.x, v.pos.y, v.pos.z-1 , 0, 0, 0, 0, 0, 0, 2.0, 2.0, 0.3, Config.Checkpoints.shop[1], Config.Checkpoints.shop[2], Config.Checkpoints.shop[3], 100, 0, 0, 2, 0, 0, 0, 0)
                    end
                    if dist < 1.3 then
                        local label  = CreateVarString(10, 'LITERAL_STRING', ""..v.name.." - "..Config.Prompts.BirdShop)
                        PromptSetActiveGroupThisFrame(ShopPrompts, label)
                        if Citizen.InvokeNative(0xC92AC953F0A982AE,BirdShopPrompt) then
                            if CalledBird == nil then
                                if v.jobrequired == false then
                                    BuyBirds(i)
                                else
                                    TriggerServerEvent("huntingbirds:checkmenujob", v.jobs, i)
                                end
                            else
                                TriggerEvent("vorp:TipBottom", Config.Texts.SendHome, 6000)    
                            end
                        end
                    end
                end
            end
        end
    end
end)
------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if #SellPointsC and playerCoords ~= nil then
            for i, v in pairs(SellPointsC) do
                if tonumber(v.owner) ~= GetPlayerServerId(PlayerId()) then
                    local dist = GetDistanceBetweenCoords(playerCoords, v.sellcoords, true)
                    if dist < 10.0 then
                        Citizen.InvokeNative(0x2A32FAA57B937173, 0x6903B113, v.sellcoords.x, v.sellcoords.y, v.sellcoords.z-0.9 , 0, 0, 0, 0, 0, 0, 2.0, 2.0, 0.3, Config.Checkpoints.shop[1], Config.Checkpoints.shop[2], Config.Checkpoints.shop[3], 100, 0, 0, 2, 0, 0, 0, 0)
                    end
                    if dist < 2.0 then
                        local label  = CreateVarString(10, 'LITERAL_STRING', "$"..v.sellprice)
                        PromptSetActiveGroupThisFrame(BuyBirdPrompts, label)
                        if Citizen.InvokeNative(0xC92AC953F0A982AE,BuyBirdPrompt) then
                            TriggerServerEvent("huntingbirds:sell:buyoffer", v.owner, v.sellprice, v.id)
                        end
                    end
                end
                if tonumber(v.owner) == GetPlayerServerId(PlayerId()) then
                    local dist = GetDistanceBetweenCoords(playerCoords, v.sellcoords, true)
                    if dist < 2.0 then
                        Citizen.InvokeNative(0x2A32FAA57B937173, 0x6903B113, v.sellcoords.x, v.sellcoords.y, v.sellcoords.z-0.9 , 0, 0, 0, 0, 0, 0, 2.0, 2.0, 0.3,  Config.Checkpoints.shop[1], Config.Checkpoints.shop[2], Config.Checkpoints.shop[3], 100, 0, 0, 2, 0, 0, 0, 0)
                    end
                end
            end
        end
    end
end)
------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if selling == true then
            DisableControlAction(0, 0xF8982F00, true)
            while SellPointsC[CalledBirdData.id] == nil do
                Citizen.Wait(1)
            end
            local label  = CreateVarString(10, 'LITERAL_STRING', "Sell".."$"..SellPointsC[CalledBirdData.id].sellprice)
            PromptSetActiveGroupThisFrame(SellPrompts, label)
            if Citizen.InvokeNative(0xC92AC953F0A982AE,StopSellPrompt) then
                StopSellBird()
            end
        end
    end
end)
----------------------------FUNCTIONS----------------------------
function StartSellBird() -- findme 
    local result = nil
    TriggerEvent("syn_inputs:sendinputs", Config.Texts.confirm, Config.Texts.priceee, function(cb) -- findme
        local result =     tonumber(cb)
        if result ~= nil and result ~= "" and result > 0 then
            SellBirdPriceAdded(tonumber(result))
        end
    end)
end
----------------------------------------------------------------------------
function SellBirdPriceAdded(result)
    selling = true
    SetEntityInvincible(PlayerPedId(), true)
    TaskStandStill(PlayerPedId(), -1)
    local sc = GetEntityCoords(PlayerPedId())
    TriggerServerEvent("huntingbirds:sell:create", CalledBirdData.id, result, sc, GetPlayerServerId(PlayerId()), PedToNet(CalledBird))
end
--------------------------------------------------------
function StopSellBird()
    selling = false
    SetEntityInvincible(PlayerPedId(), false)
    ClearPedTasks(PlayerPedId())
    TriggerServerEvent("huntingbirds:sell:stop",CalledBirdData.id)
end
--------------------------------------------------------
function CheckEntities()
    if CalledBird ~= nil and GetMount(PlayerPedId()) == 0 then
        for i, v in pairs(deathEntities) do
            if DoesEntityExist(i) and not IsThisModelAHorse(GetEntityModel(i)) then
                if IsEntityDead(i) then
                    local dist = GetDistanceBetweenCoords(playerCoords, GetEntityCoords(i), true)
                    while dist < 1.5 do
                        Citizen.Wait(200)
                        dist = GetDistanceBetweenCoords(playerCoords, GetEntityCoords(i), true)
                        if nearby == false then
                            nearby = true
                        end
                    end
                    if nearby == true then
                        nearby = false
                    end
                end
            end
        end
    end
end
--------------------------------------------------------
function FollowPlayer()
    local bc = GetEntityCoords(CalledBird)
    if IsEntityFrozen(CalledBird) then
        FreezeEntityPosition(CalledBird, false)
    end
    SetEntityCollision(CalledBird, false, false)
    if IsEntityAttached(CalledBird) then
        DetachEntity(CalledBird, 1, 1)
        birdOnShoulder = false
    end
    TaskFlyAway(CalledBird, PlayerPedId())
    Citizen.Wait(2000)
    birdIsFollowing = true
    TaskFlyingCircle(CalledBird, 4.0, GetEntityCoords(CalledBird), 3.1, 4.1)
end
--------------------------------------------------------
function SendBirdHome(id)
    TriggerEvent("vorp:TipBottom", Config.Texts.GoingHome, 6000)    
    birdisFlyingHome = true
    if preyID ~= nil then
        DetachEntity(preyID, 1, 1)
        preyID = nil
    end
    if IsEntityAttached(CalledBird) then
        DetachEntity(CalledBird, 1, 1)
        birdOnShoulder = false
    end
    if IsEntityFrozen(CalledBird) then
        FreezeEntityPosition(CalledBird, false)
    end
    if IsPedStill(PlayerPedId()) == 1 then
        ClearPedTasksImmediately(PlayerPedId())
    end
    if selectedScavItem ~= nil then
        selectedScavItem = nil
    end
    SetEntityCollision(CalledBird, false, false)
    TaskFlyAway(CalledBird, PlayerPedId())
    if id == 0 then
        Citizen.Wait(7000)
    else
        Citizen.Wait(500)
    end
    if Camera ~= nil then
        DeleteBirdCam()
    end
    DeleteEntity(CalledBird)
    SetEntityAsNoLongerNeeded(CalledBird)
    CalledBird = nil
    CalledBirdData = {}
    birdIsFollowing = false
    birdIsFlytoPed = false
    birdOnShoulder = false
    birdisFlyingHome = false
    birdisHunting = false
end
--------------------------------------------------------
function FlyToPlayer()
    birdIsFlytoPed = true
    birdIsFollowing = false
    local pc = GetEntityCoords(PlayerPedId())
    TaskStandStill(PlayerPedId(),-1)
    TriggerEvent("vorp:TipBottom", Config.Texts.WaitBird, 6000)    
    ClearPedTasks(CalledBird)
    Citizen.Wait(100)
    TaskFlyToCoord(CalledBird, 1.0, pc.x, pc.y, pc.z+0.5, 1, 0)
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(500)
            local dist = GetDistanceBetweenCoords(pc, GetEntityCoords(CalledBird), true)
            if dist < 5.0 then
                local pc2 = GetEntityCoords(PlayerPedId())
                local dist2 = GetDistanceBetweenCoords(GetEntityCoords(CalledBird), pc2, true)
                if dist2 > 1.2 then
                    ClearPedTasks(CalledBird)
                    TaskFlyToCoord(CalledBird, 1.0, pc2.x, pc2.y, pc2.z+0.5, 1, 0)
                end
                while dist2 > 1.5 do
                    dist2 = GetDistanceBetweenCoords(GetEntityCoords(CalledBird), pc2, true)
                    Citizen.Wait(100)
                end
                if preyID ~= nil then
                    FreezeEntityPosition(preyID, false)
                    DetachEntity(preyID, 1, 1)
                    preyID = nil
                    birdisHunting = false
                    TriggerServerEvent("huntingbirds:addxp",preyXP, CalledBirdData.id)
                    CalledBirdData.xp = CalledBirdData.xp + preyXP
                    preyXP = nil
                end
                if selectedScavItem ~= nil then
                    TriggerServerEvent("huntingbirds:addxp",selectedScavItem.xp, CalledBirdData.id)
                    TriggerServerEvent("huntingbirds:addscavengeditem",selectedScavItem.name, selectedScavItem.amount)
                    CalledBirdData.xp = CalledBirdData.xp + selectedScavItem.xp
                    birdisHunting = false
                    selectedScavItem = nil
                end
                if Camera ~= nil then
                    DeleteBirdCam()
                end
                local model = GetEntityModel(CalledBird)
                local Attach
                if IsPedMale(PlayerPedId()) then
                    Attach = Config.BirdAttach[model].Male
                else
                    Attach = Config.BirdAttach[model].Female
                end
                AttachEntityToEntity(CalledBird, PlayerPedId(), Attach[1], Attach[2], Attach[3], Attach[4], Attach[5], Attach[6], Attach[7], false, false, true, false, 0, true, false, false)
                ClearPedTasksImmediately(CalledBird)
                SetBlockingOfNonTemporaryEvents(CalledBird, true)
                FreezeEntityPosition(CalledBird, true)
                ClearPedTasksImmediately(PlayerPedId())
                birdIsFlytoPed = false
                birdisHunting = false
                birdOnShoulder = true
                break
            end
        end
    end)
end
--------------------------------------------------------
function CreateBird(model, preset, name, xp, id)
    local playerPed = PlayerPedId()
    CalledBirdData = {
        model = model,
        preset = preset,
        name = name,
        xp = xp,
        id = id,
    }
    BirdName = name
    if CalledBird ~= nil then
        DeleteEntity(CalledBird)
        SetEntityAsNoLongerNeeded(CalledBird)
        CalledBird = nil
    end
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 20.0, 0.1))

    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(1)
    end

    CalledBird = CreatePed(model, x, y, z+20.0, GetEntityHeading(playerPed)+180, 1, 1)

    while not IsEntityAPed(CalledBird) do
        Citizen.Wait(1)
    end
    SetBlockingOfNonTemporaryEvents(CalledBird, true)
    SetEntityInvincible(CalledBird, true)
    SetEntityCollision(CalledBird, false, false)

    Citizen.InvokeNative(0x283978A15512B2FE, CalledBird, true)
	Citizen.InvokeNative(0x77FF8D35EEC6BBC4,CalledBird, preset)
	while not Citizen.InvokeNative(0xA0BC8FAED8CFEB3C,CalledBird) do
		Citizen.Wait(0)
	end

	Citizen.InvokeNative(0x704C908E9C405136, CalledBird)
	Citizen.InvokeNative(0xAAB86462966168CE, CalledBird, 1)
    Citizen.Wait(500)
    FreezeEntityPosition(CalledBird, true)
    SetModelAsNoLongerNeeded(model)
    FollowPlayer()
end
--------------------------------------------------------
function CreateBirdFromHunt(model, preset, name, preydata)
    local playerPed = PlayerPedId()
    BirdName = name
    if CalledBird ~= nil then
        DeleteEntity(CalledBird)
        SetEntityAsNoLongerNeeded(CalledBird)
        CalledBird = nil
    end
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 70.0, 0.1))

    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(1)
    end

    CalledBird = CreatePed(model, x, y, z+40.0, GetEntityHeading(playerPed)+180, 1, 1)
    while not IsEntityAPed(CalledBird) do
        Citizen.Wait(1)
    end
    SetBlockingOfNonTemporaryEvents(CalledBird, true)
    SetEntityInvincible(CalledBird, true)
    SetEntityCollision(CalledBird, false, false)

    Citizen.InvokeNative(0x283978A15512B2FE, CalledBird, true)
	Citizen.InvokeNative(0x77FF8D35EEC6BBC4,CalledBird, preset)
	while not Citizen.InvokeNative(0xA0BC8FAED8CFEB3C,CalledBird) do
		Citizen.Wait(0)
	end

	Citizen.InvokeNative(0x704C908E9C405136, CalledBird)
	Citizen.InvokeNative(0xAAB86462966168CE, CalledBird, 1)
    Citizen.Wait(500)
    SetModelAsNoLongerNeeded(model)
    if IsBirdOfPrey(CalledBird) == true then
        CreatePrey(preydata)
    elseif IsBirdScavenger(CalledBird) == true then
        selectedScavItem = CreateScavengedItem()
    elseif IsBirdFisher(CalledBird) == true then
        CreateFishPrey()
    end
    FlyToPlayer()
end
--------------------------------------------------------
function CreatePrey(preydata)
    RequestModel(preydata.model)
    while not HasModelLoaded(preydata.model) do
        Citizen.Wait(1)
    end
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 70.0, 0.1))
    preyID = CreatePed(preydata.model, x, y, z+40.0, GetEntityHeading(PlayerPedId())+180, 1, 0)
    preyXP = preydata.xp
    while not IsEntityAPed(preyID) do
        Citizen.Wait(1)
    end

    Citizen.InvokeNative(0x283978A15512B2FE, preyID, true)
	Citizen.InvokeNative(0x77FF8D35EEC6BBC4,preyID, preydata.preset)
	while not Citizen.InvokeNative(0xA0BC8FAED8CFEB3C,preyID) do
		Citizen.Wait(0)
	end

	Citizen.InvokeNative(0x704C908E9C405136, preyID)
	Citizen.InvokeNative(0xAAB86462966168CE, preyID, 1)
    Citizen.Wait(500)
    FreezeEntityPosition(preyID, true)
    Citizen.InvokeNative(0x1CE875505D45338A, preyID, 0, 0) 
    SetModelAsNoLongerNeeded(preydata.model)
    AttachEntityToEntity(preyID, CalledBird, 7, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, true, false, 0, true, false, false)
    FreezeEntityPosition(preyID, false)
end
--------------------------------------------------------
function CreateScavengedItem()
    local scavitem = {}
    for i,v in pairs(Config.ScavengerItems) do
        if CalledBirdData.xp >= v.xpreq then
            table.insert( scavitem, v)
        end
    end
    if #scavitem < 1 then
        TriggerEvent("vorp:TipBottom", Config.Texts.NoHunt, 6000)    
        return nil
    end
    local nr = math.random(1,#scavitem)
    return scavitem[nr]
end
--------------------------------------------------------
function CreateFishPrey()
    local preydata = {}
    local preys = {}
    for i,v in pairs(Config.FishItems) do
        if CalledBirdData.xp >= v.xpreq then
            table.insert( preys, v)
        end
    end
    if #preys < 1 then
        TriggerEvent("vorp:TipBottom", Config.Texts.NoHunt, 6000)    
        return
    end
    local nr = math.random(1,#preys)
    preydata = preys[nr]

    RequestModel(preydata.model)
    while not HasModelLoaded(preydata.model) do
        Citizen.Wait(1)
    end
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 70.0, 0.1))
    preyID = CreatePed(preydata.model, x, y, z+40.0, GetEntityHeading(PlayerPedId())+180, 1, 0)
    preyXP = preydata.xp
    while not IsEntityAPed(preyID) do
        Citizen.Wait(1)
    end

    Citizen.InvokeNative(0x283978A15512B2FE, preyID, true)
	Citizen.InvokeNative(0x77FF8D35EEC6BBC4,preyID, 0)
	while not Citizen.InvokeNative(0xA0BC8FAED8CFEB3C,preyID) do
		Citizen.Wait(0)
	end

	Citizen.InvokeNative(0x704C908E9C405136, preyID)
	Citizen.InvokeNative(0xAAB86462966168CE, preyID, 1)
    Citizen.Wait(500)
    FreezeEntityPosition(preyID, true)
    Citizen.InvokeNative(0x1CE875505D45338A, preyID, 0, 0) 
    SetModelAsNoLongerNeeded(preydata.model)
    AttachEntityToEntity(preyID, CalledBird, 7, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, true, false, 0, true, false, false)
    FreezeEntityPosition(preyID, false)
end
--------------------------------------------------------
--[[function BirdCamera()
    if Camera == nil then 
        Camera = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", GetEntityCoords(playerPed), -90.0, 0.0, 0.0, GetGameplayCamFov())
        ShakeCam(Camera, "DRUNK_SHAKE", 0.1)
        SetCamActive(Camera, true)
        RenderScriptCams(true, true, 1000, true, false)
        AttachCamToEntity(Camera, CalledBird, 0.0, 0.0, 0.0, true)
    else
        RenderScriptCams(false, true, 500, true, true)
        DestroyCam(Camera)
        Camera = nil
    end
end]]
--------------------------------------------------------
function DeleteBirdCam()
    RenderScriptCams(false, true, 500, true, true)
    DestroyCam(Camera)
    Camera = nil
end

----------------------------SHOP----------------------------
function BuyBirds(_id)
    if menuOpen == false then
        local id = tonumber(_id)
        MenuData.CloseAll()
        TaskStandStill(PlayerPedId(),-1)
        if not HasModelLoaded(Config.Birds[1].variants[1].model) then
            TriggerEvent("vorp:TipBottom", Config.Texts.WaitLoad, 6000)    
        end
        menuOpen = true

        for c,k in pairs(Config.Birds) do
            local m1 = k.variants[1].model
            RequestModel(m1)
            while not HasModelLoaded(m1) do
                Citizen.Wait(10)
            end
        end

        local elements = {}
        for i,v in pairs(Config.Birds) do
            elements[i] = {label = v.name, value = "category"..i, desc = MENUTEXTS.CategorySelect, catid = i}
        end
        local model = Config.Birds[1].variants[1].model
        local preset = Config.Birds[1].variants[1].preset
        local pos = Config.BirdShops[id].standpos
        CreateShowroomModel(id, model, preset, pos)

        MenuData.Open('default', GetCurrentResourceName(), 'birdshop',{
            title    = Config.BirdShops[id].name.." - "..Config.Prompts.BirdShop,
            subtext  = MENUTEXTS.BirdCategories,
            align    = 'top-right',
            elements = elements,
        },
        function(data, menu)
            menuOpen = false
            BirdCategory(id, data.current.catid)
        end,
        function(data, menu)
            SetEntityVisible(tempBird, false)
            DeleteEntity(tempBird)
            while IsAnEntity(tempBird) do
                Citizen.Wait(50)
            end
            SetEntityAsNoLongerNeeded(tempBird)
            menuOpen = false
            MenuData.CloseAll()
            ClearPedTasks(PlayerPedId())
        end,
        function(data, menu)
            preset = Config.Birds[data.current.catid].variants[1].preset
            model = Config.Birds[data.current.catid].variants[1].model
            CreateShowroomModel(id, model, preset, pos)
        end)
    end
end

function BirdCategory(id, catid)
    if menuOpen == false then
        MenuData.CloseAll()
        if not HasModelLoaded(Config.Birds[catid].variants[1].model) then
            TriggerEvent("vorp:TipBottom", Config.Texts.WaitLoad, 6000)    
        end
        menuOpen = true

        for c,k in pairs(Config.Birds[catid].variants) do
            local m1 = k.model
            RequestModel(m1)
            while not HasModelLoaded(m1) do
                Citizen.Wait(10)
            end
        end

        local elementsV = {}
        local table = Config.Birds[catid].variants
        local prices = {}
        Citizen.Wait(100)
        for i,v in pairs(table) do
            local basicprice = v.price
            local tax = Config.BirdShops[id].tax
            local taxprice = (tax * (basicprice/100)) + basicprice
            local newprice = tonumber(string.format("%.2f", taxprice)) 
            local infoV = v
            elementsV[i] = {label = v.name.." $"..newprice, value = ""..catid.."category"..i, desc = "<img src='"..v.image.."'><br><p style='color:gold'>"..MENUTEXTS.TypeSelect.."<br><p style='color:green'>"..v.type.." "..Config.Texts.BirdT, birdid = i, info = infoV}
            prices[i] = newprice
            Citizen.Wait(10)
        end
        local model = table[1].model
        local preset = table[1].preset
        local pos = Config.BirdShops[id].standpos
        CreateShowroomModel(id, model, preset, pos)

        MenuData.Open('default', GetCurrentResourceName(), 'birdshop'..catid,{
            title    = Config.BirdShops[id].name.." - "..Config.Prompts.BirdShop,
            subtext  = MENUTEXTS.BirdCategories,
            align    = 'top-right',
            elements = elementsV,
        },
        function(data, menu)
            local price = prices[data.current.birdid]
            local bmodel = data.current.info.model
            local xp = data.current.info.xp
            local bpreset = data.current.info.preset
            AddName(bmodel, price, xp, bpreset)
        end,
        function(data, menu)
            SetEntityVisible(tempBird, false)
            DeleteEntity(tempBird)
            while IsAnEntity(tempBird) do
                Citizen.Wait(50)
            end
            SetEntityAsNoLongerNeeded(tempBird)
            menuOpen = false
            table = {}
            menu.close()
            BuyBirds(id)
        end,
        function(data, menu)
            preset = table[data.current.birdid].preset
            model = table[data.current.birdid].model
            CreateShowroomModel(id, model, preset, pos)
        end)
    end
end
----------------------------------------------------------------------------
function AddName(bmodel, price, xp, bpreset)
    TriggerEvent("syn_inputs:sendinputs", Config.Texts.confirm, Config.Texts.BirdName, function(cb) -- findme
        local result =     tostring(cb)
        if result ~= nil and result ~= "" then
            TriggerServerEvent("huntingbirds:buybird", bmodel, price, xp, bpreset, result)
        end
    end)
end
----------------------------------------------------------------------------
function CreateShowroomModel(id, model, preset, pos)
    if not HasModelLoaded(model) then
        RequestModel(model)
        while not HasModelLoaded(model) do
            Citizen.Wait(1)
        end
    end
        
    if tempBird ~= nil then
        SetEntityVisible(tempBird, false)
        DeleteEntity(tempBird)
        SetEntityAsNoLongerNeeded(tempBird)
        while IsAnEntity(tempBird) do
            Citizen.Wait(1)
        end
    end
    tempBird = CreatePed(model, pos.x, pos.y, pos.z-1, pos.h, false, 0)
    SetBlockingOfNonTemporaryEvents(tempBird, true)
    SetEntityVisible(tempBird, false)
    Citizen.InvokeNative(0x283978A15512B2FE, tempBird, true)

    Citizen.InvokeNative(0x77FF8D35EEC6BBC4,tempBird,preset) 
    while not Citizen.InvokeNative(0xA0BC8FAED8CFEB3C,tempBird) do 
        Citizen.Wait(1)
    end
    Citizen.InvokeNative(0x704C908E9C405136, tempBird)
    Citizen.InvokeNative(0xAAB86462966168CE, tempBird, 1)
    Citizen.InvokeNative(0xCC8CA3E88256E58F,tempBird, 0, 1, 1, 1, false)

    NetworkSetEntityInvisibleToNetwork(tempBird, true)
    FreezeEntityPosition(tempBird,true)
    SetEntityInvincible(tempBird, true)
    SetEntityVisible(tempBird, true)
    SetModelAsNoLongerNeeded(model)
end

function OwnedBirdsMenu()
    menuOpen = true
	local elements_b = {}
    MenuData.CloseAll()
    if ownedBirds ~= nil then
        for j, z in pairs(ownedBirds) do
            table.insert (elements_b , {label = ownedBirds[j].name.." - XP: "..ownedBirds[j].xp, value = ownedBirds[j], desc =  MENUTEXTS.SelectDesc})
        end
	end
   
	MenuData.Open(
		'default', GetCurrentResourceName(), 'owned_birds',
		{
			title    = MENUTEXTS.OwnedBirds,
			subtext    = '',
			align    = 'top-right',
			elements = elements_b,
		},
		function(data, menu)
			BirdManage(data.current.value)
		end,
		function(data, menu)
            MenuData.CloseAll()
            menuOpen = false
            ownedBirds = {}
    end)
end
----------------------------------------------------------------------------
function BirdManage(bdata)
    MenuData.CloseAll()
    local elements_o_h = {
        {label = MENUTEXTS.ManageSelect, value = "CallBird" , desc =  MENUTEXTS.ManageSelectDesc },
        {label = MENUTEXTS.ManageDelete.." $"..tonumber(string.format("%.2f", (bdata.price/3))), value = "DeleteBird" , desc =  MENUTEXTS.ManageDeleteDesc },
        {label = MENUTEXTS.ManageSendHomeCurrent, value = "SendBird" , desc =  MENUTEXTS.ManageSendHomeDesc }
    }
    MenuData.Open(
        'default', GetCurrentResourceName(), 'bird_manage',
        {
            title    = MENUTEXTS.Options,
            subtext    = '',
            align    = 'top-right',
            elements =  elements_o_h,
        },
        function(data, menu)
            if data.current.value == "CallBird" then
               if CalledBird == nil and playerDead == false and birdisHunting == false then
                    menuOpen = false
                    MenuData.CloseAll()
                    CreateBird(bdata.model, bdata.preset, bdata.name, bdata.xp, bdata.id)
               else
                TriggerEvent("vorp:TipBottom", Config.Texts.SendHome, 6000)    
               end
            elseif data.current.value == "DeleteBird" then
                if CalledBird == nil and playerDead == false then
                    bdata.price = tonumber(string.format("%.2f", (bdata.price/3)))
                    ConfirmDelete(bdata)
                    menuOpen = false
                    MenuData.CloseAll()
                else
                    TriggerEvent("vorp:TipBottom", Config.Texts.SendHome, 6000)    
                end
            elseif data.current.value == "SendBird" then
                if CalledBird ~= nil and playerDead == false then
                    SendBirdHome(0)
                    MenuData.CloseAll()
                end
            end
        end,
        function(data, menu)
            TriggerServerEvent("huntingbirds:getOwnedBirds")
	end)
end
function ConfirmDelete(bdata)
    AddTextEntry("FMMC_KEY_TIP8", Config.Texts.ConfirmDelete.." "..Config.ConfirmDeleteValue)
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "", "", "", "", 30)
    while (UpdateOnscreenKeyboard() == 0) do
        Citizen.Wait(1);
    end
    while (UpdateOnscreenKeyboard() == 2) do
        Citizen.Wait(1);
        break
    end
    while (UpdateOnscreenKeyboard() == 1) do
        Citizen.Wait(1)
        if (GetOnscreenKeyboardResult()) then
            local result = GetOnscreenKeyboardResult()
            if result == Config.ConfirmDeleteValue or string.lower(result) == Config.ConfirmDeleteValue then
                MenuData.CloseAll()
                TriggerServerEvent("huntingbirds:DeleteBird", bdata)
                break
            end
        end
    end
end
--------------------------------------EVENTS--------------------------------------
RegisterNetEvent('huntingbirds:openshop')
AddEventHandler('huntingbirds:openshop', function(id)
    BuyBirds(id)
end)
----------------------------------------------------------------------------
RegisterNetEvent('huntingbirds:callowneds')
AddEventHandler('huntingbirds:callowneds', function(id)
    TriggerServerEvent("huntingbirds:getOwnedBirds")
end)
----------------------------------------------------------------------------
RegisterNetEvent('huntingbirds:starthunt')
AddEventHandler('huntingbirds:starthunt', function()
    local ar = PlayerArea()
    local selectedprey
    if ar.activity == true then
        --print("Hunt", ar.name)
        local preys = {}
        for i,v in pairs(ar.list) do
            if CalledBirdData.xp >= v.xpreq then
                table.insert( preys, v)
            end
        end
        if #preys < 1 then
            TriggerEvent("vorp:TipBottom", Config.Texts.NoHunt, 6000)    
            return
        end
        local nr = math.random(1,#preys)
        selectedprey = preys[nr]
    else
        TriggerEvent("vorp:TipBottom", Config.Texts.NoHunt, 6000)    
        return
    end
    TriggerEvent("vorp:TipBottom", Config.Texts.GoingHunt.." "..ar.name, 6000)    
    birdisHunting = true
    if IsEntityAttached(CalledBird) then
        DetachEntity(CalledBird, 1, 1)
        birdOnShoulder = false
    end
    if IsEntityFrozen(CalledBird) then
        FreezeEntityPosition(CalledBird, false)
    end
    SetEntityCollision(CalledBird, false, false)
    TaskFlyAway(CalledBird, PlayerPedId())
    if Camera ~= nil then
        DeleteBirdCam()
    end
    local t = 0
    while t < Config.BirdGoForHuntTimer do
        Citizen.Wait(1000)
        if IsEntityDead(PlayerPedId()) then
            birdisHunting = false
            break
        end
        t = t+1
    end
    DeleteEntity(CalledBird)
    SetEntityAsNoLongerNeeded(CalledBird)
    CalledBird = nil
    birdIsFollowing = false
    birdIsFlytoPed = false
    birdisFlyingHome = false
    if birdisHunting == true then
        local b = 0
        while b < Config.HuntingTimer do
            Citizen.Wait(1000)
            if IsEntityDead(PlayerPedId()) then
                birdisHunting = false
                break
            end
            b = b + 1
        end
    end
    if birdisHunting == true then
        CreateBirdFromHunt(CalledBirdData.model, CalledBirdData.preset, CalledBirdData.name, selectedprey)
        return
    end
end)
----------------------------------------------------------------------------
RegisterNetEvent('huntingbirds:ownedbirds')
AddEventHandler('huntingbirds:ownedbirds', function(birds)
    if tempBird ~= nil then
        DeleteEntity(tempBird)
        SetEntityAsNoLongerNeeded(tempBird)
        tempBird = nil
        ClearPedTasks(PlayerPedId())
    end
    ownedBirds = {}
    for i, c in pairs(birds) do
        -- model, name, preset, xp, price
        table.insert(ownedBirds, {id = tonumber(c.id), model = tonumber(c.model), name = c.name, preset = tonumber(c.preset), xp = tonumber(c.xp), price = tonumber(c.price)})
    end
	OwnedBirdsMenu()
end)
--------------------------------------------------------
RegisterNetEvent('huntingbirds:sell:gotpoints_c')
AddEventHandler('huntingbirds:sell:gotpoints_c', function(selldata)
    SellPointsC = selldata
end)
--------------------------------------------------------
RegisterNetEvent('huntingbirds:sell:updatepoints')
AddEventHandler('huntingbirds:sell:updatepoints', function(selldata, id, pedid)
    local _id = tonumber(id)
    SellPointsC[_id] = selldata
    if pedid ~= nil then
        local _pedid = NetToPed(pedid)
        DeleteEntity(_pedid)
        SetEntityAsNoLongerNeeded(_pedid)
    end
end)
--------------------------------------------------------
RegisterNetEvent('huntingbirds:sell:updatepoints1')
AddEventHandler('huntingbirds:sell:updatepoints1', function(id)
    SellPointsC[tonumber(id)] = nil
end)
--------------------------------------------------------
RegisterNetEvent('huntingbirds:sell:finishsell')
AddEventHandler('huntingbirds:sell:finishsell', function()
    if selling == true then
        selling = false
        DeleteEntity(CalledBird)
        SetEntityAsNoLongerNeeded(CalledBird)
    end
    CalledBird = nil
    CalledBirdData = {}
    selling = false
    birdOnShoulder = false
    birdIsFollowing = false
    birdIsFlytoPed = false
    birdisFlyingHome = false
    birdisHunting = false
    ClearPedTasks(PlayerPedId())
    SetEntityInvincible(PlayerPedId(), false)
end)
--------------------------------------------------------
RegisterNetEvent('huntingbirds:checktalk')
AddEventHandler('huntingbirds:checktalk', function()
    local model = GetEntityModel(CalledBird)
    local random1 = math.random(1, #Config.AudioBank)
    local aname = Config.AudioBank[random1].Name
    local random2 = math.random(1,#Config.AudioBank[random1].Variants)
    local sname = Config.AudioBank[random1].Variants[random2]

    if CalledBirdData.xp >= Config.ParrotTalkingXPReq then
        if (model == `a_c_carolinaparakeet_01` or model == `a_c_parrot_01`) then
            if talking == false then
                StopCurrentPlayingAmbientSpeech()
                StopCurrentPlayingSpeech()
                talking = true
                local c = GetEntityCoords(CalledBird)
                local x,y,z = c.x, c.y, c.z
                exports.huntingbirds.parrot_talk(0, x,y,z, aname, sname)
                Citizen.Wait(1000)
                talking = false
            else
                TriggerEvent("vorp:TipBottom", Config.Texts.WaitTalk, 6000)    
            end
        else
            TriggerEvent("vorp:TipBottom", Config.Texts.NotParrot, 6000)    
        end
    else
        TriggerEvent("vorp:TipBottom", Config.Texts.NoTalkSkill, 6000)    
    end
end)
--------------------------------------------------------
RegisterNetEvent('ricx_huntingbirds:deleteped_c')
AddEventHandler('ricx_huntingbirds:deleteped_c', function(ped)
    local _ped = NetToPed(tonumber(ped))
    if DoesEntityExist(_ped) then 
        DeleteEntity(_ped)
        SetEntityAsNoLongerNeeded(_ped)
    end
end)
--------------------------------------------------------
AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  return
    end
    if CalledBird ~= nil then
        DeleteEntity(CalledBird)
        SetEntityAsNoLongerNeeded(CalledBird)
        CalledBird = nil
    end
    if Camera ~= nil then
        DeleteBirdCam()
    end
    if tempBird ~= nil then
        DeleteEntity(tempBird)
        SetEntityAsNoLongerNeeded(tempBird)
        tempBird = nil
    end
    if menuOpen == true then
        MenuData.CloseAll()
    end
    if BirdShopBlips[1] then
        for i,v in pairs(BirdShopBlips) do
            RemoveBlip(v)
        end
    end
end)
--------------------------------------------------------
