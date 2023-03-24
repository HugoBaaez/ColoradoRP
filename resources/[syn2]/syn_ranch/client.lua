local goat
local reached = false
local goal
local ontheway = false
local herdno
local herd = {}
local wolfs = {}
local justspawned = false
local onme = false
local registering = false
local pedloc
local range = 100
local loc1 = nil
local loc2 = nil
local loc3 = nil
local loc4 = nil
local reg = false
local reg1 = false
local reg2 = false
local reg3 = false
local first = false
local sec = false
local third = false
local fourth = false
local fifth = false
local sixth = false 
local cooldown = false
local cooldown2 = false
local cooldown3 = false 
local cooldown4 = false 
local cooldown5 = false 
local freakout
local reset = false
local reset2 = false
local reset3 = false
local reset4 = false 
local reset5 = false
local reset6 = false
local attack = false
local finalnumber = 0
local creatingranch = false
local ranchprice = 0
local ranchname = ""
local playerids
local playercharid 
local playerjob 
local playerrank
local blips = {}
local ranches = {}
local inranch = false
local ranchid
local ranchpricez
local ranchnamez
local creatingranch = false 
local next = next
local herdhash
local startherd = false 
local ranchlocation
local type 
local cattlex = {}
local q_cattlex = {}
local timeout = false
local timer = 0
local failedherding = false
local Killer
local distance
local herdingcooldown = false
local timer2 = 0
local dist1x
local dist2x
local dist3x
local dist4x
local timer3 = 0
local timer4 = 0
local timer5 = 0
local timer6 =  0
local timer7 =  0
local timer8 =  0
local reachedtimerout = false 
local reachedtimerout2 = false 
local startsale = false 
local herdingcooldown2 = false 
local ontheway2 = false 
local timeout2 = false 
local reached2 = false 
local failedherding2 = false 
local justspawned2 = false 
local regx = false
local taskname
local taskloc = {}
local chores = {}
local blipg
local chorelocx = {}
local starttask = false
local task
local q_ranch 
local score
local cowpenloc = false 
local cowpenloc2 = false 
local chickenloc = false 
local chickenloc2 = false 
local cowstuff = {}
local chickenstuff = {}
local cowmo
local chicken = {}
local milking = false 
local cchecking = false 
local cheater = false 
local dog = "0"
local dogg
local onme2 = false 
local ranchtax = 0
local ranchtaxz = 0
local boss = false 
local keyholdersx = {}
local hasLoaded = false

AddEventHandler(
    "onResourceStop",
    function(resourceName)
        if resourceName == GetCurrentResourceName() then
            for k,v in pairs(herd) do
                DeleteEntity(v.goat)
            end
            for k,v in pairs(wolfs) do 
                DeleteEntity(v.wolfz)
            end
            for k,v in pairs(chicken) do 
                DeleteEntity(v.chicken)
            end
            DeleteEntity(goal)
            DeleteEntity(dogg)
            DeleteEntity(cowmo)
            TriggerEvent("syn_ranch:removeblips")
        end
    end
)

function whenKeyJustPressed(key)
    if Citizen.InvokeNative(0x580417101DDB492F, 0, key) then
        return true
    else
        return false
    end
end

function drawtext(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str, Citizen.ResultAsLong())
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
    SetTextCentre(centre)
    if enableShadow then 
        SetTextDropshadow(1, 0, 0, 0, 255)
    end
    Citizen.InvokeNative(0xADA9255D, 10);
    DisplayText(str, x, y)
  end

Citizen.CreateThread(function()
    while true do
       Citizen.Wait(100)
       if justspawned then 
        Citizen.Wait(100000)
        justspawned = false
       end
    end
end)

Citizen.CreateThread(function()
    while true do
       Citizen.Wait(100)
       if justspawned2 then 
        Citizen.Wait(100000)
        justspawned2 = false
       end
    end
end)

Citizen.CreateThread(function()
    while true do
       Citizen.Wait(100)
       if cooldown then 
        Citizen.Wait(Config.straycooldownherd)
        cooldown = false
       end
    end
end)
Citizen.CreateThread(function()
    while true do
       Citizen.Wait(100)
       if cooldown3 then 
        Citizen.Wait(Config.straycooldownsale)
        cooldown3 = false
       end
    end
end)

Citizen.CreateThread(function()
    while true do
       Citizen.Wait(100)
       if cooldown2 then 
        Citizen.Wait(Config.wolfcooldown)
        cooldown2 = false
       end
    end
end)

