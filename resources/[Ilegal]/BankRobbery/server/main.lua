VORP = exports.vorp_inventory:vorp_inventoryApi()

data = {}
TriggerEvent("vorp_inventory:getData",function(call)
    data = call
end)

local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)


Locations = {
    vector3(1290.0882568359, -1312.4019775391, 76.039939880371),
}
RegisterServerEvent("Heist:countsceriffi")
AddEventHandler("Heist:countsceriffi", function(players)
    local _source = source
    local checkPD = checkPDreq()

    if checkPD == 1 then
        TriggerEvent('mushy_robbery:talk', _source)
    elseif checkPD == 0 then
        TriggerClientEvent('vorp:TipRight', _source, 'Não há policiais suficientes', 5000)
    end

end)
function checkPDreq()
    local users = GetPlayers()
    local coponline = 0

    for _k,_v in pairs(users) do
        local users = VorpCore.getUser(_v)
        local character = users.getUsedCharacter
        
        if character.job == "police" then
            coponline = coponline + 1
        end   
    end
    
    if coponline < 1 then
        return(0)
    end
    return(1)

end

RegisterServerEvent('mushy_robbery:talk')
AddEventHandler('mushy_robbery:talk', function(source)
        local _source = source
        local Character = VorpCore.getUser(_source).getUsedCharacter
        TriggerClientEvent("vorp:TipBottom", _source, "JOHN: Eu tenho um emprego para você ", 5000)
		Citizen.Wait(5000)
		TriggerClientEvent("vorp:TipBottom", _source, "JOHN: O único problema é que você precisa de algumas dinamites", 5000)
		Citizen.Wait(5000)
		TriggerClientEvent("vorp:TipBottom", _source, "JOHN: Você quer fazer isso ? ", 5000)
		Citizen.Wait(5000)
		TriggerClientEvent('mushy_robbery:info', _source)
end)

RegisterServerEvent('mushy_robbery:pay')
AddEventHandler('mushy_robbery:pay', function()
        local _source = source
        local Character = VorpCore.getUser(_source).getUsedCharacter

    TriggerEvent("vorp:removeMoney", _source, 0, 0)
    TriggerClientEvent("vorp:TipBottom", _source, "JOHN: Agora vá para o Banco de Rhodes!", 5000)
	Citizen.Wait(1000)
    TriggerClientEvent('mushy_robbery:go', _source)    
end)

RegisterNetEvent("mushy_robbery:startrobbery")
AddEventHandler("mushy_robbery:startrobbery", function(robtime)
    local _source = source
    local Character = VorpCore.getUser(source).getUsedCharacter
    local count = VORP.getItemCount(_source, "dynamite")

    if count >= 1 then      
        VORP.subItem(_source,"dynamite", 1)
        isRobbing = false    
        TriggerClientEvent('mushy_robbery:startAnimation2', _source)
        TriggerClientEvent("vorp:TipBottom", _source, "As autoridades foram alertadas",6000)
    else   
        TriggerClientEvent("vorp:TipBottom", _source, "Você não tem dinamite", 6000)
    end     
end)

RegisterServerEvent('mushy_robbery:loot')
AddEventHandler('mushy_robbery:loot', function()
    local _source = source
    local Character = VorpCore.getUser(_source).getUsedCharacter
    Blowedynamite = Blowedynamite    
        
    if Blowedynamite == true then
    end        
    TriggerClientEvent('mushy_robbery:loot2', _source)    
end)

RegisterNetEvent("mushy_robbery:payout")
AddEventHandler("mushy_robbery:payout", function()
    TriggerEvent('vorp:getCharacter', source, function(user)
        local _source = source
        local _user = user
        local Character = VorpCore.getUser(_source).getUsedCharacter
        randommoney = math.random(800,1200)
        Character.addCurrency(0, randommoney) 
    end)
end)