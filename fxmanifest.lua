fx_version 'adamant'
game 'gta5'
description 'Bug Report UI with discord webhook'
version '1.0.1'

ui_page "ui/index.html"

files {
    "ui/index.html",
    "ui/script.js",
    "ui/style.css",
}

client_script 'client.lua'
server_script 'server.lua'
server_script 'config.lua'
