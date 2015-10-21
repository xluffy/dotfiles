#!/bin/bash

#
# x - template of shell script (program writen by bash shell)
# Released under the MIT License.
#
# https://github.com/xluffy/.../x
#

#
# Author: @xluffy
# Origin: https://github.com/visionmedia/deploy/blob/master/bin/deploy

VERSION="0.x.0"
LOG=/tmp/x.log
TEST=1
REF=

#
# Output usage information.
#

usage() {
  cat <<-EOF
  NAME
    x - template of shell script (program writen by bash shell)

  SYNTAX
    ~$ x [option]

  OPTIONS:
    -v, --version        output program version
    -h, --help           output help information
EOF
}

#
# Abort with <msg>
#

abort() {
  echo
  echo "  $@" 1>&2
  echo
  exit 1
}

#
# Log <msg>.
#

log() {
  echo "  ○ $@"
}

version() {
  echo $VERSION
}


# main program

case "$1" in
  "--help" | "-h")
    usage
    exit
    ;;
  "-v" )
    version
    ;;
  "-a" )
    abort
    ;;
  "-l" )
    log
    ;;
  *)
    usage
    exit
    ;;
esac