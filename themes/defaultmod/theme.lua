------------------------------------
-- Modified default awesome theme --
------------------------------------

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

-- keycode widget
theme.fg_widget_value = "#ffffff"
theme.fg_widget_value_important = "#7788af"
theme.fg_widget_clock = "#aaaaaa"

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
theme.taglist_squares_sel   = awesome_home .. "/themes/defaultmod/taglist/squarez.png"
theme.taglist_squares_unsel = awesome_home .. "/themes/defaultmod/taglist/squareza.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = awesome_home .. "/themes/defaultmod/submenu.png"
theme.menu_height = 15
theme.menu_width  = 100

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = awesome_home .. "/themes/defaultmod/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = awesome_home .. "/themes/defaultmod/titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive = awesome_home .. "/themes/defaultmod/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = awesome_home .. "/themes/defaultmod/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = awesome_home .. "/themes/defaultmod/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = awesome_home .. "/themes/defaultmod/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = awesome_home .. "/themes/defaultmod/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = awesome_home .. "/themes/defaultmod/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = awesome_home .. "/themes/defaultmod/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = awesome_home .. "/themes/defaultmod/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = awesome_home .. "/themes/defaultmod/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = awesome_home .. "/themes/defaultmod/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = awesome_home .. "/themes/defaultmod/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = awesome_home .. "/themes/defaultmod/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = awesome_home .. "/themes/defaultmod/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = awesome_home .. "/themes/defaultmod/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = awesome_home .. "/themes/defaultmod/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = awesome_home .. "/themes/defaultmod/titlebar/maximized_focus_active.png"

theme.wallpaper = awesome_home .. "/themes/defaultmod/background.png"

-- You can use your own layout icons like this:
theme.layout_fairh = awesome_home .. "/themes/defaultmod/layouts/fairhw.png"
theme.layout_fairv = awesome_home .. "/themes/defaultmod/layouts/fairvw.png"
theme.layout_floating  = awesome_home .. "/themes/defaultmod/layouts/floatingw.png"
theme.layout_magnifier = awesome_home .. "/themes/defaultmod/layouts/magnifierw.png"
theme.layout_max = awesome_home .. "/themes/defaultmod/layouts/maxw.png"
theme.layout_fullscreen = awesome_home .. "/themes/defaultmod/layouts/fullscreenw.png"
theme.layout_tilebottom = awesome_home .. "/themes/defaultmod/layouts/tilebottomw.png"
theme.layout_tileleft   = awesome_home .. "/themes/defaultmod/layouts/tileleftw.png"
theme.layout_tile = awesome_home .. "/themes/defaultmod/layouts/tilew.png"
theme.layout_tiletop = awesome_home .. "/themes/defaultmod/layouts/tiletopw.png"
theme.layout_spiral  = awesome_home .. "/themes/defaultmod/layouts/spiralw.png"
theme.layout_dwindle = awesome_home .. "/themes/defaultmod/layouts/dwindlew.png"

theme.awesome_icon = awesome_home .. "/themes/defaultmod/icons/awesome16.png"
theme.arch_icon = awesome_home .. "/themes/defaultmod/icons/arch16.png"
theme.awesomearch_icon = awesome_home .. "/themes/defaultmod/icons/awesomearch.png"
theme.bat =awesome_home .. "/themes/defaultmod/icons/bat_full_01.png"
theme.lowbat =awesome_home .. "/themes/defaultmod/icons/lowbat.png"
theme.wifi =awesome_home .. "/themes/defaultmod/icons/wifi_01.png"
theme.vol =awesome_home .. "/themes/defaultmod/icons/spkr_01.png"
theme.mem =awesome_home .. "/themes/defaultmod/icons/mem.png"
theme.disc =awesome_home .. "/themes/defaultmod/icons/disc.png"
theme.cpu =awesome_home .. "/themes/defaultmod/icons/cpu.png"

-- Define the icon theme for application icons. If not set then the icons 
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
