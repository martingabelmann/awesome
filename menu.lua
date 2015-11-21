local awful = require("awful")
local beautiful = require("beautiful")
-- {{{ Menu
-- Create a laucher widget and a main menu 
myawesomemenu = {
    { "manual", terminal .. " -x man awesome" },
    { "edit config", txt .. " " .. awesome.conffile },
    { "restart", awesome.restart },
    { "quit", awesome.quit }
}

myarchmenu = {
    { "poweroff", terminal .. " -x systemctl poweroff -i" },
    { "reboot", terminal .. " -x systemctl reboot -i"},
    { "standby", terminal .. " -x systemctl suspend" },
    { "lock screen", terminal .. " -x slock" },
    { "update -Syu", terminal .. " -hold -x sudo pacman -Syu" }
}

sysconfigmenu = {
    { "nmtui", terminal .. " -x nmtui" },
    { "AlsaMixer", terminal .. " -x alsamixer" }
}

appsmenu = {
    { "browser", browser },
    { "filemanager", terminal .. " -x mc -S dark" },
    --{ "filemanager", terminal .. " -e mc -sb" },
    { "mail", mail },
    { "musicplayer", music },
    { "office", office },
    { "txt", txt }, 
    { "videoplayer", videoplayer },
}

mymainmenu = awful.menu({ 
    items = { 
        { "awesome", myawesomemenu, theme.awesomearch_icon },
        { "arch", myarchmenu, theme.arch_icon },
        { "sysconfig", sysconfigmenu},
        { "applications", appsmenu},
        { "network", networkmenu},
        { "open terminal", terminal },
    }
})

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })
---}}}


