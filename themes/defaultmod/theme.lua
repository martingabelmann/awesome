---------------------------
-- Default awesome theme --
---------------------------

theme = {}

theme.font          = "clean 7.5"

theme.bg_normal     = "#000000"
theme.bg_focus      = "#000000"
theme.bg_urgent     = "#000000"
theme.bg_minimize   = "#000000"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#7788af"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.border_width  = 1
theme.border_normal = "#000000"
theme.border_focus  = "#535d6c"
theme.border_marked = "#91231c"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

theme.tasklist_disable_icon = true

-- Display the taglist squares
theme.taglist_squares_sel   = "/home/martin/.config/awesome/themes/defaultmod/taglist/squarez.png"
theme.taglist_squares_unsel = "/home/martin/.config/awesome/themes/defaultmod/taglist/squareza.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = "/home/martin/.config/awesome/themes/defaultmod/submenu.png"
theme.menu_height = 15
theme.menu_width  = 100

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = "/home/martin/.config/awesome/themes/defaultmod/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = "/home/martin/.config/awesome/themes/defaultmod/titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive = "/home/martin/.config/awesome/themes/defaultmod/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = "/home/martin/.config/awesome/themes/defaultmod/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = "/home/martin/.config/awesome/themes/defaultmod/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = "/home/martin/.config/awesome/themes/defaultmod/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = "/home/martin/.config/awesome/themes/defaultmod/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = "/home/martin/.config/awesome/themes/defaultmod/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = "/home/martin/.config/awesome/themes/defaultmod/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = "/home/martin/.config/awesome/themes/defaultmod/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = "/home/martin/.config/awesome/themes/defaultmod/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = "/home/martin/.config/awesome/themes/defaultmod/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = "/home/martin/.config/awesome/themes/defaultmod/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = "/home/martin/.config/awesome/themes/defaultmod/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = "/home/martin/.config/awesome/themes/defaultmod/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = "/home/martin/.config/awesome/themes/defaultmod/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = "/home/martin/.config/awesome/themes/defaultmod/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = "/home/martin/.config/awesome/themes/defaultmod/titlebar/maximized_focus_active.png"

theme.wallpaper = "/home/martin/.config/awesome/themes/defaultmod/background.png"

-- You can use your own layout icons like this:
theme.layout_fairh = "/home/martin/.config/awesome/themes/defaultmod/layouts/fairhw.png"
theme.layout_fairv = "/home/martin/.config/awesome/themes/defaultmod/layouts/fairvw.png"
theme.layout_floating  = "/home/martin/.config/awesome/themes/defaultmod/layouts/floatingw.png"
theme.layout_magnifier = "/home/martin/.config/awesome/themes/defaultmod/layouts/magnifierw.png"
theme.layout_max = "/home/martin/.config/awesome/themes/defaultmod/layouts/maxw.png"
theme.layout_fullscreen = "/home/martin/.config/awesome/themes/defaultmod/layouts/fullscreenw.png"
theme.layout_tilebottom = "/home/martin/.config/awesome/themes/defaultmod/layouts/tilebottomw.png"
theme.layout_tileleft   = "/home/martin/.config/awesome/themes/defaultmod/layouts/tileleftw.png"
theme.layout_tile = "/home/martin/.config/awesome/themes/defaultmod/layouts/tilew.png"
theme.layout_tiletop = "/home/martin/.config/awesome/themes/defaultmod/layouts/tiletopw.png"
theme.layout_spiral  = "/home/martin/.config/awesome/themes/defaultmod/layouts/spiralw.png"
theme.layout_dwindle = "/home/martin/.config/awesome/themes/defaultmod/layouts/dwindlew.png"

theme.awesome_icon = "/home/martin/.config/awesome/themes/defaultmod/icons/awesome16.png"
theme.arch_icon = "/home/martin/.config/awesome/themes/defaultmod/icons/arch16.png"
theme.awesomearch_icon = "/home/martin/.config/awesome/themes/defaultmod/icons/awesomearch.png"
theme.bat ="/home/martin/.config/awesome/themes/defaultmod/icons/bat_full_01.png"
theme.lowbat ="/home/martin/.config/awesome/themes/defaultmod/icons/lowbat.png"
theme.wifi ="/home/martin/.config/awesome/themes/defaultmod/icons/wifi_01.png"
theme.vol ="/home/martin/.config/awesome/themes/defaultmod/icons/spkr_01.png"
theme.mem ="/home/martin/.config/awesome/themes/defaultmod/icons/mem.png"
theme.disc ="/home/martin/.config/awesome/themes/defaultmod/icons/disc.png"
theme.cpu ="/home/martin/.config/awesome/themes/defaultmod/icons/cpu.png"

-- Define the icon theme for application icons. If not set then the icons 
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
