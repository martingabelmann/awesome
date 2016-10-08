# AwesomeWM
My Awesomeconfig and -widgets. Some of them are selfmade and more ore less documented, some are from the awesome-wiki (i'll try to mark them).  


##  Table of contents
* [Variables](#variables)
* [Keybindings](#keydoc)
* [Random wallpapers](#random-wallpapers)
* [Volume widget](#volume-widget)
* [Screenshots](#screenshots)
* [Dictionaryt](#dict)
* [Battery widget](#battery-widget)
* [Dropdown Terminal](#dropdown)
* [Application menu](#xdg-menu)
* [Shutdown dialog](#shutdown-dialog)

-----

### Variables
Configuration variables are set in the `config.lua`. In principle it is possible to configure everything there without hassle with the `rc.lua`.

### Keydoc
[Keydoc](https://awesome.naquadah.org/wiki/Document_keybindings) is a nice feature to document keybindings. Shortkey is `mod4 + F1`.

### Random wallpapers
Wallpapers are stored at `~/.config/awesome/backgrounds` per default to have random wallpapers per tag per session set
```lua
wp_index    = "random"
```
If you prefer static (but maybe different) wallpapers per tag fill `wp_index` with a table containing numbers corresponding to the images. E.g.:
```lua
wp_index = {2,1,2,1,2,1,2,1,2}
```
The numbers are counted from the output of `ls` in the background dir.

### Screenshots
are saved to `~/Screenshots`. By default `import -frame DATE` (from imagemagick package) is used.  
Shortkey is `Print`. 

### Dict
The cli-app [dictd](https://www.archlinux.org/packages/community/x86_64/dictd/) is doing all the jobs. I'm using the de-eng and eng-de libary for translation. One can also use other libaries like periodic tables, acronyms etc. (see dict -D).  
Run with `modkey + d`.

### Volume Widget
Im using hardwarebuttons to control the audio volume, so i just have to know the audio-level and mute-status. For my thinkpad this information is stored at '/proc/acpi/volume'. The file is been parsed every half second and echoed in a textbox. 
If you dont want to use the volume widget (e.g. when using pulse audios widget) set:
```lua
volfile = ""
```

### Battery Widget
Im parsing the files at `/sys/class/power_supply` for getting the capacity and charge-status. If in Batterymode and less than 20% a notification will appear.  
If you dont want to use the battery widget (e.g. on a Desktop) set:
```lua
batstatusfile=""
batcapacityfile=""
```
### Scratchpad
Need a small shell just for short time without switching the tag or squeezing the layout? - Just drop one with `mod4 + v`.  
In principle [scratchpad](https://awesome.naquadah.org/wiki/Scratchpad_manager) can be used to dropdown everything...

### XDG menu
On Archlinux install `pacman -S archlinux-xdg-menu`. It then generates an Application menu on every awesome start.
Other distros may change the `gen_xdg_menu_file=/etc/xdg/menus/arch-applications.menu` path. 
For more information see the archlinux [xdg-menu wiki article](https://wiki.archlinux.org/index.php/xdg-menu).

### Shutdown dialog
Using the shutdown/logout/suspend/reboot buttons from the awesome menu spawns a naugthy notification. To confirm the command left-click on the notification, otherwise it will vanish afert 5 seconds.
