--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
function Wait(args) Citizen.Wait(args) end
function Invoke(args, bool) Citizen.InvokeNative(args, bool) end
local VORPCore = {}
Citizen.CreateThread(function()
  while not VORPCore do
  TriggerEvent("getCore", function(core)
    VORPCore = core
  end)
  Citizen.Await(200)
end
end)
--------------------------------------------------------------------------------
-- Event Register
RegisterNetEvent('DevDokus:Metabolism:C:Hunger')
RegisterNetEvent('DevDokus:Metabolism:C:Thirst')
RegisterNetEvent('DevDokus:Metabolism:C:Stamina')
RegisterNetEvent('DevDokus:Metabolism:C:Health')
RegisterNetEvent('DevDokus:Metabolism:C:StaminaInner')
RegisterNetEvent('DevDokus:Metabolism:C:StaminaOuter')
--------------------------------------------------------------------------------
-- Core
--------------------------------------------------------------------------------
-- Variables
hud = false
_Hunger = 100
_Thirst = 100
_Stamina = 100
local DyingCount = 0
local WarningCount = 0
local DeathWarning = false
-- local IsStatsSet  = false
--------------------------------------------------------------------------------
-- Citizen.CreateThread(function()
--   local run = true
--   while run do Wait(1)
--     if VORPCore ~= nil then
--       -- TriggerServerEvent('DevDokus:Metabolism:S:StartStatus')
--       run = false
--     end
--   end
-- end)
--------------------------------------------------------------------------------
local ClothesHash = {
	{ category = "hats", hash = 2569388135 },
	{ category = "masks", hash = 1963323202 },
	{ category = "neckwear", hash = 1606587013 },
	{ category = "shirts_full", hash = 539411565 },
	{ category = "coats", hash = 0xE06D30CE },
	{ category = "coats_closed", hash = 0x662AC34 },
	{ category = "ponchos", hash = 2937336075 },
	{ category = "vests", hash = 1214179380 },
	{ category = "gloves", hash = 3938320434 },
	{ category = "chaps", hash = 822561179 },
	{ category = "pants", hash = 491541130 },
	{ category = "boots", hash = 2004797167 },
  { category = "neckties", hash = 2056714954 },
  { category = "neckwear", hash = 1606587013 },                                                                               
  { category = "satchels", hash = 2488290598 },
  { category = "spats", hash = 1363860714 },
  { category = "belts", hash = 2798728390 },
  { category = "armor", hash = 1927737204 },
}

Citizen.CreateThread(function()
while true do Wait(1000)
if VORPCore ~= nil then
  local DrainFood = 0
  local DrainWater = 0
  local User = PlayerPedId()
  local coords = GetEntityCoords(User)
  local temp = math.floor(GetTemperatureAtCoords(coords))

  for k,v in pairs(ClothesHash) do
    local IsWearingClothes = Citizen.InvokeNative(0xFB4891BD7578CDC1, User, v.hash)
    if IsWearingClothes then
      temp = temp + 1
    else
      temp = temp
    end
  end

  if (temp >= Temperature.Max) then
    DrainFood = Temperature.HotDamage.Hunger
    DrainWater = Temperature.HotDamage.Water
    if (temp == Temperature.Max) then
      TriggerEvent('vorp:NotifyLeft', 'Temperatura', 'Essa Região está muito quente! Você irá se desidratar mais rápido!', 'rpg_textures', 'rpg_hot', 5000, "COLOR_WHITE")
    end
  elseif (temp <= Temperature.Min) then
    DrainFood = Temperature.ColdDamage.Hunger
    DrainWater = Temperature.ColdDamage.Water
    if (temp == Temperature.Min) then
      TriggerEvent('vorp:NotifyLeft', 'Temperatura', 'Essa Região está muito fria! Você sentirá mais fome!', 'rpg_textures', 'rpg_cold', 5000, "COLOR_WHITE")
    end
  end

  local running = IsPedRunning(User)
  local walking = IsPedWalking(User)

  if running then
    _Hunger = _Hunger - (Food.DrainRunning)
    _Thirst = _Thirst - (Water.DrainRunning)
  elseif walking then
    _Hunger = _Hunger - (Food.DrainWalking)
    _Thirst = _Thirst - (Water.DrainWalking)
  else
    _Hunger = _Hunger - (Food.DrainIdle)
    _Thirst = _Thirst - (Water.DrainIdle)
  end
end
end
end)

