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

bash .fehbg

xset +fp /usr/share/fonts/local
xset fp rehash
xrdb -merge .Xresources 

trayer --edge bottom --align right --SetDockType true --SetPartialStrut true  --expand true --width 7 --transparent true --tint 0x191970 --height 12 &

#exec enlightenment_start
#exec pekwm
exec xmonad
