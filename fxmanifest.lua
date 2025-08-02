fx_version 'cerulean'
game 'gta5'
use_experimental_fxv2_oal 'yes'
lua54 'yes'

description 'Night Vision & Thermal Vision'
author 'xT Development'

shared_scripts {
    '@ox_lib/init.lua'
}

client_scripts {
    'configs/client.lua',
    'client/main.lua'
}

files {
    'client/utils.lua'
}