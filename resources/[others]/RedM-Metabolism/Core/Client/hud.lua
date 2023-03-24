
--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
function Wait(args) Citizen.Wait(args) end
function Invoke(args, bool) Citizen.InvokeNative(args, bool) end
--------------------------------------------------------------------------------
-- Event Register
--------------------------------------------------------------------------------
-- Core
--------------------------------------------------------------------------------
Citizen.CreateThread(function()
  while true do Wait(100)
  Invoke(0x50C803A4CD5932C5, true)
  local User = PlayerPedId()
  local coords = GetEntityCoords(User)
  local temp =  math.floor(GetTemperatureAtCoords(coords))..'°C'
  local myhealth = GetAttributeCoreValue(PlayerPedId(), 0)
  local mystamina = Citizen.InvokeNative(0x36731AC041289BB1, PlayerPedId(), 1)
  local talking = MumbleIsPlayerTalking(PlayerId()) == 1
  local nottalk = MumbleIsPlayerTalking(PlayerId()) == 0
    if myhealth >= 100 then
    myhealth = 100
    end
    SendNUIMessage({ 
    action = 'setHealth', 
    health = myhealth
    })
    SendNUIMessage({ 
    action = 'setStamina', 
    stamina = mystamina
    })
    SendNUIMessage({ 
    action = 'changeTemperature', 
    newState = temp
    })
    if talking then 
    SendNUIMessage({ 
      action = 'openMic', 
      newState = talking
    })
    else 
    SendNUIMessage({ 
      action = 'closeMic', 
      newState = nottalk
    })
    end
    if hud then 
      SendNUIMessage({ 
        action = 'showHudContent'
      })
    else 
      SendNUIMessage({ 
        action = 'hideHudContent'
      })
    end
  end
end)
Citizen.CreateThread(function()
  while true do Wait(1000)
  local hours = GetClockHours()
  local minutes = GetClockMinutes()
  if hours <= 9 then
    hours = "0"..hours
  end
  if minutes <= 9 then
    minutes = "0"..minutes
  end
  SendNUIMessage({ 
    action = 'changeHour', 
    newState = hours..':'..minutes
    })
  SendNUIMessage({ 
    action = 'setFood2', 
    food = _Hunger
    })
  SendNUIMessage({ 
    action = 'setWater', 
    water = _Thirst
  })
  end
end)