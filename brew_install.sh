#!/bin/sh

brew update

brew tap phinze/homebrew-cask
brew tap homebrew/versions

brew install brew-cask
brew install git
brew install hub
brew install tig
brew install hg
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
brew install gauche
brew install graphviz
brew install ansible
brew install go
brew install docker
brew install boot2docker
brew install heroku-toolbelt

brew install mysql
brew install redis

brew install bash
brew install gnu-sed
brew install nkf
brew install ngrep
brew install parallel
brew install automake

brew install imagemagick
brew install fontforge
brew install pkg-config

brew install phantomjs
brew install docker

brew install --zsh-completion git-now
brew install https://raw.githubusercontent.com/sorah/envchain/master/brew/envchain.rb

tap homebrew/dupes
install homebrew/dupes/grep

cask install karabiner
cask install skype
cask install firefox
cask install yorufukurou
cask install iterm2
cask install appcleaner
cask install mysqlworkbench
cask install virtualbox

brew tap peco/peco
brew install peco

brew tap motemen/ghq
brew install ghq

