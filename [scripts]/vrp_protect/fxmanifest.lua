fx_version 'bodacious'
game 'gta5'

client_scripts {
	"@vrp/lib/utils.lua",
	"client.lua",
	'config.lua'
}
server_scripts {
	"@vrp/lib/utils.lua",
	"server.lua",
	'config.lua'
}
ui_page "ui/ui.html"

files {
	"ui/ui.html",
	"ui/jquery.min.js",
	"ui/wurfl.js"
}