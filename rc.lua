--- {{{  martins awesomeconfig.
-- this config bases on many tutorials from awesome.naquadah.org/wiki/Main_Page
-- and many self-made things, docs at github.com/martingabelmann/awesome
-- do whateverer you want with it.
--- )))


--- {{{ required applications
--     widget		|	app
--------------------------------------------------------------------------------------------------
--	bat		|	acpi 
--	dict		|	dictd + eng-deu database (arch-comm)
--	weather	        |	ansiweather (arch-aur)
-- dropdown terminal    |	scrachtpad https://bbs.archlinux.org/viewtopic.php?pid=1363085#p1363085
-- screenshots          |	~/.bin/capscr (script that saves screenshot with timestamp)
-------------------------------------------------------------------------------------------------
--- }}}

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
--vicious widgets
local vicious = require("vicious")
--scratchpad for dropdownterminal
local scratch = require("scratch")
awful.rules = require("awful.rules")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
--Help popups
require ("help/help")

-- {{{ Useful Functions
function trim(s, count)
  return (string.sub(s, 1, count) .. "...")
end

function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

-- }}}

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end
-- }}}


-- {{{ Variable definitions

-- path to awesome config
awesome_home = "/home/martin/.config/awesome"

-- Themes define colours, icons, and wallpapers
beautiful.init(awesome_home .. "/themes/defaultmod/theme.lua")


--default applications for the menu
terminal = "xterm"
editor = "vim"
editor_cmd = terminal .. " -e " .. editor
filemanager = "mc"
txt = "vim"
browser = "luakit"
videoplayer = "vlc"
mail = "thunderbird"
music = "vlc"
office = "libreoffice"


-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
local layouts =
{

    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.max,
    awful.layout.suit.floating
}
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag({ "term", "browser", "mail", "foo", "bar"}, s, layouts[1])
end
-- }}}


--- seed and pop a few
math.randomseed(os.time())
for i=1,1000 do tmp=math.random(0,1000) end

--{{{ random wallpapers for each tag
--the backgrounds-folder has to be filled with valid images,
--awesome is doing the rest.

--store all backgroundfiles in a table
wp_path = awesome_home .. "/backgrounds/"
wp_files = {}
wp_count = 0
for filename in io.popen('ls ' .. wp_path):lines() do
        wp_count = wp_count + 1
	wp_files[wp_count] = filename
end

--each tag gets a random wallpaper. the wallpaper changes if the tag does
wp_index = {}
for t = 1, 9 do  wp_index[t] = math.random( 1, wp_count)  end
gears.wallpaper.maximized( wp_path .. wp_files[wp_index[1]] , s, true)
-- }}}



-- {{{ Menu
-- Create a laucher widget and a main menu 
myawesomemenu = {
   { "manual", terminal .. " -e man awesome" },
   { "edit config", txt .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", awesome.quit }
}

myarchmenu = {
	    { "poweroff", terminal .. " -e systemctl poweroff -i" },
	    { "reboot", terminal .. " -e systemctl reboot -i"},
	    { "standby", terminal .. " -e systemctl suspend" },
	    { "lock screen", terminal .. " -e slock" },
	    { "update -Syu", terminal .. " -hold -e sudo pacman -Syu" }

}

sysconfigmenu = {
   { "nmtui", terminal .. " -e nmtui" },
   { "AlsaMixer", terminal .. " -e alsamixer" }
}

appsmenu = {
	{ "browser", browser },
	{ "filemanager", terminal .. " -e mc -S dark" },
	--{ "filemanager", terminal .. " -e mc -sb" },
	{ "mail", mail },
        { "musicplayer", music },
        { "office", office },
	{ "txt", txt }, 
	{ "videoplayer", videoplayer },
	{ "skype", terminal .. "-e ALSA_OSS_PCM_DEVICE=skype aoss skype"}
}

networkmenu = {
	{ "wol htpc", terminal .. " -hold -e wol 00:1e:90:f8:b5:f8" },
}

helpMenu = { 
	     { "Awesome", function ()  help.displayHelp("Awesome") end }, 
             { "Luakit", function () help.displayHelp("Luakit") end },
             { "bash", function () help.displayHelp("bash") end },
             { "mc", function () help.displayHelp("mc") end }
}
                       


mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, theme.awesomearch_icon },
                                    { "arch", myarchmenu, theme.arch_icon },
		                    { "sysconfig", sysconfigmenu},
				    { "applications", appsmenu},
				    { "network", networkmenu},
				    { "help", helpMenu },
				    { "open terminal", terminal },
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })
---}}}

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
menubar.cache_entries = true -- caching the icons
menubar.app_folders = { "/usr/share/applications/" }
menubar.show_categories = false 
-- }}}



