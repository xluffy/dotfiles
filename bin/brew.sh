#!/bin/sh
#
# Setup mac
#
sudo -v

if [ ! $(which brew) ]; then
  echo "Install brew ..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew upgrade --all

brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

brew install moreutils
brew install findutils
brew install gnu-sed --with-default-names
brew install bash
brew tap homebrew/versions
brew install bash-completion2
echo "Adding the newly installed shell to the list of allowed shells"
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
chsh -s /usr/local/bin/bash

brew install python
# brew install ruby-build
# brew install rbenv
# LINE='eval "$(rbenv init -)"'
# grep -q "$LINE" ~/.bash_profile || echo "$LINE" >> ~/.bash_profile

brew install vim --override-system-vi
brew install homebrew/dupes/grep

brew install git
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install speedtest_cli
brew install ssh-copy-id
brew install tree
