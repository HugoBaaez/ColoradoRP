local PrimeraMina = false
local Mina1 = false
local Arbol1, Arbol2, Arbol3, Arbol4, Arbol5, Arbol6, Arbol7, Arbol8, Arbol9, Arbol10 = nil, nil, nil, nil
local Mina2 = false
local Mina3 = false
local Mina4 = false
local Mina5 = false
local Mina6 = false
local Mina7 = false
local Mina8 = false
local Mina9 = false
local Mina10 = false
local FinMina = false
local blipname = "WoodC"
-------------------------------
local PrimeraArvore = false
local Arvore1 = false
local Arvor1, Arvor2, Arvor3, Arvor4, Arvor5, Arvor6, Arvor7, Arvor8, Arvor9, Arvor10 = nil, nil, nil, nil
local Arvore2 = false
local Arvore3 = false
local Arvore4 = false
local Arvore5 = false
local Arvore6 = false
local Arvore7 = false
local Arvore8 = false
local Arvore9 = false
local Arvore10 = false
local FinArvore = false

Citizen.CreateThread(function()
    local blip = Citizen.InvokeNative(0x554d9d53f696d002, -592068833, Config.Zonas['init'].x, Config.Zonas['init'].y, Config.Zonas['init'].z)
end)

local blips = {
    { name = 'Colheita de madeira', sprite = 1904459580, x = 582.7, y = 1684.7, z = 187.6},
    { name = 'Colheita de madeira', sprite = 1904459580, x = -2524.2, y = -1361.59, z = 152.09},
    { name = 'Processo de madeira', sprite = 2107754879, x = 556.76, y = 1708.5, z= 186.0},
}