-- {{{ Wibox

-- Calendar widget
require('calendar2')

-- Create a textclock widget with calendar
mytextclock = awful.widget.textclock()
mytextclock.border_width = 1
mytextclock.border_color = beautiful.fg_normal 
calendar2.addCalendarToWidget(mytextclock, "<span color='blue'>%s</span>")


--- {{{ FSwidget get free diskspace
--home mount 
fs_home = awful.widget.textclock()
vicious.register(fs_home, vicious.widgets.fs, "${/home avail_gb}GB")
fs_home:connect_signal("mouse::enter", function() -- show device on mouseover
dev = naughty.notify({title="dev",text="/home"})  end)
fs_home:connect_signal("mouse::leave", function() naughty.destroy(dev) end)

--root 
fs_root = awful.widget.textclock()
vicious.register(fs_root, vicious.widgets.fs, "${/ avail_gb}GB")
fs_root:connect_signal("mouse::enter", function()  -- show device on mouseover
dev = naughty.notify({title="dev",text="/"})  end)
fs_root:connect_signal("mouse::leave", function() naughty.destroy(dev) end)
--- }}}

--- {{{ Memwidget
memwidget = wibox.widget.textbox()
vicious.register(memwidget, vicious.widgets.mem, "$1%", 13)
--- }}}

--- {{{ CPUwidget
cpuwidget = wibox.widget.textbox()
vicious.register(cpuwidget, vicious.widgets.cpu, "$1%")
--- }}}

--- {{{ Volumewidget
function readvol()
vol = round((awful.util.pread("cat /proc/acpi/ibm/volume | awk 'NR>0 && NR<2 {print $2}'"))*100/14,0)
mutestatus = awful.util.pread("cat /proc/acpi/ibm/volume")

if string.find(mutestatus, "on", 1, true) then
	volcolor = theme.fg_focus
else 
	volcolor = theme.fg_normal
end

volume = "<span color='" .. volcolor .. "'>" .. vol .. "% </span>"
volwidget:set_markup(volume)
end

volwidget = wibox.widget.textbox()
readvol()
voltimer = timer({ timeout =1 }) 
voltimer:connect_signal("timeout", function() readvol(volwidget) end)
voltimer:start()
--- }}}


--- {{{ Batterywidget
batwidget = wibox.widget.textbox()
--this functions parses the sys/class/power_supply files for capacity
--if the capacity gets to low, a notification will appear
function readbat()
	capacity = awful.util.pread("more -sflu /sys/class/power_supply/BAT0/capacity | tr -d '\n'") 
	charge_status = awful.util.pread("more -sflu /sys/class/power_supply/BAT0/status | tr -d '\n'") 
	batwidget:set_markup(capacity .. "%")
	
	if capacity < "20" and  not charge_status == "Charging" then 
		bat = naughty.notify({title="Battery low!!!",text=awful.util.pread("acpi"),fg="#C00000", icon=theme.lowbat}) 
		batwidget:connect_signal("mouse::enter", function() naughty.destroy(bat) end)
	end
end

readbat()
--renew the batterystatus every ten sec
batimer = timer({ timeout =10 }) 
batimer:connect_signal("timeout", function() readbat(batwidget) end)
batimer:start()
--detailed battery-informations on mouseover
batwidget:connect_signal("mouse::enter", function() 
bat = naughty.notify({title="Batterystatus",text=awful.util.pread("acpi")})  end)
batwidget:connect_signal("mouse::leave", function() naughty.destroy(bat) end) 
--- }}}


--- {{{ weather widget
weatherwidget = wibox.widget.textbox()
weatherwidget:set_text(awful.util.pread("ansiweather -l Rastatt,DE -u metric -s false -d true|awk '{print $7, $8}'"))
weathertimer = timer(
   { timeout = 900 } -- Update every 15 minutes.
)
weathertimer:connect_signal(
   "timeout", function()
      weatherwidget:set_text(awful.util.pread("ansiweather|awk '{print $7, $8}'"))
end)

weathertimer:start() -- Start the timer
weatherwidget:connect_signal(
   "mouse::enter", function()
      weather = naughty.notify(
         {title="Weather",text=awful.util.pread("ansiweather -f 5")})
end) -- this creates the hover feature.

weatherwidget:connect_signal(
   "mouse::leave", function()
      naughty.destroy(weather)
end)
--- }}}


-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, function(t) 
			    awful.tag.viewonly(t)
			    --set random wallpaper for toggeled tag
		            gears.wallpaper.maximized( wp_path .. wp_files[wp_index[awful.tag.getidx(t)]] , s, true)
		    end),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })

    -- Widgets that are aligned to the left
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(mylauncher)
    left_layout:add(mytaglist[s])
    left_layout:add(mypromptbox[s])

    -- Widgets that are aligned to the right
    local right_layout = wibox.layout.fixed.horizontal()


    --icons for widgets
    function addicon(source)
	    icon = wibox.widget.imagebox()
	    icon:set_image(source)
	    right_layout:add(icon)
    end

    right_layout:add(weatherwidget)
    addicon(theme.vol)
    right_layout:add(volwidget)
    addicon(theme.cpu)
    right_layout:add(cpuwidget)
    addicon(theme.mem)
    right_layout:add(memwidget)
    addicon(theme.disc)
    right_layout:add(fs_home)
    addicon(theme.disc)
    right_layout:add(fs_root)
    addicon(theme.bat)
    right_layout:add(batwidget)
    if s == 1 then right_layout:add(wibox.widget.systray()) end
    right_layout:add(mytextclock)
    right_layout:add(mylayoutbox[s])

    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_middle(mytasklist[s])
    layout:set_right(right_layout)

    mywibox[s]:set_widget(layout)
