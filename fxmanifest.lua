fx_version "adamant"

game "gta5"

name "esx_mumble_voip"
description "Uma substituição do tokovoip que usa o fivems mumble voip"
author "Renildo Marcio (renildomrc@gmail.com)"
version "1.0.0"

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