Citizen.CreateThread(function()
    for _, info in pairs(blips) do
        local blip = N_0x554d9d53f696d002(1664425300, info.x, info.y, info.z)
        SetBlipSprite(blip, info.sprite, 1)
        SetBlipScale(blip, 0.2)
        Citizen.InvokeNative(0x9CB1A1623062F402, blip, info.name)
    end  
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local pos = GetEntityCoords(PlayerPedId())
        Citizen.InvokeNative(0x2A32FAA57B937173, 0x07DCE236, Config.Zonas['init'].x, Config.Zonas['init'].y, Config.Zonas['init'].z - 1.0, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 0.9, 18, 255, 1, 155, 0, 0, 2, 0, 0, 0, 0)

        if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['init'].x, Config.Zonas['init'].y, Config.Zonas['init'].z) < 1.0) then
            if true then
              DrawText3D(Config.Zonas['init'].x, Config.Zonas['init'].y, Config.Zonas['init'].z, Language.translate[Config.lang]['press'])
                if IsControlJustPressed(0, 0xC7B5340A) then
                    TriggerServerEvent('woodcutter:checkjob')
                end
            end
        end
        if PrimeraMina and IsPedOnFoot(PlayerPedId()) then
            Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zonas['Miner1'].x, Config.Zonas['Miner1'].y, Config.Zonas['Miner1'].z - 1.0, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 1.5, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Miner1'].x, Config.Zonas['Miner1'].y, Config.Zonas['Miner1'].z) < 3.0) then
            DrawText3D(Config.Zonas['Miner1'].x, Config.Zonas['Miner1'].y, Config.Zonas['Miner1'].z, Language.translate[Config.lang]['press'])
                if IsControlJustPressed(0, 0xC7B5340A) then
                    animacion()
                    animacion3(Arbol1) -- Aqui eu tenho certeza
                  TriggerEvent("vorp:NotifyLeft", "Lenhador", Language.translate[Config.lang]['goto'], "inventory_items", "provision_rf_wood_cobalt", 2700)
                    PlaySoundFrontend("Give_Item_Enter", "HUD_Donate_Sounds", true, 1)
					RemoveBlip(blip)
					blip2 = Citizen.InvokeNative(0x554d9d53f696d002, 203020899, Config.Zonas['Miner2'].x, Config.Zonas['Miner2'].y, Config.Zonas['Miner2'].z)
                    SetBlipSprite(blip2, -570710357, 1)
					PrimeraMina = false
                    Mina2 = true
                end
            end
        elseif Mina2 and IsPedOnFoot(PlayerPedId()) then
            Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zonas['Miner2'].x, Config.Zonas['Miner2'].y, Config.Zonas['Miner2'].z - 1.0, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 1.5, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Miner2'].x, Config.Zonas['Miner2'].y, Config.Zonas['Miner2'].z) < 3.0) then
              DrawText3D(Config.Zonas['Miner2'].x, Config.Zonas['Miner2'].y, Config.Zonas['Miner2'].z, Language.translate[Config.lang]['press'])
                if IsControlJustPressed(0, 0xC7B5340A) then
                    animacion()
                    animacion3(Arbol2)
                  TriggerEvent("vorp:NotifyLeft", "Lenhador", Language.translate[Config.lang]['goto'], "inventory_items", "provision_rf_wood_cobalt", 2700)
                    PlaySoundFrontend("Give_Item_Enter", "HUD_Donate_Sounds", true, 1)
                    RemoveBlip(blip2)
                    blip3 = Citizen.InvokeNative(0x554d9d53f696d002, 203020899, Config.Zonas['Miner3'].x, Config.Zonas['Miner3'].y, Config.Zonas['Miner3'].z)
                    SetBlipSprite(blip3, -570710357, 1)
                    Mina2 = false
                    Mina3 = true
                end
            end
        elseif Mina3 and IsPedOnFoot(PlayerPedId()) then
            Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zonas['Miner3'].x, Config.Zonas['Miner3'].y, Config.Zonas['Miner3'].z - 1.0, 0, 0, 0, 0, 0, 0,2.0, 2.0, 1.5, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Miner3'].x, Config.Zonas['Miner3'].y, Config.Zonas['Miner3'].z) < 3.0) then
               DrawText3D(Config.Zonas['Miner3'].x, Config.Zonas['Miner3'].y, Config.Zonas['Miner3'].z, Language.translate[Config.lang]['press'])
                if IsControlJustPressed(0, 0xC7B5340A) then
                    animacion()
                    animacion3(Arbol3)
                 TriggerEvent("vorp:NotifyLeft", "Lenhador", Language.translate[Config.lang]['goto'], "inventory_items", "provision_rf_wood_cobalt", 2700)
                    PlaySoundFrontend("Give_Item_Enter", "HUD_Donate_Sounds", true, 1)
                    RemoveBlip(blip3)
                    blip4 = Citizen.InvokeNative(0x554d9d53f696d002, 203020899, Config.Zonas['Miner4'].x, Config.Zonas['Miner4'].y, Config.Zonas['Miner4'].z)
                    SetBlipSprite(blip4, -570710357, 1)
                    Mina3 = false
                    Mina4 = true
                end
            end
        elseif Mina4 and IsPedOnFoot(PlayerPedId()) then
            Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zonas['Miner4'].x, Config.Zonas['Miner4'].y, Config.Zonas['Miner4'].z - 1.0, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 1.5, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Miner4'].x, Config.Zonas['Miner4'].y, Config.Zonas['Miner4'].z) < 3.0) then
             DrawText3D(Config.Zonas['Miner4'].x, Config.Zonas['Miner4'].y, Config.Zonas['Miner4'].z, Language.translate[Config.lang]['press'])
                if IsControlJustPressed(0, 0xC7B5340A) then
                    animacion()
                    animacion3(Arbol4)
                  TriggerEvent("vorp:NotifyLeft", "Lenhador", Language.translate[Config.lang]['goto'], "inventory_items", "provision_rf_wood_cobalt", 2700)
                    PlaySoundFrontend("Give_Item_Enter", "HUD_Donate_Sounds", true, 1)
                    RemoveBlip(blip4)
                    blip5 = Citizen.InvokeNative(0x554d9d53f696d002, 203020899, Config.Zonas['Miner5'].x, Config.Zonas['Miner5'].y, Config.Zonas['Miner5'].z)
                    SetBlipSprite(blip5, -570710357, 1)
                    Mina4 = false
                    Mina5 = true
                end
            end
        elseif Mina5 and IsPedOnFoot(PlayerPedId()) then
            Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zonas['Miner5'].x, Config.Zonas['Miner5'].y, Config.Zonas['Miner5'].z - 1.0, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 1.5, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Miner5'].x, Config.Zonas['Miner5'].y, Config.Zonas['Miner5'].z) < 3.0) then
           DrawText3D(Config.Zonas['Miner5'].x, Config.Zonas['Miner5'].y, Config.Zonas['Miner5'].z, Language.translate[Config.lang]['press'])
                if IsControlJustPressed(0, 0xC7B5340A) then
                    animacion()
                    animacion3(Arbol5)
                  TriggerEvent("vorp:NotifyLeft", "Lenhador", Language.translate[Config.lang]['goto'], "inventory_items", "provision_rf_wood_cobalt", 2700)
                    PlaySoundFrontend("Give_Item_Enter", "HUD_Donate_Sounds", true, 1)
                    RemoveBlip(blip5)
                    blip6 = Citizen.InvokeNative(0x554d9d53f696d002, 203020899, Config.Zonas['Miner6'].x, Config.Zonas['Miner6'].y, Config.Zonas['Miner6'].z)
                    SetBlipSprite(blip6, -570710357, 1)
                    Mina5 = false
                    Mina6 = true
                end
            end
        elseif Mina6 and IsPedOnFoot(PlayerPedId()) then
            Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zonas['Miner6'].x, Config.Zonas['Miner6'].y, Config.Zonas['Miner6'].z - 1.0, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 1.5, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Miner6'].x, Config.Zonas['Miner6'].y, Config.Zonas['Miner6'].z) < 3.0) then
              DrawText3D(Config.Zonas['Miner6'].x, Config.Zonas['Miner6'].y, Config.Zonas['Miner6'].z, Language.translate[Config.lang]['press'])
                if IsControlJustPressed(0, 0xC7B5340A) then
                    animacion()
                    animacion3(Arbol6)
                   TriggerEvent("vorp:NotifyLeft", "Lenhador", Language.translate[Config.lang]['goto'], "inventory_items", "provision_rf_wood_cobalt", 2700)
                    PlaySoundFrontend("Give_Item_Enter", "HUD_Donate_Sounds", true, 1)
                    RemoveBlip(blip6)
                    blip7 = Citizen.InvokeNative(0x554d9d53f696d002, 203020899, Config.Zonas['Miner7'].x, Config.Zonas['Miner7'].y, Config.Zonas['Miner7'].z)
                    SetBlipSprite(blip7, -570710357, 1)
                    Mina6 = false
                    Mina7 = true
                end
            end
        elseif Mina7 and IsPedOnFoot(PlayerPedId()) then
            Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zonas['Miner7'].x, Config.Zonas['Miner7'].y, Config.Zonas['Miner7'].z - 1.0, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 1.5, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Miner7'].x, Config.Zonas['Miner7'].y, Config.Zonas['Miner7'].z) < 3.0) then
               DrawText3D(Config.Zonas['Miner7'].x, Config.Zonas['Miner7'].y, Config.Zonas['Miner7'].z, Language.translate[Config.lang]['press'])
                if IsControlJustPressed(0, 0xC7B5340A) then
                    animacion()
                    animacion3(Arbol7)
                   TriggerEvent("vorp:NotifyLeft", "Lenhador", Language.translate[Config.lang]['goto'], "inventory_items", "provision_rf_wood_cobalt", 2700)
                    PlaySoundFrontend("Give_Item_Enter", "HUD_Donate_Sounds", true, 1)
                    RemoveBlip(blip7)
                    blip8 = Citizen.InvokeNative(0x554d9d53f696d002, 203020899, Config.Zonas['Miner8'].x, Config.Zonas['Miner8'].y, Config.Zonas['Miner8'].z)
                    SetBlipSprite(blip8, -570710357, 1)
                    Mina7 = false
                    Mina8 = true
                end
            end
        elseif Mina8 and IsPedOnFoot(PlayerPedId()) then
            Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zonas['Miner8'].x, Config.Zonas['Miner8'].y, Config.Zonas['Miner8'].z - 1.0, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 1.5, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Miner8'].x, Config.Zonas['Miner8'].y, Config.Zonas['Miner8'].z) < 3.0) then
               DrawText3D(Config.Zonas['Miner8'].x, Config.Zonas['Miner8'].y, Config.Zonas['Miner8'].z, Language.translate[Config.lang]['press'])
                if IsControlJustPressed(0, 0xC7B5340A) then
                    animacion()
                    animacion3(Arbol8)
                   TriggerEvent("vorp:NotifyLeft", "Lenhador", Language.translate[Config.lang]['goto'], "inventory_items", "provision_rf_wood_cobalt", 2700)
                    PlaySoundFrontend("Give_Item_Enter", "HUD_Donate_Sounds", true, 1)
                    RemoveBlip(blip8)
                    blip9 = Citizen.InvokeNative(0x554d9d53f696d002, 203020899, Config.Zonas['Miner9'].x, Config.Zonas['Miner9'].y, Config.Zonas['Miner9'].z)
                    SetBlipSprite(blip9, -570710357, 1)
                    Mina8 = false
                    Mina9 = true
                end
            end
        elseif Mina9 and IsPedOnFoot(PlayerPedId()) then
            Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zonas['Miner9'].x, Config.Zonas['Miner9'].y, Config.Zonas['Miner9'].z - 1.0, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 1.5, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Miner9'].x, Config.Zonas['Miner9'].y, Config.Zonas['Miner9'].z) < 3.0) then
               DrawText3D(Config.Zonas['Miner9'].x, Config.Zonas['Miner9'].y, Config.Zonas['Miner9'].z, Language.translate[Config.lang]['press'])
                if IsControlJustPressed(0, 0xC7B5340A) then
                    animacion()
                    animacion3(Arbol9)
                    TriggerEvent("vorp:NotifyLeft", "Lenhador", Language.translate[Config.lang]['goto'], "inventory_items", "provision_rf_wood_cobalt", 2700)
                    PlaySoundFrontend("Give_Item_Enter", "HUD_Donate_Sounds", true, 1)
                    RemoveBlip(blip9)
                    blip10 = Citizen.InvokeNative(0x554d9d53f696d002, 203020899, Config.Zonas['Miner10'].x, Config.Zonas['Miner10'].y, Config.Zonas['Miner10'].z)
                    SetBlipSprite(blip10, -570710357, 1)
                    Mina9 = false
                    Mina10 = true
                end
            end
        elseif Mina10 and IsPedOnFoot(PlayerPedId()) then
            Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zonas['Miner10'].x, Config.Zonas['Miner10'].y, Config.Zonas['Miner10'].z - 1.0, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 1.5, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Miner10'].x, Config.Zonas['Miner10'].y, Config.Zonas['Miner10'].z) < 3.0) then
               DrawText3D(Config.Zonas['Miner10'].x, Config.Zonas['Miner10'].y, Config.Zonas['Miner10'].z, Language.translate[Config.lang]['press'])
                if IsControlJustPressed(0, 0xC7B5340A) then
                    animacion()
                    animacion3(Arbol10)
                   TriggerEvent("vorp:NotifyLeft", "~o~Atenção", Language.translate[Config.lang]['noveh'], "rpg_textures", "rpg_agitation", 3000)
                    TriggerEvent("vorp:NotifyLeft", "~t6~Lenhador", Language.translate[Config.lang]['carry'], "generic_textures", "tick", 3000)
                    PlaySoundFrontend("Give_Item_Enter", "HUD_Donate_Sounds", true, 1)
                    
                    RemoveBlip(blip10)
                    Mina10 = false
                    FinMina = true
                    TriggerEvent('stress:modify', 5.7)
                end
            end
        elseif FinMina == true then
            TriggerServerEvent('art_woodcutter:givewood')
            FinMina = false
        end 
    end
    
