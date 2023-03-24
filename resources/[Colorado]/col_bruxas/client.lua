local HaveBucketOnHead = false
local open = false
local playerjob
local playerrank
local prompts = GetRandomIntInRange(0, 0xffffff)

RegisterNetEvent("bruxas:findjob")
AddEventHandler("bruxas:findjob", function(job,rank)
	playerjob = job
	playerrank = rank
end)
RegisterCommand("cegar", function(source, args, rawCommand)
    local target = args[1]
    local time = args[2]
        TriggerServerEvent('lto_headbucket:PutBucket', tonumber(target), tonumber(time))
end)

RegisterNetEvent('lto_headbucket:BucketActif')
AddEventHandler('lto_headbucket:BucketActif', function(time)
	HaveBucketOnHead = not HaveBucketOnHead
	local playerPed = PlayerPedId()
    local time_minutes = math.floor(time*60)
	Citizen.CreateThread(function()
		if HaveBucketOnHead then
            DoScreenFadeOut(1000)
            IsScreenFadedIn()
            Citizen.Wait(time_minutes)
        
            DoScreenFadeIn(500)
            HaveBucketOnHead = false
        elseif not HaveBucketOnHead then
        HaveBucketOnHead = false
		
		end
	end)
end)

function BucketHead(hash)
    local Chaudiere = GetHashKey(hash)
    Wait(500)
    RequestModel(Chaudiere)
    if not HasModelLoaded(Chaudiere) then 
    RequestModel(Chaudiere) 
    end
    while not HasModelLoaded(Chaudiere) do 
    Citizen.Wait(1) 
    end
    local playerPed = PlayerPedId()
    local x,y,z = table.unpack(GetEntityCoords(playerPed))
    Bucket = CreateObject(Chaudiere, x, y, z + 0.2, true, true, true)
    local boneIndex = GetEntityBoneIndexByName(playerPed, "skel_head")
    SetEntityAsMissionEntity(Bucket, true, true)
    AttachEntityToEntity(Bucket, playerPed,boneIndex, 0.200, 0.0, 0.0, 1.024, -90.0, -70.0, true, true, false, true, 1, true)
	open = true
	SendNUIMessage({action = "open"})	
end	

function RemoveBucketHead()
	DetachEntity(Bucket,false,true)
    ClearPedTasks(player)
    DeleteObject(Bucket)
    open = false
    SendNUIMessage({action = "close"})
end	

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
        local coords = GetEntityCoords(PlayerPedId())
        if (Vdist(coords.x, coords.y, coords.z, 2615.696, -1017.63, 44.288) < 1.0) then  --YOUR CHORDS FOR MENU HERE
            --DrawTxt("Pressione [~e~G~q~] para acessar o menu.", 0.50, 0.85, 0.7, 0.7, true, 255, 255, 255, 255, true)
			local label  = CreateVarString(10, 'LITERAL_STRING', "Tonicos")
			PromptSetActiveGroupThisFrame(prompts, label)
			if Citizen.InvokeNative(0xC92AC953F0A982AE,openmenu) then
				if IsControlJustReleased(0, 0x760A9C6F) then -- g
					TriggerServerEvent('bruxas:getjob')
					if jobcheck(Config.job, playerjob) and tonumber(playerrank) >= Config.jobrankcraft then
						TriggerEvent("bruxas:client:OpenMenu")
					else
						TriggerEvent("RedM:Notify",'notify', 'Você não tem permissão!')
					end
				end
			end
        end
    end
