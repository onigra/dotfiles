#!/bin/sh

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

ln -s ~/dotfiles/.gemrc ~/.gemrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.inputrc ~/.inputrc
ln -s ~/dotfiles/.tigrc ~/.tigrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.zsh ~/.zsh
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.peco ~/.peco

ln -s ~/dotfiles/.config/git ~/.config/git
ln -s ~/dotfiles/.config/nvim ~/.config/nvim
ln -s ~/dotfiles/.config/powerline ~/.config/powerline
ln -s ~/dotfiles/.config/karabiner ~/.config/karabiner

