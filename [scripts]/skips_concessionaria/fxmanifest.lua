
fx_version "bodacious"
game "gta5"

ui_page_preload "yes"
ui_page "nui/html/index.html"

client_scripts {
	"@vrp/lib/utils.lua",
	"src/cl_module.lua"
}

server_scripts {
	"@vrp/lib/utils.lua",
	"@mysql-async/lib/MySQL.lua",
	"src/sv_module.lua"
}

files {
	"nui/*",
	"nui/**/*"
}