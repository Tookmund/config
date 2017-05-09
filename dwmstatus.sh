#!/bin/sh
# Taken from:
#	https://raw.github.com/kaihendry/Kai-s--HOME/master/.xinitrc

while true
do
	if amixer get Master | grep off > /dev/null
	then
		VOL="Vol: --%"
	else
		VOL="Vol: $(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')"
	fi
	LOCALTIME=$(date +%Y-%m-%d\ %H:%M)
	IP=$(for i in `ip r`; do echo $i; done | grep -A 1 src | tail -n1) # can get confused if you use vmware
	TEMP="$(($(cat /sys/class/thermal/thermal_zone0/temp) / 1000))C"

	if acpi | grep Battery > /dev/null
	then
		BAT="Bat: $(acpi -b | awk '{ print $4 " " $5 }' | tr -d ',')"
		if acpi | grep Charging > /dev/null
		then
			BAT="$BAT CHG"
		fi
		xsetroot -name "$IP $BAT $VOL $TEMP $LOCALTIME"
	else
		xsetroot -name "$IP $VOL $TEMP $LOCALTIME" 
	fi
	sleep 20s
done
