local VorpCore = {}
local VORPwl = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

TriggerEvent("getWhitelistTables", function(cb)
    VORPwl = cb
end)

local timezone = -0
local Time = {}

function attHora()
    Time.hora = tonumber(os.date("%H", os.time() + timezone * 60 * 60))
    if Time.hora >= 0 and Time.hora <= 9 then Time.hora = "0" .. Time.hora end

    Time.min = tonumber(os.date("%M"))
    if Time.min >= 0 and Time.min <= 0 then Time.min = "0" .. Time.min end

    Time.seg = tonumber(os.date("%S"))
    if Time.seg >= 0 and Time.seg <= 9 then Time.seg = "0" .. Time.seg end

    Time.ano = tonumber(os.date("%Y"))
    Time.mes = tonumber(os.date("%m"))
    if Time.mes >= 0 and Time.mes <= 9 then Time.mes = "0" .. Time.mes end
    Time.dia = tonumber(os.date("%d"))
    if Time.dia >= 0 and Time.dia <= 9 then Time.dia = "0" .. Time.dia end
end

RegisterServerEvent("colorado:postarDiscord")
AddEventHandler("colorado:postarDiscord", function(webhook, command, message, source)			  
	SendWebhookMessage(webhook, command, message, source)
end)

function SendWebhookMessage(webhook, command, message, source)
    if webhook ~= nil and webhook ~= "" then
        
        local _source = source
        local User = VorpCore.getUser(_source)
        local Character = User.getUsedCharacter
        local getid = VORPwl.getEntry(Character.identifier).getId()
        PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({
            embeds = {
                {
                    ["author"] = {
                        ["name"] = 'Olho que tudo vê',
                        ["icon_url"] = 'https://img.freepik.com/vetores-premium/piramide-de-tijolos-estilizados-de-macons-com-um-olho-que-tudo-ve-ilustracao-monocromatica-vetorial-fundo-preto_643070-250.jpg?w=2000',
                    },
                    ["description"] = "Novo log registrado!",
                    ["type"]="rich",
                    ["color"] = 4777493,
                    ["fields"] = {
                        {
                            ["name"] = "Executado por",
                            ["value"] = "" ..Character.firstname.. " "..Character.lastname.."\nID Fixo: ("..getid..")\nTemp ID: (".._source..")",
                            ["inline"] = false,
                        },
                        {
                            ["name"] = "Comando Registrado",
                            ["value"] = command,
                            ["inline"] = false,
                        },
                        {
                            ["name"] = "Jogador afetado",
                            ["value"] = "" ..Character.firstname.. " "..Character.lastname.."\nID Fixo: ("..getid..")\nTemp ID: (".._source..")",
                            ["inline"] = false,
                        },
                        {
                            ["name"] = "Detalhes",
                            ["value"] = message,
                            ["inline"] = false,
                        },
                    },
                    ["thumbnail"] = {
                        ["url"] = 'https://static.dicionariodesimbolos.com.br/upload/e4/6d/olho-que-tudo-ve-8_xl.jpeg',
                    },
                    ["footer"]=  {
                        ["text"]= "Horário "..os.date("%H:%M:%S").."",
                    },
                },
            },
            avatar_url = "https://media.discordapp.net/attachments/978860849957593129/1012423777419804884/colorado_logo.png?width=468&height=468",
			username = "Colorado Roleplay",
        }), {
            ['Content-Type'] = 'application/json'
        })
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        attHora()
    end
end)

function GetIdentity(source, identity)

    for k, v in pairs(GetPlayerIdentifiers(source)) do
        if string.sub(v, 1, string.len(identity .. ":")) == identity .. ":" then
            return v
        end
    end
end