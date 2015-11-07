# Configured for a 1920x1080 display
xclock -digital -g +1500+1040 &
wmbattery -w 1 -g +1850+1020 &
sh $HOME/.fehbg &
xscreensaver &
9menu -geometry +0+1010 -file $HOME/config/9menu &
conky &
exec 9wm -term st