end)

-------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Wait(0)
        local pos = GetEntityCoords(PlayerPedId())
        Citizen.InvokeNative(0x2A32FAA57B937173, 0x07DCE236, Config.Zonas['inic'].x, Config.Zonas['inic'].y, Config.Zonas['inic'].z - 1.0, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 0.9, 18, 255, 1, 155, 0, 0, 2, 0, 0, 0, 0)

        if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['inic'].x, Config.Zonas['inic'].y, Config.Zonas['inic'].z) < 1.0) then
            if true then
              DrawText3D(Config.Zonas['inic'].x, Config.Zonas['inic'].y, Config.Zonas['inic'].z, Language.translate[Config.lang]['press'])
                if IsControlJustPressed(0, 0xC7B5340A) then
                    TriggerServerEvent('woodcutter:checkjob2')
                end
            end
        end
        if PrimeraArvore and IsPedOnFoot(PlayerPedId()) then
            Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zonas['Machad1'].x, Config.Zonas['Machad1'].y, Config.Zonas['Machad1'].z - 1.0, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 1.5, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Machad1'].x, Config.Zonas['Machad1'].y, Config.Zonas['Machad1'].z) < 3.0) then
            DrawText3D(Config.Zonas['Machad1'].x, Config.Zonas['Machad1'].y, Config.Zonas['Machad1'].z, Language.translate[Config.lang]['press'])
                if IsControlJustPressed(0, 0xC7B5340A) then
                    animacion()
                    animacion3(Arvor1) -- Aqui eu tenho certeza
                  TriggerEvent("vorp:NotifyLeft", "Lenhador", Language.translate[Config.lang]['goto'], "inventory_items", "provision_rf_wood_cobalt", 2700)
                    PlaySoundFrontend("Give_Item_Enter", "HUD_Donate_Sounds", true, 1)
					RemoveBlip(blip)
					blip2 = Citizen.InvokeNative(0x554d9d53f696d002, 203020899, Config.Zonas['Machad2'].x, Config.Zonas['Machad2'].y, Config.Zonas['Machad2'].z)
                    SetBlipSprite(blip2, -570710357, 1)
					PrimeraArvore = false
                    Arvore2 = true
                end
            end
        elseif Arvore2 and IsPedOnFoot(PlayerPedId()) then
            Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zonas['Machad2'].x, Config.Zonas['Machad2'].y, Config.Zonas['Machad2'].z - 1.0, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 1.5, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Machad2'].x, Config.Zonas['Machad2'].y, Config.Zonas['Machad2'].z) < 3.0) then
              DrawText3D(Config.Zonas['Machad2'].x, Config.Zonas['Machad2'].y, Config.Zonas['Machad2'].z, Language.translate[Config.lang]['press'])
                if IsControlJustPressed(0, 0xC7B5340A) then
                    animacion()
                    animacion3(Arvor2)
                  TriggerEvent("vorp:NotifyLeft", "Lenhador", Language.translate[Config.lang]['goto'], "inventory_items", "provision_rf_wood_cobalt", 2700)
                    PlaySoundFrontend("Give_Item_Enter", "HUD_Donate_Sounds", true, 1)
                    RemoveBlip(blip2)
                    blip3 = Citizen.InvokeNative(0x554d9d53f696d002, 203020899, Config.Zonas['Machad3'].x, Config.Zonas['Machad3'].y, Config.Zonas['Machad3'].z)
                    SetBlipSprite(blip3, -570710357, 1)
                    Arvore2 = false
                    Arvore3 = true
                end
            end
        elseif Arvore3 and IsPedOnFoot(PlayerPedId()) then
            Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zonas['Machad3'].x, Config.Zonas['Machad3'].y, Config.Zonas['Machad3'].z - 1.0, 0, 0, 0, 0, 0, 0,2.0, 2.0, 1.5, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Machad3'].x, Config.Zonas['Machad3'].y, Config.Zonas['Machad3'].z) < 3.0) then
               DrawText3D(Config.Zonas['Machad3'].x, Config.Zonas['Machad3'].y, Config.Zonas['Machad3'].z, Language.translate[Config.lang]['press'])
                if IsControlJustPressed(0, 0xC7B5340A) then
                    animacion()
                    animacion3(Arvor3)
                 TriggerEvent("vorp:NotifyLeft", "Lenhador", Language.translate[Config.lang]['goto'], "inventory_items", "provision_rf_wood_cobalt", 2700)
                    PlaySoundFrontend("Give_Item_Enter", "HUD_Donate_Sounds", true, 1)
                    RemoveBlip(blip3)
                    blip4 = Citizen.InvokeNative(0x554d9d53f696d002, 203020899, Config.Zonas['Machad4'].x, Config.Zonas['Machad4'].y, Config.Zonas['Machad4'].z)
                    SetBlipSprite(blip4, -570710357, 1)
                    Arvore3 = false
                    Arvore4 = true
                end
            end
        elseif Arvore4 and IsPedOnFoot(PlayerPedId()) then
            Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zonas['Machad4'].x, Config.Zonas['Machad4'].y, Config.Zonas['Machad4'].z - 1.0, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 1.5, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Machad4'].x, Config.Zonas['Machad4'].y, Config.Zonas['Machad4'].z) < 3.0) then
             DrawText3D(Config.Zonas['Machad4'].x, Config.Zonas['Machad4'].y, Config.Zonas['Machad4'].z, Language.translate[Config.lang]['press'])
                if IsControlJustPressed(0, 0xC7B5340A) then
                    animacion()
                    animacion3(Arvor4)
                  TriggerEvent("vorp:NotifyLeft", "Lenhador", Language.translate[Config.lang]['goto'], "inventory_items", "provision_rf_wood_cobalt", 2700)
                    PlaySoundFrontend("Give_Item_Enter", "HUD_Donate_Sounds", true, 1)
                    RemoveBlip(blip4)
                    blip5 = Citizen.InvokeNative(0x554d9d53f696d002, 203020899, Config.Zonas['Machad5'].x, Config.Zonas['Machad5'].y, Config.Zonas['Machad5'].z)
                    SetBlipSprite(blip5, -570710357, 1)
                    Arvore4 = false
                    Arvore5 = true
                end
            end
        elseif Arvore5 and IsPedOnFoot(PlayerPedId()) then
            Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zonas['Machad5'].x, Config.Zonas['Machad5'].y, Config.Zonas['Machad5'].z - 1.0, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 1.5, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Machad5'].x, Config.Zonas['Machad5'].y, Config.Zonas['Machad5'].z) < 3.0) then
           DrawText3D(Config.Zonas['Machad5'].x, Config.Zonas['Machad5'].y, Config.Zonas['Machad5'].z, Language.translate[Config.lang]['press'])
                if IsControlJustPressed(0, 0xC7B5340A) then
                    animacion()
                    animacion3(Arvor5)
                  TriggerEvent("vorp:NotifyLeft", "Lenhador", Language.translate[Config.lang]['goto'], "inventory_items", "provision_rf_wood_cobalt", 2700)
                    PlaySoundFrontend("Give_Item_Enter", "HUD_Donate_Sounds", true, 1)
                    RemoveBlip(blip5)
                    blip6 = Citizen.InvokeNative(0x554d9d53f696d002, 203020899, Config.Zonas['Machad6'].x, Config.Zonas['Machad6'].y, Config.Zonas['Machad6'].z)
                    SetBlipSprite(blip6, -570710357, 1)
                    Arvore5 = false
                    Arvore6 = true
                end
            end
        elseif Arvore6 and IsPedOnFoot(PlayerPedId()) then
            Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zonas['Machad6'].x, Config.Zonas['Machad6'].y, Config.Zonas['Machad6'].z - 1.0, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 1.5, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Machad6'].x, Config.Zonas['Machad6'].y, Config.Zonas['Machad6'].z) < 3.0) then
              DrawText3D(Config.Zonas['Machad6'].x, Config.Zonas['Machad6'].y, Config.Zonas['Machad6'].z, Language.translate[Config.lang]['press'])
                if IsControlJustPressed(0, 0xC7B5340A) then
                    animacion()
                    animacion3(Arvor6)
                   TriggerEvent("vorp:NotifyLeft", "Lenhador", Language.translate[Config.lang]['goto'], "inventory_items", "provision_rf_wood_cobalt", 2700)
                    PlaySoundFrontend("Give_Item_Enter", "HUD_Donate_Sounds", true, 1)
                    RemoveBlip(blip6)
                    blip7 = Citizen.InvokeNative(0x554d9d53f696d002, 203020899, Config.Zonas['Machad7'].x, Config.Zonas['Machad7'].y, Config.Zonas['Machad7'].z)
                    SetBlipSprite(blip7, -570710357, 1)
                    Arvore6 = false
                    Arvore7 = true
                end
            end
        elseif Arvore7 and IsPedOnFoot(PlayerPedId()) then
            Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zonas['Machad7'].x, Config.Zonas['Machad7'].y, Config.Zonas['Machad7'].z - 1.0, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 1.5, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Machad7'].x, Config.Zonas['Machad7'].y, Config.Zonas['Machad7'].z) < 3.0) then
               DrawText3D(Config.Zonas['Machad7'].x, Config.Zonas['Machad7'].y, Config.Zonas['Machad7'].z, Language.translate[Config.lang]['press'])
                if IsControlJustPressed(0, 0xC7B5340A) then
                    animacion()
                    animacion3(Arvor7)
                   TriggerEvent("vorp:NotifyLeft", "Lenhador", Language.translate[Config.lang]['goto'], "inventory_items", "provision_rf_wood_cobalt", 2700)
                    PlaySoundFrontend("Give_Item_Enter", "HUD_Donate_Sounds", true, 1)
                    RemoveBlip(blip7)
                    blip8 = Citizen.InvokeNative(0x554d9d53f696d002, 203020899, Config.Zonas['Machad8'].x, Config.Zonas['Machad8'].y, Config.Zonas['Machad8'].z)
                    SetBlipSprite(blip8, -570710357, 1)
                    Arvore7 = false
                    Arvore8 = true
                end
            end
        elseif Arvore8 and IsPedOnFoot(PlayerPedId()) then
            Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zonas['Machad8'].x, Config.Zonas['Machad8'].y, Config.Zonas['Machad8'].z - 1.0, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 1.5, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Machad8'].x, Config.Zonas['Machad8'].y, Config.Zonas['Machad8'].z) < 3.0) then
               DrawText3D(Config.Zonas['Machad8'].x, Config.Zonas['Machad8'].y, Config.Zonas['Machad8'].z, Language.translate[Config.lang]['press'])
                if IsControlJustPressed(0, 0xC7B5340A) then
                    animacion()
                    animacion3(Arvor8)
                   TriggerEvent("vorp:NotifyLeft", "Lenhador", Language.translate[Config.lang]['goto'], "inventory_items", "provision_rf_wood_cobalt", 2700)
                    PlaySoundFrontend("Give_Item_Enter", "HUD_Donate_Sounds", true, 1)
                    RemoveBlip(blip8)
                    blip9 = Citizen.InvokeNative(0x554d9d53f696d002, 203020899, Config.Zonas['Machad9'].x, Config.Zonas['Machad9'].y, Config.Zonas['Machad9'].z)
                    SetBlipSprite(blip9, -570710357, 1)
                    Arvore8 = false
                    Arvore9 = true
                end
            end
        elseif Arvore9 and IsPedOnFoot(PlayerPedId()) then
            Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zonas['Machad9'].x, Config.Zonas['Machad9'].y, Config.Zonas['Machad9'].z - 1.0, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 1.5, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Machad9'].x, Config.Zonas['Machad9'].y, Config.Zonas['Machad9'].z) < 3.0) then
               DrawText3D(Config.Zonas['Machad9'].x, Config.Zonas['Machad9'].y, Config.Zonas['Machad9'].z, Language.translate[Config.lang]['press'])
                if IsControlJustPressed(0, 0xC7B5340A) then
                    animacion()
                    animacion3(Arvor9)
                    TriggerEvent("vorp:NotifyLeft", "Lenhador", Language.translate[Config.lang]['goto'], "inventory_items", "provision_rf_wood_cobalt", 2700)
                    PlaySoundFrontend("Give_Item_Enter", "HUD_Donate_Sounds", true, 1)
                    RemoveBlip(blip9)
                    blip10 = Citizen.InvokeNative(0x554d9d53f696d002, 203020899, Config.Zonas['Machad10'].x, Config.Zonas['Machad10'].y, Config.Zonas['Machad10'].z)
                    SetBlipSprite(blip10, -570710357, 1)
                    Arvore9 = false
                    Arvore10 = true
                end
            end
        elseif Arvore10 and IsPedOnFoot(PlayerPedId()) then
            Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zonas['Machad10'].x, Config.Zonas['Machad10'].y, Config.Zonas['Machad10'].z - 1.0, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 1.5, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Machad10'].x, Config.Zonas['Machad10'].y, Config.Zonas['Machad10'].z) < 3.0) then
               DrawText3D(Config.Zonas['Machad10'].x, Config.Zonas['Machad10'].y, Config.Zonas['Machad10'].z, Language.translate[Config.lang]['press'])
                if IsControlJustPressed(0, 0xC7B5340A) then
                    animacion()
                    animacion3(Arvor10)
                   TriggerEvent("vorp:NotifyLeft", "~o~Atenção", Language.translate[Config.lang]['noveh'], "rpg_textures", "rpg_agitation", 3000)
                    TriggerEvent("vorp:NotifyLeft", "~t6~Lenhador", Language.translate[Config.lang]['carry'], "generic_textures", "tick", 3000)
                    PlaySoundFrontend("Give_Item_Enter", "HUD_Donate_Sounds", true, 1)
                    
                    RemoveBlip(blip10)
                    Arvore10 = false
                    FinArvore = true
                    TriggerEvent('stress:modify', 5.7)
                end
            end
        elseif FinArvore == true then
            TriggerServerEvent('art_woodcutter:givewood')
            FinArvore = false
        end 
    end
    
