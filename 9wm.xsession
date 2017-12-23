xsetroot -solid grey40 &
xscreensaver -no-splash &

xbacklight -set 40 &

# Configured for a 1920x1080 display
xclock -digital -g +1560+1040 &
wmbattery -w 1 -g +1850+1020 &
9menu -geometry +0+1010 -file $HOME/config/9menu &
xsysinfo -g +0+782 &

#exec openbsd-cwm
# rxvt-unicode-256color
exec 9wm -debug -active "#55AAAA" -inactive "#9EEEEE" -term "urxvt -bg beige" 2> 9wm.log > 9wm.log
