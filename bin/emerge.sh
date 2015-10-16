#!/bin/bash
# Descript: 
# Author: @xluffy

_base()
{
  local pkgs=(acpi ansible autoconf automake bc cmake cowsay cronie dos2unix dstat elinks flac fontconfig gawk gcc geany git go htop inxi jemalloc logrotate lsof lua lynx make app-misc/mc nano ncdu openvpn pv rsync sed sys-apps/pciutils sys-apps/usbutils tmux unzip vim xzip zip)

  for pkg in "${pkgs[@]}";do
    yes | emerge $pkg || break
  done
}

_X11() {
  yes | emerge xorg-x11
}

_base