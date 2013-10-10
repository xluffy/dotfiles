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

#uim-toolbar-gtk-systray &

#ibus-daemon --xim -d
/usr/bin/xscreensaver -no-splash &
xset +fp /usr/share/fonts/local
xset fp rehash
#exec openbox-session

#while true; do
#   xsetroot -name "$(date +"%F %R")"
#   sleep 1m    # Update time every minute
#done &
#exec dwm

#conky
#(conky | dzen2 -x '1100' -e '' -fg '#66a9ba' -bg '#000000' -w '720' -h '15' -ta r -fn '-*-terminus-medium-r-*-*-12-*-*-*-*-*-*-*' -p )&

nitrogen --restore &

/home/xluffy/workplace/dwm/bin/startdwm
