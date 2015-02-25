#!/bin/bash

SUDO=$(which sudo)
PM=$(which pacman)

pks='ansible archey3 atop bridge-utils bzip2 chromium-pepper-flash cmake cowsay cronie curl dhclient dhcpcd dialog dmidecode dos2unix fabric firefox flac fontconfig gc gcc geany gzip hicolor-icon-theme htop httperf httpie keepassx lsof lua lxc lz4 lzo make mc meld mesa-libgl mime-types mkinitcpio mpd mpg123 netctl ngrep ntfs-3g openvpn python python-setuptools ruby shotwell siege skype sshfs sublime-text subversion supervisor tmux ttf-hanazono ttf-sazanami ttf-ubuntu-font-family unrar unzip vagrant virtualbox wireshark-cli wireshark-gtk xf86driproto xf86-input-evdev xf86-video-fbdev xf86-video-nouveau xf86vidmodeproto xorg-appres xorg-bdftopcf xorg-fonts-alias xorg-fonts-encodings xorg-fonts-misc xorg-font-util xorg-font-utils xorg-iceauth xorg-mkfontdir xorg-mkfontscale xorg-server-common xorg-server-devel xorg-server-utils xorg-sessreg xorg-setxkbmap xorg-util-macros xorg-xauth xorg-xbacklight xorg-xcmsdb xorg-xgamma xorg-xhost xorg-xinit xorg-xinput xorg-xkbcomp xorg-xmodmap xorg-xrandr xorg-xrdb xorg-xrefresh xorg-xset xorg-xsetroot xscreensaver xz yaourt zathura zathura-djvu zathura-pdf-poppler zip'

for pk in ${pks[@]}; do
	printf "Install $pk ... \n"
	$SUDO $PM -S "$pk" || break
done