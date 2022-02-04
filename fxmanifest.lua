fx_version 'bodacious'
game 'gta5'

client_scripts {
	'config.lua',
	'functions/functions_client.lua',
	'source/fuel_client.lua',
}

server_scripts {
	'config.lua',
	'source/fuel_server.lua',
	'@async/async.lua',
	'@mysql-async/lib/MySQL.lua',
}

exports {
	'GetFuel',
	'SetFuel'
}

files {
    'html/index.html',
    'html/index.js',
    'html/index.css',
    'html/reset.css',
    'html/img/tanke.png',
}

ui_page "html/index.html"