local buttons_prompt = GetRandomIntInRange(0, 0xffffff)
local buttons_prompt2 = GetRandomIntInRange(0, 0xffffff)
local buttons_prompt3 = GetRandomIntInRange(0, 0xffffff)
local buttons_prompt4 = GetRandomIntInRange(0, 0xffffff)
local buttons_prompt5 = GetRandomIntInRange(0, 0xffffff)
local buttons_prompt6 = GetRandomIntInRange(0, 0xffffff)
local buttons_prompt7 = GetRandomIntInRange(0, 0xffffff)
local buttons_prompt8 = GetRandomIntInRange(0, 0xffffff)
local buttons_prompt9 = GetRandomIntInRange(0, 0xffffff)
local buttons_prompt10 = GetRandomIntInRange(0, 0xffffff)
local shop_prop = {}
local count_vnum = {}
local storage_box_ = {}
local coords_prop_ = {}
local box_on_car = {}
local blip = {}
local blip_storage = {}
local blip_sell = {}
local blip_hunting = {}
local blip_hunting_ex = {}
local inventory_table = {}
local record_info = {}
local active = false
local active2 = false
local active3 = false
local active4 = false
local active5 = false
local active10 = false
local open_money = false
local InspectPrompt
local count_add = false
local global_optimalize = 1500
local tax_price = 0
local tax_city = nil
local tax_price_hunt = 0
local tax_city_hunt = nil
local hold = false
local carring = false
local test_box = ''
local mission_started = false
local money_acc = 0
local have_job = 0
local horse_entity = 0
local spawned_props = false
local charid = 0
local record_info_weapon = {}
local spam_block = false

TriggerEvent("gum_menu:getData",function(call)
    MenuData = call
end)

Citizen.CreateThread(function()
	start_vnum_count()
end)

start_vnum_count = function ()
    for k,v in pairs(Config.Buy_Spot) do
		for k2,v2 in pairs(v.items) do
			count_vnum[k2] = 1
			shop_prop[k2] = 0
			blip[k2] = 0
			blip_storage[k2] = 0
			blip_hunting[k2] = 0
			blip_hunting_ex[k2] = 0
			blip_sell[k2] = 0
		end
    end
end

function Button_Prompt_Sell()
	Citizen.CreateThread(function()
		local str = 'Menu de vendas'
		SellPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
		PromptSetControlAction(SellPrompt, 0xA1ABB953)
		str = CreateVarString(10, 'LITERAL_STRING', str)
		PromptSetText(SellPrompt, str)
		PromptSetEnabled(SellPrompt, true)
		PromptSetVisible(SellPrompt, true)
		PromptSetHoldMode(SellPrompt, true)
		PromptSetGroup(SellPrompt, buttons_prompt10)
		PromptRegisterEnd(SellPrompt)
	end)
end

RegisterNetEvent("vorp:SelectedCharacter")
AddEventHandler("vorp:SelectedCharacter", function(charid)
	Citizen.CreateThread(function()
		Button_Prompt()
		Button_Prompt2()
		blips()
		while true do
			local can_shop = 1500
			for k,v in pairs(Config.Buy_Spot) do
				for k2,v2 in pairs(v.items) do
					local player = PlayerPedId()
					local coords = GetEntityCoords(player)
					if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.center[1], v.center[2], v.center[3], false) < v.center[4] then
						can_shop = 10
						if Config.Enable_Light_All_Items then
							DrawLightWithRange(tonumber(string.format("%.2f", v2.coord[1])), tonumber(string.format("%.2f", v2.coord[2])), tonumber(string.format("%.2f", v2.coord[3]+1.0)), 255, 255, 255, tonumber(string.format("%.2f", 1.5)), tonumber(string.format("%.2f", 30.0)))
						end
					end
					if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v2.coord[1], v2.coord[2], v2.coord[3], false) < 0.9 then
						local coords = GetEntityCoords(PlayerPedId())
						local tax_price_s = (v2.price/100*tax_price)
						if active == false then
							local item_name = CreateVarString(10, 'LITERAL_STRING', v2.name)
							PromptSetActiveGroupThisFrame(buttons_prompt, item_name)
						end
						if active2 == true then
							local item_name2 = CreateVarString(10, 'LITERAL_STRING', v2.name)
							PromptSetActiveGroupThisFrame(buttons_prompt2, item_name2)
						end
						if not started_cam then
							DrawText3D(v2.coord[1], v2.coord[2], v2.coord[3]+0.3,  ""..v2.name.."\n "..Config.Language[5].text.." "..tonumber(string.format("%.2f", tax_price_s)).."$ ")
							if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, 0x27D1C284) then
								StartCam_Shop(v2.camer[1], v2.camer[2], v2.camer[3], v2.camer[4])
								FreezeEntityPosition(player, true)
								started_cam = true
								active = true
								active2 = true
							end
						else
							if Config.Light_On_Preview_Item then
								DrawLightWithRange(tonumber(string.format("%.2f", v2.coord[1])), tonumber(string.format("%.2f", v2.coord[2])), tonumber(string.format("%.2f", v2.coord[3]+1.0)), 255, 255, 255, tonumber(string.format("%.2f", 1.5)), tonumber(string.format("%.2f", 30.0)))
							end

							if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, 0x27D1C284) then
								EndCam()
								FreezeEntityPosition(player, false)
								started_cam = false
								count_vnum[k2] = 1
								active = false
								active2 = false
							end
							if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, 0x0522B243) then
								EndCam()
								FreezeEntityPosition(player, true)
								started_cam = false
								count_vnum[k2] = 1
								active = false
								active2 = false
								TriggerEvent("vorpinputs:getInput", Config.Language[1].text, Config.Language[2].text, function(cb)
									local reward_item = k2
									local count_vnum_p = tonumber(cb)
									if count_vnum_p ~= nil and count_vnum_p ~= 0 and count_vnum_p > 0 then
										if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v2.coord[1], v2.coord[2], v2.coord[3], false) < 20 then
											if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v2.coord[1], v2.coord[2], v2.coord[3], false) < 7.5 then
												TriggerServerEvent("gum_stores:buy_item", reward_item, count_vnum_p, count_vnum[k2]*tax_price_s, v.blip_name, v.enable_tax, v.min_max[1], v.min_max[2], count_vnum_p*v2.tax)
											end
										end
									else
										if Config.Gum_Notify_Old then
											exports['gum_notify']:DisplayLeftNotification(Config.Language[4].text, Config.Language[3].text, Config.FirstName, Config.SecondName, 2000)
										end
										if Config.Gum_Notify_NUI then
											exports['gum_notify']:DisplayLeftNotification(Config.Language[4].text, Config.Language[3].text, Config.Image, 2000)
										end
									end
									FreezeEntityPosition(PlayerPedId(), false)
								end)
							end
						end
						if started_cam then
							DrawText3D(v2.coord[1], v2.coord[2], v2.coord[3]+0.15, ""..v2.name.."\n "..Config.Language[6].text.." : "..tonumber(string.format("%.2f", count_vnum[k2]*tax_price_s)).."$ ")
						end
					end
				end
			end
			Citizen.Wait(can_shop)
		end
	end)

	Citizen.CreateThread(function()
		while true do
			local tick_store = 1500
			local can_show = false
			local coords = GetEntityCoords(PlayerPedId())
			for k,v in pairs(Config.Buy_Spot) do
				for k2,v2 in pairs(v.items) do
					if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.center[1], v.center[2], v.center[3], false) < v.center[4] then
						can_show = true
					end
				end
				for k2,v2 in pairs(v.items) do
					if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.center[1], v.center[2], v.center[3], false) < v.center[4] then
						if can_show == true then
							if shop_prop[k2] == 0 then
								shop_prop[k2] = CreateObject(v2.props, v2.coord[1], v2.coord[2], v2.coord[3], false, false, false)
								SetEntityHeading(shop_prop[k2], v2.coord[4])
								FreezeEntityPosition(shop_prop[k2], true)
								SetEntityAsMissionEntity(shop_prop[k2], true, true)
							end
						end
					end
				end
			end
			if can_show == false then
				for k,v in pairs(Config.Buy_Spot) do
					for k2,v2 in pairs(v.items) do
						if DoesEntityExist(shop_prop[k2]) then
							SetEntityAsMissionEntity(shop_prop[k2], false, false)
							DeleteObject(shop_prop[k2])
							shop_prop[k2] = 0
						end
					end
				end
			end
			Citizen.Wait(tick_store)
		end
	end)

	Citizen.CreateThread(function()
		Button_Prompt_Sell()
		while true do
			local coords = GetEntityCoords(PlayerPedId())
			local new_optimize = 1000
			for k,v in pairs(Config.Sell_Spot) do
				if v.butcher == false then
					if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.center[1], v.center[2], v.center[3], false) < 3 then
						if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.center[1], v.center[2], v.center[3], false) < 2 then
							new_optimize = 10
							if active10 == false then
								local item_name_test = CreateVarString(10, 'LITERAL_STRING', "Lugar de venda")
								PromptSetActiveGroupThisFrame(buttons_prompt10, item_name_test)
							end
							if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, 0xA1ABB953) then
								TriggerServerEvent("gum_stores:check_inventory")
								Citizen.Wait(2000)
								Sell_Animal_Menu("store")
								active10 = true
							end
						else
							new_optimize = 1000
						end
					end
				end
			end
			Citizen.Wait(new_optimize)
		end
	end)
end)

