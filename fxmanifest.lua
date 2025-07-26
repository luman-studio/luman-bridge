fx_version 'cerulean'
games { 'gta5' }
author 'Luman Studio'
version '1.0.0'
lua54 'yes'

shared_scripts {
    'shared/events.lua',

    'config.lua',
    'init.lua',
}

client_scripts {
    'client/frameworks/*.lua',
    'client/c_exports.lua',
}

server_scripts {
    'server/frameworks/*.lua',
    'server/s_exports.lua',
}

files {
    'client/frameworks/modules/*.lua',
}

escrow_ignore {
    'client/*.*',
    'server/*.*',
    '*.*',
}