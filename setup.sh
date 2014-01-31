#!/bin/sh

ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.zsh ~/.zsh
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.inputrc ~/.inputrc
ln -s ~/dotfiles/.irbrc ~/.irbrc
ln -s ~/dotfiles/.gemrc ~/.gemrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig

# gem
gem i pry td rspec powder