function Open_Expand_List()
	MenuData.CloseAll()
	local elements = {}
	for k,v in pairs(Config.Buy_Spot) do 
		if v.enable_tax == true then
			table.insert(elements,{label = "<b>"..Config.Language[7].text.." "..v.blip_name.." </b> ", value = ""..v.blip_name..""})
		end
	end

   MenuData.Open('default', GetCurrentResourceName(), 'gum_adminmenu',
	{
		title    = Config.Language[8].text,
		subtext    = Config.Language[9].text,
		align    = 'top-right',
		elements = elements,
	},
	function(data, menu)
		for k,v in pairs(Config.Buy_Spot) do 
			if v.enable_tax == true then
				if(data.current.value == ''..v.blip_name..'') then
					local blip_add = v.blip_name
					menu.close()
					TriggerServerEvent("gum_stores:check_money", 1.0)
					Citizen.Wait(1000)
					if money_acc == 1 then
						for k2,v2 in pairs(Config.Job_Rev_Spot) do
							local coords = GetEntityCoords(PlayerPedId())
							if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v2["job_coords"][1], v2["job_coords"][2], v2["job_coords"][3], false) < 3 then
								test_box = 'P_CRATE03X'
								spawn_vehicle_box(k2, blip_add, 'P_CRATE03X', k)
								if Config.Gum_Notify_Old then
									exports['gum_notify']:DisplayLeftNotification(Config.Language[4].text, Config.Language[10].text, Config.FirstName, Config.SecondName, 5000)
								end
								if Config.Gum_Notify_NUI then
									exports['gum_notify']:DisplayLeftNotification(Config.Language[4].text, Config.Language[10].text, Config.Image, 7000)
								end
								Citizen.Wait(1000)
							end
						end
					end
				end
			end
		end
	end,
	function(data, menu)
		menu.close()
	end)
end

