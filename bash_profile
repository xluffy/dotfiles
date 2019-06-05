# Add Homebrew `/usr/local/bin` and User `~/bin` to the `$PATH`
PATH=/usr/local/bin:$PATH
PATH=$HOME/bin:$PATH:$HOME/go/bin
PATH=$PATH:/Users/xluffy/Library/Python/3.6/bin
GOPATH=$HOME/go
export PATH

eval "$(rbenv init -)"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.

for file in ~/.{bash_prompt,exports,aliases,functions}; do
  [ -r "$file" ] && source "$file"
done

unset file

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/xluffy/5source/google-cloud-sdk/path.bash.inc' ]; then 
  source '/Users/xluffy/5source/google-cloud-sdk/path.bash.inc';
fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/xluffy/5source/google-cloud-sdk/completion.bash.inc' ]; then
  source '/Users/xluffy/5source/google-cloud-sdk/completion.bash.inc'; 
fi

sscp() {
  scp ubuntu@"$1"
}

eval "$(pyenv init -)"
