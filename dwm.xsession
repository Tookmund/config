$HOME/config/dwmstatus.sh &
uxterm &
firefox &
xscreensaver -no-splash &
# lock on suspend
xss-lock -- xscreensaver-command --lock &
exec dwm