RegisterNetEvent("vorp:SelectedCharacter")
AddEventHandler("vorp:SelectedCharacter", function(charid)
	Citizen.CreateThread(function()
		local coords = GetEntityCoords(PlayerPedId())
		for k,v in pairs(Config.Buy_Spot) do
			if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.center[1], v.center[2], v.center[3], false) < 20 then
				TriggerServerEvent("gum_stores:check_tax", v.blip_name)
			end
		end
		if Config.StandardHunting then
			for k,v in pairs(Config.Sell_Spot) do
				if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.center[1], v.center[2], v.center[3], false) < 15 then
					TriggerServerEvent("gum_stores:check_tax_hunt", v.blip_name)
				end
			end
		end
		TriggerServerEvent("gum_stores:check_stores_all_player")
		while true do
			local coords = GetEntityCoords(PlayerPedId())
			for k,v in pairs(Config.Buy_Spot) do
				if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.center[1], v.center[2], v.center[3], false) < 20 then
					TriggerServerEvent("gum_stores:check_tax", v.blip_name)
				end
			end
			if Config.StandardHunting then
				for k,v in pairs(Config.Sell_Spot) do
					if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.center[1], v.center[2], v.center[3], false) < 15 then
						TriggerServerEvent("gum_stores:check_tax_hunt", v.blip_name)
					end
				end
			end
			Citizen.Wait(5000)
		end
	end)

	Citizen.CreateThread(function()
		Mission_Prompt()
		Take_Prompt()
		Put_Prompt()
		Add_To_Storage_Prompt()
		GiveBack_Prompt()
		if Config.StandardHunting then
			Start_Expand_Hunt()
		end
		while true do
			local player = PlayerPedId()
			local coords = GetEntityCoords(player)
			local vehicle_coords = GetEntityCoords(vehicle)
			local take_optimize = 1000
			if not mission_started then
				for k,v in pairs(Config.Job_Rev_Spot) do
					if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.job_coords[1], v.job_coords[2], v.job_coords[3], false) < 15 then
						if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.job_coords[1], v.job_coords[2], v.job_coords[3], false) < 3 then
							take_optimize = 10
							if active == false then
								local job_name = CreateVarString(10, 'LITERAL_STRING', Config.Language[11].text)
								PromptSetActiveGroupThisFrame(buttons_prompt3, job_name)
							end
							if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, 0x27D1C284) then
								Citizen.Wait(1000)
								local check_cart = GetClosestVehicle(coords.x, coords.y, coords.z,20.0, GetHashKey("huntercart01"), 71)
								if check_cart == 0 then
									Open_Expand_List()
								else
									if Config.Gum_Notify_Old then
										exports['gum_notify']:DisplayLeftNotification(Config.Language[4].text, Config.Language[12].text, Config.FirstName, Config.SecondName, 2000)
									end
									if Config.Gum_Notify_NUI then
										exports['gum_notify']:DisplayLeftNotification(Config.Language[4].text, Config.Language[12].text, Config.Image, 2000)
									end
								end
							end
						else
							take_optimize = 1000
						end
					end
				end
				if Config.StandardHunting then
					for k,v in pairs(Config.Sell_Spot) do
						if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.j_coord[1], v.j_coord[2], v.j_coord[3], false) < 15 then
							if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.j_coord[1], v.j_coord[2], v.j_coord[3], false) < 3 then
								take_optimize = 10
								if Config.Job_Need then
									if active == false and carring == false and v.enable_tax == true then
										local job_name = CreateVarString(10, 'LITERAL_STRING', Config.Language[13].text)
										PromptSetActiveGroupThisFrame(buttons_prompt9, job_name)
									end 
									if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, 0x27D1C284) and carring == false then
										have_job = 0
										TriggerServerEvent("gum_stores:check_job")
										Citizen.Wait(900)
										if have_job == 1 then
											local check_cart = GetClosestVehicle(coords.x, coords.y, coords.z,20.0, GetHashKey("huntercart01"), 71)
											if check_cart == 0 then
												TriggerServerEvent("gum_stores:check_money", Config.PayForWagon)
												Citizen.Wait(1000)
												if money_acc == 1 then
													test_box = "mp005_p_mp_trader_gen_bag02x"
													spawn_vehicle_box(k, v.blip_name, 'mp005_p_mp_trader_gen_bag02x')
													if Config.Gum_Notify_Old then
														exports['gum_notify']:DisplayLeftNotification(Config.Language[4].text, Config.Language[14].text, Config.FirstName, Config.SecondName, 5000)
													end
													if Config.Gum_Notify_NUI then
														exports['gum_notify']:DisplayLeftNotification(Config.Language[4].text, Config.Language[14].text, Config.Image, 7000)
													end
													Citizen.Wait(100)
												end
											else
												if Config.Gum_Notify_Old then
													exports['gum_notify']:DisplayLeftNotification(Config.Language[4].text, Config.Language[15].text, Config.FirstName, Config.SecondName, 2000)
												end
												if Config.Gum_Notify_NUI then
													exports['gum_notify']:DisplayLeftNotification(Config.Language[4].text, Config.Language[15].text, Config.Image, 2000)
												end
											end
										else
											if Config.Gum_Notify_Old then
												exports['gum_notify']:DisplayLeftNotification(Config.Language[4].text, Config.Language[16].text, Config.FirstName, Config.SecondName, 2000)
											end
											if Config.Gum_Notify_NUI then
												exports['gum_notify']:DisplayLeftNotification(Config.Language[4].text, Config.Language[16].text, Config.Image, 2000)
											end
										end
									end
								else
									if active == false and carring == false and v.enable_tax == true then
										local job_name = CreateVarString(10, 'LITERAL_STRING', Config.Language[13].text)
										PromptSetActiveGroupThisFrame(buttons_prompt9, job_name)
									end 
									if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, 0x27D1C284) and carring == false then
										Citizen.Wait(1000)
										local check_cart = GetClosestVehicle(coords.x, coords.y, coords.z,20.0, GetHashKey("huntercart01"), 71)
										if check_cart == 0 then
											TriggerServerEvent("gum_stores:check_money", Config.PayForWagon)
											Citizen.Wait(1000)
											if money_acc == 1 then
												test_box = "mp005_p_mp_trader_gen_bag02x"
												spawn_vehicle_box(k, v.blip_name, 'mp005_p_mp_trader_gen_bag02x')
												if Config.Gum_Notify_Old then
													exports['gum_notify']:DisplayLeftNotification(Config.Language[4].text, Config.Language[14].text, Config.FirstName, Config.SecondName, 5000)
												end
												if Config.Gum_Notify_NUI then
													exports['gum_notify']:DisplayLeftNotification(Config.Language[4].text, Config.Language[14].text, Config.Image, 7000)
												end
												Citizen.Wait(1000)
											end
										else
											if Config.Gum_Notify_Old then
												exports['gum_notify']:DisplayLeftNotification(Config.Language[4].text, Config.Language[15].text, Config.FirstName, Config.SecondName, 2000)
											end
											if Config.Gum_Notify_NUI then
												exports['gum_notify']:DisplayLeftNotification(Config.Language[4].text, Config.Language[15].text, Config.Image, 2000)
											end
										end
									end
								end
							else
								take_optimize = 1000
							end
						end
					end
				end
			end
			if mission_started then
				if carring then
					DisableControlAction(0, 0x8FFC75D6, true)
					DisableControlAction(0, 0xD9D0E1C0, true)
				end
				for i=1,9 do
					coords_prop_[i] = GetEntityCoords(storage_box_[i])
					if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, coords_prop_[i].x, coords_prop_[i].y, coords_prop_[i].z, false) < 1.0 and GetMount(PlayerPedId()) == 0 and GetVehiclePedIsIn(PlayerPedId()) == 0 then
						DrawText3D(coords_prop_[i].x, coords_prop_[i].y, coords_prop_[i].z+1.0,  "↓")
						if active == false and carring == false then
							local job_name = CreateVarString(10, 'LITERAL_STRING', Config.Language[11].text)
							PromptSetActiveGroupThisFrame(buttons_prompt4, job_name)
						end
						if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, 0x27D1C284) then
							if carring == false then
								FreezeEntityPosition(PlayerPedId(), true)
								TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 2000, true, false, false, false)
								Citizen.Wait(2000)
								ClearPedTasks(PlayerPedId())
								Citizen.Wait(2000)
								if test_box == "P_CRATE03X" then
									Citizen.InvokeNative(0x6B9BBD38AB0796DF, storage_box_[i], PlayerPedId(), GetEntityBoneIndexByName(PlayerPedId(), "SKEL_R_Finger12"), 0.20, -0.188, 0.001, 15.0, 175.0, 0.0, true, true, false, true, 1, true);
									Citizen.InvokeNative(0x7DFB49BCDB73089A, storage_box_[i], false)
								else
									Citizen.InvokeNative(0x6B9BBD38AB0796DF, storage_box_[i], PlayerPedId(), GetEntityBoneIndexByName(PlayerPedId(), "SKEL_L_Finger12"), 0.13, -0.03, 0.04, 78.0, 96.0, 0.0, true, true, false, true, 1, true);
									Citizen.InvokeNative(0x7DFB49BCDB73089A, storage_box_[i], false)
								end
								FreezeEntityPosition(PlayerPedId(), false)
								carring = true
							end
						end

						if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, vehicle_coords.x, vehicle_coords.y, vehicle_coords.z, false) < 2.0 and GetMount(PlayerPedId()) == 0 and GetVehiclePedIsIn(PlayerPedId()) == 0 then
							if active2 == false and carring == true then
								local job_name = CreateVarString(10, 'LITERAL_STRING', Config.Language[11].text)
								PromptSetActiveGroupThisFrame(buttons_prompt5, job_name)
							end 
							if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, 0x27D1C284) then
								if carring == true then
									if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, coords_prop_[i].x, coords_prop_[i].y, coords_prop_[i].z, false) < 1.0 and GetMount(PlayerPedId()) == 0 and GetVehiclePedIsIn(PlayerPedId()) == 0 then
										if test_box == 'P_CRATE03X' then
											if i <= 4 then
												Citizen.InvokeNative(0x6B9BBD38AB0796DF, storage_box_[i], vehicle, 0, 0.3, (2.0-(i/1.0)/2.0)-0.5, 0.09, 0.0, 0.0, 0.0, 0, 0, 0, 0, 2, true);
												Citizen.InvokeNative(0x7DFB49BCDB73089A, storage_box_[i], false)
											elseif i >= 4 and i <= 8 then
												Citizen.InvokeNative(0x6B9BBD38AB0796DF, storage_box_[i], vehicle, 0, -0.3, (2.0-(i/1.0)/2.0)+1.0, 0.09, 0.0, 0.0, 0.0, 0, 0, 0, 0, 2, true);
												Citizen.InvokeNative(0x7DFB49BCDB73089A, storage_box_[i], false)
											elseif i >= 8 and i <= 9 then
												Citizen.InvokeNative(0x6B9BBD38AB0796DF, storage_box_[i], vehicle, 0, -0.3, (2.0-(i/1.0)/2.0)+3.5, 0.09, 0.0, 0.0, 0.0, 0, 0, 0, 0, 2, true);
												Citizen.InvokeNative(0x7DFB49BCDB73089A, storage_box_[i], false)
											end
										else
											Citizen.InvokeNative(0x6B9BBD38AB0796DF, storage_box_[i], vehicle, 0, 0.0, (1.0-(i/2.0)/2.0), 0.09, 0.0, 0.0, 0.0, 0, 0, 0, 0, 2, true);
											Citizen.InvokeNative(0x7DFB49BCDB73089A, storage_box_[i], false)
										end
										box_on_car[i] = 1
									end
									Citizen.Wait(500)
									carring = false
								end
							end
						end
						if test_box == 'P_CRATE03X' then
							for k,v in pairs(Config.Buy_Spot) do
								if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.expand_cd[1], v.expand_cd[2], v.expand_cd[3], false) < 10 then
									if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.expand_cd[1], v.expand_cd[2], v.expand_cd[3], false) < 3 then
										if active3 == false and carring then
											local job_name = CreateVarString(10, 'LITERAL_STRING', Config.Language[11].text)
											PromptSetActiveGroupThisFrame(buttons_prompt6, job_name)
										end 
										if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, 0x27D1C284) and carring then
											carring = false
											SetEntityAsMissionEntity(storage_box_[i], true, true)
											DeleteEntity(storage_box_[i])
											TriggerServerEvent("gum_stores:update_tax_for_storage", v.blip_name, v.box_tax[1], v.box_tax[2], v.min_max[1])
										end
									end
								end
							end
						else
							if Config.StandardHunting then
								for k,v in pairs(Config.Sell_Spot) do
									if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v["expand_cd"][1], v["expand_cd"][2], v["expand_cd"][3], false) < 10 then
										if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v["expand_cd"][1], v["expand_cd"][2], v["expand_cd"][3], false) < 3 then
											if active3 == false and carring then
												local job_name = CreateVarString(10, 'LITERAL_STRING', Config.Language[11].text)
												PromptSetActiveGroupThisFrame(buttons_prompt6, job_name)
											end 
											if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, 0x27D1C284) and carring then
												carring = false
												SetEntityAsMissionEntity(storage_box_[i], true, true)
												DeleteEntity(storage_box_[i])
												TriggerServerEvent("gum_stores:update_tax_for_storage", Config.Sell_Spot[butcher_save]["blip_name"], Config.Sell_Spot[butcher_save]["box_tax"][1], Config.Sell_Spot[butcher_save]["box_tax"][2], Config.Sell_Spot[butcher_save]["min_max"][1])
											end
										end
									end
								end
							end
						end
					end
					if test_box == 'P_CRATE03X' then
						for k,v in pairs(Config.Buy_Spot) do
							if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v["wagon_cd"][1], v["wagon_cd"][2], v["wagon_cd"][3], false) < 5 then
								local Entity_Model = GetEntityModel(GetVehiclePedIsIn(PlayerPedId()))
								if Entity_Model == GetHashKey("huntercart01") then
									if active3 == false then
										local job_name = CreateVarString(10, 'LITERAL_STRING', Config.Language[11].text)
										PromptSetActiveGroupThisFrame(buttons_prompt7, job_name)
									end 
									if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, 0x27D1C284) then
										if tonumber(NetworkGetEntityOwner(vehicle)) == tonumber(PlayerId(PlayerPedId())) then
											TriggerServerEvent("gum_stores:get_back_money", Config.PayForWagon)
											mission_started = false
											for i=1,9 do
												SetEntityAsMissionEntity(storage_box_[i], true, true)
												DeleteEntity(storage_box_[i])
											end
											SetEntityAsMissionEntity(vehicle, true, true)
											DeleteVehicle(vehicle)
											SetGpsMultiRouteRender(false)
											if Config.Gum_Notify_Old then
												exports['gum_notify']:DisplayLeftNotification(Config.Language[4].text, Config.Language[18].text, Config.FirstName, Config.SecondName, 2000)
											end
											if Config.Gum_Notify_NUI then
												exports['gum_notify']:DisplayLeftNotification(Config.Language[4].text, Config.Language[18].text, Config.Image, 2000)
											end
										else
											if Config.Gum_Notify_Old then
												exports['gum_notify']:DisplayLeftNotification(Config.Language[4].text, Config.Language[41].text, Config.FirstName, Config.SecondName, 2000)
											end
											if Config.Gum_Notify_NUI then
												exports['gum_notify']:DisplayLeftNotification(Config.Language[4].text, Config.Language[41].text, Config.Image, 2000)
											end
										end
									end
								end
							end
						end
					else
						if Config.StandardHunting then
							for k,v in pairs(Config.Sell_Spot) do
								if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v["back_wagon_cd"][1], v["back_wagon_cd"][2], v["back_wagon_cd"][3], false) < 5 then
									local Entity_Model = GetEntityModel(GetVehiclePedIsIn(PlayerPedId()))
									if Entity_Model == GetHashKey("huntercart01") then
										if active3 == false then
											local job_name = CreateVarString(10, 'LITERAL_STRING', Config.Language[11].text)
											PromptSetActiveGroupThisFrame(buttons_prompt7, job_name)
										end 
										if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, 0x27D1C284) then
											if tonumber(NetworkGetEntityOwner(vehicle)) == tonumber(PlayerId(PlayerPedId())) then
												TriggerServerEvent("gum_stores:get_back_money", Config.PayForWagon)
												mission_started = false
												for i=1,9 do
													SetEntityAsMissionEntity(storage_box_[i], true, true)
													DeleteEntity(storage_box_[i])
												end
												SetEntityAsMissionEntity(vehicle, true, true)
												DeleteVehicle(vehicle)
												SetGpsMultiRouteRender(false)
												if Config.Gum_Notify_Old then
													exports['gum_notify']:DisplayLeftNotification(Config.Language[4].text, Config.Language[18].text, Config.FirstName, Config.SecondName, 2000)
												end
												if Config.Gum_Notify_NUI then
													exports['gum_notify']:DisplayLeftNotification(Config.Language[4].text, Config.Language[18].text, Config.Image, 2000)
												end
											else
												if Config.Gum_Notify_Old then
													exports['gum_notify']:DisplayLeftNotification(Config.Language[4].text, Config.Language[41].text, Config.FirstName, Config.SecondName, 2000)
												end
												if Config.Gum_Notify_NUI then
													exports['gum_notify']:DisplayLeftNotification(Config.Language[4].text, Config.Language[41].text, Config.Image, 2000)
												end
											end
										end
									end
								end
							end
						end
					end
					take_optimize = 10
				end
			end
			Citizen.Wait(take_optimize)
		end
	end)
