#!/bin/sh

git clone git@github.com:pyenv/pyenv.git ~/.pyenv
pyenv install 3.6.6
pyenv pyenv global 3.6.6
pyenv rehash