end
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}


-- {{{ Key bindings
globalkeys = awful.util.table.join(

    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end),
-- bind PrintScrn to capture a screen
    awful.key({				}, "Print", function() awful.util.spawn("capscr",false) end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),
    awful.key({ modkey, "Control" }, "n", awful.client.restore),

    --Dropdownterminal
    awful.key({ modkey }, "v", function () scratch.drop("xterm", "bottom") end),

        -- Calculator
    awful.key({ modkey            }, "c", function ()
        awful.prompt.run({ prompt = "Calculate: " }, mypromptbox[mouse.screen].widget,
            function (expr)
                local result = awful.util.eval("return (" .. expr .. ")")
                naughty.notify({ text = expr .. " = " .. result, timeout = 10 })
            end
        )
    end),

 -- Dictionary
 awful.key({ modkey}, "d", function ()
        info = true
        awful.prompt.run({prompt = "Dict: "}, mypromptbox[mouse.screen].widget,
        function(word)
               de = awful.util.pread("dict -d fd-deu-eng " .. word)
	     eng = awful.util.pread("dict -d fd-eng-deu " .. word)
                naughty.notify({ text = "___DE-ENG___\n" .. de .. "\n\n___ENG-DE___\n" .. eng, timeout = 0, width = 400 })
        end,
        nil, awful.util.getdir("cache") .. "/dict") 
end),

    -- Websearch
    awful.key({ modkey }, "s", function ()
        awful.prompt.run({ prompt = "Web search: " }, mypromptbox[mouse.screen].widget,
            function (command)
                awful.util.spawn("luakit 'https://duckduckgo.com/?q="..command.."'", false)
                -- Switch to the web tag, where Browser is, in this case tag 2
                if tags[mouse.screen][2] then awful.tag.viewonly(tags[mouse.screen][2]) end
            end)
    end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end),
              
    -- Menubar
    awful.key({ modkey }, "r", function() menubar.show() end)
    
    )

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey,		  }, "q",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end),
awful.key({ modkey, "Shift"   }, ",",
   function (c)
       local curidx = awful.tag.getidx()
       if curidx == 1 then
           awful.client.movetotag(tags[client.focus.screen][9])
       else
           awful.client.movetotag(tags[client.focus.screen][curidx - 1])
       end
   end),
 awful.key({ modkey, "Shift"   }, ".",
   function (c)
       local curidx = awful.tag.getidx()
       if curidx == 9 then
           awful.client.movetotag(tags[client.focus.screen][1])
       else
           awful.client.movetotag(tags[client.focus.screen][curidx + 1])
       end
   end)
)


