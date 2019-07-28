xscreensaver -no-splash &
xss-lock -- xscreensaver-command --lock &
xrandr --dpi 192
xinput set-prop "Synaptics TM3289-002" "libinput Natural Scrolling Enabled" 1
feh --bg-scale $HOME/config/joy.png
xmodmap $HOME/config/swapcapsesc
exec i3
