# Configured for a 1920x1080 display
xclock -digital -g +1560+1040 &
wmbattery -w 1 -g +1850+1020 &
sh $HOME/.fehbg &
xscreensaver -no-splash &
9menu -geometry +0+1010 -file $HOME/config/9menu &
xsysinfo -g +0+862 -nosmp &
xman -g +245+1005 &
exec 9wm
