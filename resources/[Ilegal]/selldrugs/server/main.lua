local VorpCore = {}


TriggerEvent("getCore",function(core)
    VorpCore = core
end)

Inventory = exports.vorp_inventory:vorp_inventoryApi()

function getDistance(A, B)
    local x = B.x - A.x
    local y = B.y - A.y
    local z = B.z - A.z
    return math.sqrt((x ^ 2) + (y ^ 2) + (z ^ 2))
end

-------------------------------------------------WEBHOOK------------------------------------

function SendWebhook(webhook, source, text)
	local time = os.date("%d/%m/%Y %X")
	local name = GetPlayerName(source)
	local identifier = GetPlayerIdentifiers(source)
    	local User = VorpCore.getUser(source)
    	local Character = User.getUsedCharacter
    	local playerName = Character.firstname
	local playerLame = Character.lastname
	local data = "Venda de Drogas ➝ ".. time .. ' : ' .. playerName ..' '..playerLame..' ➝ ' .. text
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = data}), { ['Content-Type'] = 'application/json' })
end
---------------------------------function check PD requirement-----------------------
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
    
    if coponline < Config.coponlinereq then
        return(0)
    end
    return(1)

end

RegisterServerEvent('FrankieSellToNPC:CheckTabAndSellItMyGuy')
AddEventHandler('FrankieSellToNPC:CheckTabAndSellItMyGuy', function(Coords)
    
    local checkPD = checkPDreq()
    local _source = source
    local kis = math.random(1)
    local AmountToSell = math.random(1,3)
    local luck = math.random(1,10)
    local count = 0
    local Character = VorpCore.getUser(_source).getUsedCharacter
    local sellFcked = 0
    local dis = getDistance(Coords, Config.coordinates[1])

    --print(json.encode(dis))

    --------------------------------------coords check----------------------------------------
    if  (Config.distance - dis) > 0 then
        sellFcked = 1
    end

    --------------------------------------CHECK PD----------------------------------------

    if checkPD == 0 then
        TriggerClientEvent("vorp:TipRight", _source, 'Não há policiais suficientes', 6000)
    elseif checkPD == 1 then
        
        for _, item in ipairs(Config.item) do
            local itemCount = Inventory.getItemCount(_source, item.item)

            if itemCount ~= nil then
                if sellFcked == 1 then
                    if luck > 8 then
                        TriggerClientEvent("vorp:TipRight", _source, 'Eu não quero suas coisas, seu idiota', 6000)
                    else
                        if itemCount >= AmountToSell then
                            Inventory.subItem(_source, item.item, AmountToSell)
                            local price = AmountToSell* (item.priceMax - item.priceMin) + item.priceMin
                            price = tonumber(string.format("%.2f", price))
                            local text = AmountToSell.. ' ' ..item.name.. ' por '..price..' dólares' 
                            Character.addCurrency(0 , price)
                            TriggerClientEvent("vorp:TipRight", _source, 'Você vendeu '..AmountToSell.. ' '..item.name..' por ' ..price..' dólares ', 6000)
                            local webhook = Config.WebHook
                            SendWebhook(webhook, _source, text)
                        else
                            TriggerClientEvent("vorp:TipRight", _source, 'Eu quero '..AmountToSell.." "..item.name..' e você não tem!', 6000) 
                        end
                    end
                else
                    TriggerClientEvent("vorp:TipRight", _source, 'Você está muito longe', 6000)
                end
            end
        end
    end
end)



-----police notify-----------

RegisterNetEvent("policenotify3")
AddEventHandler("policenotify3", function(players, coords)
    checkPD = checkPDreq()
    
    
    if checkPD == 1 then
        for each, player in ipairs(players) do
            TriggerEvent("vorp:getCharacter", player, function(user)
                if user ~= nil then
                    if user.job == "police" then
                        TriggerClientEvent("Witness:ToggleNotification3", player, coords)
                    end
                end
            end)
        end
    end
end)