Citizen.CreateThread(function()
while true do
if VORPCore ~= nil then
if _Hunger < Food.LoseWhen then
  local User = PlayerPedId()
  local Core = GetAttributeCoreValue(User, 0)
  local health = math.floor((Core - Food.DamagePerSec))
  Citizen.InvokeNative(0xC6258F41D86676E0, User, 0, health)
end

if _Thirst < Water.LoseWhen then
  local User = PlayerPedId()
  local Core = GetAttributeCoreValue(User, 0)
  local health = math.floor((Core - Water.DamagePerSec))
  Citizen.InvokeNative(0xC6258F41D86676E0, User, 0, health)
end
end
Wait(1000)
end
end)

local stage = { s1 = false, s2 = false, s3 = false}
local DeadOrAlive = true
local CoreIsZero = false
Citizen.CreateThread(function()
while true do
if VORPCore ~= nil then
local User = PlayerPedId()
local Core = GetAttributeCoreValue(User, 0)
local eHealth = GetEntityHealth(User)
-- print(Core, eHealth, DeadOrAlive, stage.s1, stage.s2, stage.s3, CoreIsZero)

-- STOP: If user is dead, let's wait until the player is alive again.
if (Core == 0) and not DeadOrAlive then print("Esperando para reaparecer.....") return end

if (Core == 0) and DeadOrAlive then
CoreIsZero = true
if (eHealth >= 50) then
  Citizen.InvokeNative(0x697157CED63F18D4, User, 5, false, true, true)
  if stage.s1 == false then stage.s1 = true TriggerEvent("vorp:TipRight",'Você está morrendo, verifique suas funções vitais!', 5000) end
elseif (eHealth < 50) and (eHealth >= 35) then
  Citizen.InvokeNative(0x697157CED63F18D4, User, 5, false, true, true)
  if stage.s2 == false then stage.s2 = true TriggerEvent("vorp:TipRight",'Eu sinto formigando meus dedos...', 5000) end
elseif (eHealth < 35) and (eHealth >= 2) then
  Citizen.InvokeNative(0x697157CED63F18D4, User, 5, false, true, true)
  if stage.s3 == false then stage.s3 = true TriggerEvent("vorp:TipRight",'Eu posso ver as luzes, o fim está próximo...',  5000) end
elseif (eHealth < 2) then
  Citizen.InvokeNative(0x697157CED63F18D4, User, 50000, false, true, true)
  DeadOrAlive = false
end
end
---------------------------- WORK IN PROGRESS ----------------------------
-- ToDo: Detecting when user eats or drinks to reset the dialog for dying.
if (Core ~= 0) and CoreIsZero then print("Usuário curado") CoreIsZero = false end
--------------------------------------------------------------------------

-- When the player comes back to live, reset the script.
if (Core ~= 0) and not DeadOrAlive then
TriggerEvent('DevDokus:Metabolism:C:Health', 100)
CoreIsZero = false
DeadOrAlive = true
_Hunger = 100
_Thirst = 100
_Stamina = 100
DyingCount = 0
WarningCount = 0
DeathWarning = false
stage.s1 = false
stage.s2 = false
stage.s3 = false
end
end
Wait(5000)
end
end)

-- AddEventHandler('DevDokus:Metabolism:C:SetFirstStatus', function(Data)
--   _Hunger = (Data.Hunger)
--   _Thirst = (Data.Thirst)
--   IsStatsSet = true
-- end)

AddEventHandler('DevDokus:Metabolism:C:Hunger', function(value)
  _Hunger = _Hunger + tonumber(value)
  if (_Hunger <= 0) then _Hunger = 0 end
    if (_Hunger > 100) then _Hunger = 100 end
    stage.s1 = false
    stage.s2 = false
    stage.s3 = false
end)

