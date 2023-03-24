fx_version 'adamant'

game 'rdr3'
lua54 'yes'

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

files {
  'config.lua'
}

client_scripts {
  'config.lua',
  'client.lua'
}

server_scripts {
  'config.lua',
  'server.lua'
}
escrow_ignore {
  'client.lua', 
  'config.lua', 
}

dependency '/assetpacks'