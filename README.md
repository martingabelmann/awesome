# awesome
my awesomeconfig

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
We just change the wallpaper on each tag-toggle.
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
if it's change with the keyboard, we need to replace
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



Now the wallpaper will change every time you swich the tag.
