fx_version "adamant"

game "gta5"

name "mumble-voip"
description "Uma substituição do tokovoip para quem usa o fivem mumble voip"
author "renildomarcio (renildomarcio@gmail.com)"
version "1.0.1"

ui_page "ui/index.html"

files {
	"ui/index.html",
	"ui/mic_click_on.ogg",
	"ui/mic_click_off.ogg",
}

client_scripts {
	"config.lua",
    "client.lua",
}

server_scripts {
    "server.lua",
}

provide "tokovoip_script"
