# AwesomeWM
My Awesomeconfig and -widgets. Some of them are selfmade and more ore less documented, some are from the awesome-wiki (i'll try to mark them).  


###  Table of contents
* [features] (#features)
	* [random wallpapers](#random-wallpapers)
* [widgets](#widgets)
	* [weather](#weather-widget)


# features
## random wallpapers
*I wanted to have random wallpapers for each tag per session. So here they are.*  
  
**Wallpaper section**
First we generate a table with all wallpapers. Every tag gets assigned to one Wallpaper using a table filled with random indices.  
  
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
--- seed and "pop a few"
math.randomseed(os.time())
for i=1,1000 do tmp=math.random(0,1000) end

--{{ random wallpapers for each tag
wp_path = "/home/martin/.config/awesome/backgrounds/"
wp_files = { "orig.png", "yoda.png" }
wp_index = {}

for t = 1, 9 do  wp_index[t] = math.random( 1, #wp_files)  end
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

##Weather Widget
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