end)

RegisterNetEvent("gum_stores:delete_wagons_obs")
AddEventHandler("gum_stores:delete_wagons_obs", function()
	for i=1,9 do
		SetEntityAsMissionEntity(storage_box_[i], true, true)
		DeleteEntity(storage_box_[i])
	end
	SetEntityAsMissionEntity(vehicle, true, true)
	DeleteVehicle(vehicle)
	SetGpsMultiRouteRender(false)
end)

RegisterNetEvent("gum_stores:send_store_to_client")
AddEventHandler("gum_stores:send_store_to_client", function(store_player, char_id)
	store_all = store_player
	if char_id ~= nil then
		charid = char_id
	end
end)

RegisterNetEvent("gum_stores:check_money")
AddEventHandler("gum_stores:check_money", function(money_check)
	money_acc = money_check
end)

RegisterNetEvent("gum_stores:send_inventory")
AddEventHandler("gum_stores:send_inventory", function(inventory_check, record_check)
	inventory_table = inventory_check
	record_info = record_check
end)

RegisterNetEvent("gum_stores:weapon_inventory")
AddEventHandler("gum_stores:weapon_inventory", function(weapon_check, record)
	weapon_table = weapon_check
	record_info_weapon = record
end)

RegisterNetEvent("vorp:SelectedCharacter")
AddEventHandler("vorp:SelectedCharacter", function(charid)
	Citizen.CreateThread(function()
		while true do
			if carring then
				if test_box == "P_CRATE03X" then
					playAnim("mech_carry_box","idle", 2000, 31)
				else
					playAnim("mech_loco_m@generic@carry@ped@idle","idle", 2000, 31)
				end
				Citizen.Wait(2000)
			else
				if mission_started then
					local coords = GetEntityCoords(PlayerPedId())
					Citizen.Wait(1000)
					local vehicle_coords = GetEntityCoords(vehicle)
					Citizen.InvokeNative(0x0C3F0F7F92CA847C, vehicle, 7.0)
					if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, vehicle_coords.x, vehicle_coords.y, vehicle_coords.z, false) > 30 then
						for i=1,9 do
							SetEntityAsMissionEntity(storage_box_[i], true, true)
							DeleteEntity(storage_box_[i])
						end
						SetEntityAsMissionEntity(vehicle, true, true)
						DeleteVehicle(vehicle)
						SetGpsMultiRouteRender(false)
						mission_started = false
						TriggerServerEvent("gum_stores:Send_Drop_Money")
					end
				end
				Citizen.Wait(5000)
			end
		end
	end)
end)

function playAnim(dict,name, time, flag)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(100)
    end
    TaskPlayAnim(PlayerPedId(), dict, name, 20.0, 8.0, time, flag, 0, true, 0, false, 0, false)  
end

function spawn_vehicle_box(k, city, is, blip_set)
	mission_started = true
	if is == 'P_CRATE03X' then
		TriggerServerEvent("gum_stores:take_cart")
        local car = GetHashKey(Config.Job_Rev_Spot[k]["cart_spawn"])
        RequestModel(car)
        while not Citizen.InvokeNative(0x1283B8B89DD5D1B6, car, Citizen.ResultAsBoolean) do
            Wait(1000)
        end
		if Config.OneSyncOn then
        	vehicle = Citizen.InvokeNative(0x214651FB1DFEBA89, car, Config.Job_Rev_Spot[k]["cart_coords"][1], Config.Job_Rev_Spot[k]["cart_coords"][2], Config.Job_Rev_Spot[k]["cart_coords"][3], Config.Job_Rev_Spot[k]["cart_coords"][4], false, false, 0, 1)
		else
        	vehicle = Citizen.InvokeNative(0xAF35D0D2583051B0, car, Config.Job_Rev_Spot[k]["cart_coords"][1], Config.Job_Rev_Spot[k]["cart_coords"][2], Config.Job_Rev_Spot[k]["cart_coords"][3], Config.Job_Rev_Spot[k]["cart_coords"][4], true, false, 0, 1)
		end
		while not DoesEntityExist(vehicle) do
            Citizen.Wait(5)
        end
		SetEntityAsMissionEntity(vehicle, true, true)
		SetVehicleOnGroundProperly(vehicle)
		SetModelAsNoLongerNeeded(car)

		StartGpsMultiRoute(6, true, true)
		AddPointToGpsMultiRoute(Config.Buy_Spot[blip_set]["expand_cd"][1], Config.Buy_Spot[blip_set]["expand_cd"][2], Config.Buy_Spot[blip_set]["expand_cd"][3])
		SetGpsMultiRouteRender(true)

		for i=1,9 do
			storage_box_[i] = CreateObject(is, Config.Job_Rev_Spot[k]["box_cd"][1]+i/2, Config.Job_Rev_Spot[k]["box_cd"][2]+i/2, Config.Job_Rev_Spot[k]["box_cd"][3], false, false, false)
			SetEntityHeading(storage_box_[i], Config.Job_Rev_Spot[k]["box_cd"][4])
			Citizen.InvokeNative(0x7DFB49BCDB73089A, storage_box_[i], true)
		end
		Citizen.Wait(1000)
		if Config.OneSyncOn then
			NetworkRegisterEntityAsNetworked(vehicle)
		end
	else
		butcher_save = k
		local car = GetHashKey(Config.Sell_Spot[k]["cart_spawn"])
        RequestModel(car)
        while not Citizen.InvokeNative(0x1283B8B89DD5D1B6, car, Citizen.ResultAsBoolean) do
            Wait(1000)
        end
		if Config.OneSyncOn then
			vehicle = Citizen.InvokeNative(0x214651FB1DFEBA89, car, Config.Sell_Spot[k]["cart_coords"][1], Config.Sell_Spot[k]["cart_coords"][2], Config.Sell_Spot[k]["cart_coords"][3], Config.Sell_Spot[k]["cart_coords"][4], false, false, 0, 1)
		else
			vehicle = Citizen.InvokeNative(0xAF35D0D2583051B0, car, Config.Sell_Spot[k]["cart_coords"][1], Config.Sell_Spot[k]["cart_coords"][2], Config.Sell_Spot[k]["cart_coords"][3], Config.Sell_Spot[k]["cart_coords"][4], true, false, 0, 1)
		end
		while not DoesEntityExist(vehicle) do
            Citizen.Wait(5)
        end
		SetEntityAsMissionEntity(vehicle, true, true)
		SetVehicleOnGroundProperly(vehicle)
		SetModelAsNoLongerNeeded(car)

		StartGpsMultiRoute(6, true, true)
		AddPointToGpsMultiRoute(Config.Sell_Spot[k]["expand_cd"][1], Config.Sell_Spot[k]["expand_cd"][2], Config.Sell_Spot[k]["expand_cd"][3])
		SetGpsMultiRouteRender(true)

		for i=1,9 do
			storage_box_[i] = CreateObject(is, Config.Sell_Spot[k]["box_coords"][1]+i/2, Config.Sell_Spot[k]["box_coords"][2]+i/2, Config.Sell_Spot[k]["box_coords"][3], false, false, false)
			SetEntityHeading(storage_box_[i], Config.Sell_Spot[k]["box_coords"][4])
			Citizen.InvokeNative(0x7DFB49BCDB73089A, storage_box_[i], true)
		end
		Citizen.Wait(1000)
		if Config.OneSyncOn then
			NetworkRegisterEntityAsNetworked(vehicle)
		end
	end
end

RegisterNetEvent("gum_stores:check_tax")
AddEventHandler("gum_stores:check_tax", function(city_name, tax_count)
	tax_price = tax_count
	tax_city = city_name
end)

RegisterNetEvent("gum_stores:check_tax_hunt")
AddEventHandler("gum_stores:check_tax_hunt", function(city_name, tax_count)
	tax_price_hunt = tax_count
	tax_city_hunt = city_name
end)

RegisterNetEvent("gum_stores:get_entity")
AddEventHandler("gum_stores:get_entity", function(get_horse)
	horse_entity = get_horse
end)

