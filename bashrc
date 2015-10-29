#
# ~/.bashrc
#

# If not running interactively, don't do anything
#[[ $- != *i* ]] && return
#[[ -z "$TMUX" ]] && exec tmux

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

cowsay "Welcome to sunshine ┏( ^o^)┛"

#cmatrix -B

Black='\e[0;30m' # Black
Red='\e[0;31m' # Red
Green='\e[0;32m' # Green
Yellow='\e[0;33m' # Yellow
Blue='\e[0;34m' # Blue
Purple='\e[0;35m' # Purple
Cyan='\e[0;36m' # Cyan
White='\e[0;37m' # White

if [ $UID != 0 ]; then
  PS1='\[\e[0;32m\]:: \[\e[0;37m\]You are \[\e[0;32m\]\u\[\e[0;37m\] -at- \[\e[0;34m\]\h\[\e[0;37m\] [\[\e[0;32m\]\w\[\e[0;39m\]]\n\[\e[0;32m\]\$\[\e[m\] '
else
  PS1='\[\e[0;32m\]:: \[\e[0;37m\]You are \[\e[0;31m\]\u\[\e[0;37m\] -at- \[\e[0;34m\]\h\[\e[0;37m\] [\[\e[0;32m\]\w\[\e[0;39m\]]\n\[\e[0;31m\]\$\[\e[m\] '
fi

EDITOR=vim
PATH=$PATH:/home/xquang/bin:/home/xquang/.gem/ruby/2.2.0/bin

export GOPATH=~/go
export PATH=$PATH:~/go/bin

# modified commands
alias grep='grep --color=auto'
alias more='less'
alias df='df -h | tail -n 8 | sort'
alias du='du -sch'
alias ping='ping -c 5'
alias pong='ping google.com.vn'
alias p='curl httpbin.org/ip'
alias pv='pv -peafbt'

# Comment of PV
# - p: progress bar
# - e: enable eta time, how long it will be beforce completion
# - a: Turn the average rate counter on.
# - f: Force output.
# - b: Display the total amount of data transferred so far.
# - t: Display the total elapsed time that pv has been running for.

# New commands
alias date='date "+%A, %B %d, %Y [%T]"'

# privileged access
if [ $UID -ne 0 ]; then
alias sudo='sudo '
alias reboot='sudo reboot'
alias halt='sudo halt'
alias pm-suspend='sudo pm-suspend'
fi

# ls
alias ls='ls -hF --color=auto'
alias ll='ls -l'
alias l='ls -l'
alias lll='ls -l'

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
alias times='sudo ntpdate pool.ntp.org'
alias mplayer='mplayer -msgcolor'
alias r='openssl rand -base64 15'
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

# add this configuration to ~/.bashrc
export HISTTIMEFORMAT="%F %T "                                                                                                                                        
export HISTSIZE=999999
export HISTFILESIZE=999999999
