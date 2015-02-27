#!/bin/bash

## Author: Quang.Nguyen
## Purpose: Copy my config after install Arch Linux box
## License: 

_USER='xquang'
_FILES=('bashrc' 'mpd.conf' 'tmux.conf' 'vimrc' 'xinitrc' 'gitconfig')
_DIR=('vim' 'mplayer' 'e')
_HOME='/home/'"$_USER"'/tmp/'
RS=$(which rsync)

cd "$(dirname "$0")/.."
_WORKING=$(pwd)

fconfig () {
	for f in "${_FILES[@]}"; do
		$RS -rap "$_WORKING"/"$f" "$_HOME"."$f"
	done
}

dconfig () {
	for d in "${_DIR[@]}"; do
		$RS -rap "$_WORKING"/"$d" "$_HOME"."$d"
	done
}

fconfig
dconfig