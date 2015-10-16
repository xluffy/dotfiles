#!/bin/bash
# Descrip: Install lib and package after build Arch system
# Author: @xluffy

SUDO=$(which sudo)
PM=$(which pacman)

lib=(archey3 atop bridge-utils bzip2 cmake cowsay cronie curl dhclient dhcpcd dialog dmidecode dos2unix flac fontconfig gc gcc geany gzip htop lsof lua lxc lz4 lzo make meld mesa-libgl mime-types mkinitcpio mpg123 netctl ngrep ntfs-3g python python-setuptools ruby siege subversion supervisor tmux ttf-hanazono ttf-sazanami ttf-ubuntu-font-family unrar unzip xf86driproto xf86-input-evdev xf86-video-fbdev xf86-video-nouveau xf86vidmodeproto xorg-appres xorg-bdftopcf xorg-fonts-alias xorg-fonts-encodings xorg-fonts-misc xorg-font-util xorg-font-utils xorg-iceauth xorg-mkfontdir xorg-mkfontscale xorg-server-common xorg-server-devel xorg-server-utils xorg-sessreg xorg-setxkbmap xorg-util-macros xorg-xauth xorg-xbacklight xorg-xcmsdb xorg-xgamma xorg-xhost xorg-xinit xorg-xinput xorg-xkbcomp xorg-xmodmap xorg-xrandr xorg-xrdb xorg-xrefresh xorg-xset xorg-xsetroot xz)
pkg=(ansible cronie curl doublecmd-qt dhclient dhcpcd fabric firefox keepassx hicolor-icon-theme shotwell skype sshfs tmux openvpn vagrant virtualbox wireshark-cli wireshark-gtk xscreensaver yaourt zathura zathura-djvu zathura-pdf-poppler zip)

for l in "${lib[@]}"; do
  echo "Install lib is $l"
  "$SUDO" "$PM" -S "$pk" --noconfirm || break

for pk in "${pks[@]}"; do
	echo "Install $pk ..."
	"$SUDO" "$PM" -S "$pk" --noconfirm || break
done