Citizen.CreateThread(function()
    while true do
       Citizen.Wait(0)
       if startherd then
            local loc = GetEntityCoords(PlayerPedId())
            local dist = GetDistanceBetweenCoords(loc.x,loc.y,loc.z, ranchlocation.x,ranchlocation.y,ranchlocation.z, 0)
            if 25 > dist then
                drawtext(Config.Language.presstospawn, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
                drawtext(Config.Language.dist..dist, 0.15, 0.13, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                if whenKeyJustPressed(Config.keys["G"]) then
                    startherd = false
                    Citizen.Wait(500)
                    TriggerEvent("syn_ranch:herdz")
                    timer2 =  Config.herdingcooldown
                    herdingcooldown = true 
                end
            else
                drawtext(Config.Language.outrange, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            end
       end
    end
end)

Citizen.CreateThread(function()
    while true do
       Citizen.Wait(0)
       if startsale then
            local loc = GetEntityCoords(PlayerPedId())
            local dist = GetDistanceBetweenCoords(loc.x,loc.y,loc.z, ranchlocation.x,ranchlocation.y,ranchlocation.z, 0)
            if 25 > dist then
                drawtext(Config.Language.presstospawn, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
                drawtext(Config.Language.dist..dist, 0.15, 0.13, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                if whenKeyJustPressed(Config.keys["G"]) then
                    startsale = false
                    Citizen.Wait(500)
                    TriggerEvent("syn_ranch:herdg")
                    timer4 =  Config.salecooldown
                    herdingcooldown2 = true 
                end
            else
                drawtext(Config.Language.outrange, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            end
       end
    end
end)


function contains2(table, element)
    for k, v in pairs(table) do
    if k == element then
    return true
        end
    end
  return false
  end


Citizen.CreateThread(function()
    while true do
       Citizen.Wait(0)
        if regx then 
            drawtext(Config.Language.pressg, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            if whenKeyJustPressed(Config.keys["G"]) then
                taskloc = GetEntityCoords(PlayerPedId())
                Citizen.Wait(1000)
                if contains(chores, taskname) then 
                    chores[taskname].loc = taskloc
                    for k,v in pairs(chores) do 
                        v.num = 0
                    end
                    TriggerServerEvent("syn_ranch:registertaskloc",chores,ranchid)
                else
                    chores[taskname] = {loc = taskloc, num = 0}
                    for k,v in pairs(chores) do 
                        v.num = 0
                    end
                    TriggerServerEvent("syn_ranch:registertaskloc",chores,ranchid)
                end
                regx = false 
            end
        end
    end
end)

Citizen.CreateThread(function() 
    while true do
       Citizen.Wait(0)
        if cowpenloc then 
            drawtext(Config.Language.pressg, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            if whenKeyJustPressed(Config.keys["G"]) then
                local penloc = GetEntityCoords(PlayerPedId())
                Citizen.Wait(1000)
                local cows = {loc = penloc}
                TriggerServerEvent("syn_ranch:regcowpen",ranchid,cows)
                cowpenloc = false 
            end
        end
    end
end)

Citizen.CreateThread(function() 
    while true do
       Citizen.Wait(0)
        if cowpenloc2 then 
            drawtext(Config.Language.pressg, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            if whenKeyJustPressed(Config.keys["G"]) then
                local penloc = GetEntityCoords(PlayerPedId())
                Citizen.Wait(1000)
                local cows = {loc = penloc}
                TriggerServerEvent("syn_ranch:regcowpen2",ranchid,cows)
                cowpenloc2 = false 
            end
        end
    end
end)

Citizen.CreateThread(function() 
    while true do
       Citizen.Wait(0)
        if chickenloc2 then 
            drawtext(Config.Language.pressg, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            if whenKeyJustPressed(Config.keys["G"]) then
                local penloc = GetEntityCoords(PlayerPedId())
                Citizen.Wait(1000)
                local chickens = {loc = penloc}
                TriggerServerEvent("syn_ranch:regchickenpen2",ranchid,chickens)
                chickenloc2 = false 
            end
        end
    end
end)

Citizen.CreateThread(function() 
    while true do
       Citizen.Wait(0)
        if chickenloc then 
            drawtext(Config.Language.pressg, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            if whenKeyJustPressed(Config.keys["G"]) then
                local penloc = GetEntityCoords(PlayerPedId())
                Citizen.Wait(1000)
                local chickens = {loc = penloc}
                TriggerServerEvent("syn_ranch:regchickenpen",ranchid,chickens)
                chickenloc = false 
            end
        end
    end
end)



Citizen.CreateThread(function()
    while true do
       Citizen.Wait(0)
       
       if registering then 
        local loc = GetEntityCoords(PlayerPedId())
        local dist1
        local dist2
        local dist3
        local dist4
        if not reg then 
             dist1 = GetDistanceBetweenCoords(loc.x,loc.y,loc.z, pedloc.x,pedloc.y,pedloc.z, 0)
            if range > dist1 and dist1 > 8 then
                drawtext(Config.Language.pressg, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
                drawtext(Config.Language.dist..dist1, 0.15, 0.13, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                if whenKeyJustPressed(Config.keys["G"]) then
                    loc1 = GetEntityCoords(PlayerPedId())
                    dist1x = dist1
                    reg = true
                    Citizen.Wait(1000)
                end
            elseif 8 > dist1 then
                drawtext(Config.Language.tooclose, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            elseif dist1 > range then
                drawtext(Config.Language.outrange, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            end
        end
        if reg and not reg1 then
             dist2 = GetDistanceBetweenCoords(loc.x,loc.y,loc.z, loc1.x,loc1.y,loc1.z, 0)
            if range > dist2 and dist2 > 8 then
                drawtext(Config.Language.pressg, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
                drawtext(Config.Language.dist..dist2, 0.15, 0.13, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                if whenKeyJustPressed(Config.keys["G"]) then
                    loc2 = GetEntityCoords(PlayerPedId())
                    dist2x = dist2
                    reg1 = true
                    Citizen.Wait(1000)
                end
            elseif 8 > dist2 then
                drawtext(Config.Language.tooclose, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            elseif dist2 > range then
                drawtext(Config.Language.outrange, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            end
        end
        if reg and reg1 and not reg2 then 
             dist3 = GetDistanceBetweenCoords(loc.x,loc.y,loc.z, loc2.x,loc2.y,loc2.z, 0)
            if range > dist3 and dist3 > 8 then
                drawtext(Config.Language.pressg, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
                drawtext(Config.Language.dist..dist3, 0.15, 0.13, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                if whenKeyJustPressed(Config.keys["G"]) then
                    loc3 = GetEntityCoords(PlayerPedId())
                    dist3x = dist3
                    reg2 = true
                    Citizen.Wait(1000)
                end
            elseif 8 > dist3 then
                drawtext(Config.Language.tooclose, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            elseif dist3 > range then
                drawtext(Config.Language.outrange, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            end
        end 
        if reg and reg1 and reg2 and not reg3 then 
             dist4 = GetDistanceBetweenCoords(loc.x,loc.y,loc.z, loc3.x,loc3.y,loc3.z, 0)
            if range > dist4 and dist4 > 8 then
                drawtext(Config.Language.pressg, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
                drawtext(Config.Language.dist..dist4, 0.15, 0.13, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                if whenKeyJustPressed(Config.keys["G"]) then
                    loc4 = GetEntityCoords(PlayerPedId())
                    dist4x = dist4
                    reg = false
                    reg1 = false
                    reg2 = false
                    Citizen.Wait(1000)
                    local trail = {}
                    table.insert(trail, {
                        loc1 = loc1,
                        loc2 = loc2,
                        loc3 = loc3,
                        loc4 = loc4
                      })
                      local distx = dist1x+dist2x+dist3x+dist4x
                    TriggerServerEvent("syn_ranch:registertrail",ranchid,trail,distx)
                    registering = false
                end
            elseif 8 > dist4 then
                drawtext(Config.Language.tooclose, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            elseif dist4 > range then
                drawtext(Config.Language.outrange, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            end
        end
        
       end
    end
end)

RegisterCommand(Config.herdingdogcommand, function(source, args, raw)
    if not onme2 then 
        if ontheway then
            if dog ~= "0" then 
                onme = true
                onme2 = true 
                for k,v in pairs(herd) do 
                    if not v.stray then
                         ClearPedTasks(v.goat)
                         FreezeEntityPosition(v.goat,false)
                         local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.5, 0.5, -0.35))
                         TaskGoToCoordAnyMeans(v.goat ,x,y,z ,1.5, 0, 0, 0, 0.5)
                    end
                end
                Citizen.Wait(10000)
                for k,v in pairs(herd) do 
                    if not v.stray then
                        FreezeEntityPosition(v.goat,false)
                        ClearPedTasks(v.goat)
                        TaskGoToEntity(v.goat, goal, -1, 7.2, 1.0, 0, 0)
                        local coo = GetEntityCoords(goal) 
                        TaskGoToCoordAnyMeans(v.goat,coo.x,coo.y,coo.z,1.5,0,0,0,0)
                    end
                end
                onme = false
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
       Citizen.Wait(100)
        if onme2 then 
            Citizen.Wait(300000)
            onme2 = false
        end
    end
end)


Citizen.CreateThread(function()
    while true do
       Citizen.Wait(100)
       if not onme and ontheway then
            if first == false then 
                for k,v in pairs(herd) do 
                    local hcoords = GetEntityCoords(v.goat)
                    local pcoords = GetEntityCoords(goal)
                    local caldist = GetDistanceBetweenCoords(pcoords.x, pcoords.y, pcoords.z, hcoords.x, hcoords.y, hcoords.z,0)
                    if 20 > caldist and ontheway then
                        reset = true
                    end
                end
                if reset then 
                    DeleteEntity(goal)
                    goal = nil
                    inv = GetHashKey("a_c_chipmunk_01")       
                    RequestModel(inv)
                    while not HasModelLoaded(inv) do
                        Wait(10)
                    end
                    inv = CreatePed("a_c_chipmunk_01", loc2.x, loc2.y,loc2.z, true, true, true)
                    goal = inv
                    SetEntityVisible(goal,false)
                    SetPedRelationshipGroupHash(goal,rel2)
                    FreezeEntityPosition(goal,true)
                    SetPlayerInvincible(goal, true) 
                end
                if reset then
                    Wait(1000)
                    for k,v in pairs(herd) do
                         FreezeEntityPosition(v.goat,true) 
                         first = true
                         FreezeEntityPosition(v.goat,false)
                        ClearPedTasks(v.goat)
                        TaskGoToEntity(v.goat, goal, -1, 7.2, 1.0, 0, 0)
                        local coo = GetEntityCoords(goal) 
                        TaskGoToCoordAnyMeans(v.goat,coo.x,coo.y,coo.z,1.5,0,0,0,0)

                    end
                end
            end
        end

    end
end)



Citizen.CreateThread(function()
    while true do
       Citizen.Wait(100)
        if not onme and ontheway then
            if first == true and sec == false and reset then 
                for k,v in pairs(herd) do 
                    local hcoords = GetEntityCoords(v.goat)
                    local pcoords = GetEntityCoords(goal)
                    local caldist = GetDistanceBetweenCoords(pcoords.x, pcoords.y, pcoords.z, hcoords.x, hcoords.y, hcoords.z,0)
                    if 20 > caldist and ontheway then
                        reset2 = true
                    end
                end
                if reset2 then 
                    DeleteEntity(goal)
                    goal = nil
                    inv = GetHashKey("a_c_chipmunk_01")       
                    RequestModel(inv)
                    while not HasModelLoaded(inv) do
                        Wait(10)
                    end
                    inv = CreatePed("a_c_chipmunk_01", loc3.x, loc3.y,loc3.z, true, true, true)
                    goal = inv
                    SetEntityVisible(goal,false)
                    SetPedRelationshipGroupHash(goal,rel2)
                    FreezeEntityPosition(goal,true)
                    SetPlayerInvincible(goal, true) 
                    
                end
                if reset2 then
                    Wait(1000)
                    for k,v in pairs(herd) do
                         FreezeEntityPosition(v.goat,true) 
                         sec = true
                         FreezeEntityPosition(v.goat,false)
                        ClearPedTasks(v.goat)
                        TaskGoToEntity(v.goat, goal, -1, 7.2, 1.0, 0, 0)
                        local coo = GetEntityCoords(goal) 
                        TaskGoToCoordAnyMeans(v.goat,coo.x,coo.y,coo.z,1.5,0,0,0,0)

                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
       Citizen.Wait(100)
        if not onme and ontheway then
            if first == true and sec == true and third == false and reset2 then 
                for k,v in pairs(herd) do 
                    local hcoords = GetEntityCoords(v.goat)
                    local pcoords = GetEntityCoords(goal)
                    local caldist = GetDistanceBetweenCoords(pcoords.x, pcoords.y, pcoords.z, hcoords.x, hcoords.y, hcoords.z,0)
                    if 20 > caldist and ontheway then
                        reset3 = true
                    end
                end
                if reset3 then 
                    DeleteEntity(goal)
                    goal = nil
                    inv = GetHashKey("a_c_chipmunk_01")       
                    RequestModel(inv)
                    while not HasModelLoaded(inv) do
                        Wait(10)
                    end
                    inv = CreatePed("a_c_chipmunk_01", loc4.x, loc4.y,loc4.z, true, true, true)
                    goal = inv
                    SetEntityVisible(goal,false)
                    SetPedRelationshipGroupHash(goal,rel2)
                    FreezeEntityPosition(goal,true)
                    SetPlayerInvincible(goal, true) 
                    
                end
                if reset3 then 
                    Wait(1000)
                    for k,v in pairs(herd) do
                         FreezeEntityPosition(v.goat,true) 
                         third = true
                         FreezeEntityPosition(v.goat,false)
                        ClearPedTasks(v.goat)
                        TaskGoToEntity(v.goat, goal, -1, 7.2, 1.0, 0, 0)
                        local coo = GetEntityCoords(goal) 
                        TaskGoToCoordAnyMeans(v.goat,coo.x,coo.y,coo.z,1.5,0,0,0,0)

                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
       Citizen.Wait(100)
        if not onme and ontheway then
            if first == true and sec == true and third == true and fourth == false and reset3 then 
                for k,v in pairs(herd) do 
                    local hcoords = GetEntityCoords(v.goat)
                    local pcoords = GetEntityCoords(goal)
                    local caldist = GetDistanceBetweenCoords(pcoords.x, pcoords.y, pcoords.z, hcoords.x, hcoords.y, hcoords.z,0)
                    if 20 > caldist and ontheway then
                        reset4 = true
                    end
                end
                if reset4 then 
                    DeleteEntity(goal)
                    goal = nil
                    inv = GetHashKey("a_c_chipmunk_01")       
                    RequestModel(inv)
                    while not HasModelLoaded(inv) do
                        Wait(10)
                    end
                    inv = CreatePed("a_c_chipmunk_01", loc3.x, loc3.y,loc3.z, true, true, true)
                    goal = inv
                    SetEntityVisible(goal,false)
                    SetPedRelationshipGroupHash(goal,rel2)
                    FreezeEntityPosition(goal,true)
                    SetPlayerInvincible(goal, true) 
                    
                end
                if reset4 then 
                    Wait(1000)
                    for k,v in pairs(herd) do
                         FreezeEntityPosition(v.goat,true) 
                         fourth = true
                         FreezeEntityPosition(v.goat,false)
                        ClearPedTasks(v.goat)
                        TaskGoToEntity(v.goat, goal, -1, 7.2, 1.0, 0, 0)
                        local coo = GetEntityCoords(goal) 
                        TaskGoToCoordAnyMeans(v.goat,coo.x,coo.y,coo.z,1.5,0,0,0,0)

                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
       Citizen.Wait(100)
        if not onme and ontheway then
            if first == true and sec == true and third == true and fourth == true and fifth == false and reset4 then 
                for k,v in pairs(herd) do 
                    local hcoords = GetEntityCoords(v.goat)
                    local pcoords = GetEntityCoords(goal)
                    local caldist = GetDistanceBetweenCoords(pcoords.x, pcoords.y, pcoords.z, hcoords.x, hcoords.y, hcoords.z,0)
                    if 20 > caldist and ontheway then
                        reset5 = true
                    end
                end
                if reset5 then 
                    DeleteEntity(goal)
                    goal = nil
                    inv = GetHashKey("a_c_chipmunk_01")       
                    RequestModel(inv)
                    while not HasModelLoaded(inv) do
                        Wait(10)
                    end
                    inv = CreatePed("a_c_chipmunk_01", loc2.x, loc2.y,loc2.z, true, true, true)
                    goal = inv
                    SetEntityVisible(goal,false)
                    SetPedRelationshipGroupHash(goal,rel2)
                    FreezeEntityPosition(goal,true)
                    SetPlayerInvincible(goal, true) 
                    
                end
                if reset5 then 
                    Wait(1000)
                    for k,v in pairs(herd) do
                         FreezeEntityPosition(v.goat,true) 
                         fifth = true
                         FreezeEntityPosition(v.goat,false)
                        ClearPedTasks(v.goat)
                        TaskGoToEntity(v.goat, goal, -1, 7.2, 1.0, 0, 0)
                        local coo = GetEntityCoords(goal) 
                        TaskGoToCoordAnyMeans(v.goat,coo.x,coo.y,coo.z,1.5,0,0,0,0)

                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
       Citizen.Wait(100)
        if not onme and ontheway then
            if first == true and sec == true and third == true and fourth == true and fifth == true and sixth == false and reset5 then 
                for k,v in pairs(herd) do 
                    local hcoords = GetEntityCoords(v.goat)
                    local pcoords = GetEntityCoords(goal)
                    local caldist = GetDistanceBetweenCoords(pcoords.x, pcoords.y, pcoords.z, hcoords.x, hcoords.y, hcoords.z,0)
                    if 20 > caldist and ontheway then
                        reset6 = true
                    end
                end
                if reset6 then 
                    DeleteEntity(goal)
                    goal = nil
                    inv = GetHashKey("a_c_chipmunk_01")       
                    RequestModel(inv)
                    while not HasModelLoaded(inv) do
                        Wait(10)
                    end
                    inv = CreatePed("a_c_chipmunk_01", loc1.x, loc1.y,loc1.z, true, true, true)
                    goal = inv
                    SetEntityVisible(goal,false)
                    SetPedRelationshipGroupHash(goal,rel2)
                    FreezeEntityPosition(goal,true)
                    SetPlayerInvincible(goal, true) 
                    
                end
                if reset6 then 
                    Wait(1000)
                    for k,v in pairs(herd) do
                         FreezeEntityPosition(v.goat,true) 
                         sixth = true
                         FreezeEntityPosition(v.goat,false)
                        ClearPedTasks(v.goat)
                        TaskGoToEntity(v.goat, goal, -1, 7.2, 1.0, 0, 0)
                        local coo = GetEntityCoords(goal) 
                        TaskGoToCoordAnyMeans(v.goat,coo.x,coo.y,coo.z,1.5,0,0,0,0)

                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
       Citizen.Wait(100)
            for k,v in pairs(herd) do 
                 local xcoords = GetEntityCoords(v.goat)
                 local zcoords = GetEntityCoords(goal)
                 local caldist = GetDistanceBetweenCoords(zcoords.x, zcoords.y, zcoords.z, xcoords.x, xcoords.y, xcoords.z,0)
                 if first == true and sec == true and third == true and fourth == true and fifth and sixth and reset6 then 
                     if 20 > caldist and ontheway and not reachedtimerout then
                         reached = true
                         DeleteEntity(v.goat)
                         finalnumber = finalnumber + 1
                         timer3 = Config.reachedtimer
                     end
                 end
             end
        
    end
end)

Citizen.CreateThread(function() 
    while true do
       Citizen.Wait(100)
            for k,v in pairs(herd) do 
                 local xcoords = GetEntityCoords(v.goat)
                 for f, g in pairs(Config.cattlesale) do
                     local caldist = GetDistanceBetweenCoords(g.Pos.x, g.Pos.y, g.Pos.z, xcoords.x, xcoords.y, xcoords.z,0)
                     if 20 > caldist and ontheway2 and not reachedtimerout2 then
                         reached2 = true
                         DeleteEntity(v.goat)
                         finalnumber = finalnumber + 1
                         timer5 = Config.reachedtimer
                     end
                 end
             end
          
    end
end)

Citizen.CreateThread(function() 
    while true do
       Citizen.Wait(100)
       if ontheway and not reached then 
            for k,v in pairs(herd) do
                if IsEntityDead(v.goat) then
                    table.remove(herd,k)
                    herdno = herdno - 1
                    q_cattlex[type] = q_cattlex[type] - (q_cattlex[type] * 0.1)
                    if Config.pvp then 
                        local PedKiller = GetPedSourceOfDeath(v.goat)
                        if IsEntityAPed(PedKiller) and IsPedAPlayer(PedKiller) then
                            Killer = NetworkGetPlayerIndexFromPed(PedKiller)
                        elseif IsEntityAVehicle(PedKiller) and IsEntityAPed(GetPedInVehicleSeat(PedKiller, -1)) and IsPedAPlayer(GetPedInVehicleSeat(PedKiller, -1)) then
                            Killer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(PedKiller, -1))
                        end
                        if (Killer ~= PlayerId()) then
                            local killz = GetPlayerServerId(Killer)
                            if killz ~= nil then 
                                if Config.vorp then
                                    TriggerEvent("vorp:TipBottom", Config.Language.herddie, 4000)
                                elseif Config.redem then
                                    TriggerEvent("redem_roleplay:Tip", Config.Language.herddie, 4000)
                                end
                                TriggerServerEvent("syn_ranch:rewardkiller",type,killz)
                            end
                            killz = nil
                        end
                    end
                end
            end
            if 0 >= #herd then 
                herdno = 0
                failedherding = true
            end
        end
    end
end)

Citizen.CreateThread(function() 
    while true do
       Citizen.Wait(100)
       if ontheway2 and not reached2 then 
            for o,p in pairs(herd) do 
                TaskGoToEntity( p.goat, PlayerPedId(), -1, 1.5, 2.0, 0, 0 )
                local coo = GetEntityCoords(PlayerPedId()) 
                TaskGoToCoordAnyMeans(p.goat,coo.x,coo.y,coo.z,1.5,0,0,0,0)   
		        Citizen.InvokeNative(0x489FFCCCE7392B55, p.goat, PlayerPedId()) --Follow
            end
            for k,v in pairs(herd) do
                if IsEntityDead(v.goat) then
                    table.remove(herd,k)
                    herdno = herdno - 1
                    q_cattlex[type] = q_cattlex[type] - (q_cattlex[type] * 0.1)
                    if Config.pvp then 
                        local PedKiller = GetPedSourceOfDeath(v.goat)
                        if IsEntityAPed(PedKiller) and IsPedAPlayer(PedKiller) then
                            Killer = NetworkGetPlayerIndexFromPed(PedKiller)
                        elseif IsEntityAVehicle(PedKiller) and IsEntityAPed(GetPedInVehicleSeat(PedKiller, -1)) and IsPedAPlayer(GetPedInVehicleSeat(PedKiller, -1)) then
                            Killer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(PedKiller, -1))
                        end
                        if (Killer ~= PlayerId()) then
                            local killz = GetPlayerServerId(Killer)
                            if killz ~= nil then 
                                if Config.vorp then
                                    TriggerEvent("vorp:TipBottom", Config.Language.herddie, 4000)
                                elseif Config.redem then
                                    TriggerEvent("redem_roleplay:ShowObjective", Config.Language.herddie, 4000)
                                end
                                TriggerServerEvent("syn_ranch:rewardkiller",type,killz)
                            end
                            killz = nil
                        end
                    end
                end
            end
            if 0 >= #herd then 
                herdno = 0
                failedherding2 = true
            end
        end
    end
end)

Citizen.CreateThread(function() -- findme
    while true do
       Citizen.Wait(100)
       
       if ontheway2 and not reached2 then
            if IsEntityDead(PlayerPedId()) or timeout2 or failedherding2 then 
                for k,v in pairs(herd) do 
                    DeleteEntity(v.goat)
                end
                for k,v in pairs(wolfs) do 
                    DeleteEntity(v.wolfz)
                end
                DeleteEntity(dogg)
                ontheway2 = false 
                if herdno > 1 then 
                    finalnumber = round(herdno/2)
                    q_cattlex[type] = round(q_cattlex[type]/2)
                else 
                    finalnumber = 0
                end
                if Config.vorp then
                    TriggerEvent("vorp:TipBottom", Config.Language.failed, 4000)
                elseif Config.redem then
                    TriggerEvent("redem_roleplay:ShowObjective", Config.Language.failed, 4000)
                end
                Citizen.Wait(100)
                if finalnumber ~= 0 then 
                    cattlex[type] = finalnumber
                elseif 0 >= finalnumber then 
                    cattlex[type] = nil
                end
                if 0 >= q_cattlex[type] then 
                    q_cattlex[type] = nil
                end
                TriggerServerEvent("syn_ranch:finishedherding",ranchid,cattlex,q_cattlex)
                  
            end
        end
    end
end)


Citizen.CreateThread(function() -- findme
    while true do
       Citizen.Wait(100)
       
       if ontheway and not reached then
            if IsEntityDead(PlayerPedId()) or timeout or failedherding then 
                DeleteEntity(goal)
                for k,v in pairs(herd) do 
                    DeleteEntity(v.goat)
                end
                for k,v in pairs(wolfs) do 
                    DeleteEntity(v.wolfz)
                end
                DeleteEntity(dogg)
                ontheway = false 
                if herdno > 1 then 
                    finalnumber = round(herdno/2)
                    q_cattlex[type] = round(q_cattlex[type]/2)
                else 
                    finalnumber = 0
                end
                if Config.vorp then
                    TriggerEvent("vorp:TipBottom", Config.Language.failed, 4000)
                elseif Config.redem then
                    TriggerEvent("redem_roleplay:ShowObjective", Config.Language.failed, 4000)
                end
                Citizen.Wait(100)
                if finalnumber ~= 0 then 
                    cattlex[type] = finalnumber
                elseif 0 >= finalnumber then 
                    cattlex[type] = nil
                end
                if 0 >= q_cattlex[type] then 
                    q_cattlex[type] = nil
                end
                TriggerServerEvent("syn_ranch:finishedherding",ranchid,cattlex,q_cattlex)
                failedherding = false
                reached = false
                first = false 
                sec = false 
                third = false
                fourth = false
                fifth = false
                sixth = false    
                reset = false
                reset2 = false
                reset3 = false
                reset4 = false 
                reset5 = false
                reset6 = false  
                reachedtimerout = false
                timeout = false
                timer3 = Config.reachedtimer
                timer = Config.herdtimer
                finalnumber = 0
                herd = {}    
            end
        end
    end
end)

Citizen.CreateThread(function() -- timer
    while true do
        Citizen.Wait(1)
	    if timer >= 0 and ontheway then
	    	Citizen.Wait(1000)
	    	if timer > 0 then
	    		timer = timer - 1
	    	end
            if 0 >= timer then 
                timeout = true 
            end
	    end
    end
end)

Citizen.CreateThread(function() -- timer6
    while true do
        Citizen.Wait(1)
	    if timer6 >= 0 and ontheway2 then
	    	Citizen.Wait(1000)
	    	if timer6 > 0 then
	    		timer6 = timer6 - 1
	    	end
            if 0 >= timer6 then 
                timeout2 = true 
            end
	    end
    end
end)

Citizen.CreateThread(function() -- timer3
    while true do
        Citizen.Wait(1)
	    if timer3 >= 0 and reached then
	    	Citizen.Wait(1000)
	    	if timer3 > 0 then
	    		timer3 = timer3 - 1
	    	end
            if 0 >= timer3 then 
                reachedtimerout = true 
            end
	    end
    end
end)

Citizen.CreateThread(function() -- timer5
    while true do
        Citizen.Wait(1)
	    if timer5 >= 0 and reached2 then
	    	Citizen.Wait(1000)
	    	if timer5 > 0 then
	    		timer5 = timer5 - 1
	    	end
            if 0 >= timer5 then 
                reachedtimerout2 = true 
            end
	    end
    end
end)

Citizen.CreateThread(function() -- timer7
    while true do
        Citizen.Wait(1)
	    if timer7 >= 0 and cooldown4 then
	    	Citizen.Wait(1000)
	    	if timer7 > 0 then
	    		timer7 = timer7 - 1
	    	end
            if 0 >= timer7 then 
                cooldown4 = false 
                SetPlayerInvincible(cowmo, false)
                DeleteEntity(cowmo)
                cheater = false 
            end
	    end
    end
end)


Citizen.CreateThread(function() -- timer8
    while true do
        Citizen.Wait(1)
	    if timer8 >= 0 and cooldown5 then
	    	Citizen.Wait(1000)
	    	if timer8 > 0 then
	    		timer8 = timer8 - 1
	    	end
            if 0 >= timer8 then 
                cooldown5 = false 
                for k,v in pairs(chicken) do 
                    SetPlayerInvincible(v.chicken, false)
                    DeleteEntity(v.chicken)
                end
            end
	    end
    end
end)


Citizen.CreateThread(function() -- timer2
    while true do
        Citizen.Wait(1)
	    if timer2 >= 0 and herdingcooldown then
	    	Citizen.Wait(1000)
	    	if timer2 > 0 then
	    		timer2 = timer2 - 1
	    	end
            if 0 >= timer2 then 
                herdingcooldown = false
                timer2 =  Config.herdingcooldown
            end
	    end
    end
end)
Citizen.CreateThread(function() -- timer4
    while true do
        Citizen.Wait(1)
	    if timer4 >= 0 and herdingcooldown2 then
	    	Citizen.Wait(1000)
	    	if timer4 > 0 then
	    		timer4 = timer4 - 1
	    	end
            if 0 >= timer4 then 
                herdingcooldown2 = false
                timer4 =  Config.salecooldown
            end
	    end
    end
end)

Citizen.CreateThread(function() --  findme
    while true do
       Citizen.Wait(100)
       if reached2 and 0 >= timer5 then 
        local quality = 0
        local num
            ontheway2 = false
            if Config.vorp then
                TriggerEvent("vorp:TipBottom", Config.Language.finished, 4000)
            elseif Config.redem then
                TriggerEvent("redem_roleplay:ShowObjective", Config.Language.finished, 4000)
            end
            for k,v in pairs(herd) do
                DeleteEntity(v.goat)
            end
            for k,v in pairs(wolfs) do 
                DeleteEntity(v.wolfz)
            end
            DeleteEntity(dogg)
            reached2 = false
            reachedtimerout2 = false 
            timeout2 = false 
            timer6 = Config.selltimer
            timer5 = Config.reachedtimer
            herd = {}      
            if  finalnumber ~= herdno then 
                local deleted = herdno - finalnumber 
                q_cattlex[type] = q_cattlex[type] - ((q_cattlex[type] * 0.1)*deleted)
            end
            if finalnumber ~= 0 then 
                cattlex[type] = finalnumber
                quality = q_cattlex[type]
                num = finalnumber
            elseif 0 >= finalnumber then 
                cattlex[type] = nil
                q_cattlex[type] = nil
                quality = 0
                num = 0
            end
            cattlex[type] = nil
            q_cattlex[type] = nil
            TriggerServerEvent("syn_ranch:rewardsale",ranchid,cattlex,q_cattlex,quality,num,type) 
            finalnumber = 0
        end
    end
end)


Citizen.CreateThread(function() -- findme
    while true do
       Citizen.Wait(100)
       if reached and 0 >= timer3 then 
            DeleteEntity(goal)
            ontheway = false
            if Config.vorp then
                TriggerEvent("vorp:TipBottom", Config.Language.finished, 4000)
            elseif Config.redem then
                TriggerEvent("redem_roleplay:ShowObjective", Config.Language.finished, 4000)
            end
            for k,v in pairs(herd) do
                DeleteEntity(v.goat)
            end
            for k,v in pairs(wolfs) do 
                DeleteEntity(v.wolfz)
            end
            DeleteEntity(dogg)
            reached = false
            first = false 
            sec = false 
            third = false
            fourth = false
            fifth = false
            sixth = false    
            reset = false
            reset2 = false
            reset3 = false
            reset4 = false 
            reset5 = false
            reset6 = false 
            timeout = false
            timer3 = Config.reachedtimer
            reachedtimerout = false 
            herd = {}      
            if  finalnumber ~= herdno then 
                local deleted = herdno - finalnumber 
                q_cattlex[type] = q_cattlex[type] - ((q_cattlex[type] * 0.1)*deleted)
            end
            if finalnumber ~= 0 then 
                cattlex[type] = finalnumber
                if Config.maxquality > q_cattlex[type] then 
                    q_cattlex[type] = (q_cattlex[type] + finalnumber) * distance
                end
            elseif 0 >= finalnumber then 
                cattlex[type] = nil
                q_cattlex[type] = nil
            end
            if q_ranch == 0 then 
                q_ranch = 1 
            end
            q_cattlex[type] = q_cattlex[type] * (q_ranch/100)
            if Config.qualitybuff then
                q_cattlex[type] = q_cattlex[type] * Config.qualitybuffvalue
            end
            if q_cattlex[type] > Config.maxquality then 
                q_cattlex[type] = Config.maxquality
            end
            TriggerServerEvent("syn_ranch:finishedherding",ranchid,cattlex,q_cattlex)
            finalnumber = 0
        end
    end
end)

Citizen.CreateThread(function()
    while true do
       Citizen.Wait(100)
       if ontheway then 
            for k,v in pairs(herd) do 
                if dog ~= "0" then 
                    local xcoords = GetEntityCoords(v.goat)
                    local ycoords = GetEntityCoords(dogg)
                    local zcoords = GetEntityCoords(PlayerPedId())
                    local caldist2 = GetDistanceBetweenCoords(zcoords.x, zcoords.y, zcoords.z, xcoords.x, xcoords.y, xcoords.z,0)
                    local caldist = GetDistanceBetweenCoords(ycoords.x, ycoords.y, ycoords.z, xcoords.x, xcoords.y, xcoords.z,0)
                    if caldist2 > 8 and caldist > 15 and ontheway and not v.stray and not onme then
                         ClearPedTasks(v.goat)
                         FreezeEntityPosition(v.goat,true)
                         v.far = true
                    elseif v.far and (8 > caldist2 or 15 > caldist) and not v.stray and not onme then
                         FreezeEntityPosition(v.goat,false)
                         TaskGoToEntity(v.goat, goal, -1, 7.2, 1.0, 0, 0)
                         local coo = GetEntityCoords(goal) 
                         TaskGoToCoordAnyMeans(v.goat,coo.x,coo.y,coo.z,1.5,0,0,0,0)
 
                        v.far = false
                    end
                else
                    local xcoords = GetEntityCoords(v.goat)
                        local zcoords = GetEntityCoords(PlayerPedId())
                        local caldist2 = GetDistanceBetweenCoords(zcoords.x, zcoords.y, zcoords.z, xcoords.x, xcoords.y, xcoords.z,0)
                    if caldist2 > 8 and ontheway and not v.stray and not onme then
                         ClearPedTasks(v.goat)
                         FreezeEntityPosition(v.goat,true)
                         v.far = true
                    elseif v.far and 8 > caldist2 and not v.stray and not onme then
                         FreezeEntityPosition(v.goat,false)
                         TaskGoToEntity(v.goat, goal, -1, 7.2, 1.0, 0, 0)
                         local coo = GetEntityCoords(goal) 
                         TaskGoToCoordAnyMeans(v.goat,coo.x,coo.y,coo.z,1.5,0,0,0,0)
 
                        v.far = false
                    end
                end
             end
        end
    end
end)

Citizen.CreateThread(function() 
    while true do
       Citizen.Wait(100)
       if ontheway2 then 
            for k,v in pairs(herd) do 
                 local xcoords = GetEntityCoords(v.goat)
                     local zcoords = GetEntityCoords(PlayerPedId())
                     local caldist2 = GetDistanceBetweenCoords(zcoords.x, zcoords.y, zcoords.z, xcoords.x, xcoords.y, xcoords.z,0)
                 if caldist2 > 60 and ontheway2 and not v.stray  then
                      ClearPedTasks(v.goat)
                      FreezeEntityPosition(v.goat,true)
                      v.far = true
                 elseif v.far and 60 > caldist2 and not v.stray then
                      FreezeEntityPosition(v.goat,false)
                      TaskGoToEntity(v.goat, PlayerPedId(), -1, 10.5, 3.5, 0, 0 )
                        Citizen.InvokeNative(0x489FFCCCE7392B55, v.goat, PlayerPedId()) --Follow
                        local coo = GetEntityCoords(PlayerPedId()) 
                        TaskGoToCoordAnyMeans(v.goat,coo.x,coo.y,coo.z,3.5,0,0,0,0)

                        v.far = false
                 end
            end
        end
    end
end)



Citizen.CreateThread(function()
    while true do
       Citizen.Wait(5000)
       if not justspawned2 and ontheway2 then
            for k,v in pairs(herd) do 
                 if ontheway2 and not v.far and not v.stray then
                     Citizen.Wait(5000)
                     local straychance = math.random(1,10)
                     if straychance > Config.stray and not cooldown3 then
                        freakout = GetEntityCoords(v.goat)
                        cooldown3 = true 
                         v.stray = true 
                         local hcoords = GetEntityCoords(v.goat)
                         v.orgcoords = hcoords
                         ClearPedTasks(v.goat)
                         FreezeEntityPosition(v.goat,false)
                         TaskGoToCoordAnyMeans(v.goat ,hcoords.x+20,hcoords.y+20,hcoords.z ,1.5, 0, 0, 0, 0.5)
                     end
                end
            end
        end
    end
end)



Citizen.CreateThread(function()
    while true do
       Citizen.Wait(1000)
       local x,y,z
       if not justspawned and ontheway then
            for k,v in pairs(herd) do 
                 if ontheway and not v.far and not v.stray and not cooldown2 then
                     Citizen.Wait(9000)
                     local straychance = math.random(1,15)
                     if straychance > Config.wolf and not cooldown2 then
                        cooldown2 = true 
                         attack = true 
                     end
                end
            end
            if attack then 
                for i=1, herdno /2 do
                    local wolf
                    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 10.5, 10.5, 1.15))
                    wolf = GetHashKey("a_c_wolf")       
                    RequestModel(wolf)
                    while not HasModelLoaded(wolf) do
                        Wait(10)
                    end
                    wolf = CreatePed("a_c_wolf", x, y, z, true, true, true)
                    attack = false
                    Citizen.InvokeNative(0x77FF8D35EEC6BBC4, wolf, 1, 0)
                    Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, wolf)
                    table.insert(wolfs, {
                        wolfz        = wolf
                      })
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
       Citizen.Wait(5000)
       if not justspawned and ontheway then
            for k,v in pairs(herd) do 
                 if ontheway and not v.far and not v.stray then
                     Citizen.Wait(5000)
                     local straychance = math.random(1,10)
                     if straychance > Config.stray and not cooldown then
                        freakout = GetEntityCoords(v.goat)
                        cooldown = true 
                         v.stray = true 
                         local hcoords = GetEntityCoords(v.goat)
                         v.orgcoords = hcoords
                         ClearPedTasks(v.goat)
                         FreezeEntityPosition(v.goat,false)
                         TaskGoToCoordAnyMeans(v.goat ,hcoords.x+20,hcoords.y+20,hcoords.z ,1.5, 0, 0, 0, 0.5)
                         if dog ~= "0" then 
                            ClearPedTasks(dogg)
                            TaskGoToEntity(dogg, v.goat, -1, 1.5, 2.0, 0, 0 )
                            local coo = GetEntityCoords(v.goat) 
                            TaskGoToCoordAnyMeans(dogg,coo.x,coo.y,coo.z,1.5,0,0,0,0)   
                            Citizen.InvokeNative(0x489FFCCCE7392B55, dogg, v.goat)
                         end
                     end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
       Citizen.Wait(100)
       if ontheway then
            for k,v in pairs(herd) do 
                if v.stray then 
                    if dog ~= "0" then 
                        Citizen.Wait(5000)
                        local xcoords = GetEntityCoords(v.goat)
                        local zcoords = GetEntityCoords(PlayerPedId())
                        local ycoords = GetEntityCoords(dogg)
                        local hasdog = false 
                        local caldist = GetDistanceBetweenCoords(ycoords.x, ycoords.y, ycoords.z, xcoords.x, xcoords.y, xcoords.z,0)
                        local caldist2 = GetDistanceBetweenCoords(zcoords.x, zcoords.y, zcoords.z, xcoords.x, xcoords.y, xcoords.z,0)
                        if 5 > caldist2 or 5 > caldist then 
                            ClearPedTasks(v.goat) 
                            SetBlockingOfNonTemporaryEvents(farm2, true)
                            TaskGoToCoordAnyMeans(v.goat ,freakout.x,freakout.y,freakout.z ,1.5, 0, 0, 0, 0.5)
                            v.far = false
                            TaskGoToEntity(v.goat, goal, -1, 7.2, 1.0, 0, 0)
                            local coo = GetEntityCoords(goal) 
                            TaskGoToCoordAnyMeans(v.goat,coo.x,coo.y,coo.z,1.5,0,0,0,0)   
                            Citizen.Wait(15000)
                            v.stray = false
                            v.far = false
                            ClearPedTasks(dogg)
                            TaskGoToEntity(dogg, PlayerPedId(), -1, 3.5, 2.0, 0, 0 )
                            local coo = GetEntityCoords(PlayerPedId()) 
                            TaskGoToCoordAnyMeans(dogg,coo.x,coo.y,coo.z,1.5,0,0,0,0)   
	        	            Citizen.InvokeNative(0x489FFCCCE7392B55, dogg, PlayerPedId())
                        end
                    else
                        Citizen.Wait(5000)
                        local xcoords = GetEntityCoords(v.goat)
                        local zcoords = GetEntityCoords(PlayerPedId())
                        local hasdog = false 
                        local caldist2 = GetDistanceBetweenCoords(zcoords.x, zcoords.y, zcoords.z, xcoords.x, xcoords.y, xcoords.z,0)
                        if 5 > caldist2 then 
                            ClearPedTasks(v.goat) 
                            SetBlockingOfNonTemporaryEvents(farm2, true)
                            TaskGoToCoordAnyMeans(v.goat ,freakout.x,freakout.y,freakout.z ,1.5, 0, 0, 0, 0.5)
                            v.stray = false
                            v.far = false
                            Citizen.Wait(10000)
                            TaskGoToEntity(v.goat, goal, -1, 7.2, 1.0, 0, 0)
                            local coo = GetEntityCoords(goal) 
                            TaskGoToCoordAnyMeans(v.goat,coo.x,coo.y,coo.z,1.5,0,0,0,0)   

                        end
                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
       Citizen.Wait(100)
       if ontheway2 then
            for k,v in pairs(herd) do 
                if v.stray then 
                    Citizen.Wait(5000)
                    local xcoords = GetEntityCoords(v.goat)
                    local zcoords = GetEntityCoords(PlayerPedId())
                    local caldist2 = GetDistanceBetweenCoords(zcoords.x, zcoords.y, zcoords.z, xcoords.x, xcoords.y, xcoords.z,0)
                    if 5 > caldist2 then 
                        ClearPedTasks(v.goat) 
                        SetBlockingOfNonTemporaryEvents(farm2, true)
                        TaskGoToCoordAnyMeans(v.goat ,freakout.x,freakout.y,freakout.z ,1.5, 0, 0, 0, 0.5)
                        v.stray = false
                        v.far = false
                        Citizen.Wait(10000)
                        TaskGoToEntity(v.goat, PlayerPedId(), -1, 1.5, 2.0, 0, 0 )
                        local coo = GetEntityCoords(PlayerPedId()) 
                        TaskGoToCoordAnyMeans(v.goat,coo.x,coo.y,coo.z,1.5,0,0,0,0)   
	        	         Citizen.InvokeNative(0x489FFCCCE7392B55, v.goat, PlayerPedId()) --Follow
                    end
                end
            end
        end
    end
end)

function round(x)
    return x>=0 and math.floor(x+0.5) or math.ceil(x-0.5)
end
function AnIndexOf(t,val)
    for k,v in ipairs(t) do 
        if v == val then return k end
    end
end
local function getIndex(tab, val)
    local index = nil
    for i, v in ipairs (tab) do 
        if (v.id == val) then
          index = i 
        end
    end
    return index
end


Citizen.CreateThread(function()
    while true do
       Citizen.Wait(0)
       if timer >0 and ontheway and not reached then
            drawtext(Config.Language.timerxz..timer, 0.15, 0.13, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
       end      
    end
end)

Citizen.CreateThread(function()
    while true do
       Citizen.Wait(0)
       if timer6 >0 and ontheway2 and not reached2 then
            drawtext(Config.Language.timerxz..timer6, 0.15, 0.13, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
       end      
    end
end)

Citizen.CreateThread(function()
    while true do
       Citizen.Wait(0)
       if timer3 >0 and reached then
            drawtext(Config.Language.timerxz..timer3, 0.15, 0.13, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
       end      
    end
end)

Citizen.CreateThread(function()
    while true do
       Citizen.Wait(0)
       if timer5 >0 and reached2 then
            drawtext(Config.Language.timerxz..timer5, 0.15, 0.13, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
       end      
    end
end)


RegisterNetEvent("syn_ranch:ranchinfo")
AddEventHandler("syn_ranch:ranchinfo", function(ranch)
  ranches = ranch
end)

RegisterNetEvent("syn_ranch:resetblips")
AddEventHandler("syn_ranch:resetblips", function()
  Citizen.Wait(1000)
  TriggerServerEvent("syn_ranch:getranchinfo")
  Citizen.Wait(1000)
  TriggerEvent("syn_ranch:removeblips")
  Citizen.Wait(500)
  TriggerEvent("syn_ranch:createblips")
  TriggerEvent("syn_ranch:blip")
end)

RegisterNetEvent("syn_ranch:resetranch")
AddEventHandler("syn_ranch:resetranch", function()
  TriggerServerEvent("syn_ranch:getranchinfo")
end)

RegisterNetEvent("syn_ranch:getplayerinfos")
AddEventHandler("syn_ranch:getplayerinfos", function(identifier,charidentifier,job,rank)
  playerids = identifier
  playercharid = charidentifier
  playerjob = job
  playerrank = rank
end)

if Config.vorp then
    RegisterNetEvent("vorp:SelectedCharacter") -- NPC loads after selecting character
    AddEventHandler("vorp:SelectedCharacter", function(charid)
        Citizen.Wait(3000)
        TriggerServerEvent("syn_ranch:getplayerinfo")
        TriggerServerEvent("syn_ranch:getranchinfo")
        Citizen.Wait(3000)
        TriggerEvent("syn_ranch:resetblips")
    end)
end



if Config.redem then
    RegisterNetEvent("redem:PlayerSelected") -- NPC loads after selecting character
    AddEventHandler("redem:PlayerSelected", function(charid)
        hasLoaded = true
        Citizen.Wait(3000)
        TriggerServerEvent("syn_ranch:getplayerinfo")
        TriggerServerEvent("syn_ranch:getranchinfo")
        Citizen.Wait(3000)
        TriggerEvent("syn_ranch:resetblips")
    end)
end


RegisterNetEvent("syn_ranch:createranch")
AddEventHandler("syn_ranch:createranch", function()
  creatingranch = true
  WarMenu.OpenMenu('createranch')
end)

RegisterNetEvent("syn_ranch:herdg")
AddEventHandler("syn_ranch:herdg", function()
    if not ontheway then
        timer6 = Config.selltimer
        timer3 = Config.reachedtimer
        justspawned2 = true
        reached2 = false 
        reachedtimerout2 = false 
        local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.5, 0.5, -0.35))
        z = z+0.2
        for i=1, herdno do
            x = x+0.2
            y = y+0.2
            farm2 = GetHashKey(herdhash)       
            RequestModel(farm2)
            while not HasModelLoaded(farm2) do
                Wait(10)
            end
            farm2 = CreatePed(herdhash, x, y, z, true, true, true)
            SetBlockingOfNonTemporaryEvents(farm2, true)
            Citizen.InvokeNative(0x77FF8D35EEC6BBC4, farm2, 1, 0)
            table.insert(herd, {
                goat        = farm2,
                stray = false,
                far = false
              })
        end
        
        for o,p in pairs(herd) do 
            TaskGoToEntity( p.goat, PlayerPedId(), -1, 10.5, 2.5, 0, 0 )
            local coo = GetEntityCoords(PlayerPedId()) 
            TaskGoToCoordAnyMeans(p.goat,coo.x,coo.y,coo.z,2.5,0,0,0,0)   
		    Citizen.InvokeNative(0x489FFCCCE7392B55, p.goat, PlayerPedId()) --Follow
        end
        ontheway2 = true
    end
end)

RegisterNetEvent("syn_ranch:herdz")
AddEventHandler("syn_ranch:herdz", function()
    if not ontheway then
        timer = Config.herdtimer
        timer5 = Config.reachedtimer
        justspawned = true
        reached = false 
        reachedtimerout = false 
        local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.5, 0.5, -0.35))
        z = z+0.2
        for i=1, herdno do
            x = x+0.2
            y = y+0.2
            farm2 = GetHashKey(herdhash)       
            RequestModel(farm2)
            while not HasModelLoaded(farm2) do
                Wait(10)
            end
            farm2 = CreatePed(herdhash, x, y, z, true, true, true)
            SetBlockingOfNonTemporaryEvents(farm2, true)
            Citizen.InvokeNative(0x77FF8D35EEC6BBC4, farm2, 1, 0)
            table.insert(herd, {
                goat        = farm2,
                stray = false,
                far = false
              })
        end
        if dog ~= "0" then
            dogg = GetHashKey(dog)       
            RequestModel(dogg)
            while not HasModelLoaded(dogg) do
                Wait(10)
            end
            dogg = CreatePed(dog, x, y, z, true, true, true)
            SetBlockingOfNonTemporaryEvents(dogg, true)
            Citizen.InvokeNative(0x77FF8D35EEC6BBC4, dogg, 1, 0)
            TaskGoToEntity(dogg, PlayerPedId(), -1, 3.5, 2.0, 0, 0 )
            local coo = GetEntityCoords(PlayerPedId()) 
            TaskGoToCoordAnyMeans(dogg,coo.x,coo.y,coo.z,1.5,0,0,0,0)   
            Citizen.InvokeNative(0x489FFCCCE7392B55, dogg, PlayerPedId())
        end

        inv = GetHashKey("a_c_chipmunk_01")       
        RequestModel(inv)
        while not HasModelLoaded(inv) do
            Wait(10)
        end
        inv = CreatePed("a_c_chipmunk_01", loc1.x, loc1.y,loc1.z, true, true, true)
        goal = inv
        SetEntityVisible(goal,false)
        FreezeEntityPosition(goal,true)
        SetPlayerInvincible(goal, true)
        for o,p in pairs(herd) do 
            TaskGoToEntity(p.goat, goal, -1, 7.2, 1.0, 0, 0)
            local coo = GetEntityCoords(goal) 
            TaskGoToCoordAnyMeans(p.goat,coo.x,coo.y,coo.z,1.5,0,0,0,0)   
        end
        ontheway = true
    end
end)

function contains(table, element)
    for k, v in pairs(table) do
    if k == element then
    return true
        end
    end
  return false
  end

RegisterNUICallback('send', function(data)
    SetNuiFocus(false,false)
    score = tonumber(data.score)
end)
RegisterNetEvent("syn_ranch:score")
AddEventHandler("syn_ranch:score", function()
    chores[task].num = chores[task].num + 1
    if score == nil then
        score = 1 
    end
    if Config.maxscorelock then 
        if score > Config.maxscore then 
            score = Config.maxscore
        end 
    end
    q_ranch = q_ranch + score 
    TriggerServerEvent("syn_ranch:updatetasks",ranchid,chores,q_ranch)


end)

RegisterNetEvent("syn_ranch:score2")
AddEventHandler("syn_ranch:score2", function()
    if q_ranch == 0 then 
        q_ranch = 1
    end
    local balance = score
    if Config.reducedmilk then 
        balance = score/2
    end
    local milk = balance * (q_ranch/100)
    local final =  round(milk)
    TriggerServerEvent("syn_ranch:finishedmilking",ranchid,final)
end)

RegisterNetEvent("syn_ranch:score3")
AddEventHandler("syn_ranch:score3", function()
    if q_ranch == 0 then 
        q_ranch = 1
    end
    local balance = score
    if Config.reducedeggs then 
        balance = score/2
    end
    local eggs = balance * (q_ranch/100)
    local final =  round(eggs)
    TriggerServerEvent("syn_ranch:finishedchecking",ranchid,final)
end)


  Citizen.CreateThread(function() 
    while true do
       Citizen.Wait(0)
        if starttask then 
            local loc = GetEntityCoords(PlayerPedId())
            local dist = GetDistanceBetweenCoords(chorelocx.x,chorelocx.y,chorelocx.z, loc.x,loc.y,loc.z, 0)
            if dist > 3 then 
                Citizen.InvokeNative(0x2A32FAA57B937173, 0x6903B113, chorelocx.x, chorelocx.y, chorelocx.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 1.0, 100, 1, 1, 190, false, true, 2, false, false, false, false)
                drawtext(Config.Language.gotoloc, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            elseif 3 >= dist then
                drawtext(Config.Language.starttask, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)  
                if whenKeyJustPressed(Config.keys["G"]) then
                    SetNuiFocus(true,true)
                    SendNUIMessage({
                        action = "show",
                        pic = task,
                    })    
    
                        exports['progressBars']:startUI(32000, Config.Language.working)

                    if task == "racking" then 
                        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey("WORLD_HUMAN_FARMER_RAKE"), 32000, true, false, false, false)
                    elseif task == "hayscope" then
                        shovelanim()
                    elseif task == "feed" then
                        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey("WORLD_HUMAN_FEED_CHICKEN"), 32000, true, false, false, false)
                    elseif task == "hayspread" then
                        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey("WORLD_HUMAN_PITCH_HAY_SPREAD"), 32000, true, false, false, false)
                    elseif task == "water" then 
                        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey("WORLD_PLAYER_CHORES_BUCKET_POUR_HIGH"), 15000, true, false, false, false)
                        Citizen.Wait(2000)
                        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey("WORLD_PLAYER_CHORES_BUCKET_POUR_HIGH"), 15000, true, false, false, false)
                    end
                    Citizen.Wait(32000)
                    TriggerEvent("syn_ranch:score")
                    ClearPedTasks(PlayerPedId())
                    starttask = false 
                    Citizen.InvokeNative(0xFCCC886EDE3C63EC,PlayerPedId(),false,true)
                end
            end
        end
    end
end)


function CrouchAnim()
    local dict = "mech_milking"
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(10)
    end
    local ped = PlayerPedId()
    TaskPlayAnim(ped, dict, "milking_loop_player", 1.0, 8.0, -1, 1, 0, false, false, false)    
end

function egganim()
    local dict = "mech_pickup@loot_body@dead_hogtie_face_up@transitions"
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(10)
    end
    local ped = PlayerPedId()
    TaskPlayAnim(ped, dict, "rt_to_loot", 1.0, 8.0, -1, 1, 0, false, false, false)    
end


function shovelanim()
    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey("WORLD_HUMAN_SHOVEL_COAL_PICKUP"), 32000, true, false, false, false)
    local dict = "mech_pickup@mp_treasure@grab_01"
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(10)
    end
    local ped = PlayerPedId()
    TaskPlayAnim(ped, dict, "base", 1.0, 8.0, -1, 1, 0, false, false, false)
end

Citizen.CreateThread(function() 
    while true do
       Citizen.Wait(0)
        if milking then 
            local showprompt = false 
            local locxx = GetEntityCoords(PlayerPedId())
            local locyy = GetEntityCoords(cowmo)
            local dist = GetDistanceBetweenCoords(locxx.x,locxx.y,locxx.z, locyy.x,locyy.y,locyy.z, 0)
            if dist > 3 then
                Citizen.InvokeNative(0x2A32FAA57B937173, 0x6903B113, locyy.x, locyy.y, locyy.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 1.0, 100, 1, 1, 190, false, true, 2, false, false, false, false)
                drawtext(Config.Language.gotocow, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            elseif 3 >= dist then
                if not showprompt then 
                    drawtext(Config.Language.gtomilk, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
                end
                if whenKeyJustPressed(Config.keys["G"]) then
                    showprompt = true 
                    SetNuiFocus(true,true)
                    SendNUIMessage({
                        action = "show",
                        pic = "milk",
                    })  
               
                        exports['progressBars']:startUI(32000, Config.Language.working)

                    CrouchAnim()
                    Citizen.Wait(32000)
                    ClearPedTasks(PlayerPedId())
                    TriggerEvent("syn_ranch:score2")
                    timer7 = Config.milkingcooldown
                    cooldown4 = true 
                    milking = false 
                    FreezeEntityPosition(cowmo,false)
                end
            end
        end
    end
end)


RegisterNetEvent("syn_ranch:spawncow") -- 
  AddEventHandler("syn_ranch:spawncow", function()
    local location = cowstuff["loc"]
    cowmo = GetHashKey("a_c_cow")       
    RequestModel(cowmo)
    while not HasModelLoaded(cowmo) do
        Wait(10)
    end
    cowmo = CreatePed("a_c_cow", location.x, location.y, location.z, true, true, true)
    SetBlockingOfNonTemporaryEvents(cowmo, true) 
    Citizen.InvokeNative(0x77FF8D35EEC6BBC4, cowmo, 1, 0)
    Wait(1000)
    FreezeEntityPosition(cowmo,true)
    milking = true 
end)

Citizen.CreateThread(function() -- 
    while true do
       Citizen.Wait(0)
        if cchecking then 
            local showprompt = false 
            local locxx = GetEntityCoords(PlayerPedId())
            local dist = GetDistanceBetweenCoords(locxx.x,locxx.y,locxx.z, chickenstuff["loc"].x,chickenstuff["loc"].y,chickenstuff["loc"].z, 0)
            if dist > 3 then
                Citizen.InvokeNative(0x2A32FAA57B937173, 0x6903B113, chickenstuff["loc"].x, chickenstuff["loc"].y, chickenstuff["loc"].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 1.0, 100, 1, 1, 190, false, true, 2, false, false, false, false)
                drawtext(Config.Language.gotochicken, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            elseif 3 >= dist then
                if not showprompt then 
                    drawtext(Config.Language.gotochicken, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
                end
                if whenKeyJustPressed(Config.keys["G"]) then
                    showprompt = true 
                    SetNuiFocus(true,true)
                    SendNUIMessage({
                        action = "show",
                        pic = "eggs",
                    })  
        
                        exports['progressBars']:startUI(32000, Config.Language.working)
            
                    egganim()
                    Citizen.Wait(32000)
                    ClearPedTasks(PlayerPedId())
                    TriggerEvent("syn_ranch:score3")
                    timer8 = Config.chickenscooldown
                    cooldown5 = true 
                    cchecking = false 
                    for k,v in pairs(chicken) do 
                        FreezeEntityPosition(v.chicken,false)
                    end
                end
            end
        end
    end
end)

RegisterNetEvent("syn_ranch:spawnchickens") 
  AddEventHandler("syn_ranch:spawnchickens", function()
    local location = chickenstuff["loc"]
    for i=1, 4 do
        local farm2 = GetHashKey("a_c_chicken_01")       
        RequestModel(farm2)
        while not HasModelLoaded(farm2) do
            Wait(10)
        end
        farm2 = CreatePed("a_c_chicken_01", location.x, location.y, location.z, true, true, true)
        SetBlockingOfNonTemporaryEvents(farm2, true)
        Citizen.InvokeNative(0x77FF8D35EEC6BBC4, farm2, 1, 0)
        Wait(1000)
        FreezeEntityPosition(farm2,true)
        table.insert(chicken, {
            chicken        = farm2,
          })
    end
    cchecking = true 
end)


Citizen.CreateThread(function() 
    while true do
       Citizen.Wait(100)
       if (cooldown4 or milking) and not cheater then 
            if IsEntityDead(cowmo) then
                local PedKiller = GetPedSourceOfDeath(cowmo)
                if IsEntityAPed(PedKiller) and IsPedAPlayer(PedKiller) then
                    Killer = NetworkGetPlayerIndexFromPed(PedKiller)
                elseif IsEntityAVehicle(PedKiller) and IsEntityAPed(GetPedInVehicleSeat(PedKiller, -1)) and IsPedAPlayer(GetPedInVehicleSeat(PedKiller, -1)) then
                    Killer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(PedKiller, -1))
                end
                if (Killer == PlayerId()) then
                    local killz = GetPlayerServerId(Killer)
                    if killz ~= nil then 
                        TriggerServerEvent("syn_ranch:catchcheater",killz)
                        cheater = true
                        if milking then
                            milking = false 
                        end
                    end
                    killz = nil
                else
                    local killz = GetPlayerServerId(Killer)
                    if killz ~= nil then 
                        TriggerServerEvent("syn_ranch:catchcheater2",killz)
                    end
                end
            end
        end
    end
end)

Citizen.CreateThread( function()
    WarMenu.CreateMenu('createranch', Config.Language.createranch)
    WarMenu.CreateMenu('buyranch', Config.Language.ranchforsale)
    WarMenu.CreateMenu('ownedranch', Config.Language.ownedranch)
    WarMenu.CreateSubMenu('confirm', 'createranch', Config.Language.sure)
    WarMenu.CreateSubMenu('confirm2', 'buyranch', Config.Language.sure)
    WarMenu.CreateSubMenu('cattletype', 'ownedranch', Config.Language.buycattle)
    WarMenu.CreateSubMenu('herding', 'ownedranch', Config.Language.selectcattle)
    WarMenu.CreateSubMenu('viewcattle', 'ownedranch', Config.Language.cattle)
    WarMenu.CreateSubMenu('sellcattle', 'ownedranch', Config.Language.cattle)
    WarMenu.CreateSubMenu('choresloc', 'ownedranch', Config.Language.choresloc)
    WarMenu.CreateSubMenu('ranchchores', 'ownedranch', Config.Language.ranchchores)
    WarMenu.CreateSubMenu('upgrades', 'ownedranch', Config.Language.upgrades)
    WarMenu.CreateSubMenu('cowpen', 'ownedranch', Config.Language.cowpen)
    WarMenu.CreateSubMenu('chickenpen', 'ownedranch', Config.Language.chickenpen)
    WarMenu.CreateSubMenu('herdingdog', 'ownedranch', Config.Language.herdingdog)
    WarMenu.CreateSubMenu('ledger', 'ownedranch', Config.Language.ledger)
    WarMenu.CreateSubMenu('bossactions', 'ownedranch', Config.Language.bossactions)
    WarMenu.CreateSubMenu('fire', 'ownedranch', Config.Language.fire)
    while true do
        if WarMenu.IsMenuOpened('createranch') then

            if WarMenu.Button(Config.Language.ranchname..ranchname) then
                if Config.vorp then
                    TriggerEvent("vorpinputs:getInput", Config.Language.confirm, Config.Language.ranchname, function(cb)
                    ranchname = cb
                    end)
                elseif Config.redem then
                    TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.ranchname, function(cb)
                    ranchname = cb
                    end)
                end
            end
            if WarMenu.Button(Config.Language.ranchprice..ranchprice) then
                if Config.vorp then
                    TriggerEvent("vorpinputs:getInput", Config.Language.confirm, Config.Language.ranchprice, function(cb)
                        local count =     tonumber(cb)
                        if count ~= nil and count ~= 0 and count > 0 then
                        ranchprice = count
                        else
                        TriggerEvent("vorp:TipBottom", Config.Language.invalidamount, 4000)
                        end
                    end)
                elseif Config.redem then
                    TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.ranchprice, function(cb)
                        local count =     tonumber(cb)
                        if count ~= nil and count ~= 0 and count > 0 then
                        ranchprice = count
                        else
                        TriggerEvent("redem_roleplay:ShowObjective", Config.Language.invalidamount, 4000)
                        end
                    end)
                end
            end
            if WarMenu.Button(Config.Language.ranchtax..ranchtax.." $") then
                if Config.vorp then
                    TriggerEvent("vorpinputs:getInput", Config.Language.confirm, Config.Language.ranchtax, function(cb)
                        local count =     tonumber(cb)
                        if count ~= nil and count ~= 0 and count > 0 then
                            ranchtax = count
                        else
                        TriggerEvent("vorp:TipBottom", Config.Language.invalidamount, 4000)
                        end
                    end)
                elseif Config.redem then
                    TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.ranchtax, function(cb)
                        local count =     tonumber(cb)
                        if count ~= nil and count ~= 0 and count > 0 then
                            ranchtax = count
                        else
                        TriggerEvent("redem_roleplay:ShowObjective", Config.Language.invalidamount, 4000)
                        end
                    end)
                end
            end
            if WarMenu.MenuButton(Config.Language.confirm, 'confirm') then end
        elseif WarMenu.IsMenuOpened('confirm') then
            if WarMenu.Button(Config.Language.yes) then
                local ranchcoords = GetEntityCoords(PlayerPedId())
              TriggerServerEvent("syn_ranch:createranch",ranchname,ranchprice,ranchcoords,ranchtax)
              creatingranch = false 
              WarMenu.CloseMenu()
            end
            if WarMenu.MenuButton(Config.Language.no, 'createranch') then end

        elseif WarMenu.IsMenuOpened('buyranch') then
            if WarMenu.Button(Config.Language.ranchid..ranchid) then end
            if WarMenu.Button(Config.Language.ranchname..ranchnamez) then end
            if WarMenu.Button(Config.Language.ranchprice..ranchpricez) then end 
            if WarMenu.Button(Config.Language.ranchtax..ranchtaxz.." $") then end 
            if WarMenu.MenuButton(Config.Language.confirm, 'confirm2') then end
          elseif WarMenu.IsMenuOpened('confirm2') then
            if WarMenu.Button(Config.Language.yes) then
              TriggerServerEvent("syn_ranch:buyaranch",ranchpricez,ranchid)
              WarMenu.CloseMenu()
            end
            if WarMenu.MenuButton(Config.Language.no, 'buyranch') then end

        elseif WarMenu.IsMenuOpened('ownedranch') then
            for k,v in pairs(ranches) do 
                if v.ranchid == ranchid then 
                    if WarMenu.Button(Config.Language.ranchid..ranchid) then end
                    if WarMenu.Button(Config.Language.ranchname..v.ranchname) then end
                    if WarMenu.Button(Config.Language.ranchtax..v.tax.." $") then end
                    if WarMenu.Button(Config.Language.enviroment..v.q_ranch.." %") then end
                    if next(v.trail) ~= nil and next(v.cattle) ~= nil and not ontheway and not herdingcooldown and not ontheway2 then
                          
                        if WarMenu.MenuButton(Config.Language.herd,"herding") then end
                        
                    end
                    if next(v.cattle) ~= nil then 
                        if WarMenu.MenuButton(Config.Language.viewcattle,"viewcattle") then end
                    end
                    if next(v.chores) ~= nil then 
                        if WarMenu.MenuButton(Config.Language.ranchchores,"ranchchores") then end
                    end
                    if herdingcooldown then 
                        if WarMenu.Button(Config.Language.herdcooldown..timer2..Config.Language.seconds) then end
                    end
                    if herdingcooldown2 then 
                        if WarMenu.Button(Config.Language.salecooldown..timer4..Config.Language.seconds) then end
                    end
                    if WarMenu.MenuButton(Config.Language.buycattle,'cattletype') then end
                    if next(v.cattle) ~= nil and not herdingcooldown2 and not ontheway2 and not ontheway then 
                        if WarMenu.MenuButton(Config.Language.sellcattle,"sellcattle") then end
                    end
                    if next(v.cows) ~= nil and not milking then
                        if WarMenu.MenuButton(Config.Language.cowpen,'cowpen') then end
                    end
                    if next(v.chickens) ~= nil and not cchecking then
                        if WarMenu.MenuButton(Config.Language.chickenpen,'chickenpen') then end
                    end
                    if WarMenu.Button(Config.Language.settrail) then 
                        registering = true
                        pedloc = GetEntityCoords(PlayerPedId())
                        WarMenu.CloseMenu()
                    end
                    if WarMenu.MenuButton(Config.Language.setchoreslocation,'choresloc') then end
                    if boss then
                        if WarMenu.MenuButton(Config.Language.bossactions,'bossactions') then end
                    end
                end
            end
        elseif WarMenu.IsMenuOpened('bossactions') then   
            for k,v in pairs(ranches) do 
                if v.ranchid == ranchid then
                    if WarMenu.MenuButton(Config.Language.upgrades,"upgrades") then end
                    if WarMenu.MenuButton(Config.Language.ledger,"ledger") then end
                    if WarMenu.MenuButton(Config.Language.fire, 'fire') then end -- 
                    if WarMenu.Button(Config.Language.hire) then 
                        WarMenu.CloseMenu() 
                        if Config.vorp then     
                            TriggerEvent("vorpinputs:getInput",Config.Language.confirm, Config.Language.id, function(cb)
                                local testid =     tonumber(cb)
                                if testid ~= nil and testid ~= 0 and testid > 0 then
                                    local playerid = testid
                                    TriggerServerEvent("syn_ranch:hireplayer", playerid, ranchid, keyholdersx)
                                end
                            end)
                        elseif Config.redem then
                            TriggerEvent("syn_inputs:sendinputs",Config.Language.confirm, Config.Language.id, function(cb)
                                local testid =     tonumber(cb)
                                if testid ~= nil and testid ~= 0 and testid > 0 then
                                    local playerid = testid
                                    TriggerServerEvent("syn_ranch:hireplayer", playerid, ranchid, keyholdersx)
                                end
                            end)
                        end
                    end
                end
            end
        elseif WarMenu.IsMenuOpened('fire') then
            if next(keyholdersx) ~= nil then
                for k, v in pairs(keyholdersx) do 
                    if WarMenu.Button(""..v.name.."") then
                        local takeid = v.identifier
                        local takecharid = v.charidentifier
                        local name = v.name
                        TriggerServerEvent("syn_ranch:fireplayer",keyholdersx,ranchid,takeid,takecharid,name)
                        WarMenu.CloseMenu()      
                    end
                end
            end
        elseif WarMenu.IsMenuOpened('ledger') then
            for k,v in pairs(ranches) do 
                if v.ranchid == ranchid then
                    if WarMenu.Button(Config.Language.ledger.." : "..v.ledger.." $") then end 
                    if WarMenu.Button(Config.Language.withdraw) then 
                        if Config.vorp then
                            TriggerEvent("vorpinputs:getInput", Config.Language.confirm, Config.Language.amount, function(cb)
                                local count =     tonumber(cb)
                                if count ~= nil and count ~= 0 and count > 0 and v.ledger >= count then
                                local take = count
                                WarMenu.CloseMenu()
                                    TriggerServerEvent("syn_ranch:withdraw",ranchid,take)
                                else
                                TriggerEvent("vorp:TipBottom", Config.Language.invalidamount, 4000)
                                end
                            end)
                        elseif Config.redem then
                            TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.amount, function(cb)
                                local count =     tonumber(cb)
                                if count ~= nil and count ~= 0 and count > 0 and v.ledger >= count then
                                local take = count
                                WarMenu.CloseMenu()
                                    TriggerServerEvent("syn_ranch:withdraw",ranchid,take)
                                else
                                TriggerEvent("redem_roleplay:ShowObjective", Config.Language.invalidamount, 4000)
                                end
                            end)
                        end
                    end
                    if WarMenu.Button(Config.Language.deposit) then 
                        if Config.vorp then
                            TriggerEvent("vorpinputs:getInput", Config.Language.confirm, Config.Language.amount, function(cb)
                                local count =     tonumber(cb)
                                if count ~= nil and count ~= 0 and count > 0 then
                                local depo = count
                                WarMenu.CloseMenu()
                                    TriggerServerEvent("syn_ranch:deposit",ranchid,depo)
                                else
                                TriggerEvent("vorp:TipBottom", Config.Language.invalidamount, 4000)
                                end
                            end)
                        elseif Config.redem then
                            TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.amount, function(cb)
                                local count =     tonumber(cb)
                                if count ~= nil and count ~= 0 and count > 0 then
                                local depo = count
                                WarMenu.CloseMenu()
                                    TriggerServerEvent("syn_ranch:deposit",ranchid,depo)
                                else
                                TriggerEvent("redem_roleplay:ShowObjective", Config.Language.invalidamount, 4000)
                                end
                            end)
                        end
                    end
                end
            end
        elseif WarMenu.IsMenuOpened('herdingdog') then
            for k,v in pairs(Config.herdingdogs) do 
                if WarMenu.Button(k.." / "..Config.herdingdogs[k].price.." $") then
                    local price =  Config.herdingdogs[k].price
                    local hash = Config.herdingdogs[k].model
                    TriggerServerEvent("syn_ranch:buydog",ranchid,price,hash)
                    WarMenu.CloseMenu()
                end 
            end
        elseif WarMenu.IsMenuOpened('chickenpen') then
            for k,v in pairs(ranches) do 
                if v.ranchid == ranchid then
                    if v.eggs > 0 then 
                        if boss then 
                            if WarMenu.Button(Config.Language.takeeggs.." / "..v.eggs) then
                                if Config.vorp then
                                    TriggerEvent("vorpinputs:getInput", Config.Language.confirm, Config.Language.amount, function(cb)
                                        local count =     tonumber(cb)
                                        if count ~= nil and count ~= 0 and count > 0 and v.eggs >= count then
                                        local takeeggs = count
                                        WarMenu.CloseMenu()
                                            TriggerServerEvent("syn_ranch:takeeggs",ranchid,takeeggs)
                                        else
                                        TriggerEvent("vorp:TipBottom", Config.Language.invalidamount, 4000)
                                        end
                                    end)
                                elseif Config.redem then
                                    TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.amount, function(cb)
                                        local count =     tonumber(cb)
                                        if count ~= nil and count ~= 0 and count > 0 and v.eggs >= count then
                                        local takeeggs = count
                                        WarMenu.CloseMenu()
                                            TriggerServerEvent("syn_ranch:takeeggs",ranchid,takeeggs)
                                        else
                                        TriggerEvent("redem_roleplay:ShowObjective", Config.Language.invalidamount, 4000)
                                        end
                                    end)
                                end
                            end
                        end
                    end
                    if not cooldown5 then 
                        if v.checking == 1 then 
                            if WarMenu.Button(Config.Language.oncooldown) then end
                        else
                            if WarMenu.Button(Config.Language.checkchickens) then 
                                WarMenu.CloseMenu()
                                chickenstuff = v.chickens
                                TriggerEvent("syn_ranch:spawnchickens")
                                TriggerServerEvent("syn_ranch:startedchecking",ranchid)
                            end
                        end
                    else
                        if WarMenu.Button(Config.Language.chickencooldown.." "..timer8..Config.Language.seconds) then end
                    end
                    if WarMenu.Button(Config.Language.changelocation) then --  
                        chickenloc2 = true 
                        WarMenu.CloseMenu()
                    end
                end
            end
        elseif WarMenu.IsMenuOpened('cowpen') then
            for k,v in pairs(ranches) do 
                if v.ranchid == ranchid then
                    if v.milk > 0 then 
                        if boss then
                            if WarMenu.Button(Config.Language.takemilk.." / "..v.milk) then
                                if Config.vorp then
                                    TriggerEvent("vorpinputs:getInput", Config.Language.confirm, Config.Language.amount, function(cb)
                                        local count =     tonumber(cb)
                                        if count ~= nil and count ~= 0 and count > 0 and v.milk >= count then
                                        local takemilk = count
                                        WarMenu.CloseMenu()
                                            TriggerServerEvent("syn_ranch:takemilk",ranchid,takemilk)
                                        else
                                        TriggerEvent("vorp:TipBottom", Config.Language.invalidamount, 4000)
                                        end
                                    end)
                                elseif Config.redem then
                                    TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.amount, function(cb)
                                        local count =     tonumber(cb)
                                        if count ~= nil and count ~= 0 and count > 0 and v.milk >= count then
                                        local takemilk = count
                                        WarMenu.CloseMenu()
                                            TriggerServerEvent("syn_ranch:takemilk",ranchid,takemilk)
                                        else
                                        TriggerEvent("redem_roleplay:ShowObjective", Config.Language.invalidamount, 4000)
                                        end
                                    end)
                                end
                            end
                        end
                    end
                    if not cooldown4 then 
                        if v.milking == 1 then 
                            if WarMenu.Button(Config.Language.oncooldown) then end
                        else
                            if WarMenu.Button(Config.Language.milkcows) then 
                                WarMenu.CloseMenu()
                                cowstuff = v.cows
                                TriggerEvent("syn_ranch:spawncow")
                                TriggerServerEvent("syn_ranch:startedmilking",ranchid)
                            end
                        end
                    else
                        if WarMenu.Button(Config.Language.milkingcooldown.." "..timer7..Config.Language.seconds) then end
                    end
                    if WarMenu.Button(Config.Language.changelocation) then 
                        cowpenloc2 = true 
                        WarMenu.CloseMenu()
                    end
                end
            end
        elseif WarMenu.IsMenuOpened('upgrades') then 
            for k,v in pairs(ranches) do 
                if v.ranchid == ranchid then
                    if next(v.cows) == nil then 
                        if WarMenu.Button(Config.Language.cowpen.." / "..Config.cowpencost.." $") then 
                            cowpenloc = true 
                            WarMenu.CloseMenu()
                        end
                    end
                    if next(v.chickens) == nil then 
                        if WarMenu.Button(Config.Language.chickenpen.." / "..Config.chickenpencost.." $") then 
                            chickenloc = true 
                            WarMenu.CloseMenu()
                        end
                    end
                    if WarMenu.MenuButton(Config.Language.herdingdog,"herdingdog") then end
                end
            end
        elseif WarMenu.IsMenuOpened('ranchchores') then
            for k,v in pairs(ranches) do 
                if v.ranchid == ranchid then
                    local chores = v.chores
                    if contains(v.chores, "racking") and 2 > chores["racking"].num then 
                        if WarMenu.Button(Config.Language.racking) then 
                                chorelocx = chores["racking"].loc
                                starttask = true 
                                task = "racking"
                                WarMenu.CloseMenu()
                        end
                    end
                    if contains(v.chores, "hayscope") and 2 > chores["hayscope"].num then 
                        if WarMenu.Button(Config.Language.hayscope) then 
                            chorelocx = chores["hayscope"].loc
                            starttask = true 
                            task = "hayscope"
                            WarMenu.CloseMenu()
                        end
                    end
                    if contains(v.chores, "feed") and 2 > chores["feed"].num  then 
                        if WarMenu.Button(Config.Language.feed) then 
                            chorelocx = chores["feed"].loc
                            starttask = true 
                            task = "feed"
                            WarMenu.CloseMenu()
                        end
                    end
                    if contains(v.chores, "hayspread") and 2 > chores["hayspread"].num  then 
                        if WarMenu.Button(Config.Language.hayspread) then 
                            chorelocx = chores["hayspread"].loc
                            starttask = true 
                            task = "hayspread"
                            WarMenu.CloseMenu()
                        end
                    end
                    if contains(v.chores, "water") and 2 > chores["water"].num  then 
                        if WarMenu.Button(Config.Language.water) then 
                            chorelocx = chores["water"].loc
                            starttask = true 
                            task = "water"
                            WarMenu.CloseMenu()
                        end
                    end
                end
            end

        elseif WarMenu.IsMenuOpened('choresloc') then
            for k,v in pairs(ranches) do 
                if v.ranchid == ranchid then
                    if WarMenu.Button(Config.Language.racking) then 
                        regx = true 
                        taskname = "racking"
                        WarMenu.CloseMenu()
                    end
                    if WarMenu.Button(Config.Language.hayscope) then 
                        regx = true 
                        taskname = "hayscope"
                        WarMenu.CloseMenu()
                    end
                    if WarMenu.Button(Config.Language.feed) then 
                        regx = true 
                        taskname = "feed"
                        WarMenu.CloseMenu()
                    end
                    if WarMenu.Button(Config.Language.hayspread) then 
                        regx = true 
                        taskname = "hayspread"
                        WarMenu.CloseMenu()
                    end
                    if WarMenu.Button(Config.Language.water) then 
                        regx = true 
                        taskname = "water"
                        WarMenu.CloseMenu()
                    end
                end
            end
        elseif WarMenu.IsMenuOpened('sellcattle') then
            for k,v in pairs(ranches) do 
                if v.ranchid == ranchid then
                    if v.selling == 1 then 
                        if WarMenu.Button(Config.Language.oncooldown) then end
                    else
                        cattlex = v.cattle
                        q_cattlex = v.q_cattle
                        distance = v.dist
                        for m,l in pairs(cattlex) do 
                            if WarMenu.Button(""..m.." / "..Config.Language.owned.." "..l.." / "..Config.Language.quality..q_cattlex[m]) then
                                startsale = true 
                                TriggerServerEvent("syn_ranch:startedselling",ranchid)
                                for x,z in pairs(Config.cattletypes) do 
                                    if x == m then
                                       herdno = l
                                       herdhash = z
                                       WarMenu.CloseMenu()
                                       ranchlocation = v.location
                                       type = m
                                   end 
                               end
                            end
                        end
                    end
                end
            end
        elseif WarMenu.IsMenuOpened('viewcattle') then
            for k,v in pairs(ranches) do 
                if v.ranchid == ranchid then
                    cattlex = v.cattle
                    q_cattlex = v.q_cattle
                    distance = v.dist
                    for m,l in pairs(cattlex) do 
                        if WarMenu.Button(""..m.." / "..Config.Language.owned.." "..l.." / "..Config.Language.quality..q_cattlex[m]) then
                        end
                    end
                end
            end
        elseif WarMenu.IsMenuOpened('herding') then
            for k,v in pairs(ranches) do 
                if v.ranchid == ranchid then
                    if v.herding == 1 then 
                        if WarMenu.Button(Config.Language.oncooldown) then end
                    else
                        cattlex = v.cattle
                        q_cattlex = v.q_cattle
                        distance = v.dist
                        for m,l in pairs(cattlex) do 
                            if WarMenu.Button(""..m.." / "..Config.Language.owned.." "..l.." / "..Config.Language.quality..q_cattlex[m]) then
                                for x,z in pairs(Config.cattletypes) do 
                                     if x == m then
                                        herdno = l
                                        herdhash = z
                                        WarMenu.CloseMenu()
                                        local trailx = v.trail
                                        for u,g in pairs(trailx) do 
                                            loc1 = g.loc1
                                            loc2 = g.loc2
                                            loc3 = g.loc3
                                            loc4 = g.loc4
                                        end
                                        ranchlocation = v.location
                                        TriggerServerEvent("syn_ranch:startedherding",ranchid)
                                        startherd = true
                                        type = m
                                        if dog ~= "0" then 
                                            if Config.vorp then
                                                TriggerEvent("vorp:TipBottom", Config.Language.dogg..Config.herdingdogcommand..Config.Language.tome, 4000)
                                            elseif Config.redem then
                                                TriggerEvent("redem_roleplay:ShowObjective", Config.Language.dogg..Config.herdingdogcommand..Config.Language.tome, 4000)
                                            end
                                        end 
                                    end
                                end
                            end
                        end
                    end
                end
            end
        elseif WarMenu.IsMenuOpened('cattletype') then
            for k,v in pairs(ranches) do 
                if v.ranchid == ranchid then
                    local cattlex = v.cattle
                    local q_cattlex = v.q_cattle
                    local price
                    for j,s in pairs(Config.cattletypes) do 
                        if next(cattlex) == nil then 
                            for m,n in pairs(Config.joblock) do 
                                if j == m then
                                    if n == "none" or n == playerjob then -- 
                                        for r,e in pairs(Config.cattleprice) do
                                         
                                            if j == r then 
                                                if WarMenu.Button(Config.Language.buy..j.." / "..e.." $") then 
                                                    if Config.vorp then
                                                        TriggerEvent("vorpinputs:getInput", Config.Language.confirm, Config.Language.amount, function(cb)
                                                            local count =     tonumber(cb)
                                                            if count ~= nil and count ~= 0 and count > 0 and Config.maxherd >= count then


                                                                    price = e * count


                                                            local herdamount = count
                                                            cattlex[j] = herdamount
                                                            q_cattlex[j] = herdamount
                                                            TriggerServerEvent("syn_ranch:buycattle",ranchid,cattlex,price,q_cattlex)
                                                            WarMenu.CloseMenu()
                                                            else
                                                            TriggerEvent("vorp:TipBottom", Config.Language.invalidamount, 4000)
                                                            end
                                                        end)
                                                    elseif Config.redem then
                                                        TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.amount, function(cb)
                                                            local count =     tonumber(cb)
                                                            if count ~= nil and count ~= 0 and count > 0 and Config.maxherd >= count then
                                                                

                                                                    price = e * count

                                                                 
                                                              local herdamount = count
                                                              cattlex[j] = herdamount
                                                              q_cattlex[j] = herdamount
                                                              TriggerServerEvent("syn_ranch:buycattle",ranchid,cattlex,price,q_cattlex)
                                                              WarMenu.CloseMenu()
                                                            else
                                                              TriggerEvent("redem_roleplay:ShowObjective", Config.Language.invalidamount, 4000)
                                                            end
                                                        end)
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        elseif contains(cattlex, j) and Config.maxherd > cattlex[j] then 
                            for m,n in pairs(Config.joblock) do 
                                if j == m then
                                    if n == "none" or n == playerjob then
                                        for r,e in pairs(Config.cattleprice) do 
                                            if j == r then 
                                                if WarMenu.Button(Config.Language.buy..j.." / "..Config.Language.owned.." "..cattlex[j].." / "..e) then 
                                                    if Config.vorp then
                                                        TriggerEvent("vorpinputs:getInput", Config.Language.confirm, Config.Language.amount, function(cb)
                                                            local count =     tonumber(cb)
                                                            if count ~= nil and count ~= 0 and count > 0 and Config.maxherd >= (count+cattlex[j]) then


                                                                        price = e * count


                                                            local herdamount = count+cattlex[j]
                                                            local herd_q = count + q_cattlex[j]
                                                            cattlex[j] = herdamount
                                                            q_cattlex[j] = herd_q
                                                            TriggerServerEvent("syn_ranch:buycattle",ranchid,cattlex,price,q_cattlex)
                                                            WarMenu.CloseMenu()
                                                            else
                                                            TriggerEvent("vorp:TipBottom", Config.Language.invalidamount, 4000)
                                                            end
                                                        end)
                                                    elseif Config.redem then
                                                        TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.amount, function(cb)
                                                            local count =     tonumber(cb)
                                                            if count ~= nil and count ~= 0 and count > 0 and Config.maxherd >= (count+cattlex[j]) then

                                                                    
                                                                price = e * count
                                                                    

                                                              local herdamount = count+cattlex[j]
                                                              local herd_q = count + q_cattlex[j]
                                                              cattlex[j] = herdamount
                                                              q_cattlex[j] = herd_q
                                                              TriggerServerEvent("syn_ranch:buycattle",ranchid,cattlex,price,q_cattlex)
                                                              WarMenu.CloseMenu()
                                                            else
                                                              TriggerEvent("redem_roleplay:ShowObjective", Config.Language.invalidamount, 4000)
                                                            end
                                                        end)
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        elseif not contains(cattlex, j) and cattlex[j] == nil then
                            for m,n in pairs(Config.joblock) do 
                                if j == m then
                                    if n == "none" or n == playerjob then
                                        for r,e in pairs(Config.cattleprice) do 
                                            if j == r then
                                                if WarMenu.Button(Config.Language.buy..j.." / "..e) then 
                                                    if Config.vorp then
                                                        TriggerEvent("vorpinputs:getInput", Config.Language.confirm, Config.Language.amount, function(cb)
                                                            local count =     tonumber(cb)
                                                            if count ~= nil and count ~= 0 and count > 0 and Config.maxherd >= count then

                                                                        price = e * count

                                                                 
                                                            local herdamount = count
                                                            cattlex[j] = herdamount
                                                            q_cattlex[j] = herdamount
                                                            TriggerServerEvent("syn_ranch:buycattle",ranchid,cattlex,price,q_cattlex)
                                                            WarMenu.CloseMenu()
                                                            else
                                                            TriggerEvent("vorp:TipBottom", Config.Language.invalidamount, 4000)
                                                            end
                                                        end)
                                                    elseif Config.redem then 
                                                        TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.amount, function(cb)
                                                            local count =     tonumber(cb)
                                                            if count ~= nil and count ~= 0 and count > 0 and Config.maxherd >= count then
                                                                
                                                                    
                                                                        price = e * count
                                                                    
                                                                 
                                                              local herdamount = count
                                                              cattlex[j] = herdamount
                                                              q_cattlex[j] = herdamount
                                                              TriggerServerEvent("syn_ranch:buycattle",ranchid,cattlex,price,q_cattlex)
                                                              WarMenu.CloseMenu()
                                                            else
                                                              TriggerEvent("redem_roleplay:ShowObjective", Config.Language.invalidamount, 4000)
                                                            end
                                                        end)
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
----------------------------------------------------------
        end
        WarMenu.Display()
        Citizen.Wait(0)
    end
end)

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
                playerid = GetPlayerServerId(players[i])
                tgt1 = GetPlayerPed(players[i])
            end
        end
    end
    return closestPlayer, closestDistance,  playerid, tgt1
end


RegisterNetEvent("syn_ranch:createblips")
AddEventHandler("syn_ranch:createblips", function()
  Citizen.Wait(2000)
  local blip
    for k,v in pairs(ranches) do
        if v.owned == 0 then 
            blip =  N_0x554d9d53f696d002(1664425300, v.location.x, v.location.y, v.location.z)
            SetBlipScale(blip, 0.2)
            SetBlipSprite(blip, Config.ranchforsale, 1) 
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, Config.Language.ranchforsale)
            table.insert(blips, {
              blipz = blip
            })
        elseif (v.id == playerids and v.charid == playercharid) or playerjob == Config.synsocietyjob then
            blip =  N_0x554d9d53f696d002(1664425300, v.location.x, v.location.y, v.location.z)
            SetBlipScale(blip, 0.2)
            SetBlipSprite(blip, Config.playerranch, 1) 
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, v.shopname)
            table.insert(blips, {
              blipz = blip
            })
        else
            if v.owned then 
                for x,z in pairs(v.hired) do 
                    if z.identifier == playerids and z.charidentifier == playercharid then
                        blip =  N_0x554d9d53f696d002(1664425300, v.location.x, v.location.y, v.location.z)
                        SetBlipScale(blip, 0.2)
                        SetBlipSprite(blip, Config.playerranch, 1) 
                        Citizen.InvokeNative(0x9CB1A1623062F402, blip, v.shopname)
                        table.insert(blips, {
                          blipz = blip
                        })
                    end
                end
            end
        end
    end
end)

RegisterNetEvent("syn_ranch:blip")
AddEventHandler("syn_ranch:blip", function()
  for k, v in pairs(Config.cattlesale) do
    blipg = N_0x554d9d53f696d002(1664425300, v.Pos.x, v.Pos.y, v.Pos.z)
    SetBlipSprite(blipg, v.blipsprite, 1)
    SetBlipScale(blipg, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, blipg, v.Name)
  end
end)

RegisterNetEvent("syn_ranch:removeblips")
AddEventHandler("syn_ranch:removeblips", function()
  for k,v in pairs(blips) do
    RemoveBlip(v.blipz)
  end   
  blips = {}  
  RemoveBlip(blipg)
end)

RegisterNetEvent("syn_ranch:menuclosed")
AddEventHandler("syn_ranch:menuclosed", function()
    ClearPedTasks(PlayerPedId())
    FreezeEntityPosition(PlayerPedId(),false)  
  if inranch then 
    inranch = false 
  end
  if creatingranch then 
    creatingranch = false 
    ranchname = ""
    ranchprice = 0
  end
end)

Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
      local player = PlayerPedId()
      local coords = GetEntityCoords(player)
      local sleep = true 
        for k, v in pairs(ranches) do
            local dist =  GetDistanceBetweenCoords(coords, v.location.x, v.location.y, v.location.z, true)
            if 2 < dist and 15 > dist then 
                sleep = false
                Citizen.InvokeNative(0x2A32FAA57B937173, 0x6903B113, v.location.x, v.location.y, v.location.z-1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 1.0, 100, 1, 1, 190, false, true, 2, false, false, false, false)
            elseif dist < 2 and not inranch and not registering then
              sleep = false
              local closestPlayer, closestDistance, playerid, tgt1 = GetClosestPlayer()
                
                
                    if v.owned == 0 then           
                        drawtext(Config.Language.buyranch, 0.50, 0.95, 0.6, 0.6, true, 255, 255, 255, 255, true, 10000)           
                        if IsControlJustReleased(0, Config.keys["G"]) then
                            if closestPlayer ~= -1 and closestDistance <= 2.0 then
                                if Config.vorp then
                                    TriggerEvent("vorp:TipBottom", Config.Language.tooclose2, 4000)
                                elseif Config.redem then
                                    TriggerEvent("redem_roleplay:ShowObjective", Config.Language.tooclose2, 4000)
                                end
                            else
                                TaskStandStill(PlayerPedId(), -1)
                                FreezeEntityPosition(PlayerPedId(),true)              
                                inranch = true
                                ranchid = v.ranchid
                                ranchpricez = v.price
                                ranchtaxz = v.tax
                                ranchnamez = v.ranchname
                                WarMenu.OpenMenu('buyranch')
                            end
                        end
                    elseif v.owned == 1 and not inranch and not reg and not registering and not startherd and not ontheway and not ontheway2 and not startherd and not startsale then 
                        if v.id == playerids and v.charid == playercharid then
                            drawtext(Config.Language.openranch, 0.50, 0.95, 0.6, 0.6, true, 255, 255, 255, 255, true, 10000)
                            if IsControlJustReleased(0, Config.keys["G"]) then  
                                if closestPlayer ~= -1 and closestDistance <= 2.0 then
                                    if Config.vorp then
                                        TriggerEvent("vorp:TipBottom", Config.Language.tooclose2, 4000)
                                    elseif Config.redem then
                                        TriggerEvent("redem_roleplay:ShowObjective", Config.Language.tooclose2, 4000)
                                    end
                                else 
                                    TriggerServerEvent("syn_ranch:getranchinfo")
                                    Citizen.Wait(2000)
                                    ranchid = v.ranchid
                                    TaskStandStill(PlayerPedId(), -1)
                                    FreezeEntityPosition(PlayerPedId(),true)   
                                    inranch = true  
                                    chores = v.chores      
                                    q_ranch = v.q_ranch  
                                    keyholdersx = v.hired
                                    if v.dog ~= "0" then
                                        dog = v.dog 
                                    end
                                    boss = true
                                    WarMenu.OpenMenu('ownedranch')    
                                end             
                            end 
                        else
                            if v.owned then 
                                for x,z in pairs(v.hired) do 
                                    if z.identifier == playerids and z.charidentifier == playercharid then
                                        drawtext(Config.Language.openranch, 0.50, 0.95, 0.6, 0.6, true, 255, 255, 255, 255, true, 10000)
                                        if IsControlJustReleased(0, Config.keys["G"]) then 
                                            if closestPlayer ~= -1 and closestDistance <= 2.0 then
                                                if Config.vorp then
                                                    TriggerEvent("vorp:TipBottom", Config.Language.tooclose2, 4000)
                                                elseif Config.redem then
                                                    TriggerEvent("redem_roleplay:ShowObjective", Config.Language.tooclose2, 4000)
                                                end
                                            else   
                                                TriggerServerEvent("syn_ranch:getranchinfo")
                                                Citizen.Wait(2000)
                                                ranchid = v.ranchid 
                                                TaskStandStill(PlayerPedId(), -1)
                                                FreezeEntityPosition(PlayerPedId(),true)  
                                                inranch = true  
                                                chores = v.chores      
                                                q_ranch = v.q_ranch  
                                                keyholdersx = v.hired
                                                if v.dog ~= "0" then
                                                    dog = v.dog 
                                                end
                                                boss = false
                                                WarMenu.OpenMenu('ownedranch') 
                                            end                
                                        end 
                                    end
                                end
                            end
                        end
                    end
                
            end
        end
        if sleep then 
          Citizen.Wait(500)
        end
    end
  end)