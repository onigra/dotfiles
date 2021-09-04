#!/bin/sh

brew update
brew upgrade
brew cleanup

asdf update
asdf plugin-update --all

