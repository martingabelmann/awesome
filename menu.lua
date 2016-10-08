local awful = require("awful")
local beautiful = require("beautiful")
local naughty = require("naughty")


-- confirm <question> to run <func> by clicking on the notification
function askfor(question, func) 
	naughty.notify({
        title   = question,
        text    = "click for 'yes'",
        timeout = 5,
        run     = func
	})
end

-- write theme name to awesome_home/themeswitch
-- and restart awesome
function write_theme(theme_dir)
    io.open(awesome_home .. "/themeswitch", "w"):write(theme_dir)
    awful.util.eval(awesome.restart)
end

-- generate menu with xdg_menu
if awful.util.file_readable(gen_xdg_menu_file) then
    awful.util.eval(awful.util.pread("xdg_menu --format awesome --root-menu " .. gen_xdg_menu_file))
else
    xdgmenu = nil
end


-- search for all themes in awesome_home/themes
themeswitch = {}
for theme_dir in io.popen('ls -1 ' .. awesome_home .. "/themes"):lines() do
    if awful.util.file_readable(awesome_home .. "/themes/" .. theme_dir .. "/theme.lua") then
	    table.insert(themeswitch, { theme_dir,  function() write_theme(theme_dir) end })
    end
end

mymainmenu = awful.menu({ 
    items = { 
        { "logout", function() askfor("Do you really want to logout?",  awesome.quit) end},
        
        { "poweroff", function() askfor(
            "Do you really want to shutdown?",  
            function() awful.util.pread(terminal .. " -x systemctl poweroff -i") end
            ) 
            end 
        },

        { "reboot", function() askfor(
            "Do you really want to reboot?",  
            function() awful.util.pread(terminal .. " -x systemctl reboot -i") end
            ) 
            end 
        },

        { "standby", function() askfor(
            "Do you really want to suspend?",  
            function() awful.util.pread(terminal .. " -x systemctl suspend") end
            ) 
            end 
        },
        
        { "lock screen", terminal .. " -x slock" },
        
        { "theme switch", themeswitch },
        
        { "awesome", xdgmenu, theme.awesomearch_icon }
    }
})

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })
