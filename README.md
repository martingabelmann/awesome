# AwesomeWM
My Awesomeconfig and -widgets. Some of them are selfmade and more ore less documented, some are from the awesome-wiki (i'll try to mark them).  


###  Table of contents
* [Variables](#variables)
* [Features](#features)
	* [random wallpapers](#random-wallpapers)
	* [dictionary](#dict)
* [Widgets](#widgets)
	* [weather](#weather-widget)
	* [volbar](#volume-widget)
	* [battery](#battery-widget)
* [ToDo](#todo)

# Variables
Additional variables:
 *  ``awesome_home``= ``/home/username/.config/awesome``
 * maybe there will be more

# features
## random wallpapers
*I wanted to have random wallpapers for each tag per session. So here they are.*  
 
First we generate a table with all image files stored in ``awesome_home .. '/backgrounds/'``. Every tag gets assigned to one Wallpaper using a table filled with random indices.
  
**Wallpaper section**
 
Replace
```lua
-- {{{ Wallpaper
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end
-- }}}
```
with
```lua
--- seed and pop a few
math.randomseed(os.time())
for i=1,1000 do tmp=math.random(0,1000) end

--{{ random wallpapers for each tag
--store all backgroundfiles in a table
wp_path = awesome_home .. "/backgrounds/"
wp_files = {}
wp_count = 0
for filename in io.popen('ls ' .. wp_path):lines() do
        wp_count = wp_count + 1
        wp_files[wp_count] = filename
end
wp_index = {}
--each tag gets a random wallpaper. the wallpaper changes if the tag does
for t = 1, 9 do  wp_index[t] = math.random( 1, wp_count)  end
gears.wallpaper.maximized( wp_path .. wp_files[wp_index[1]] , s, true)
-- }}}
```  
  
**Wibox section**  
We just change the wallpaper on each tag-toggle event.  
If the wallpaper is changed by mouse we need to replace  
```lua
awful.button({ }, 1, awful.tag.viewonly),
```
with
```lua
awful.button({ }, 1, function(t)
                     awful.tag.viewonly(t)
                     --set random wallpaper for toggeled tag
                     gears.wallpaper.maximized( wp_path .. wp_files[wp_index[awful.tag.getidx(t)]] , s, true)
end),
```  
  
**Keybindings section**  
if it's changed with the keyboard, we need to replace
```lua
function ()
            local screen = mouse.screen
            local tag = awful.tag.gettags(screen)[i]
            if tag then
                        awful.tag.viewonly(tag)
            end
end),
```
with
```lua
function ()
            local screen = mouse.screen
            local tag = awful.tag.gettags(screen)[i]
            if tag then
                        awful.tag.viewonly(tag)
                         --set random wallpaper on current tag
                        gears.wallpaper.maximized( wp_path .. wp_files[wp_index[i]] , s, true)
                        end
end),
```
Now the wallpaper will change every time you swich the tag, which will look like every tag has its own (random) wallpaper.

# dict
The cli-app [dictd](https://www.archlinux.org/packages/community/x86_64/dictd/) is doing all the jobs. I'm using the de-eng and eng-de libary for translation. One can also use other libaries like periodic tables, acronyms etc. (see dict -D).  
  
In the **keybindings**-section
```lua
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
```

# Widgets  
## Weather Widget
Im using the [ansiweather-git](https://github.com/fcambus/ansiweat) package from [archlinux  aur](https://aur.archlinux.org/packages/ansiweather-git/) to grep weather informations from the cli.  

Just place the `weatherwidget` in your layout where you want.
```lua
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
```

## Volume Widget
Im using hardwarebuttons to control the audio volume, so i just have to know the audio-level and mute-status. For my thinkpad this information is stored at '/proc/acpi/volume'. The file is been parsed every half second and echoed in a textbox.

```lua
-- Create Volbar
function readvol()
volume = round((awful.util.pread("cat /proc/acpi/ibm/volume | awk 'NR>0 && NR<2 {print $2}'"))*100/14,0)
mutestatus = awful.util.pread("cat /proc/acpi/ibm/volume")

if string.find(mutestatusk, "on", 1, true) then
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
```  

## Battery Widget
Im parsing the files at /sys/class/power_supply for getting the capacity and charge-status.
If in Batterymode and less than 20% a notification will appear.

```lua
batwidget = wibox.widget.textbox()
function readbat()
        capacity = awful.util.pread("more -sflu /sys/class/power_supply/BAT0/capacity | tr -d '\n'")
        charge_status = awful.util.pread("more -sflu /sys/class/power_supply/BAT0/status | tr -d '\n'")
        batwidget:set_markup(capacity .. "%")

        if capacity < "20" and  charge_status == "Discharging" then
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
```
# ToDo
 * variable terminal
 * application-array that generates menus and spawn commands
 * weather widget with better metrics