RegisterServerEvent('moonshiner:original')
AddEventHandler("moonshiner:original", function()
    local _source = tonumber(source)
    local User = VorpCore.getUser(_source) 
    local Character = User.getUsedCharacter         
    local count = Inventory.getItemCount(_source, "acucar")
    local count2 = Inventory.getItemCount(_source, "agua")
    local count3 = Inventory.getItemCount(_source, "milho")
	if count >= 1 and count2 >= 2 and count3 >= 3 then		    
        Inventory.subItem(_source,"acucar", 1)
        Inventory.subItem(_source,"agua", 2)
        Inventory.subItem(_source,"milho", 3) 
        TriggerClientEvent('shiner:moonshine', _source)
        Wait(30000)
        Inventory.addItem(_source, "moonshine", 5)
        TriggerClientEvent("vorp:NotifyLeft", _source, "Sucesso", "Você recebeu 5 Moonshine", "menu_textures", "cross", 3000, "COLOR_WHITE")
    else
        TriggerClientEvent("vorp:NotifyLeft", _source, "~e~Erro!", "Você precisa de: 1 Açucar, 2 Água e 3 Milhos.", "menu_textures", "cross", 3000, "COLOR_WHITE")
    end
end)

RegisterServerEvent('moonshiner:tropical')
AddEventHandler("moonshiner:tropical", function()
    local _source = tonumber(source)
    local User = VorpCore.getUser(_source) 
    local Character = User.getUsedCharacter         
    local count = Inventory.getItemCount(_source, "tropicalPunchMash")
    local count2 = Inventory.getItemCount(_source, "alcool")
	if count >= 1 and count2 >= 2 then		    
        Inventory.subItem(_source,"tropicalPunchMash", 1)
        Inventory.subItem(_source,"alcool", 2)
        TriggerClientEvent('shiner:moonshine', _source)
        Wait(30000)
        Inventory.addItem(_source, "tropicalPunchMoonshine", 5)
        TriggerClientEvent("vorp:NotifyLeft", _source, "Sucesso", "Você recebeu 5 Moonshine Tropical", "menu_textures", "cross", 3000, "COLOR_WHITE")
    else
        TriggerClientEvent("vorp:NotifyLeft", _source, "~e~Erro!", "Você precisa de: 1 Mosto, 2 Alcool", "menu_textures", "cross", 3000, "COLOR_WHITE")
    end
end)

RegisterServerEvent('moonshiner:alcool')
AddEventHandler("moonshiner:alcool", function()
    local _source = tonumber(source)
    local User = VorpCore.getUser(_source) 
    local Character = User.getUsedCharacter         
    local count = Inventory.getItemCount(_source, "Yarrow")
    local count2 = Inventory.getItemCount(_source, "agua")
	if count >= 3 and count2 >= 1 then		    
        Inventory.subItem(_source,"Yarrow", 2)
        Inventory.subItem(_source,"agua", 1)
        TriggerClientEvent('shiner:mistura', _source)
        Wait(30000)
        Inventory.addItem(_source, "alcool", 1)
        TriggerClientEvent("vorp:NotifyLeft", _source, "Sucesso", "Você recebeu 1 Alcool", "menu_textures", "cross", 3000, "COLOR_WHITE")
    else
        TriggerClientEvent("vorp:NotifyLeft", _source, "~e~Erro!", "Você precisa de: 2 Milefólio, 1 Água", "menu_textures", "cross", 3000, "COLOR_WHITE")
    end
end)

RegisterServerEvent('moonshiner:mosto')
AddEventHandler("moonshiner:mosto", function()
    local _source = tonumber(source)
    local User = VorpCore.getUser(_source) 
    local Character = User.getUsedCharacter         
    local count = Inventory.getItemCount(_source, "Agarita")
    local count2 = Inventory.getItemCount(_source, "ginseng_alaska")
    local count3 = Inventory.getItemCount(_source, "ginseng_americano")
    local count4 = Inventory.getItemCount(_source, "agua")
	if count >= 2 and count2 >= 2 and count3 >= 2 and count4 >= 1 then		    
        Inventory.subItem(_source,"Agarita", 2)
        Inventory.subItem(_source,"ginseng_alaska", 2)
        Inventory.subItem(_source,"ginseng_americano", 2)
        Inventory.subItem(_source,"agua", 1)
        TriggerClientEvent('shiner:mistura', _source)
        Wait(30000)
        Inventory.addItem(_source, "tropicalPunchMash", 2)
        TriggerClientEvent("vorp:NotifyLeft", _source, "Sucesso", "Você recebeu 2 Mosto de Ginseng", "menu_textures", "cross", 3000, "COLOR_WHITE")
            
    else
        TriggerClientEvent("vorp:NotifyLeft", _source, "~e~Erro!", "Você precisa: 2 Agarita, 2 Ginseng do Alasca, 2 Ginseng Americano, 1 Água", "menu_textures", "cross", 3000, "COLOR_WHITE")
    end
end)