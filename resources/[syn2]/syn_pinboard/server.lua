TriggerEvent("getCore",function(core)
    VorpCore = core
end)

RegisterServerEvent("syn_pinboard:get_posters")
AddEventHandler("syn_pinboard:get_posters", function(city)
    local _source = source
    local tablex = {}
    local User = VorpCore.getUser(source) 
    local Character = User.getUsedCharacter
    local charidentifier = Character.charIdentifier
    local group = User.getGroup
    exports.oxmysql:execute('SELECT * FROM posters WHERE city=@city', {['city'] = city}, function(result)
        if result[1] ~= nil then 
            for i=1, #result, 1 do
                table.insert(tablex, {
                    title = result[i].title,
                    poster_link = result[i].poster_link,
                    text = result[i].text,
                    charidentifier = result[i].charidentifier,
                    id = result[i].id,
                })
            end
        end
        TriggerClientEvent("syn_pinboard:send_list",_source,tablex,charidentifier,group)
    end)
end)

RegisterServerEvent("syn_pinboard:set_link")
AddEventHandler("syn_pinboard:set_link", function(title,poster_link,desc,city)
    local _source = source
    local Character = VorpCore.getUser(source).getUsedCharacter
    if Character.job == 'police'then
        if poster_link ~= nil then 
            local charidentifier = Character.charIdentifier
            Discord(Config.webhook,title,poster_link,desc, 3447003,city)
            local parameters = { ['title'] = title,  ['poster_link'] = poster_link, ['text'] = desc, ['city'] = city, ['charidentifier'] = charidentifier}
            exports.oxmysql:execute("INSERT INTO posters ( `title`, `poster_link`, `text`, `city`, `charidentifier`) VALUES ( @title, @poster_link, @text, @city, @charidentifier)", parameters)
            TriggerClientEvent("vorp:TipBottom", _source, "Você prendeu um cartaz no quadro de avisos", 4000)
        end
    else
        TriggerClientEvent('vorp:TipRight', _source, 'Você não tem permissão para colocr um cartaz!', 4000)
    end
end)

RegisterServerEvent("syn_pinboard:removeposter")
AddEventHandler("syn_pinboard:removeposter", function(id)
    local _source = source
    exports.oxmysql:execute("DELETE FROM posters WHERE id=@id", {["id"] = id})
end)

RegisterCommand("clearpins", function(source, args)
    
    if args ~= nil then
  local User = VorpCore.getUser(source) -- Return User with functions and all characters
  local Character = User.getUsedCharacter
  local group = User.getGroup -- Return user group (not character group)
    if group == "admin" then
		exports.oxmysql:execute("TRUNCATE TABLE posters", {})
    else return false
    end
   end
end)


function Discord(webhook, title, link, desc, color,city)
    local _source = source
    local Character = VorpCore.getUser(_source).getUsedCharacter
    local name        = Character.firstname .. ' ' .. Character.lastname
    local logs = ""
    local avatar = "https://media.discordapp.net/attachments/805495169901789194/911350679447150603/unknown.png"
    if string.match(link, "http") then
        logs = {
          {
              ["color"] = color,
              ["title"] = title,
              ["image"] ={["url"]= link},
              ["text"] = desc,
              ["footer"] = {["text"]="Condado: "..city,["icon_url"]= "https://images-ext-1.discordapp.net/external/RuuF8ttvzeKtefw8i-vtnukWq9iNX3FDCEybUFf38_8/%3Fsize%3D2048/https/cdn.discordapp.com/icons/960549387476545546/a_baa26450323f43b02a6f203de5a615f2.gif"}
          }
        }
    else
        logs = {
            {
                ["color"] = color,
                ["title"] = title,
                ["text"] = desc,
                ["footer"] = {["text"]="Condado: "..city,["icon_url"]= "https://images-ext-1.discordapp.net/external/RuuF8ttvzeKtefw8i-vtnukWq9iNX3FDCEybUFf38_8/%3Fsize%3D2048/https/cdn.discordapp.com/icons/960549387476545546/a_baa26450323f43b02a6f203de5a615f2.gif"}
            }
          }
    end
        PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({["username"] = name ,["avatar_url"] = avatar ,embeds = logs}), { ['Content-Type'] = 'application/json' })
  end