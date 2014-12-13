#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

export GTK_IM_MODULE='uim'
export QT_IM_MODULE='uim'
uim-xim &
export XMODIFIERS='@im=uim'

xset +fp /usr/share/fonts/local
xset fp rehash

#xscreensaver &

# while true; do
#     # Log stderror to a file 
#     dwm 2> ~/.dwm.log
#     # No error logging
#     #dwm >/dev/null 2>&1
# done

while true; do

# Power/Battery Status
if [ "$( cat /sys/class/power_supply/AC0/online )" -eq "1" ]; then
        DWM_BATTERY="AC";
        DWM_RENEW_INT=3;
else
        DWM_BATTERY=$(( `cat /sys/class/power_supply/BAT0/energy_now` * 100 / `cat /sys/class/power_supply/BAT0/energy_full` ));
        DWM_RENEW_INT=30;
fi;

# Volume Level
#DWM_VOL=$( amixer -c1 sget Master | awk -vORS=' ' '/Mono:/ {print($6$4)}' );

# Date and Time
DWM_CLOCK=$( date '+%e %b %Y %a | %k:%M' );

# Overall output command
DWM_STATUS="Power: [$DWM_BATTERY] | $DWM_CLOCK";
xsetroot -name "$DWM_STATUS";
sleep $DWM_REFRESH_INT;

done &

exec enlightenment_start
#exec /home/xquang/linux/xdwm
