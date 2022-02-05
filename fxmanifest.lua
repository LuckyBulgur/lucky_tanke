fx_version 'bodacious'
game 'gta5'

client_scripts {
	'@es_extended/locale.lua',
	'config.lua',
	'functions/functions_client.lua',
	'source/fuel_client.lua',
	'locales/en.lua',
	'locales/de.lua',
}

server_scripts {
	'@es_extended/locale.lua',
	'config.lua',
	'source/fuel_server.lua',
	'@async/async.lua',
	'@mysql-async/lib/MySQL.lua',
	'locales/en.lua',
	'locales/de.lua',
}

files {
    'html/index.html',
    'html/index.js',
    'html/index.css',
    'html/reset.css',
    'html/img/tanke.png',
}

ui_page "html/index.html"