Citizen.CreateThread(function()
	while true do
		local coords = GetEntityCoords(PlayerPedId())
		local new_optimize = 1000
		if store_all ~= nil then
			for k,v in pairs(store_all) do
				if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, json.decode(v.coord).x, json.decode(v.coord).y, json.decode(v.coord).z, false) < 3 then
					if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, json.decode(v.coord).x, json.decode(v.coord).y, json.decode(v.coord).z, false) < 2 then
						new_optimize = 5
						if active10 == false then
							if v.charid == 0 then
								local item_name_test = CreateVarString(10, 'LITERAL_STRING', "Loja a venda por "..v.price.."$")
								PromptSetActiveGroupThisFrame(buttons_prompt10, item_name_test)
							else
								local item_name_test = CreateVarString(10, 'LITERAL_STRING', "Lugar de venda")
								PromptSetActiveGroupThisFrame(buttons_prompt10, item_name_test)
							end
						end
						if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, 0xA1ABB953) then
							if charid == v.charid then
								TriggerServerEvent("gum_stores:check_inventory")
								TriggerServerEvent("gum_stores:check_stores_all_player")
								Citizen.Wait(2000)
								My_Store_Menu(v.id, v.name, json.decode(v.items), json.decode(v.weapons), v.money)
							else
								if v.charid == 0 then
									active10 = true
									Citizen.Wait(100)
									TriggerEvent("vorpinputs:getInput", "Confirmar", "Você quer comprar uma loja por "..v.price.."$ | Inscrição : Ano", function(cb)
										local answer_list = tostring(cb)
										if answer_list ~= nil and (answer_list == "Ano" or answer_list == "ano" or answer_list == "ANO") then
											TriggerServerEvent("gum_stores:buy_stores", v.id)
										end
										active10 = false
										return false
									end)
								else
									TriggerServerEvent("gum_stores:check_stores_all_player")
									TriggerServerEvent("gum_stores:check_inventory")
									Citizen.Wait(2000)
									Store_Menu(v.id, v.name, json.decode(v.items), json.decode(v.weapons), v.money)
								end
							end
							active10 = true
						end
					else
						new_optimize = 1000
					end
				end
			end
		end
		Citizen.Wait(new_optimize)		
	end
end)


function My_Store_Menu(id, name, items, weapons, money)
	MenuData.CloseAll()
	local elements = {
		{label = "Ganhos "..(math.floor(money*100)/100).."$", value = 'balance'},
		{label = "Adicionar à loja", value = 'add_to_store'},
		{label = "Retirar da loja", value = 'take_from_store'},
		{label = "Ver loja", value = 'store'},
	}
   MenuData.Open('default', GetCurrentResourceName(), 'gum_stores',
	{
		title    = 'Store Adminstration',
		subtext    = '',
		align    = 'top-right',
		elements = elements,
	},
	function(data, menu)
        if(data.current.value == 'add_to_store') then
            Add_To_Store(id, name, items, weapons, money)
		end
		if(data.current.value == 'take_from_store') then
            Take_From_Store(id, name, items, weapons, money)
		end
		if(data.current.value == 'store') then
            Your_Store(id, name, items, weapons, money)
		end
		if (data.current.value == 'balance') then
			TriggerEvent("vorpinputs:getInput", "Confirmar", "Quanto você quer escolher??", function(cb)
				local get_money = tonumber(cb)
				if get_money ~= "close" and get_money ~= nil and tonumber(get_money) > 0 and tonumber(money) >= tonumber(get_money) then
					money = money-get_money
					TriggerServerEvent("gum_stores:get_money", id, money, get_money)
					menu.close()
					active10 = false
				else
				end
			end)
		end
	end,
	function(data, menu)
		active10 = false
		menu.close()
	end)  
end

function Take_From_Store(id, name, items, weapons, money)
	MenuData.CloseAll()
	local elements = {}
	local have_weapon = false
	local have_items = false
	for k,v in pairs(items) do
		have_items = true
	end
	if have_items == true then
		table.insert(elements,{label = "<center><b>- Items -</b></center>"})
	end
	for k,v in pairs(items) do
		table.insert(elements,{label = ""..v.price.."$ | "..v.count.."x "..v.label.."", value = ""..v.item.."-"..v.count..""})
	end
	for k,v in pairs(weapons) do
		have_weapon = true
	end
	if have_weapon == true then
		table.insert(elements,{label = "<center><b>- Armas -</b></center>"})
	end
	for k,v in pairs(weapons) do
		table.insert(elements,{label = ""..v.price.."$ | "..v.label.."", value = ""..v.item.."-"..v.label..""})
	end
	MenuData.Open('default', GetCurrentResourceName(), 'gum_stores',
	{
		title    = "Lugar de venda",
		subtext    = "O valor é para 1 peça",
		align    = 'top-right',
		elements = elements,
	},
	function(data, menu)
		if spam_block == false then 
			for k,v in pairs(items) do
				if data.current.value == ""..v.item.."-"..v.count.."" then
					spam_block = true
					table.remove(items, k)
					TriggerServerEvent("gum_stores:add_item_inventory", id, v.item, v.count, items)
					Take_From_Store(id, name, items, weapons, money)
					Citizen.Wait(2000)
					spam_block = false
				end
			end
			for k,v in pairs(weapons) do
				if data.current.value == ""..v.item.."-"..v.label.."" then
					spam_block = true
					table.remove(weapons, k)
					TriggerServerEvent("gum_stores:add_weapon_inventory", id, v.item, weapons)
					Take_From_Store(id, name, items, weapons, money)
					Citizen.Wait(2000)
					spam_block = false
				end
			end
		else
			if Config.Gum_Notify_Old then
				exports['gum_notify']:DisplayLeftNotification(Config.Language[4].text, "You cant spam this", Config.FirstName, Config.SecondName, 2000)
			end
			if Config.Gum_Notify_NUI then
				exports['gum_notify']:DisplayLeftNotification(Config.Language[4].text, "You cant spam this", Config.Image, 2000)
			end
		end
	end,
	function(data, menu)
		My_Store_Menu(id, name, items, weapons, money)
	end)
end

function Your_Store(id, name, items, weapons, money)
	MenuData.CloseAll()
	local elements = {}
	local have_weapon = false
	local have_items = false
	for k,v in pairs(items) do
		have_items = true
	end
	if have_items == true then
		table.insert(elements,{label = "<center><b>- Items -</b></center>"})
	end
	for k,v in pairs(items) do
		table.insert(elements,{label = ""..v.price.."$ | "..v.count.."x "..v.label.."", value = ""..v.item..""})
	end
	for k,v in pairs(weapons) do
		have_weapon = true
	end
	if have_weapon == true then
		table.insert(elements,{label = "<center><b>- Armas -</b></center>"})
	end
	for k,v in pairs(weapons) do
		table.insert(elements,{label = ""..v.price.."$ | "..v.label.."", value = ""..v.item.."-"..v.label..""})
	end
	MenuData.Open('default', GetCurrentResourceName(), 'gum_stores',
	{
		title    = "Lugar de venda",
		subtext    = "O valor é para 1 peça",
		align    = 'top-right',
		elements = elements,
	},
	function(data, menu)
		for k,v in pairs(items) do
			if data.current.value == v.item then
				TriggerEvent("vorpinputs:getInput", "Confirmar", "Quantos você quer comprar??", function(cb)
					local count_vnum_p = tonumber(cb)
					if count_vnum_p ~= "close" and count_vnum_p ~= nil and tonumber(count_vnum_p) > 0 and v.count >= tonumber(count_vnum_p) then
						spam_block = true
						if v.count == tonumber(count_vnum_p) then
							table.remove(items, k)
						else
							table.insert(items, {item=v.item, count=v.count-count_vnum_p, label=v.label, price=v.price})
							table.remove(items, k)
						end
						Citizen.Wait(0)
						TriggerServerEvent("gum_stores:buy_item_from_store", id, v.item, count_vnum_p, items, v.price, money)
						Your_Store(id, name, items, weapons, money)
						Citizen.Wait(2000)
						spam_block = false
					else
						if Config.Gum_Notify_Old then
							exports['gum_notify']:DisplayLeftNotification(Config.Language[4].text, "This much is not in store.", Config.FirstName, Config.SecondName, 2000)
						end
						if Config.Gum_Notify_NUI then
							exports['gum_notify']:DisplayLeftNotification(Config.Language[4].text, "This much is not in store.", Config.Image, 2000)
						end
					end
				end)
			end
		end
		for k,v in pairs(weapons) do
			if data.current.value == ""..v.item.."-"..v.label.."" then
				spam_block = true
				if v.count == tonumber(count_vnum_p) then
					table.remove(weapons, k)
				end
				Citizen.Wait(0)
				TriggerServerEvent("gum_stores:buy_weapon_inventory", id, v.id, weapons, v.price, money)
				Your_Store(id, name, items, weapons, money)
				Citizen.Wait(2000)
				spam_block = false
			end
		end
	end,
	function(data, menu)
		My_Store_Menu(id, name, items, weapons, money)
	end)
end

function Store_Menu(id, name, items, weapons, money)
	MenuData.CloseAll()
	local elements = {}
	local have_weapon = false
	local have_items = false
	for k,v in pairs(items) do
		have_items = true
	end
	if have_items == true then
		table.insert(elements,{label = "<center><b>- Items -</b></center>"})
	end
	for k,v in pairs(items) do
		table.insert(elements,{label = ""..v.price.."$ | "..v.count.."x "..v.label.."", value = ""..v.item..""})
	end
	for k,v in pairs(weapons) do
		have_weapon = true
	end
	if have_weapon == true then
		table.insert(elements,{label = "<center><b>- Armas -</b></center>"})
	end
	for k,v in pairs(weapons) do
		table.insert(elements,{label = ""..v.price.."$ | "..v.label.."", value = ""..v.item.."-"..v.label..""})
	end
	MenuData.Open('default', GetCurrentResourceName(), 'gum_stores',
	{
		title    = "Local de venda",
		subtext    = "O valor é para 1 peça",
		align    = 'top-right',
		elements = elements,
	},
	function(data, menu)
		for k,v in pairs(items) do
			if data.current.value == v.item then
				print(v.item)
				TriggerEvent("vorpinputs:getInput", "Confirmar", "Quantos você quer comprar??", function(cb)
					local count_vnum_p = tonumber(cb)
					print(count_vnum_p)
					if count_vnum_p ~= "close" and count_vnum_p ~= nil and tonumber(count_vnum_p) > 0 and v.count >= tonumber(count_vnum_p) then
						print(count_vnum_p)
						print(v.item)
					else
						print("NOT IN STORE")
					end
				end)
			end
		end
		for k,v in pairs(weapons) do
			if data.current.value == ""..v.item.."-"..v.label.."" then
			end
		end
	end,
	function(data, menu)
		menu.close()
	end)