AddEventHandler('DevDokus:Metabolism:C:Thirst', function(value)
_Thirst = _Thirst + tonumber(value)
  if (_Thirst <= 0) then _Thirst = 0 end
  if (_Thirst > 100) then _Thirst = 100 end
  stage.s1 = false
  stage.s2 = false
  stage.s3 = false
end)

AddEventHandler('DevDokus:Metabolism:C:Stamina', function(value)
local User = PlayerPedId()
local _Stamina = Citizen.InvokeNative(0x36731AC041289BB1, User, 1)
local new = _Stamina + tonumber(value)
if (new > 100) then new = 100 end
Citizen.InvokeNative(0xC6258F41D86676E0, User, 1, new)
end)

AddEventHandler('DevDokus:Metabolism:C:Health', function(value)
local User = PlayerPedId()
local health = Citizen.InvokeNative(0x36731AC041289BB1, User, 1)
local new = health + tonumber(value)
if (new > 100) then new = 100 end
Citizen.InvokeNative(0xC6258F41D86676E0, User, 0, new)
end)

AddEventHandler('DevDokus:Metabolism:C:StaminaInner', function(value)
local User = PlayerPedId()
Citizen.InvokeNative(0x4AF5A4C7B9157D14, User, 1, value, true)
end)

AddEventHandler('DevDokus:Metabolism:C:StaminaOuter', function(value)
local User = PlayerPedId()
Citizen.InvokeNative(0xF6A7C08DF2E28B28, User, 1, value, true)
end)

--------------------------------------------------------------------------------
---------------------- Café
RegisterNetEvent('metabolism:cafe')
AddEventHandler('metabolism:cafe', function()
  local propEntity = CreateObject(GetHashKey("p_mugCoffee01x"), GetEntityCoords(PlayerPedId()), false, true, false, false, true)

  TaskItemInteraction_2(PlayerPedId(), -1199896558, propEntity, GetHashKey("p_mugCoffee01x_ph_r_hand"), GetHashKey("DRINK_COFFEE_HOLD"), 1, 0, -1.0)
  Wait(5500)
  ClearPedTasksImmediately(PlayerPedId())
  TriggerEvent('DevDokus:Metabolism:C:Thirst', 25)
end)
----------------------------- Cha
RegisterNetEvent('metabolism:cha')
AddEventHandler('metabolism:cha', function()
  local propEntity = CreateObject(GetHashKey("p_mugCoffee01x"), GetEntityCoords(PlayerPedId()), false, true, false, false, true)

  TaskItemInteraction_2(PlayerPedId(), -1199896558, propEntity, GetHashKey("p_mugCoffee01x_ph_r_hand"), GetHashKey("DRINK_COFFEE_HOLD"), 1, 0, -1.0)
  Wait(5500)
  ClearPedTasksImmediately(PlayerPedId())
  TriggerEvent('DevDokus:Metabolism:C:Thirst', 100)
end)
-----------------------------------------------------------------

RegisterNetEvent('metabolism:ativar')
AddEventHandler('metabolism:ativar', function(prop, valor)
  Eat = true
  local playerPed = PlayerPedId()
  local prop_name = prop
  local x,y,z = table.unpack(GetEntityCoords(playerPed))
  local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
  local boneIndex = GetEntityBoneIndexByName(playerPed, "SKEL_R_Finger02")

  RequestAnimDict("amb_misc@world_human_eat_apple@male_a@wip_base")
  while not HasAnimDictLoaded("amb_misc@world_human_eat_apple@male_a@wip_base") do
      Citizen.Wait(100)
  end
  if  IsPedMale(playerPed) then
      TaskPlayAnim(playerPed, "amb_misc@world_human_eat_apple@male_a@wip_base", "wip_base", 8.0, -8.0, 5500, 0, 0, true, 0, false, 0, false)
      AttachEntityToEntity(prop, playerPed,boneIndex, 0.00, 0.0, 0.0, 1.024, 70.0, 100.0, true, true, false, true, 1, true)
      Wait(5500)
      ClearPedSecondaryTask(playerPed)
      TriggerEvent('DevDokus:Metabolism:C:Hunger', valor)
      DeleteObject(prop)
  else
      TaskPlayAnim(playerPed, "amb_misc@world_human_eat_apple@male_a@wip_base", "wip_base", 8.0, -8.0, 5500, 0, 0, true, 0, false, 0, false)
      AttachEntityToEntity(prop, playerPed,boneIndex, 0.00, 0.0, 0.0, 1.024, 70.0, 100.0, true, true, false, true, 1, true)
      Wait(5500)
      ClearPedSecondaryTask(playerPed)
      TriggerEvent('DevDokus:Metabolism:C:Hunger', valor)
      DeleteObject(prop)
  end
  Eat = false
  
end)