end)
Citizen.CreateThread(function()
    Citizen.Wait(5000)
    local str = "Pressione para"
	openmenu = PromptRegisterBegin()
	PromptSetControlAction(openmenu, Config.keys["G"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(openmenu, str)
	PromptSetEnabled(openmenu, 1)
	PromptSetVisible(openmenu, 1)
	PromptSetStandardMode(openmenu,1)
    PromptSetHoldMode(openmenu, 1)
	PromptSetGroup(openmenu, prompts)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,openmenu,true)
	PromptRegisterEnd(openmenu)
end)

function jobcheck(table, element)
	for k, v in pairs(table) do
        if v == element then
        	return true
		end
    end
return false
end
----------------------------------------------------------------------------------
RegisterNetEvent('bruxas:client:OpenMenu')
AddEventHandler('bruxas:client:OpenMenu', function()
    showBruxas = true
    local Bruxas = {
        {
            header = "Caldeirão",
            txt = "",
            isMenuHeader = true, --título, janela nao clicável
        },
		{
            header = "Ginseng do Alaska",
            txt = "Planta nativa do alaska, $0.05",
            params = {
                isServer = true,
                event = "ginsengA",
            }
        },
		{
            header = "Ginseng Americano",
            txt = "Planta nativa, $0.05",
            params = {
                isServer = true,
                event = "ginsengUSA",
            }
        },
        {
            header = "Extrato de Veneno",
            txt = "Pote onde o veneno de cobra será tratado",
            params = {
                isServer = true,
                event = "extrato",
            }
        },
        {
            header = "Anti Veneno de cobras",
            txt = "Tira os efeitos venenosos provocados por picadas de cobras",
            params = {
                isServer = true,
                event = "antiveneno",
            }
        },
        {
            header = "Caldo de Galinha Envenenado",
            txt = "Comida Saborosa com gostinho de veneno",
            params = {
                isServer = true,
                event = "caldodegalinhaenvenenado",
            }
        },
        {
            header = "Caldo de Galinha",
            txt = "Comida Saborosa com gostinho de galinha",
            params = {
                isServer = true,
                event = "caldodegalinha",
            }
        },
        {
            header = "Antidoto contra venenos",
            txt = "Tira os efeitos venenosos provocados por comidas ou flechas",
            params = {
                isServer = true,
                event = "antipoison",
            }
        },
		{
            header = "Fechar",
            params = {
                event = "col-menu:closeMenu",
            }
        },
    }
    exports['col-menu']:openMenu(Bruxas)
end)

RegisterNetEvent('progressbar:startBRuxas')
AddEventHandler('progressbar:startBRuxas', function()

    local playerPed = PlayerPedId()
    --TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CANNED_FOOD_COOKING'), -1, true, false, false, false)
    exports['progressBars']:startUI(20000, "Preparando...")
    animazionecucina()
    Citizen.Wait(20000)
    ClearPedTasksImmediately(PlayerPedId())

end)

function animazionecucina()    
    RequestAnimDict("amb_camp@prop_camp_foodprep@working@seasoning@male_b@idle_c")
    while not HasAnimDictLoaded("amb_camp@prop_camp_foodprep@working@seasoning@male_b@idle_c") do
        Citizen.Wait(1)
		RequestAnimDict("amb_camp@prop_camp_foodprep@working@seasoning@male_b@idle_c")
    end	
     TaskPlayAnim(PlayerPedId(), "amb_camp@prop_camp_foodprep@working@seasoning@male_b@idle_c", "idle_h", 1.0, 8.0, -1, 1, 0, false, 0, false, 0, false)
    Wait(20000)
	ClearPedTasks(PlayerPedId())
end
function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str, Citizen.ResultAsLong())
   SetTextScale(w, h)
   SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
   SetTextCentre(centre)
   if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
   Citizen.InvokeNative(0xADA9255D, 10);
   DisplayText(str, x, y)
end

----------------------------------------------------- VENENOS
local poisoned = false
local myrkky = 0
local tapahtunut = false
local tapahtunut2 = false
local tapahtunut3 = false
local tapahtunut4 = false
local antidote = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		local size = GetNumberOfEvents(0)
		if size > 0 then
			for i = 0, size - 1 do

				local eventAtIndex = GetEventAtIndex(0, i)

				if eventAtIndex == GetHashKey("EVENT_ENTITY_DAMAGED") then

					local eventDataSize = 9 

					local eventDataStruct = DataView.ArrayBuffer(128)
					eventDataStruct:SetInt32(16 ,0)			-- 8*2 offset for 2 element of eventData
					eventDataStruct:SetInt32(24 ,0)			-- 8*3 offset for 3 element of eventData

					local is_data_exists = Citizen.InvokeNative(0x57EC5FA4D4D6AFCA,0,i,eventDataStruct:Buffer(),eventDataSize)

					if is_data_exists then
						if PlayerPedId() == eventDataStruct:GetInt32(0) then
							local weaponHash = eventDataStruct:GetInt32(16)
							local ammo = eventDataStruct:GetInt32(24)
							if ammo == GetHashKey("AMMO_ARROW_POISON") then
								Poison()
							end
						end
					end
				end
			end
		end
	end
end)


Citizen.CreateThread(function()
	AnimpostfxStop("ODR3_Injured01Loop")
end)