end)
-------------------------------------------------------------------------------------------------


canProcess = false
RegisterNetEvent("checklogcl")
AddEventHandler("checklogcl", function(result)
    canProcess = result
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        Citizen.InvokeNative(0x2A32FAA57B937173, 0x07DCE236, Config.Zonas['Entrega'].x, Config.Zonas['Entrega'].y, Config.Zonas['Entrega'].z - 1.0, 0, 0, 0, 0, 0, 0, 4.0, 4.0, 1.5, 255, 23, 23, 155, 0, 0, 2, 0, 0, 0, 0)
        local pos = GetEntityCoords(PlayerPedId())
        if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Entrega'].x, Config.Zonas['Entrega'].y, Config.Zonas['Entrega'].z) < 3.0) then
           DrawText3D(Config.Zonas['Entrega'].x, Config.Zonas['Entrega'].y, Config.Zonas['Entrega'].z,Language.translate[Config.lang]['pressf'])
            if IsControlJustPressed(0, 0xC7B5340A) then
                animacion2()
                TriggerServerEvent("checklogsv")
                Wait(1000)
                if canProcess then
                    TriggerEvent("vorp:NotifyLeft", "~t6~Lenhador", Language.translate[Config.lang]['completejob'], "generic_textures", "tick", 3000)
                    PlaySoundFrontend("HUD_DRAW", "HUD_DUEL_SOUNDSET", true, 1)
                    TriggerServerEvent('art_woodcutter:cobrar')
                else
                   TriggerEvent("vorp:NotifyLeft", "~e~Erro", Language.translate[Config.lang]['nomateriale'], "menu_textures", "cross", 3000)
                end
            end
        end
    end
end)

