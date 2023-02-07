print('\27[32m[LDO Store] Autenticado com sucesso!')
    
local version = '1.0.0'
local VorpCore = {}
local VORPwl = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

TriggerEvent("getWhitelistTables", function(cb)
    VORPwl = cb
end)

AddEventHandler("onResourceStart", function(resource)
    if resource == GetCurrentResourceName() then
        CheckFrameworkVersion()
    end
end)

local isActive = false
RegisterCommand("wall", function(source, args, raw)
    local _source = source
    local User = VorpCore.getUser(_source)
    local Character = User.getUsedCharacter
    local ace = IsPlayerAceAllowed(_source, Config.AcePermission)
    if ace then
        isActive = not isActive
        TriggerClientEvent("sendMessageToAdmins", _source, isActive)
        SendWebhookMessage(isActive, _source)
    else 
        TriggerClientEvent("vorp:TipRight", _source, 'Você deve ser um administrador', 4000)
    end
end, true)

function SendWebhookMessage(isActive, source)
    local _source = source
    local User = VorpCore.getUser(_source)
    local Character = User.getUsedCharacter
    local getid = VORPwl.getEntry(Character.identifier).getId()
    PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode({
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
                        ["value"] = "WALL",
                        ["inline"] = false,
                    },
                    {
                        ["name"] = "Jogador afetado",
                        ["value"] = "" ..Character.firstname.. " "..Character.lastname.."\nID Fixo: ("..getid..")\nTemp ID: (".._source..")",
                        ["inline"] = false,
                    },
                    {
                        ["name"] = "Detalhes",
                        ["value"] = "Is now "..tostring(isActive).."",
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
        avatar_url = Config.EmbedAvatar,
        username = Config.EmbedUsername,
    }), {
        ['Content-Type'] = 'application/json'
    })
end

function CheckFrameworkVersion()
    PerformHttpRequest("https://pastebin.com/raw/k8BPw2mr", function(err, text, headers)
        if text == tostring(version) then
            print("\27[32m[LDO WALL] Script Is Updated")
        else
            print("\27[33m[LDO WALL] is Outdated a new version available")
        end
    end, 'GET', '', {})
end   