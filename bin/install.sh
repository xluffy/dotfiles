#!/bin/bash
#
# Purpose: Install brew on mac osx
# Author: xluffy
#

DEBUG="${DEBUG:-true}"

[ "${DEBUG}" = "true"  ] && set -x

_log() {
  printf "\x1B[2;32m"
  echo "[LOG]" "[$(date +'%Y-%m-%d %H:%M:%S')]:" "$*"
  printf "\x1B[0m"
}

_die() {
  printf "\x1B[2;31m"
  echo "[ERROR]" "[$(date +'%Y-%m-%d %H:%M:%S')]:" "$*" >&2
  exit 1 
  printf "\x1B[0m"
}

_i_brew() {
  if [ ! "$(command -v brew)" ]; then
    echo "Install brew ..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  brew update
  brew upgrade --all
}

_i_pkgs() {
  if [ ! -f ../Brewfile ]; then
    _log "Can't exist Brewfile, please check"
  fi

  brew bundle install --file=../Brewfile
}

_config() {
  local files=(aliases bash_profile bash_prompt bashrc exports functions gitconfig psqlrc tmux.conf vimrc)
  local user
  user=$(whoami)

  for f in "${files[@]}"; do
    if [ ! -f "${f}" ]; then
      _log "Can't exist config"
    fi
    install --owner="${user}" --mode=0644 "${f}" "/Users/${user}/.${f}"
  done
}

main() {
  _i_brew || _die "Can't install brew"
  _i_pkgs || _die "Can't install packages"
  _config || _die "Can't config"
}

main "$@"
