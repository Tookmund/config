# Configured for a 1920x1080 display
xclock -digital -g +1500+1040 &
wmbattery -w 1 -g +1850+1020 &
sh $HOME/.fehbg &
xscreensaver &
xsysinfo -g +0+850 &
exec rio -term st
