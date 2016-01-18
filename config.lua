local awful = require("awful")
local beautiful = require("beautiful")
local menubar = require("menubar")

-- {{{ Variable definitions

-- path to awesome config dir
awesome_home = "/home/martin/.config/awesome"

-- Wallpapers directory, dont store anyting else in there!
wp_path = awesome_home .. "/backgrounds/"

-- Themes define colours, icons, and wallpapers
beautiful.init(awesome_home .. "/themes/defaultmod/theme.lua")

--default applications for the menu
terminal    = "xfce4-terminal"
editor      = "vim"
editor_cmd  = terminal .. " -x " .. editor
filemanager = "mc"
txt         = "vim"
browser     = "luakit"
videoplayer = "vlc"
mail        = "thunderbird"
music       = "vlc"
office      = "libreoffice"

-- Taglist
taglist     = { "1", "2", "3", "4", "5", "6"}

-- Default modkey.
modkey = "Mod4"
-- }}}

-- {{{  Wallpaper config
-- set to random to get random wallpapers per session per tag
wp_index    = "random"

-- ...or order the wallpers on your own choice
-- wp_index = {1,1,1,1,1,1,1,1,1}
-- }}}

-- {{{ Table of layouts to cover with awful.layout.inc, order matters.
layouts = {
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.max,
    awful.layout.suit.floating
}

-- }}}

-- {{{ Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
menubar.cache_entries = true -- caching the icons
menubar.app_folders = { "/usr/share/applications/" }
menubar.show_categories = false 
-- }}}


