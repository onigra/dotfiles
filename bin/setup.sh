#!/bin/sh

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

ln -s ~/dotfiles/.gemrc ~/.gemrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.inputrc ~/.inputrc
ln -s ~/dotfiles/.irbrc ~/.irbrc
ln -s ~/dotfiles/.tigrc ~/.tigrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.zsh ~/.zsh
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/powerline ~/.config/powerline

mkdir ~/.peco
ln -s ~/dotfiles/.peco/config.json ~/.peco/config.json

mkdir -p ~/.config/git
ln -s ~/dotfiles/.config/git/ignore ~/.config/git/ignore

mkdir -p ~/.cache
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
rm installer.sh

