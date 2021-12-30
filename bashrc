#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux

for file in ~/.{bash_prompt,exports,aliases,functions}; do
  [ -r "${file}" ] && source "${file}"
done

shuf -n 1 /home/xluffy/code/cowsay-quote/quote.txt | cowsay

# privileged access
if [ $UID -ne 0 ]; then
  alias sudo='sudo '
  alias reboot='sudo reboot'
  alias halt='sudo halt'
fi

# auto-completion
complete -cf sudo
complete -cf man

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
