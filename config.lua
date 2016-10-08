local awful = require("awful")
local beautiful = require("beautiful")
local menubar = require("menubar")
-- {{{ Variable definitions

-- path to awesome config dir
awesome_home = awful.util.getdir("config")

-- Wallpapers directory, dont store anyting else in there!
wp_path = awesome_home .. "/backgrounds/"

-- Themes define colours, icons, and wallpapers
-- fallback theme if the theme in the themeswitch file is not found
theme_fallback = "/usr/share/awesome/themes/default/theme.lua" 
theme.awesome_icon     = awesome_home .. "/icons/awesome16.png"
theme.arch_icon        = awesome_home .. "/icons/arch16.png"
theme.awesomearch_icon = awesome_home .. "/icons/awesomearch.png"
theme.bat              = awesome_home .. "/icons/bat_full_01.png"
theme.lowbat           = awesome_home .. "/icons/lowbat.png"
theme.wifi             = awesome_home .. "/icons/wifi_01.png"
theme.vol              = awesome_home .. "/icons/spkr_01.png"
theme.mem              = awesome_home .. "/icons/mem.png"
theme.disc             = awesome_home .. "/icons/disc.png"
theme.cpu              = awesome_home .. "/icons/cpu.png"
--- keycode widget colors
theme.fg_widget_value           = "#ffffff"
theme.fg_widget_value_important = "#7788af"
theme.fg_widget_clock           = "#aaaaaa"

-- disable tsklist icons
theme.tasklist_disable_icon = true

--default applications for the menu
terminal    = "xfce4-terminal"
editor      = "vim"

-- path to xdg_menu generation file
-- xdg_menu creates a applications menu for you
gen_xdg_menu_file = "/etc/xdg/menus/arch-applications.menu"

-- Screenshot directory
screenshot_dir = os.getenv("HOME") .. "/Screenshots/"
screenshot_cmd = "import -frame "
function screenshot_dest()
    return screenshot_dir .. os.time() .. ".png"
end

-- Taglist
taglist     = { "1", "2", "3", "4", "5", "6"}

-- Default modkey.
modkey = "Mod4"
-- }}}

-- Volume widget: file that stores acpi-volume informations (ibm thinkpads)
volfile = "/proc/acpi/ibm/volume"
--volfile="" --disables volume widget

-- Battery widget: files containing capacity and charge informations (ibm thinkpads)
batcapacityfile="/sys/class/power_supply/BAT0/capacity"
batstatusfile="/sys/class/power_supply/BAT0/status"
--batstatusfile="" -- disables battery widget
--batcapacityfile="" 

-- {{{  Wallpaper config

-- set to random to get random wallpapers per session per tag
wp_index    = "random"

-- ...or order the wallpers on your own choice
-- wp_index = {1,1,1,1,1,1,1,1,1}

-- set one wallpaper per screen (true) 
-- or stretch the same over all monitors (false)
wp_screen = false

-- wether to ignore aspect ratio
wp_aspectratio = true

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


