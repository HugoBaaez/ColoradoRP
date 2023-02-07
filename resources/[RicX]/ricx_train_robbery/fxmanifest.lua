
fx_version "cerulean"
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
games {"rdr3"}
lua54 "yes"

escrow_ignore {
	'config.lua', 
    'events.lua',
    'sv_events.lua',
}

files {
    'not.js',
}

shared_scripts {
    'config.lua',
}

client_scripts {
    'client.lua',
    'events.lua',
    'not.js'
}


server_scripts {
    'fw_func.lua',
    'server.lua',
    'sv_events.lua',
}

server_export 'GetTrainMissionPedCoords'
server_export 'GetTrainMissionID'

--[[
    How to use at server side:
    local coords_train = exports.ricx_train_robbery:GetTrainMissionPedCoords()

    local train_id = exports.ricx_train_robbery:GetTrainMissionID()
]]
dependency '/assetpacks'