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

-- generate menu with xdg_menu
if awful.util.file_readable(gen_xdg_menu_file) then
    awful.util.eval(awful.util.pread("xdg_menu --format awesome --root-menu " .. gen_xdg_menu_file))
else
    xdgmenu = nil
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
        
        { "awesome", xdgmenu, theme.awesomearch_icon }
    }
})

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })
