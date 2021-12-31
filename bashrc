#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux

for file in ~/.{bash_prompt,exports,aliases,functions}; do
  [ -r "${file}" ] && source "${file}"
done

shuf -n 1 /home/xluffy/code/dotfiles/quote.txt | cowsay

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

eval "$(direnv hook bash)"
show_virtual_env() {
  if [[ -n "$VIRTUAL_ENV" && -n "$DIRENV_DIR" ]]; then
    echo "($(basename $VIRTUAL_ENV))"
  fi
}
export -f show_virtual_env
PS1='$(show_virtual_env)'$PS1
