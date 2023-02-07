VorpInv = exports.vorp_inventory:vorp_inventoryApi()


local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

Citizen.CreateThread(function()
	Citizen.Wait(2000)
	VorpInv.RegisterUsableItem("sementetomate", function(data) 
		local _source = data.source
		TriggerEvent('stress:getStress', _source, function(stress)
			if stress < 100 then
				TriggerClientEvent('poke_planting:planto1', data.source, "crp_tomatoes_har_aa_sim", "crp_tomatoes_har_aa_sim", "crp_tomatoes_aa_sim", "sementetomate")
			end
		end)
	end)

	VorpInv.RegisterUsableItem("sementebrocolis", function(data) 
		local _source = data.source
		TriggerEvent('stress:getStress', _source, function(stress)
			if stress < 100 then
				TriggerClientEvent('poke_planting:planto1', data.source, "crp_broccoli_aa_sim", "crp_broccoli_aa_sim", "crp_broccoli_aa_sim", "sementebrocolis")
			end
		end)
	end)

	VorpInv.RegisterUsableItem("sementecenoura", function(data) 
		local _source = data.source
		TriggerEvent('stress:getStress', _source, function(stress)
			if stress < 100 then
				TriggerClientEvent('poke_planting:planto1', data.source, "crp_carrots_sap_ba_sim", "crp_carrots_ba_sim", "crp_carrots_aa_sim", "sementecenoura")
			end
		end)
	end)

	VorpInv.RegisterUsableItem("barbaseed", function(data) 
		local _source = data.source
		TriggerEvent('stress:getStress', _source, function(stress)
			if stress < 100 then
				TriggerClientEvent('poke_planting:planto1', data.source, "crp_carrots_sap_ba_sim", "crp_carrots_sap_ba_sim", "crp_carrots_sap_ba_sim", "barbaseed")
			end
		end)
	end)

	VorpInv.RegisterUsableItem("sementebatata", function(data) 
		local _source = data.source
		TriggerEvent('stress:getStress', _source, function(stress)
			if stress < 100 then
				TriggerClientEvent('poke_planting:planto1', data.source, "crp_carrots_sap_ba_sim", "crp_potato_aa_sim", "crp_potato_aa_sim", "sementebatata")
			end
		end)
	end)

	VorpInv.RegisterUsableItem("sementetrigo", function(data) 
		local _source = data.source
		TriggerEvent('stress:getStress', _source, function(stress)
			if stress < 100 then
				TriggerClientEvent('poke_planting:planto1', data.source, "crp_wheat_sap_long_aa_sim", "crp_wheat_sap_long_ab_sim", "crp_wheat_dry_aa_sim", "sementetrigo")
			end
		end)
	end)

	VorpInv.RegisterUsableItem("sementemilho", function(data) 
		local _source = data.source
		TriggerEvent('stress:getStress', _source, function(stress)
			if stress < 100 then
				TriggerClientEvent('poke_planting:planto1', data.source, "CRP_CORNSTALKS_CB_SIM", "CRP_CORNSTALKS_CA_SIM", "CRP_CORNSTALKS_AB_SIM", "sementemilho")
			end
		end)
	end)

	VorpInv.RegisterUsableItem("p_oppio", function(data) 
		local _source = data.source
		TriggerEvent('stress:getStress', _source, function(stress)
			if stress < 100 then
				TriggerClientEvent('poke_planting:planto1', data.source, "prariepoppy_p", "prariepoppy_p", "prariepoppy_p", "p_oppio")
			end
		end)
	end)

	VorpInv.RegisterUsableItem("wateringcan", function(data) 
		local _source = data.source
		TriggerClientEvent('poke_planting:regar1',data.source)
	end)

	
end)

RegisterServerEvent("poke_planting:removeSeed")
AddEventHandler("poke_planting:removeSeed", function(seed)
	local _source = source
	VorpInv.subItem(_source, seed, 1)
end)

RegisterServerEvent('plantacao:giveHarvestItems')
AddEventHandler("plantacao:giveHarvestItems", function(itemName, itemCount)
    local _source = source
    Inventory.addItem(_source, itemName, itemCount)
    --TriggerClientEvent("vorp:TipBottom", _source, _U('got_Harvest_Item_Info', itemCount.." "..itemName), 4000)
end)


RegisterServerEvent('poke_planting:giveitem')
AddEventHandler('poke_planting:giveitem', function(tipo)
    local _source = source
    local User = VorpCore.getUser(_source) 
    local Character = User.getUsedCharacter         
	local count = math.random(3, 8) --3,8
	
	if tipo == "crp_tomatoes_aa_sim" then
		--TriggerClientEvent("redemrp_notification:start", _source, 'Hai raccolto '..count..' tomate', 3)
		VorpInv.addItem(_source, "tomate", count)
	elseif tipo == "crp_broccoli_aa_sim" then
	--	TriggerClientEvent("redemrp_notification:start", _source, 'Hai raccolto '..count..' broccoli', 3)
		VorpInv.addItem(_source, "brocolis", count)
	elseif tipo == "crp_carrots_aa_sim" then
	--	TriggerClientEvent("redemrp_notification:start", _source, 'Hai raccolto '..count..' carote', 3)
		VorpInv.addItem(_source, "cenoura", count)
	elseif tipo == "crp_carrots_sap_ba_sim" then
	--	TriggerClientEvent("redemrp_notification:start", _source, 'Hai raccolto '..count..' barbabietole', 3)
		VorpInv.addItem(_source, "barbabietole", count)	
	elseif tipo == "crp_potato_aa_sim" then
	--	TriggerClientEvent("redemrp_notification:start", _source, 'Hai raccolto '..count..' patate', 3)
		VorpInv.addItem(_source, "batata", count)
	elseif tipo == "crp_wheat_dry_aa_sim" then
	--	TriggerClientEvent("redemrp_notification:start", _source, 'Hai raccolto '..count..' cereali', 3)
		VorpInv.addItem(_source, "trigo", count)	
	elseif tipo == "CRP_CORNSTALKS_AB_SIM" then
	--	TriggerClientEvent("redemrp_notification:start", _source, 'Hai raccolto '..count..' di mais', 3)
		VorpInv.addItem(_source, "milho", count)
	elseif tipo == "prariepoppy_p" then
--	TriggerClientEvent("redemrp_notification:start", _source, 'Hai raccolto '..count..' di oppio', 3)
		VorpInv.addItem(_source, "oppio", count)
	end

end)