end


function Add_To_Store(id, name, items, weapons, money)
	MenuData.CloseAll()
	local elements = {}
	table.insert(elements,{label = "<center><b>- items -</b></center>"})
	for key,value in pairs(record_info) do
		for k,v in pairs(inventory_table) do
			if value.item == v.name then
				table.insert(elements,{label = "<b>"..v.count.."</b>x "..value.label.."", value = ""..value.item..""})
			end
		end
	end
	table.insert(elements,{label = "<center><b>- Armas -</b></center>"})
	for key,value in pairs(record_info_weapon) do
		for k,v in pairs(weapon_table) do
			if value.item == v.name then
				table.insert(elements,{label = ""..value.label.."", value = ""..v.id.."-"..v.name..""})
			end
		end
	end
	MenuData.Open('default', GetCurrentResourceName(), 'gum_stores',
	{
		title    = "Lugar de venda",
		subtext    = "Venda tudo que precisa aqui",
		align    = 'top-right',
		elements = elements,
	},
	function(data, menu)
		if spam_block == false then
			for key,value in pairs(record_info) do
				for k,v in pairs(inventory_table) do
					if value.item == v.name then
						if data.current.value == value.item then
							TriggerEvent("vorpinputs:getInput", "Confirmar", "Quantas você deseja colocar na loja??</br>Você tem : "..v.."x "..value.label.."", function(cb)
								local count_vnum_p = tonumber(cb)
								if count_vnum_p ~= nil and count_vnum_p ~= 0 and count_vnum_p > 0 and count_vnum_p <= v then
									TriggerEvent("vorpinputs:getInput", "Confirmar", "Preço para 1 peça?", function(cb)
										local seached = false
										local price_p = tonumber(cb)
										if price_p ~= nil and price_p ~= 0 and price_p > 0 then
											spam_block = true
											for k2,v2 in pairs(items) do
												if v2.item == value.item then
													if seached == false then
														seached = true
														table.insert(items, {item=value.item, count=v2.count+count_vnum_p, label=value.label, price=price_p})
														table.remove(items, k2)
													end
												end
											end
											Citizen.Wait(0)
											if seached == false then
												table.insert(items, {item=value.item, count=count_vnum_p, label=value.label, price=price_p})
											end
											inventory_table[value.item] = v.count-count_vnum_p
											TriggerServerEvent("gum_stores:remove_item_inventory", id, value.item, count_vnum_p, items)
											Add_To_Store(id, name, items, weapons, money)
											Citizen.Wait(2000)
											spam_block = false
										end
									end)
								end
								active10 = false
								return false
							end)
						end
					end
				end
			end
			for key,value in pairs(record_info_weapon) do
				for k,v in pairs(weapon_table) do
					if value.item == v.name then
						if data.current.value == ""..v.id.."-"..v.name.."" then
							TriggerEvent("vorpinputs:getInput", "Confirmar", "Preço da arma?", function(cb)
								local price_p = tonumber(cb)
								if price_p ~= nil and price_p ~= 0 and price_p > 0 then
									spam_block = true
									table.insert(weapons, {item=v.id, label=value.label, price=price_p})
									table.remove(weapon_table, k)
									TriggerServerEvent("gum_stores:remove_weapon_inventory", id, v.id, weapons)
									Add_To_Store(id, name, items, weapons, money)
									Citizen.Wait(2000)
									spam_block = false
								end
								active10 = false
								return false
							end)
						end
					end
				end
			end
		else
			if Config.Gum_Notify_Old then
				exports['gum_notify']:DisplayLeftNotification(Config.Language[4].text, "You cant spam this", Config.FirstName, Config.SecondName, 2000)
			end
			if Config.Gum_Notify_NUI then
				exports['gum_notify']:DisplayLeftNotification(Config.Language[4].text, "You cant spam this", Config.Image, 2000)
			end
		end
	end,
	function(data, menu)
		My_Store_Menu(id, name, items, weapons, money)
	end)
end

function Sell_Animal_Menu(type)
	MenuData.CloseAll()
	local elements = {}
	local coords = GetEntityCoords(PlayerPedId())
	for keye,values in pairs(Config.Sell_Spot) do
		for k2,v2 in pairs(values.items) do
			if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, values.center[1], values.center[2], values.center[3], false) < 10 then
				for key,value in pairs(record_info) do
					for k,v in pairs(inventory_table) do
						if value.item == k2 and v.name == k2 then
							table.insert(elements,{label = ""..v.count.."x <b>"..value.label.."</b>", value = ""..v.name.."", desc = "Value for sell all : ".. v.count*(math.floor((v2.price/tax_price_hunt*100)*100)/100).."</br>Value for sell 1 : "..(math.floor((v2.price/tax_price_hunt*100)*100)/100)..""})
						end
					end
				end
			end
		end
	end
   MenuData.Open('default', GetCurrentResourceName(), 'gum_adminmenu',
	{
		title    = "Lugar de venda",
		subtext    = "Venda tudo o que você precisa aqui",
		align    = 'top-right',
		elements = elements,
	},
	function(data, menu)
		local coords = GetEntityCoords(PlayerPedId())
		for keye,values in pairs(Config.Sell_Spot) do
			for k2,v2 in pairs(values.items) do
				if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, values.center[1], values.center[2], values.center[3], false) < 10 then
					for key,value in pairs(record_info) do
						for k,v in pairs(inventory_table) do
							if value.item == k2 and v.name == k2 then
								if (data.current.value == ''..v.name..'') then
									TriggerEvent("vorpinputs:getInput", "Confirmar", "Quantos você quer vender???", function(cb)
										local count_vnum_p = tonumber(cb)
										if count_vnum_p ~= nil and count_vnum_p ~= 0 and count_vnum_p > 0 and count_vnum_p <= v.count then
											if type == "butcher" then
												TriggerServerEvent("gum_stores:sell_items", value.item, count_vnum_p, count_vnum_p*(math.floor((v2.price/tax_price_hunt*100)*100)/100))
											else
												TriggerServerEvent("gum_stores:sell_items2", value.item, count_vnum_p, count_vnum_p*(math.floor((v2.price/tax_price_hunt*100)*100)/100), values.blip_name, values.items[k2].tax, values.min_max[2])
											end
											menu.close()
											Citizen.Wait(2000)
											TriggerServerEvent("gum_stores:check_inventory")
											Citizen.Wait(2000)
											active10 = false
										end
										return true
									end)
								end
							end
						end
					end
				end
			end
		end
	end,
	function(data, menu)
		active10 = false
		menu.close()
	end)
end

