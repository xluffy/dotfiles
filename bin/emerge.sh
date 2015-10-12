#!/bin/bash

pkgs=(cmake cowsay cronie dos2unix flac fontconfig gcc geany htop inxi lsof make ncdu openvpn sys-apps/pciutils sys-apps/usbutils tmux unzip vim xzip zip)

for pkg in "${pkgs[@]}";do
  yes | emerge -avt $pkg || break
done