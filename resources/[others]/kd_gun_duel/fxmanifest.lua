game 'rdr3'
fx_version 'adamant'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

lua54 'yes'

escrow_ignore {
	'lang.lua',
	'config.lua'
}

client_scripts {
	'client/gun_duel_c.lua'
}

server_scripts {
  'server/gun_duel_s.lua'
}

shared_scripts {
	'lang.lua',
	'config.lua',
}

dependency '/assetpacks'