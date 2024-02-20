shared_script '@wAC/client-side/library.lua'








fx_version 'bodacious'
game 'gta5'


ui_page "nui/index.html"

client_scripts {
	"@vrp/lib/utils.lua",
	"config/config.lua",
	"client.lua"
}

server_scripts {
	"@vrp/lib/utils.lua",
	"config/config.lua",
	"server.lua"
}

files {
	"nui/*.html",
	"nui/jquery.js",
	"nui/css.css",
	"nui/images/background.png"
}