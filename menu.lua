local awful = require("awful")
local beautiful = require("beautiful")

mymainmenu = awful.menu({ 
    items = { 
        { "logout", awesome.quit },
        { "poweroff", terminal .. " -x systemctl poweroff -i" },
        { "reboot", terminal .. " -x systemctl reboot -i"},
        { "standby", terminal .. " -x systemctl suspend" },
        { "lock screen", terminal .. " -x slock" },
        { "awesome", nil, theme.awesomearch_icon }
    }
})

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })
