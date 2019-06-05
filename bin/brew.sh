#!/bin/sh
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

main() {
  _i_brew || _die "Can't install brew"
}

main "$@"