RegisterNetEvent('art_woodcutter:comienzo')
AddEventHandler('art_woodcutter:comienzo', function(source)
    PlaySoundFrontend("CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", true, 1)
   TriggerEvent("vorp:NotifyLeft", "Lenhador", Language.translate[Config.lang]['gopos'], "inventory_items", "provision_rf_wood_cobalt", 3000)
    blip = Citizen.InvokeNative(0x554d9d53f696d002, 203020899, Config.Zonas['Miner1'].x, Config.Zonas['Miner1'].y, Config.Zonas['Miner1'].z)
    SetBlipSprite(blip, -570710357, 1)
    PrimeraMina = true
    Mina1 = true
    SpawnearArboles("p_tree_pine_ponderosa_06") -- Spawneo de arboles al empezar
end)
RegisterNetEvent('art_woodcutter:comienzo2')
AddEventHandler('art_woodcutter:comienzo2', function(source)
    PlaySoundFrontend("CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", true, 1)
   TriggerEvent("vorp:NotifyLeft", "Lenhador", Language.translate[Config.lang]['gopos'], "inventory_items", "provision_rf_wood_cobalt", 3000)
    blip = Citizen.InvokeNative(0x554d9d53f696d002, 203020899, Config.Zonas['Machad1'].x, Config.Zonas['Machad1'].y, Config.Zonas['Machad1'].z)
    SetBlipSprite(blip, -570710357, 1)
    PrimeraArvore = true
    Arvore1 = true
    SpawnearArboles("p_tree_pine_ponderosa_06") -- Spawneo de arboles al empezar
end)