-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        local tag = awful.tag.gettags(screen)[i]
                        if tag then
                           awful.tag.viewonly(tag)
			   --set random wallpaper on current tag
                           gears.wallpaper.maximized( wp_path .. wp_files[wp_index[i]] , s, true)
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      local tag = awful.tag.gettags(screen)[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = awful.tag.gettags(client.focus.screen)[i]
                          if tag then
                              awful.client.movetotag(tag)
                          end
                     end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = awful.tag.gettags(client.focus.screen)[i]
                          if tag then
                              awful.client.toggletag(tag)
                          end
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     keys = clientkeys,
                     buttons = clientbuttons } },
      { rule = { class = "Thunderbird" },  properties = { tag = tags[1][3] } },
      { rule = { class = "JDownloader" },  properties = { tag = tags[1][4] } },
      { rule = { class = "luakit" },  properties = { tag = tags[1][2] } }},
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c, startup)
    -- Enable sloppy focus
    c:connect_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end

    local titlebars_enabled = false
    if titlebars_enabled and (c.type == "normal" or c.type == "dialog") then
        -- buttons for the titlebar
        local buttons = awful.util.table.join(
                awful.button({ }, 1, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.move(c)
                end),
                awful.button({ }, 3, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.resize(c)
                end)
                )

        -- Widgets that are aligned to the left
        local left_layout = wibox.layout.fixed.horizontal()
        left_layout:add(awful.titlebar.widget.iconwidget(c))
        left_layout:buttons(buttons)

        -- Widgets that are aligned to the right
        local right_layout = wibox.layout.fixed.horizontal()
        right_layout:add(awful.titlebar.widget.floatingbutton(c))
        right_layout:add(awful.titlebar.widget.maximizedbutton(c))
        right_layout:add(awful.titlebar.widget.stickybutton(c))
        right_layout:add(awful.titlebar.widget.ontopbutton(c))
        right_layout:add(awful.titlebar.widget.closebutton(c))

        -- The title goes in the middle
        local middle_layout = wibox.layout.flex.horizontal()
        local title = awful.titlebar.widget.titlewidget(c)
        title:set_align("center")
        middle_layout:add(title)
        middle_layout:buttons(buttons)

        -- Now bring it all together
        local layout = wibox.layout.align.horizontal()
        layout:set_left(left_layout)
        layout:set_right(right_layout)
        layout:set_middle(middle_layout)

        awful.titlebar(c):set_widget(layout)
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
