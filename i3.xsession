xscreensaver -no-splash &
xss-lock -- xscreensaver-command --lock &
xrandr --dpi 192
feh --bg-scale $HOME/config/joy.png
xinput set-prop 12 "libinput Natural Scrolling Enabled" 1
xmodmap $HOME/config/swapcapsesc
exec i3