function animacion()

    local playerPed = PlayerPedId()
    local prop_name = 'p_axe02x'
    local x,y,z = table.unpack(GetEntityCoords(playerPed))
    local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
    local boneIndex = GetEntityBoneIndexByName(playerPed, "SKEL_R_Finger12")

    RequestAnimDict("amb_work@world_human_tree_chop@male_a@idle_b")
    while not HasAnimDictLoaded("amb_work@world_human_tree_chop@male_a@idle_b") do
        Citizen.Wait(100)
    end
    TaskPlayAnim(playerPed, "amb_work@world_human_tree_chop@male_a@idle_b", "idle_f", 8.0, -8.0, 10000, 0, 0, true, 0, false, 0, false)
    AttachEntityToEntity(prop, playerPed,boneIndex, 0.200, -0.0, 0.5010, 1.024, -160.0, -70.0, true, true, false, true, 1, true)

    exports['progressBars']:startUI(10000, Language.translate[Config.lang]['mining'])
    Wait(10000)
    ClearPedSecondaryTask(playerPed)
    DeleteObject(prop)
end

function animacion2()
    RequestAnimDict("amb_work@world_human_wood_plane@working@male_a@base")
    while not HasAnimDictLoaded("amb_work@world_human_wood_plane@working@male_a@base") do
        Citizen.Wait(1)
		RequestAnimDict("amb_work@world_human_wood_plane@working@male_a@base")
    end
	while not HasModelLoaded("p_woodplane01x") do
	   RequestModel("p_woodplane01x")
	   Citizen.Wait(1)
	end
    TaskPlayAnim(PlayerPedId(), "amb_work@world_human_wood_plane@working@male_a@base", "base", 1.0, 8.0, -1, 1, 0, false, 0, false, 0, false)
	local object = CreateObject("p_woodplane01x", x, y, z, true, true, true)
	AttachEntityToEntity(object, PlayerPedId(), GetEntityBoneIndexByName(PlayerPedId(), "PH_R_Hand"), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 1, 0, 0, 1)
	--TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('PROP_HUMAN_SACK_STORAGE_IN'), 7000, true, false, false, false)
    exports['progressBars']:startUI(10000, Language.translate[Config.lang]['placing'])
    Wait(10000)
	DeleteObject(object)
	ClearPedTasks(PlayerPedId())
