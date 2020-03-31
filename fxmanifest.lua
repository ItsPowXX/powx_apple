fx_version 'adamant'
games { 'gta5' };

client_scripts {
    '@es_extended/locale.lua',

    'RageUI/src/RMenu.lua',
    'RageUI/src/menu/RageUI.lua',
    'RageUI/src/menu/Menu.lua',
    'RageUI/src/menu/MenuController.lua',

    'RageUI/src/components/*.lua',

    'RageUI/src/menu/elements/*.lua',

    'RageUI/src/menu/items/*.lua',

    'RageUI/src/menu/panels/*.lua',

    'RageUI/src/menu/panels/*.lua',
    'RageUI/src/menu/windows/*.lua',

    'client/*.lua',
    'locales/*.lua',
    'config.lua'
}

server_scripts {
    '@es_extended/locale.lua',

    'server/*.lua',
    'locales/*.lua',
    'config.lua'
}