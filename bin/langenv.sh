#!/bin/sh

# rbenv
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
mkdir -p ~/.rbenv/plugins
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/ianheggie/rbenv-binstubs ~/.rbenv/plugins/rbenv-binstubs
git clone https://github.com/amatsuda/gem-src.git ~/.rbenv/plugins/gem-src
git clone https://github.com/sstephenson/rbenv-default-gems.git ~/.rbenv/plugins/rbenv-default-gems
ln -s ~/dotfiles/default-gems ~/.rbenv/default-gems

# ndenv
git clone https://github.com/riywo/ndenv ~/.ndenv
git clone https://github.com/riywo/node-build.git ~/.ndenv//plugins/node-build

# pyenv
git clone git@github.com:pyenv/pyenv.git ~/.pyenv

