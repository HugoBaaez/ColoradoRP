game 'rdr3'
fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
lua54 "yes"

escrow_ignore {
	'*.lua', 
}

client_scripts {
    'client.lua',
    'not.js',
    'dataview.lua',
}
files {'not.js'}
shared_scripts {
    'config.lua',
}

server_scripts {
    'server.lua',
}
dependency '/assetpacks'