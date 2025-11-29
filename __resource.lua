fx_version 'cerulean'
games {'gta5'}

author 'KxinMensch'
description 'A Farming script '
version '1.0.0'

client_scripts{
	'@NativeUILua_Reloaded/src/NativeUIReloaded.lua',
    'config.lua',
    'client/client.lua',
}


server_scripts {
    'server/server.lua',
    '@mysql-async/lib/MySQL.lua'
}

client_scripts {
    "NativeUILua/Wrapper/Utility.lua",

    "NativeUILua/UIElements/UIVisual.lua",
    "NativeUILua/UIElements/UIResRectangle.lua",
    "NativeUILua/UIElements/UIResText.lua",
    "NativeUILua/UIElements/Sprite.lua",
}

client_scripts {
    "NativeUILua/UIMenu/elements/Badge.lua",
    "NativeUILua/UIMenu/elements/Colours.lua",
    "NativeUILua/UIMenu/elements/ColoursPanel.lua",
    "NativeUILua/UIMenu/elements/StringMeasurer.lua",

    "NativeUILua/UIMenu/items/UIMenuItem.lua",
    "NativeUILua/UIMenu/items/UIMenuCheckboxItem.lua",
    "NativeUILua/UIMenu/items/UIMenuListItem.lua",
    "NativeUILua/UIMenu/items/UIMenuSliderItem.lua",
    "NativeUILua/UIMenu/items/UIMenuSliderHeritageItem.lua",
    "NativeUILua/UIMenu/items/UIMenuColouredItem.lua",

    "NativeUILua/UIMenu/items/UIMenuProgressItem.lua",
    "NativeUILua/UIMenu/items/UIMenuSliderProgressItem.lua",

    "NativeUILua/UIMenu/windows/UIMenuHeritageWindow.lua",

    "NativeUILua/UIMenu/panels/UIMenuGridPanel.lua",
    "NativeUILua/UIMenu/panels/UIMenuHorizontalOneLineGridPanel.lua",
    "NativeUILua/UIMenu/panels/UIMenuVerticalOneLineGridPanel.lua",
    "NativeUILua/UIMenu/panels/UIMenuColourPanel.lua",
    "NativeUILua/UIMenu/panels/UIMenuPercentagePanel.lua",
    "NativeUILua/UIMenu/panels/UIMenuStatisticsPanel.lua",

    "NativeUILua/UIMenu/UIMenu.lua",
    "NativeUILua/UIMenu/MenuPool.lua",
}

client_scripts {
    'NativeUILua/UITimerBar/UITimerBarPool.lua',

    'NativeUILua/UITimerBar/items/UITimerBarItem.lua',
    'NativeUILua/UITimerBar/items/UITimerBarProgressItem.lua',
    'NativeUILua/UITimerBar/items/UITimerBarProgressWithIconItem.lua',

}

client_scripts {
    'NativeUILua/UIProgressBar/UIProgressBarPool.lua',
    'NativeUILua/UIProgressBar/items/UIProgressBarItem.lua',
}

client_scripts {
    "NativeUILua/NativeUI.lua",
}
