#!/bin/bash

## Author: Quang.Nguyen
## Purpose: Copy my config after install Arch Linux box
## License: 

_USER='xquang'
_FILES=('bashrc' 'mpd.conf' 'tmux.conf' 'vimrc' 'xinitrc')
_DIR=('vim' 'mplayer' 'e')
_HOME='/home/'"$_USER"'/tmp/'
RS=$(which rsync)

cd "$(dirname "$0")/.."
_WORKING=$(pwd)


fconfig () {
	for f in "${_FILES[@]}"; do
		rsync -rap "$_WORKING"/"$f" "$_HOME"."$f"
	done
}

dconfig () {
	for d in "${_DIR[@]}"; do
		rsync -rap "$_WORKING"/"$d" "$_HOME"."$d"
	done
}

fconfig
dconfig