RegisterNetEvent('metabolism:beber')
AddEventHandler('metabolism:beber', function(prop, valor)
  itemInHand = 0
  playCustomAnim("mech_butcher", "small_rat_give_player", 1100, 25)
  Citizen.Wait(700)
  if prop ~= "" then
    local pC = GetEntityCoords(PlayerPedId())
    itemInHand = CreateObject(prop, pC.x, pC.y, pC.z, true, false, false)
    AttachEntityToEntity(itemInHand, PlayerPedId(), GetEntityBoneIndexByName(PlayerPedId(), "PH_R_HAND"), 0.00, 0.00, 0.04, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
  end
  Citizen.InvokeNative(0xFCCC886EDE3C63EC, PlayerPedId(), 2, 1) -- Removes Weapon from animation	
  Citizen.Wait(600)
  playCustomAnim("mech_inventory@drinking@bottle_cylinder_d1-3_h30-5_neck_a13_b2-5", "uncork", 500, 25)
  Citizen.Wait(500)
  playCustomAnim("mech_inventory@drinking@bottle_cylinder_d1-3_h30-5_neck_a13_b2-5", "chug_a", -1, 25)
  Citizen.Wait(5000)
  ClearPedSecondaryTask(PlayerPedId())
  if prop ~= "" then
    deleteObj(itemInHand)
  end
  itemInHand = nil
  TriggerEvent('DevDokus:Metabolism:C:Thirst', valor)
end)

function playCustomAnim(dict,name, time, flag)
  RequestAnimDict(dict)
  while not HasAnimDictLoaded(dict) do
      Citizen.Wait(100)
  end
TaskPlayAnim(PlayerPedId(), dict, name, 1.0, 1.0, time, flag, 0, true, 0, false, 0, false)  
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
RegisterNetEvent('metabolism:Seringa')
AddEventHandler('metabolism:Seringa', function(valor)
  local playerPed = PlayerPedId()
  RequestAnimDict("mech_inventory@item@stimulants@inject@quick")
  while not HasAnimDictLoaded("mech_inventory@item@stimulants@inject@quick") do
      Wait(100)
  end
  TaskPlayAnim(playerPed, "mech_inventory@item@stimulants@inject@quick", "quick_stimulant_inject_lhand", 8.0, -0.5, -1, 0, 0, true, 0, false, 0, false)
  Wait(5000)
  TriggerEvent('DevDokus:Metabolism:C:Health', valor)
  ClearPedTasks(playerPed)
end)

RegisterNetEvent('metabolism:Seringa2')
AddEventHandler('metabolism:Seringa2', function(valor)
  local playerPed = PlayerPedId()
  RequestAnimDict("mech_inventory@item@stimulants@inject@quick")
  while not HasAnimDictLoaded("mech_inventory@item@stimulants@inject@quick") do
      Wait(100)
  end
  TaskPlayAnim(playerPed, "mech_inventory@item@stimulants@inject@quick", "quick_stimulant_inject_lhand", 8.0, -0.5, -1, 0, 0, true, 0, false, 0, false)
  Wait(5000)
  TriggerEvent('DevDokus:Metabolism:C:Stamina', valor)
  ClearPedTasks(playerPed)
end)

RegisterNetEvent('metabolism:Ensopado')
AddEventHandler('metabolism:Ensopado', function(valor, valor2)
  local ped = PlayerPedId()
  local bowl = CreateObject("p_bowl04x_stew", GetEntityCoords(ped), false, false, 1, 1, 0)
  local spoon = CreateObject("p_spoon01x", GetEntityCoords(ped), false, false, 1, 1, 0)

  Citizen.InvokeNative(0x669655FFB29EF1A9, bowl, 0, "Stew_Fill", 1.0)
  Citizen.InvokeNative(0xCAAF2BCCFEF37F77, bowl, 0)

  Citizen.InvokeNative(0xCAAF2BCCFEF37F77, spoon, 0)

  TaskItemInteraction_2(ped, 599184882, bowl, GetHashKey("p_bowl04x_stew_ph_l_hand"), -583731576, true, 0, 0)
  TaskItemInteraction_2(ped, 599184882, spoon, GetHashKey("p_spoon01x_ph_r_hand"), -583731576, true, 0, 0)

  Citizen.InvokeNative(0xB35370D5353995CB, ped, -583731576, 1.0)
  Citizen.Wait(10000)
  ClearPedTasks(ped)
  TriggerEvent('DevDokus:Metabolism:C:Hunger', valor)
  TriggerEvent('DevDokus:Metabolism:C:Thirst', valor2)
end)

RegisterNetEvent('showhud')
AddEventHandler('showhud', function(value)
  hud = value
end)

RegisterNetEvent('RedM:hud')
AddEventHandler('RedM:hud', function(voiceModeData)
  local ped = PlayerPedId()

  SendNUIMessage({ 
    action = 'changeMic', 
    newState = voiceModeData
  })
end)

RegisterNetEvent('RedM:Notify')
AddEventHandler('RedM:Notify', function(tipo, text)
  local ped = PlayerPedId()
  SendNUIMessage({ 
    action = 'showAlert', 
    alertType = tipo,
    alertMessage = text
  })
end)

------------------------------- Stress
local stress = 0
RegisterNetEvent("vorp:SelectedCharacter")
AddEventHandler("vorp:SelectedCharacter", function()
  TriggerServerEvent('stress:requestStress')
  hud = true
end)

RegisterNetEvent('stress:modify')
AddEventHandler('stress:modify', function(value) 
    if stress + tonumber(value) <= 100 and stress + tonumber(value) > 0 then
        stress = stress + tonumber(value)
    elseif stress + tonumber(value) > 100 then 
        stress = 100
    else
        stress = 0
    end
    SendNUIMessage({ 
      action = 'setStress', 
      stress = stress
     })
end)

Citizen.CreateThread(function() 
    while true do 
        math.randomseed(GetGameTimer())
        Wait(math.random(5000,10000))
        TriggerServerEvent("stress:share", stress)
    end
end)

Citizen.CreateThread(function() 
    while true do 
        Wait(7000) -- tempo de espera pra diminuir o stress = 7 segundos 
        local pos = GetEntityCoords(PlayerPedId())
        for k,v in pairs(Config.Locais) do
         
            local distance = GetDistanceBetweenCoords(pos.x,pos.y,pos.z,v.x,v.y,v.z, false)
            if distance < v.range then
                TriggerEvent('stress:modify', -0.5) --  quantidade de stress que diminui a cada 7s
            end
        end
    end
end)


local ped = PlayerPedId()
local hashUnarmed = GetHashKey("WEAPON_UNARMED")
local weaponHash = GetCurrentPedWeapon(ped, 1)
if weaponHash ~= hashUnarmed then
  print('STRESS', stress)
  if IsPedShooting(ped) then  -- ganho de stress atirando
    TriggerEvent('stress:modify', 0.3) -- quantidade de stress ganho, alterar apenas o valor
    print(stress)
  end
end
if stress >= 100 then
  Citizen.InvokeNative(0x406CCF555B04FAD3 , ped, 1, 0.95)
  TriggerEvent('vorp:TipRight', 'Você está muito estressado!', 4000)
else
  Citizen.InvokeNative(0x406CCF555B04FAD3 , ped, 1, 0.00)
end
Citizen.CreateThread(function()
  while true do 
  Citizen.Wait(10*60000)  --- tempo jogagdo em minutos, alterar apenas o primeiro número
  TriggerEvent('stress:modify', 0.5)--- quantidade de stress ganho, alterar apenas o valor 
  end
end)

