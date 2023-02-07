VORP = exports.vorp_inventory:vorp_inventoryApi()

data = {}
TriggerEvent("vorp_inventory:getData",function(call)
    data = call
end)

local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)


RegisterServerEvent("valrobbery:countsceriffi")
AddEventHandler("valrobbery:countsceriffi", function(players)
    local _source = source
    local checkPD = checkPDreq()

    if checkPD == 1 then
        TriggerEvent('valrobbery:talk', _source)
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
    
    if coponline < 0 then
        return(0)
    end
    return(1)

end

RegisterServerEvent('valrobbery:talk')
AddEventHandler('valrobbery:talk', function(source)
        local _source = source
        local Character = VorpCore.getUser(_source).getUsedCharacter
        TriggerClientEvent("vorp:TipBottom", _source, "ABIGAIL: Eu tenho um emprego para você ", 5000)
		Citizen.Wait(5000)
		TriggerClientEvent("vorp:TipBottom", _source, "ABIGAIL: O único problema é que você precisa de algumas dinamite", 5000)
		Citizen.Wait(5000)
		TriggerClientEvent("vorp:TipBottom", _source, "ABIGAIL: Você quer fazer isso ? ", 5000)
		Citizen.Wait(5000)
		TriggerClientEvent('valrobbery:info', _source)
end)

RegisterServerEvent('valrobbery:pay')
AddEventHandler('valrobbery:pay', function()
    local _source = source
    local Character = VorpCore.getUser(_source).getUsedCharacter
    TriggerClientEvent("vorp:TipBottom", _source, "ABIGAIL: Agora vá para o banco de Valentine!", 5000)
	Citizen.Wait(1000)
    TriggerClientEvent('valrobbery:go', _source)    
end)

RegisterNetEvent("valrobbery:startrobbery")
AddEventHandler("valrobbery:startrobbery", function(robtime)
    local _source = source
    local Character = VorpCore.getUser(source).getUsedCharacter
    local count = VORP.getItemCount(_source, "dynamite")

    if count >= 1 then      
        VORP.subItem(_source,"dynamite", 1)  
        TriggerClientEvent('valrobbery:startAnimation2', _source)
        TriggerClientEvent("vorp:TipBottom", _source, "As autoridades foram alertadas",6000)
    else   
        TriggerClientEvent("vorp:TipBottom", _source, "Você não tem dinamite", 6000)
    end     
end)

RegisterServerEvent('valrobbery:loot')
AddEventHandler('valrobbery:loot', function()
    local _source = source
    local Character = VorpCore.getUser(_source).getUsedCharacter
    Blowedynamite = Blowedynamite    
        
    if Blowedynamite == true then
    end        
    TriggerClientEvent('valrobbery:loot2', _source)    
end)

RegisterNetEvent("valrobbery:payout")
AddEventHandler("valrobbery:payout", function()
    TriggerEvent('vorp:getCharacter', source, function(user)
        local _source = source
        local _user = user
        local Character = VorpCore.getUser(_source).getUsedCharacter
        randommoney = math.random(1200,1800)
        Character.addCurrency(0, randommoney) 
    end)
end)
