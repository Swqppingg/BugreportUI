fx_version 'bodacious'
game 'gta5'
description 'Bug Report UI with discord webhook'
version '1.0.0'

ui_page "ui/index.html"

files {
    "ui/index.html",
    "ui/script.js",
    "ui/style.css",
}

client_script 'client.lua'
server_script 'server.lua'
server_script 'config.lua'