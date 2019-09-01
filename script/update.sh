#!/bin/sh

brew upgrade
brew cleanup

asdf update
asdf plugin-update --all