if Config.StandardHunting then
	 RegisterNetEvent("vorp:SelectedCharacter")
	 AddEventHandler("vorp:SelectedCharacter", function(charid)
		Citizen.CreateThread(function()
			Sell_Animal_Prompt()
			while true do
				local optimize_test = 1500
				for k,v in pairs(Config.Sell_Spot) do
					if v.butcher == true then
						local coords = GetEntityCoords(PlayerPedId())
						if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.center[1], v.center[2], v.center[3], false) < 10 then
							if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.center[1], v.center[2], v.center[3], false) < 2.0 and not IsPedOnMount(PlayerPedId()) then
								optimize_test = 5
								if active5 == false then
									local job_name = CreateVarString(10, 'LITERAL_STRING', Config.Language[19].text)
									PromptSetActiveGroupThisFrame(buttons_prompt8, job_name)
								end 
								if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, 0x27D1C284) then
									active_prompt = true
									Sell_Animal(k)
									Citizen.Wait(500)
									active_prompt = false
									Citizen.Wait(500)
									local get_player_coords = GetEntityCoords(PlayerPedId())
									local get_entity_coords = GetEntityCoords(horse_entity)
									local distanc = GetDistanceBetweenCoords(get_player_coords, get_entity_coords)
									if tonumber(NetworkGetEntityOwner(horse_entity)) == tonumber(PlayerId(PlayerPedId())) then
										if distanc < 15.0 then
											if horse_entity ~= nil then
												Sell_Pelts()
											end
										else
											if Config.Gum_Notify_Old then
												exports['gum_notify']:DisplayLeftNotification(Config.Language[4].text, Config.Language[43].text, Config.FirstName, Config.SecondName, 2000)
											end
											if Config.Gum_Notify_NUI then
												exports['gum_notify']:DisplayLeftNotification(Config.Language[4].text, Config.Language[43].text, Config.Image, 2000)
											end
										end
									end
								end
								if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, 0xA1ABB953) then
									TriggerServerEvent("gum_stores:check_inventory")
									Citizen.Wait(2000)
									Sell_Animal_Menu("butcher")
								end
							else
								optimize_test = 1500
							end
						end
					end
				end
				Citizen.Wait(optimize_test)
			end
		end)
	end)
	
	function Sell_Pelts()
		for k,v in pairs(Config.Animals) do
			if (v.poor == Citizen.InvokeNative(0x0CEEB6F4780B1F2F, horse_entity, 2)) or (v.good == Citizen.InvokeNative(0x0CEEB6F4780B1F2F, horse_entity, 2)) or (v.perfect == Citizen.InvokeNative(0x0CEEB6F4780B1F2F, horse_entity, 2)) then
				if Citizen.InvokeNative(0x0CEEB6F4780B1F2F, horse_entity, 2) ~= false then
					Citizen.InvokeNative(0xa73f50e8796150d5, PlayerId(), Citizen.InvokeNative(0x0CEEB6F4780B1F2F, horse_entity, 2))
					Citizen.InvokeNative(0x627F7F3A0C4C51FF, horse_entity, Citizen.InvokeNative(0x0CEEB6F4780B1F2F, horse_entity, 2))
					TriggerServerEvent("gum_stores:sell_peltz", tonumber(string.format("%.3f", v.money/tax_price_hunt*100)))
					Citizen.Wait(1000)
				end
			end
			if (v.poor == Citizen.InvokeNative(0x0CEEB6F4780B1F2F, horse_entity, 1)) or (v.good == Citizen.InvokeNative(0x0CEEB6F4780B1F2F, horse_entity, 1)) or (v.perfect == Citizen.InvokeNative(0x0CEEB6F4780B1F2F, horse_entity, 1)) then
				if Citizen.InvokeNative(0x0CEEB6F4780B1F2F, horse_entity, 1) ~= false then
					Citizen.InvokeNative(0xa73f50e8796150d5, PlayerId(), Citizen.InvokeNative(0x0CEEB6F4780B1F2F, horse_entity, 1))
					Citizen.InvokeNative(0x627F7F3A0C4C51FF, horse_entity, Citizen.InvokeNative(0x0CEEB6F4780B1F2F, horse_entity, 1))
					TriggerServerEvent("gum_stores:sell_peltz", tonumber(string.format("%.3f", v.money/tax_price_hunt*100)))
					Citizen.Wait(1000)
				end
			end
			if (v.poor == Citizen.InvokeNative(0x0CEEB6F4780B1F2F, horse_entity, 0)) or (v.good == Citizen.InvokeNative(0x0CEEB6F4780B1F2F, horse_entity, 0)) or (v.perfect == Citizen.InvokeNative(0x0CEEB6F4780B1F2F, horse_entity, 0)) then
				if Citizen.InvokeNative(0x0CEEB6F4780B1F2F, horse_entity, 0) ~= false then
					Citizen.InvokeNative(0xa73f50e8796150d5, PlayerId(), Citizen.InvokeNative(0x0CEEB6F4780B1F2F, horse_entity, 0))
					Citizen.InvokeNative(0x627F7F3A0C4C51FF, horse_entity, Citizen.InvokeNative(0x0CEEB6F4780B1F2F, horse_entity, 0))
					TriggerServerEvent("gum_stores:sell_peltz", tonumber(string.format("%.3f", v.money/tax_price_hunt*100)))
					Citizen.Wait(1000)
				end
			end
		end
	end

	function Sell_Animal(k)
		local holding = Citizen.InvokeNative(0xD806CD2A4F2C2996, PlayerPedId())
		local quality = Citizen.InvokeNative(0x31FEF6A20F00B963, holding)
		local model = GetEntityModel(holding)
		local pedtype = GetPedType(holding)
		if holding ~= false then
			if Config.Animals[model] ~= nil then
				local animal = Config.Animals[model]
				local money = animal.money
				local get_money = tonumber(string.format("%.3f", money/tax_price_hunt*100))
				TriggerServerEvent("gum_stores:give_money", get_money)
				TriggerServerEvent("gum_stores:update_tax_for_hunt", money/100, Config.Sell_Spot[k]["blip_name"], Config.Sell_Spot[k]["min_max"][2], Config.Sell_Spot[k]["butcher_tax"])
				SetEntityAsMissionEntity(holding, true, true)
				DeleteEntity(holding) 
				Citizen.InvokeNative(0x5E94EA09E7207C16, holding)
				DeletePed(holding)       
			else 
				local skinFound = false
				for k2, v2 in pairs(Config.Animals) do 
					local money = v2.money
					if quality == v2.perfect then
						local multiplier = v2.perfectQualityMultiplier
						TriggerServerEvent("gum_stores:give_money", tonumber(string.format("%.3f", money*multiplier/tax_price_hunt*100))) 
						TriggerServerEvent("gum_stores:update_tax_for_hunt", tonumber(string.format("%.3f", money*multiplier/100)),  Config.Sell_Spot[k]["blip_name"])
						skinFound = true
					elseif quality == v2.good then
						local multiplier = v2.goodQualityMultiplier
						TriggerServerEvent("gum_stores:give_money", tonumber(string.format("%.3f", money*multiplier/tax_price_hunt*100))) 
						TriggerServerEvent("gum_stores:update_tax_for_hunt", tonumber(string.format("%.3f", money*multiplier/100)),  Config.Sell_Spot[k]["blip_name"])
						skinFound = true 
					elseif quality == v2.poor then
						local multiplier = v2.poorQualityMultiplier
						TriggerServerEvent("gum_stores:give_money", tonumber(string.format("%.3f", money*multiplier/tax_price_hunt*100))) 
						TriggerServerEvent("gum_stores:update_tax_for_hunt", tonumber(string.format("%.3f", money*multiplier/tax_price_hunt)),  Config.Sell_Spot[k]["blip_name"])
						skinFound = true
					end
				end
				if not skinFound then 
					if Config.Gum_Notify_Old then
						exports['gum_notify']:DisplayLeftNotification(Config.Language[4].text, Config.Language[21].text, Config.FirstName, Config.SecondName, 2000)
					end
					if Config.Gum_Notify_NUI then
						exports['gum_notify']:DisplayLeftNotification(Config.Language[4].text, Config.Language[21].text, Config.Image, 2000)
					end
				else
					SetEntityAsMissionEntity(holding, true, true)
					DeleteEntity(holding) 
					Citizen.InvokeNative(0x5E94EA09E7207C16, holding)
					DeletePed(holding)
				end
			end
		else
			if Config.Gum_Notify_Old then
				exports['gum_notify']:DisplayLeftNotification(Config.Language[4].text, Config.Language[22].text, Config.FirstName, Config.SecondName, 2000)
			end
			if Config.Gum_Notify_NUI then
				exports['gum_notify']:DisplayLeftNotification(Config.Language[4].text, Config.Language[22].text, Config.Image, 2000)
			end
		end
	end
end

RegisterNetEvent("gum_stores:close_menu")
AddEventHandler("gum_stores:close_menu", function()
	for k,v in pairs(Config.Buy_Spot) do
		for k2,v2 in pairs(v.items) do
			count_vnum[k2] = 1
		end
	end
	EndCam()
	started_cam = false
end)
RegisterNetEvent("gum_stores:check_job")
AddEventHandler("gum_stores:check_job", function(check_job_func)
	have_job = check_job_func
end)

RegisterNetEvent("gum_stores:anim_play")
AddEventHandler("gum_stores:anim_play", function()
    local dict = "script_common@mth_generic_enters@give_item_satchel@rhand@generic@in_place"
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
            Citizen.Wait(10)
    end
    TaskPlayAnim(PlayerPedId(), dict, "enter_rf", 1.0, 8.0, -1, 1, 0, false, false, false)

	Citizen.Wait(1000)
	ClearPedTasks(PlayerPedId())
	Citizen.Wait(500)
	Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),0,0,GetHashKey("KIT_EMOTE_ACTION_BITING_GOLD_COIN_1"),1,1,0,0,0) 
	Citizen.Wait(2000)
	ClearPedTasks(PlayerPedId())
	FreezeEntityPosition(PlayerPedId(), false)
end)

function blips()
	for k,v in pairs(Config.Buy_Spot) do
		if v.blip == true then
			blip[k] = N_0x554d9d53f696d002(1664425300, v.center[1], v.center[2], v.center[3])
			SetBlipSprite(blip[k], v.blip_type, 1)
			SetBlipScale(blip[k], 0.5)
			Citizen.InvokeNative(0x9CB1A1623062F402, blip[k], v.blip_name)
		end
	end
	for k,v in pairs(Config.Job_Rev_Spot) do
		blip_storage[k] = N_0x554d9d53f696d002(1664425300, Config.Job_Rev_Spot[k]['job_coords'][1], Config.Job_Rev_Spot[k]['job_coords'][2], Config.Job_Rev_Spot[k]['job_coords'][3])
		SetBlipSprite(blip_storage[k], -426139257, 1)
		SetBlipScale(blip_storage[k], 0.5)
		Citizen.InvokeNative(0x9CB1A1623062F402, blip_storage[k], Config.Job_Rev_Spot[k]['blip_name'])
	end
	for k,v in pairs(Config.Sell_Spot) do
		if v.blip == true then
			if v.butcher == false then
				blip_sell[k] = N_0x554d9d53f696d002(1664425300, v.center[1], v.center[2], v.center[3])
				SetBlipSprite(blip_sell[k], v['blip_type'], 1)
				SetBlipScale(blip_sell[k], 0.5)
				Citizen.InvokeNative(0x9CB1A1623062F402, blip_sell[k], v['blip_name'])
			end
		end
	end
	if Config.StandardHunting then
		for k,v in pairs(Config.Sell_Spot) do
			if v.blip == true then
				if v.butcher == true then
					blip_hunting_ex[k] = N_0x554d9d53f696d002(1664425300, v.center[1], v.center[2], v.center[3])
					SetBlipSprite(blip_hunting_ex[k], v.blip_type, 1)
					SetBlipScale(blip_hunting_ex[k], 0.5)
					Citizen.InvokeNative(0x9CB1A1623062F402, blip_hunting_ex[k], v.blip_name)
				end
			end
		end
		for k,v in pairs(Config.Sell_Spot) do
			if v.blip == true then
				if v.butcher == true and v.enable_tax == true then
					blip_hunting[k] = N_0x554d9d53f696d002(1664425300, v.j_coord[1], v.j_coord[2], v.j_coord[3])
					SetBlipSprite(blip_hunting[k], -426139257, 1)
					SetBlipScale(blip_hunting[k], 0.5)
					Citizen.InvokeNative(0x9CB1A1623062F402, blip_hunting[k], "Job")
				end
			end
		end
	end