end

function animacion3(object)
    local rot = 1.01
    while true do
        Wait(10)
        rot = rot + 1
        SetEntityRotation(object, rot, 0.0, 0.0, 1, true)
        if(rot >= 90) then
            break
        end

    end
    DeleteObject(object)
end

function SpawnearArboles(hash)
    local obj = GetHashKey(hash)
    Wait(500)
    RequestModel(obj)
    if not HasModelLoaded(obj) then 
        RequestModel(obj) 
    end

    while not HasModelLoaded(obj) do 
        Citizen.Wait(1) 
    end

    Arbol1 = CreateObject(obj, Config.Zonas['Miner1'].x, Config.Zonas['Miner1'].y, Config.Zonas['Miner1'].z +1.0, true, true, true)
    Arbol2 = CreateObject(obj, Config.Zonas['Miner2'].x, Config.Zonas['Miner2'].y, Config.Zonas['Miner2'].z +1.0, true, true, true)
    Arbol3 = CreateObject(obj, Config.Zonas['Miner3'].x, Config.Zonas['Miner3'].y, Config.Zonas['Miner3'].z +1.0, true, true, true)
    Arbol4 = CreateObject(obj, Config.Zonas['Miner4'].x, Config.Zonas['Miner4'].y, Config.Zonas['Miner4'].z +1.0, true, true, true)
    Arbol5 = CreateObject(obj, Config.Zonas['Miner5'].x, Config.Zonas['Miner5'].y, Config.Zonas['Miner5'].z +1.0, true, true, true)
    Arbol6 = CreateObject(obj, Config.Zonas['Miner6'].x, Config.Zonas['Miner6'].y, Config.Zonas['Miner6'].z +1.0, true, true, true)
    Arbol7 = CreateObject(obj, Config.Zonas['Miner7'].x, Config.Zonas['Miner7'].y, Config.Zonas['Miner7'].z +1.0, true, true, true)
    Arbol8 = CreateObject(obj, Config.Zonas['Miner8'].x, Config.Zonas['Miner8'].y, Config.Zonas['Miner8'].z +1.0, true, true, true)
    Arbol9 = CreateObject(obj, Config.Zonas['Miner9'].x, Config.Zonas['Miner9'].y, Config.Zonas['Miner9'].z +1.0, true, true, true)
    Arbol10 = CreateObject(obj, Config.Zonas['Miner10'].x, Config.Zonas['Miner10'].y, Config.Zonas['Miner10'].z +1.0, true, true, true)
    PlaceObjectOnGroundProperly(Arbol1)
    PlaceObjectOnGroundProperly(Arbol2)
    PlaceObjectOnGroundProperly(Arbol3)
    PlaceObjectOnGroundProperly(Arbol4)
    PlaceObjectOnGroundProperly(Arbol5)
    PlaceObjectOnGroundProperly(Arbol6)
    PlaceObjectOnGroundProperly(Arbol7)
    PlaceObjectOnGroundProperly(Arbol8)
    PlaceObjectOnGroundProperly(Arbol9)
    PlaceObjectOnGroundProperly(Arbol10)
    SetEntityAsMissionEntity(Arbol1, true)
    SetEntityAsMissionEntity(Arbol2, true)
    SetEntityAsMissionEntity(Arbol3, true)
    SetEntityAsMissionEntity(Arbol4, true)
    SetEntityAsMissionEntity(Arbol5, true)
    SetEntityAsMissionEntity(Arbol6, true)
    SetEntityAsMissionEntity(Arbol7, true)
    SetEntityAsMissionEntity(Arbol8, true)
    SetEntityAsMissionEntity(Arbol9, true)
    SetEntityAsMissionEntity(Arbol10, true)
    ------------------------------------------------------------------------------------------- BW
    Arvor1 = CreateObject(obj, Config.Zonas['Machad1'].x, Config.Zonas['Machad1'].y, Config.Zonas['Machad1'].z +1.0, true, true, true)
    Arvor2 = CreateObject(obj, Config.Zonas['Machad2'].x, Config.Zonas['Machad2'].y, Config.Zonas['Machad2'].z +1.0, true, true, true)
    Arvor3 = CreateObject(obj, Config.Zonas['Machad3'].x, Config.Zonas['Machad3'].y, Config.Zonas['Machad3'].z +1.0, true, true, true)
    Arvor4 = CreateObject(obj, Config.Zonas['Machad4'].x, Config.Zonas['Machad4'].y, Config.Zonas['Machad4'].z +1.0, true, true, true)
    Arvor5 = CreateObject(obj, Config.Zonas['Machad5'].x, Config.Zonas['Machad5'].y, Config.Zonas['Machad5'].z +1.0, true, true, true)
    Arvor6 = CreateObject(obj, Config.Zonas['Machad6'].x, Config.Zonas['Machad6'].y, Config.Zonas['Machad6'].z +1.0, true, true, true)
    Arvor7 = CreateObject(obj, Config.Zonas['Machad7'].x, Config.Zonas['Machad7'].y, Config.Zonas['Machad7'].z +1.0, true, true, true)
    Arvor8 = CreateObject(obj, Config.Zonas['Machad8'].x, Config.Zonas['Machad8'].y, Config.Zonas['Machad8'].z +1.0, true, true, true)
    Arvor9 = CreateObject(obj, Config.Zonas['Machad9'].x, Config.Zonas['Machad9'].y, Config.Zonas['Machad9'].z +1.0, true, true, true)
    Arvor10 = CreateObject(obj, Config.Zonas['Machad10'].x, Config.Zonas['Machad10'].y, Config.Zonas['Machad10'].z +1.0, true, true, true)
    PlaceObjectOnGroundProperly(Arvor1)
    PlaceObjectOnGroundProperly(Arvor2)
    PlaceObjectOnGroundProperly(Arvor3)
    PlaceObjectOnGroundProperly(Arvor4)
    PlaceObjectOnGroundProperly(Arvor5)
    PlaceObjectOnGroundProperly(Arvor6)
    PlaceObjectOnGroundProperly(Arvor7)
    PlaceObjectOnGroundProperly(Arvor8)
    PlaceObjectOnGroundProperly(Arvor9)
    PlaceObjectOnGroundProperly(Arvor10)
    SetEntityAsMissionEntity(Arvor1, true)
    SetEntityAsMissionEntity(Arvor2, true)
    SetEntityAsMissionEntity(Arvor3, true)
    SetEntityAsMissionEntity(Arvor4, true)
    SetEntityAsMissionEntity(Arvor5, true)
    SetEntityAsMissionEntity(Arvor6, true)
    SetEntityAsMissionEntity(Arvor7, true)
    SetEntityAsMissionEntity(Arvor8, true)
    SetEntityAsMissionEntity(Arvor9, true)
    SetEntityAsMissionEntity(Arvor10, true)

