dwmstatus.sh &
uxterm &
xscreensaver -no-splash &
# lock on suspend
xss-lock -- xscreensaver-command --lock &
exec dwm
