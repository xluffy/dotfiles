
#
# ~/.bashrc
#

# If not running interactively, don't do anything
#[[ $- != *i* ]] && return
#[[ -z "$TMUX" ]] && exec tmux

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

cowsay "Welcome to freeX"

#cmatrix -B

Black='\e[0;30m' # Black
Red='\e[0;31m' # Red
Green='\e[0;32m' # Green
Yellow='\e[0;33m' # Yellow
Blue='\e[0;34m' # Blue
Purple='\e[0;35m' # Purple
Cyan='\e[0;36m' # Cyan
White='\e[0;37m' # White

export PS1='\[\e[0;32m\]:: \[\e[0;37m\]You are \[\e[0;31m\]\u\[\e[0;37m\] -at- \[\e[0;31m\]\h\[\e[0;37m\] [\w\[\e[0;32m\]]\[\e[0m\]\n\$\[\e[0m\] '
export EDITOR=vim

PATH=$PATH:/home/xquang/bin

# modified commands
alias grep='grep --color=auto'
alias more='less'
alias df='df -h | tail -n 8 | sort'
alias du='du -c -h'
alias ping='ping -c 5'
alias pong='ping google.com.vn'
alias ping1='ping 192.168.1.1'
alias ping2='ping 192.168.1.201'
alias dualscreen='xrandr --output LVDS1 --auto --output VGA1 --auto --right-of LVDS1'

# New commands
alias date='date "+%A, %B %d, %Y [%T]"'

# privileged access
if [ $UID -ne 0 ]; then
alias sudo='sudo '
alias reboot='sudo reboot'
alias halt='sudo halt'
fi

# ls
alias ls='ls -hF --color=auto'
alias ll='ls -l'

# auto-completion
complete -cf sudo
complete -cf man

# pacman & yaourt
alias pacman='sudo pacman'
alias yaourt='sudo yaourt'

# take a picture
alias takepic='scrot -d 10 -c ~/.screenshot/%Y_%m_%d_%T-screenshot.png'
alias mixer='alsamixer'
alias vi='vim'
alias goodnight='sudo shutdown -h +45'
alias xinit='xinit &> ~/.xlog'
alias ww='sudo wifi-menu wf0'
alias wPublic='sudo mount.cifs //10.100.0.22/public wPublic/ -o user=quang.nguyen'
alias time='sudo ntpdate pool.ntp.org'
alias mplayer='mplayer -msgcolor'
#
export BROWSER="chromium"

## EXTRACT FUNCTION ##
giainen () {
  if [ -f $1 ] ; then
case $1 in
          *.tar.bz2) tar xvjf $1 ;;
          *.tar.gz) tar xvzf $1 ;;
          *.bz2) bunzip2 $1 ;;
          *.rar) rar x $1 ;;
          *.gz) gunzip $1 ;;
          *.tar) tar xvf $1 ;;
          *.tbz2) tar xvjf $1 ;;
          *.tgz) tar xvzf $1 ;;
          *.zip) unzip $1 ;;
          *.Z) uncompress $1 ;;
          *.7z) 7z x $1 ;;
          *) echo "don't know how to extract '$1'..." ;;
      esac
else
echo "'$1' is not a valid file!"
  fi
}

export GOPATH=$HOME/go