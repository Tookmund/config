# Configured for a 1920x1080 display
xclock -digital -g +1500+1040 &
wmbattery -w 1 -g +1850+1020 &
sh $HOME/.fehbg &
xscreensaver &
9menu -geometry +0+1025 -file $HOME/config/9menu
#xsysinfo -g +0+850 &
exec /home/jacob/coding/9wm/9wm -term st