RegisterNetEvent('Perry_Poison:UsefoodPoisoned')
AddEventHandler('Perry_Poison:UsefoodPoisoned', function()
	Poison()
end)

RegisterNetEvent('Perry_Poison:UseAntidote')
AddEventHandler('Perry_Poison:UseAntidote', function()
	antidote = true
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if poisoned then
			if IsPedRunning(PlayerPedId()) then
				Citizen.Wait(5000)
				myrkky = myrkky + 5
			end
		end
	end
end)


function Poison()
	poisoned = true
	AnimpostfxPlay("ODR3_Injured01Loop")
	while poisoned do
		Citizen.Wait(10000)
		if IsPedDeadOrDying(PlayerPedId()) then
			AnimpostfxStop("ODR3_Injured01Loop")
			myrkky = 0
			tapahtunut = false
			tapahtunut2 = false
			tapahtunut3 = false
			tapahtunut4 = false
			antidote = false
			poisoned = false
			break
		else
			if not antidote then
				myrkky = myrkky + 1
				if myrkky >= 20 and not tapahtunut then
					Citizen.Wait(500)
					tapahtunut = true
					--exports['mythic_notify']:DoLongHudText('Error', "Hengityksesi ei kulje kunnolla!")
					TriggerEvent('vorp:TipRight', 'Você começa a ter dificuldades em respirar.', 10000)
					RequestAnimDict("amb_misc@world_human_coughing@male_c@wip_base")
					while not HasAnimDictLoaded("amb_misc@world_human_coughing@male_c@wip_base") do
						Citizen.Wait(100)
					end
					TaskPlayAnim(PlayerPedId(), "amb_misc@world_human_coughing@male_c@wip_base", "wip_base", 8.0, -8.0, 60000, 0, 0, true, 0, false, 0, false) 
					Citizen.Wait(10000)
					TaskPlayAnim(PlayerPedId(), "amb_misc@world_human_coughing@male_c@wip_base", "wip_base", 8.0, -8.0, 60000, 0, 0, true, 0, false, 0, false) 
					Citizen.Wait(10000)
					TaskPlayAnim(PlayerPedId(), "amb_misc@world_human_coughing@male_c@wip_base", "wip_base", 8.0, -8.0, 60000, 0, 0, true, 0, false, 0, false) 
					Citizen.Wait(5000)
					SetPedToRagdoll(PlayerPedId(), 10000, 10000, 0, 0, 0, 0)
				elseif myrkky >= 40 and not tapahtunut2 then
					tapahtunut2 = true
					--exports['mythic_notify']:DoLongHudText('Error', "Tunnet että raajasi ei enää toimi kunnolla!")
					TriggerEvent('vorp:TipRight', 'Você começa a ter dificuldades em falar.', 10000)
					AnimpostfxStop("ODR3_Injured01Loop")
					AnimpostfxPlay("PoisonDartPassOut")
					Citizen.Wait(7000)
					DoScreenFadeOut(2000) 
					Citizen.Wait(3000)
					AnimpostfxStop("PoisonDartPassOut")  
					Wait(5000)
					AnimpostfxPlay("ODR3_Injured01Loop")
					TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_SLEEP_GROUND_ARM'), -1, false, "test", 0, false)
					DoScreenFadeIn(5000)
					Wait(5000)
				elseif myrkky >= 60 and not tapahtunut3 then
					tapahtunut3 = true
					SetPedToRagdoll(PlayerPedId(), 10000, 10000, 0, 0, 0, 0)
				elseif myrkky >= 80 and not tapahtunut4 then
					tapahtunut4 = true
					local pl = Citizen.InvokeNative(0x217E9DC48139933D)
					local ped = Citizen.InvokeNative(0x275F255ED201B937, pl)
					Citizen.InvokeNative(0x697157CED63F18D4, ped, 500000, false, true, true)
					AnimpostfxStop("ODR3_Injured01Loop")
					myrkky = 0
					tapahtunut = false
					tapahtunut2 = false
					tapahtunut3 = false
					tapahtunut4 = false
					antidote = false
					poisoned = false
					break
				end
			else
				AnimpostfxStop("ODR3_Injured01Loop")
				myrkky = 0
				tapahtunut = false
				tapahtunut2 = false
				tapahtunut3 = false
				tapahtunut4 = false
				antidote = false
				poisoned = false
				break
			end
		end
	end
end
