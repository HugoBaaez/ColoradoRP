local keys = { ['G'] = 0x760A9C6F, ['S'] = 0xD27782E3, ['W'] = 0x8FD015D8, ['H'] = 0x24978A28, ['G'] = 0x5415BE48, ["ENTER"] = 0xC7B5340A, ['E'] = 0xDFF812F9,["BACKSPACE"] = 0x156F7119 }


--menu

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
        local coords = GetEntityCoords(PlayerPedId())
    if (Vdist(coords.x, coords.y, coords.z, -334.8, -365.7, 88.1) < 1.0) then  --YOUR CHORDS FOR MENU HERE
            DrawTxt("Pressione [~e~G~q~] para comprar as blueprint's.", 0.50, 0.85, 0.7, 0.7, true, 255, 255, 255, 255, true)
            if IsControlJustReleased(0, 0x760A9C6F) then -- g
                --TriggerEvent("indiani:open")
                TriggerServerEvent('blueprint:checkgroup')
            end
        end
    end
end)

RegisterNetEvent('blueprint:checkgroupcl')
AddEventHandler('blueprint:checkgroupcl', function() 
    TriggerEvent("blueprint:client:OpenMenu")
end)


RegisterNetEvent('blueprint:client:OpenMenu')
AddEventHandler('blueprint:client:OpenMenu', function()
    showDoctorjob = true
    local Doctorjob = {
        {
            header = "Projetos de Armas",
            txt = ".",
            isMenuHeader = true, --título, janela nao clicável
        },
        {
            header = "Projeto Cattleman - 5,00$",
            txt = "",
            params = {
                isServer = true,
                event = "wc_cattlemanbp",
            }
        },
        {
            header = "Projeto Lemat - 5,00$",
            txt = "",
            params = {
                isServer = true,
                event = "wc_lematbp",
            }
        },
        {
            header = "Projeto Schofield - 5,00$",
            txt = "",
            params = {
                isServer = true,
                event = "wc_schofieldbp",
            }
        },
        {
            header = "Projeto M1899 - 5,00$",
            txt = "",
            params = {
                isServer = true,
                event = "wc_m1899bp",
            }
        },
        {
            header = "Projeto Semi Auto - 5,00$",
            txt = "",
            params = {
                isServer = true,
                event = "wc_semiautobp",
            }
        },
        {
            header = "Projeto Volcanic - 5,00$",
            txt = "",
            params = {
                isServer = true,
                event = "wc_volcanicbp",
            }
        },
        {
            header = "Projeto Henry - 5,00$",
            txt = "",
            params = {
                isServer = true,
                event = "wc_henrybp",
            }
        },
        {
            header = "Projeto Carabina - 5,00$",
            txt = "",
            params = {
                isServer = true,
                event = "wc_carabinebp",
            }
        },
        {
            header = "Projeto Winchester - 20,00$",
            txt = "",
            params = {
                isServer = true,
                event = "wc_winchesterbp",
            }
        },
        {
            header = "Projeto Rifle de ferrolho - 35,00$",
            txt = "",
            params = {
                isServer = true,
                event = "wc_boltbp",
            }
        },
        {
            header = "Projeto Shotgun - 20,00$",
            txt = "",
            params = {
                isServer = true,
                event = "wc_shotgunbp",
            }
        },
        {
            header = "Óleo de armas - 0.50$",
            txt = "",
            params = {
                isServer = true,
                event = "wc_olioarmi",
            }
        },
        {
            header = "Fechar",
            params = {
                event = "col-menu:closeMenu",
            }
        },
    }
    exports['col-menu']:openMenu(Doctorjob)
end)
--RegisterCommand("opentestmenu", function(source, args, rawCommand) -- slash COMMAND
AddEventHandler('blueprint:open', function()
    local _source = source
            if weapsmith ~= 0 then
                SetEntityAsMissionEntity(weapsmith)
                DeleteObject(weapsmith)
                weapsmith = 0
                end
                local playerPed = PlayerPedId()
                Citizen.Wait(0)
                ClearPedTasksImmediately(PlayerPedId())
                WarMenu.OpenMenu('menu')
                TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_HAMMER_TABLE'), -1, true, false, false, false)
           
                local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
                --local prop = CreateObject(GetHashKey("p_cs_note01x"), x, y, z, true, false, true)
                SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
                PlaceObjectOnGroundProperly(prop)
                weapsmith = prop
    
    --end, false)
end)

Citizen.CreateThread(function()
    while true do
	local playerPed = PlayerPedId()
        Citizen.Wait(0)
		
        if whenKeyJustPressed(keys['BACKSPACE']) then
            if weapsmith ~= 0 then
            SetEntityAsMissionEntity(weapsmith)
            DeleteObject(weapsmith)
			ClearPedTasksImmediately(PlayerPedId())
            weapsmith = 0
            end
     end
	end
end)


--- Settings ProgressBars ---

--- Flesh --- 

RegisterNetEvent('progressbar:start')
AddEventHandler('progressbar:start', function()

    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 27000, true, false, false, false)
    exports['progressBars']:startUI(20000, "Preparando...")
    Citizen.Wait(20000)
    ClearPedTasksImmediately(PlayerPedId())

end)


function whenKeyJustPressed(key)
    if Citizen.InvokeNative(0x580417101DDB492F, 0, key) then
        return true
    else
        return false
    end
end

RegisterNetEvent("wc_craftitem:prompt")
AddEventHandler("wc_craftitem:prompt", function(msg)
    SetTextScale(0.5, 0.5)
    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", msg, Citizen.ResultAsLong())
    Citizen.InvokeNative(0xFA233F8FE190514C, str)
    Citizen.InvokeNative(0xE9990552DEC71600)
end)


function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str, Citizen.ResultAsLong())
   SetTextScale(w, h)
   SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
   SetTextCentre(centre)
   if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
   Citizen.InvokeNative(0xADA9255D, 10);
   DisplayText(str, x, y)
end


