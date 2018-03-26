#!/bin/sh

brew tap caskroom/cask
brew tap homebrew/dupes

brew install git
brew install git-now
brew install hub
brew install tig
brew install jq
brew install openssl
brew install ctags
brew install readline
brew install rsense
brew install the_silver_searcher
brew install tmux
brew install reattach-to-user-namespace
brew install wget
brew install curl
brew install tree
brew install zsh
brew install coreutils
brew install colordiff
brew install go
brew install heroku
brew install peco
brew install ghq
brew install jenv
brew install terraform
brew install direnv

brew install mysql
brew install redis
brew install postgresql

brew install bash
brew install gnu-sed
brew install nkf
brew install ngrep
brew install parallel
brew install automake

brew install imagemagick
brew install pkg-config

brew install homebrew/dupes/grep

brew cask install firefox
brew cask install iterm2
brew cask install appcleaner
brew cask install slack
brew cask install atool

# Mac OS ver10.12(Sierra)以降はkarabinerをインストールしない
macOsVersion=$(sw_vers -productVersion)

if [[ "$macOsVersion" =~ "10.12" ]]; then
  brew cask install cmd-eikana
else
  brew cask install karabiner
fi

