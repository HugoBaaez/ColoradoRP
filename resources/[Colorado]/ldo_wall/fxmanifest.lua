fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'Silva#0666 <silva@galdino.app>'
description 'Wall - Wall Admin for redm'
version '1.0.0'

shared_script 'config.lua'

server_scripts {
	'server/license.lua',
	'server/sv_main.lua',
}

client_scripts {
	'client/cl_main.lua',
}