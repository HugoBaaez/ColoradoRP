fx_version "bodacious"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
author '🆂🅸🆁🅴🅲#0336'
description 'SS-LOCKPICK'
version '1.3'
lua54 'yes'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/styles.css',
    'html/script.js',
    'html/img/*.png'
}

client_scripts {
	'config.lua',
	'c/doors.lua',
	'c/c.lua',
}

server_scripts {
	'config.lua',
	's/s.lua',
}

escrow_ignore {
    'config.lua'
}
dependency '/assetpacks'