end

function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str)
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
	SetTextCentre(centre)
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
	Citizen.InvokeNative(0xADA9255D, 1);
    DisplayText(str, x, y)
end

function CreateVarString(p0, p1, variadic)
    return Citizen.InvokeNative(0xFA925AC00EB830B9, p0, p1, variadic, Citizen.ResultAsLong())
end


Citizen.CreateThread(function()
    while true do
        Wait(0)
        Citizen.InvokeNative(0x2A32FAA57B937173, 0x07DCE236, 575.6,1687.0,187.7 - 1.0, 0, 0, 0, 0, 0, 0, 4.0, 4.0, 1.5, 255, 23, 23, 155, 0, 0, 2, 0, 0, 0, 0)
        local pos = GetEntityCoords(PlayerPedId())
        if (Vdist(pos.x, pos.y, pos.z, 575.6,1687.0,187.7) < 3.0) then
          DrawText3D(575.6,1687.0,187.7, "Pressione [~e~ENTER~q~] para abrir o processo de Armeiro")
            if IsControlJustReleased(0, 0xC7B5340A) then
                Wait(50)
                TriggerServerEvent('weaponsmith:checkp')
                
            end
        end
    end
end)

RegisterNetEvent('weaponsmith:openp')
AddEventHandler('weaponsmith:openp', function() 
    WarMenu.OpenMenu('processamento')
end)

Citizen.CreateThread(function() 

    WarMenu.CreateMenu("processamento", "Armeiro")
    
    while true do
        Wait(0)
        if WarMenu.IsMenuOpened('processamento') then

            if WarMenu.Button("Criar coronha de rifle padrão") then
                TriggerServerEvent('artwoodc:processoarmeiro', 0, 15, 0, "coronharifle")
                WarMenu.CloseMenu('processamento')
            elseif WarMenu.Button("Crie coronha de rifle aprimorado") then
                TriggerServerEvent('artwoodc:processoarmeiro', 8, 15, 8, "coronhariflemelhorado")
                WarMenu.CloseMenu('processamento')
            elseif WarMenu.Button("Criar coronha de pistola padrão") then
                WarMenu.CloseMenu('processamento')
                TriggerServerEvent('artwoodc:processoarmeiro', 10, 0, 0, "coronhapistolapadrao")
                WarMenu.CloseMenu('processamento')
            elseif WarMenu.Button("Criar coronha de pistola aprimorado") then
                WarMenu.CloseMenu('processamento')
                TriggerServerEvent('artwoodc:processoarmeiro', 10, 10, 5, "coronhapistolamelhorado")
                WarMenu.CloseMenu('processamento')
            elseif WarMenu.Button("Fechar") then
                WarMenu.CloseMenu('processamento')
            end
            WarMenu.Display()
        end
    end

end)

RegisterNetEvent('artwoodc:animazionep')
AddEventHandler('artwoodc:animazionep', function() 
    animacion3pr()
end)

function animacion3pr()
    RequestAnimDict("amb_work@world_human_wood_plane@working@male_a@base")
    while not HasAnimDictLoaded("amb_work@world_human_wood_plane@working@male_a@base") do
        Citizen.Wait(1)
		RequestAnimDict("amb_work@world_human_wood_plane@working@male_a@base")
    end
	while not HasModelLoaded("p_woodplane01x") do
	   RequestModel("p_woodplane01x")
	   Citizen.Wait(1)
	end
    TaskPlayAnim(PlayerPedId(), "amb_work@world_human_wood_plane@working@male_a@base", "base", 1.0, 8.0, -1, 1, 0, false, 0, false, 0, false)
	local object = CreateObject("p_woodplane01x", x, y, z, true, true, true)
	AttachEntityToEntity(object, PlayerPedId(), GetEntityBoneIndexByName(PlayerPedId(), "PH_R_Hand"), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 1, 0, 0, 1)
	--TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('PROP_HUMAN_SACK_STORAGE_IN'), 7000, true, false, false, false)
    exports['progressBars']:startUI(180000, 'Processando...')
    FreezeEntityPosition(PlayerPedId(),true)
    Wait(180000)
	DeleteObject(object)
    FreezeEntityPosition(PlayerPedId(),false)
	ClearPedTasks(PlayerPedId())
end

function DrawText3D(x, y, z, text)
    local onScreen,_x,_y=GetScreenCoordFromWorldCoord(x, y, z)
    local px,py,pz=table.unpack(GetGameplayCamCoord())
    
    SetTextScale(0.35, 0.35)
    SetTextFontForCurrentCommand(1)
    SetTextColor(255, 255, 255, 215)
    local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
    SetTextCentre(1)
    DisplayText(str,_x,_y)
    local factor = (string.len(text)) / 150
    --DrawSprite("generic_textures", "hud_menu_4a", _x, _y+0.0125,0.015+ factor, 0.03, 0.1, 100, 1, 1, 190, 0)
end