end

function StartCam_Shop(x,y,z,h)
    DestroyAllCams(true)

    local camera_pos = GetObjectOffsetFromCoords(x, y, z ,0.0 ,1.0, 1.0, 1.0)
    camera = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", x, y, z, -10.00, 00.00, h, 50.00, true, 0)
    SetCamActive(camera,true)
    RenderScriptCams(true, true, 500, true, true)
    DisplayHud(false)
    DisplayRadar(false)
end

function EndCam()
    RenderScriptCams(false, true, 500, true, false)
    DestroyCam(camera, false)
    camera = nil
    DisplayHud(true)
    DisplayRadar(true)
    DestroyAllCams(true)
end


function DrawText3D(x, y, z, text)
	local onScreen,_x,_y=GetScreenCoordFromWorldCoord(x, y, z)
	local px,py,pz=table.unpack(GetGameplayCamCoord())

	SetTextScale(0.35, 0.35)
	SetTextFontForCurrentCommand(6)
	SetTextColor(255, 255, 255, 255)
	local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
    SetTextDropshadow(1, 0, 0, 0, 255)
	SetTextCentre(1)
	DisplayText(str,_x,_y)
end



function Button_Prompt()
	Citizen.CreateThread(function()
		local str = Config.Language[23].text
		InspectPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
		PromptSetControlAction(InspectPrompt, 0x27D1C284)
		str = CreateVarString(10, 'LITERAL_STRING', str)
		PromptSetText(InspectPrompt, str)
		PromptSetEnabled(InspectPrompt, true)
		PromptSetVisible(InspectPrompt, true)
		PromptSetHoldMode(InspectPrompt, true)
		PromptSetGroup(InspectPrompt, buttons_prompt)
		PromptRegisterEnd(InspectPrompt)
	end)
end

function Mission_Prompt()
	Citizen.CreateThread(function()
		local str = Config.Language[24].text
		StartPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
		PromptSetControlAction(StartPrompt, 0x27D1C284)
		str = CreateVarString(10, 'LITERAL_STRING', str)
		PromptSetText(StartPrompt, str)
		PromptSetEnabled(StartPrompt, true)
		PromptSetVisible(StartPrompt, true)
		PromptSetHoldMode(StartPrompt, true)
		PromptSetGroup(StartPrompt, buttons_prompt3)
		PromptRegisterEnd(StartPrompt)
	end)
end
function Take_Prompt()
	Citizen.CreateThread(function()
		local str = Config.Language[25].text
		TakePrompt = Citizen.InvokeNative(0x04F97DE45A519419)
		PromptSetControlAction(TakePrompt, 0x27D1C284)
		str = CreateVarString(10, 'LITERAL_STRING', str)
		PromptSetText(TakePrompt, str)
		PromptSetEnabled(TakePrompt, true)
		PromptSetVisible(TakePrompt, true)
		PromptSetHoldMode(TakePrompt, true)
		PromptSetGroup(TakePrompt, buttons_prompt4)
		PromptRegisterEnd(TakePrompt)
	end)
end
function Put_Prompt()
	Citizen.CreateThread(function()
		local str = Config.Language[26].text
		PutPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
		PromptSetControlAction(PutPrompt, 0x27D1C284)
		str = CreateVarString(10, 'LITERAL_STRING', str)
		PromptSetText(PutPrompt, str)
		PromptSetEnabled(PutPrompt, true)
		PromptSetVisible(PutPrompt, true)
		PromptSetHoldMode(PutPrompt, true)
		PromptSetGroup(PutPrompt, buttons_prompt5)
		PromptRegisterEnd(PutPrompt)
	end)
end
function Add_To_Storage_Prompt()
	Citizen.CreateThread(function()
		local str = Config.Language[27].text
		AddStoragePrompt = Citizen.InvokeNative(0x04F97DE45A519419)
		PromptSetControlAction(AddStoragePrompt, 0x27D1C284)
		str = CreateVarString(10, 'LITERAL_STRING', str)
		PromptSetText(AddStoragePrompt, str)
		PromptSetEnabled(AddStoragePrompt, true)
		PromptSetVisible(AddStoragePrompt, true)
		PromptSetHoldMode(AddStoragePrompt, true)
		PromptSetGroup(AddStoragePrompt, buttons_prompt6)
		PromptRegisterEnd(AddStoragePrompt)
	end)
end
function Sell_Animal_Prompt()
	Citizen.CreateThread(function()
		local str = Config.Language[28].text
		SellPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
		PromptSetControlAction(SellPrompt, 0x27D1C284)
		str = CreateVarString(10, 'LITERAL_STRING', str)
		PromptSetText(SellPrompt, str)
		PromptSetEnabled(SellPrompt, true)
		PromptSetVisible(SellPrompt, true)
		PromptSetHoldMode(SellPrompt, true)
		PromptSetGroup(SellPrompt, buttons_prompt8)
		PromptRegisterEnd(SellPrompt)
	end)
	Citizen.CreateThread(function()
		local str = "Menu de vendas"
		SellItemsPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
		PromptSetControlAction(SellItemsPrompt, 0xA1ABB953)
		str = CreateVarString(10, 'LITERAL_STRING', str)
		PromptSetText(SellItemsPrompt, str)
		PromptSetEnabled(SellItemsPrompt, true)
		PromptSetVisible(SellItemsPrompt, true)
		PromptSetHoldMode(SellItemsPrompt, true)
		PromptSetGroup(SellItemsPrompt, buttons_prompt8)
		PromptRegisterEnd(SellItemsPrompt)
	end)
end

function Start_Expand_Hunt()
	Citizen.CreateThread(function()
		local str = Config.Language[29].text
		StartExpPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
		PromptSetControlAction(StartExpPrompt, 0x27D1C284)
		str = CreateVarString(10, 'LITERAL_STRING', str)
		PromptSetText(StartExpPrompt, str)
		PromptSetEnabled(StartExpPrompt, true)
		PromptSetVisible(StartExpPrompt, true)
		PromptSetHoldMode(StartExpPrompt, true)
		PromptSetGroup(StartExpPrompt, buttons_prompt9)
		PromptRegisterEnd(StartExpPrompt)
	end)
end

function GiveBack_Prompt()
	Citizen.CreateThread(function()
		local str = Config.Language[30].text
		GiveBackPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
		PromptSetControlAction(GiveBackPrompt, 0x27D1C284)
		str = CreateVarString(10, 'LITERAL_STRING', str)
		PromptSetText(GiveBackPrompt, str)
		PromptSetEnabled(GiveBackPrompt, true)
		PromptSetVisible(GiveBackPrompt, true)
		PromptSetHoldMode(GiveBackPrompt, true)
		PromptSetGroup(GiveBackPrompt, buttons_prompt7)
		PromptRegisterEnd(GiveBackPrompt)
	end)
end

function Button_Prompt2()
	Citizen.CreateThread(function()
		local str = Config.Language[31].text
		BuyPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
		PromptSetControlAction(BuyPrompt, 0x0522B243)
		str = CreateVarString(10, 'LITERAL_STRING', str)
		PromptSetText(BuyPrompt, str)
		PromptSetEnabled(BuyPrompt, true)
		PromptSetVisible(BuyPrompt, true)
		PromptSetHoldMode(BuyPrompt, true)
		PromptSetGroup(BuyPrompt, buttons_prompt2)
		PromptRegisterEnd(BuyPrompt)
	end)

	Citizen.CreateThread(function()
		local str = Config.Language[32].text
		LeavePrompt = Citizen.InvokeNative(0x04F97DE45A519419)
		PromptSetControlAction(LeavePrompt, 0x27D1C284)
		str = CreateVarString(10, 'LITERAL_STRING', str)
		PromptSetText(LeavePrompt, str)
		PromptSetEnabled(LeavePrompt, true)
		PromptSetVisible(LeavePrompt, true)
		PromptSetHoldMode(LeavePrompt, true)
		PromptSetGroup(LeavePrompt, buttons_prompt2)
		PromptRegisterEnd(LeavePrompt)
	end)
end

AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() == resourceName) then
		for k,v in pairs(Config.Buy_Spot) do
			for k2,v2 in pairs(v.items) do
            	DeleteEntity(shop_prop[k2])
			end
        end
		for i=1,9 do
			SetEntityAsMissionEntity(storage_box_[i], true, true)
			DeleteEntity(storage_box_[i])
		end
		SetEntityAsMissionEntity(vehicle, true, true)
		DeleteVehicle(vehicle)
		SetGpsMultiRouteRender(false)
	end
end)
