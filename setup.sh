#!/bin/sh

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

ln -s ~/dotfiles/.gemrc ~/.gemrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.inputrc ~/.inputrc
ln -s ~/dotfiles/.irbrc ~/.irbrc
ln -s ~/dotfiles/.tigrc ~/.tigrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.zshenv ~/.zshenv
ln -s ~/dotfiles/.zsh ~/.zsh
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.tmux-powerlinerc ~/.tmux-powerlinerc

mkdir ~/.peco
ln -s ~/dotfiles/.peco/config.json ~/.peco/config.json

mkdir -p ~/.vim/dein
mkdir -p ~/.vim/undo
git clone https://github.com/Shougo/dein.vim ~/.vim/dein/dein.vim

mkdir ~/.tmux
git clone https://github.com/erikw/tmux-powerline.git ~/.tmux/tmux-powerline

