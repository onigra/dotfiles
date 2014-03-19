#!/bin/sh

ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.zsh ~/.zsh
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.inputrc ~/.inputrc
ln -s ~/dotfiles/.irbrc ~/.irbrc
ln -s ~/dotfiles/.gemrc ~/.gemrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.tmux-powerlinerc ~/.tmux-powerlinerc
ln -s ~/dotfiles/.spring.rb ~/.spring.rb
ln -s ~/dotfiles/Brewfile ~/Brewfile

