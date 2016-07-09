xsetroot -solid darkgray &
xscreensaver -no-splash &

xbacklight -set 40 &

# Configured for a 1920x1080 display
xclock -digital -g +1560+1040 &
#wmbattery -w 1 -g +1850+1020 &
9menu -geometry +0+1010 -file $HOME/config/9menu &
xsysinfo -g +0+862 -nosmp &

# rxvt-unicode-256color
exec 9wm-color -border turquoise -term "urxvt -bg beige" 2> 9wm.log
