EDITOR=vim

export GOPATH=~/go
export PATH=$PATH:~/go/bin

ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

shuf -n 1 ~/workspace/cowsay-quote/quote.txt | cowsay

alias grep='grep --color=auto'
alias more='less'
alias df='df -h | tail -n 8 | sort'
alias du='du -sch'
alias ping='ping -c 5'
alias pong='ping google.com.vn'
alias p='curl httpbin.org/ip'
alias pv='pv -peafbt'
alias date='date "+%A, %B %d, %Y [%T]"'

if [ $UID -ne 0 ]; then
  alias sudo='sudo '
  alias reboot='sudo reboot'
  alias halt='sudo halt'
  alias pm-suspend='sudo pm-suspend'
  alias sudo='sudo '
  alias pacman='sudo pacman'
fi

alias ls='ls -hF --color=auto'
alias ll='ls -l'
alias l='ls -l'
alias lll='ls -l'
alias r='openssl rand -base64 15'
