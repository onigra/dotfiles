#!/bin/sh

git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
mkdir -p ~/.rbenv/plugins
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/ianheggie/rbenv-binstubs ~/.rbenv/plugins/rbenv-binstubs
git clone https://github.com/amatsuda/gem-src.git ~/.rbenv/plugins/gem-src
git clone https://github.com/sstephenson/rbenv-default-gems.git ~/.rbenv/plugins/rbenv-default-gems

ln -s ~/dotfiles/default-gems ~/.rbenv/default-gems

RUBY_CONFIGURE_OPTS="--enable-shared --with-readline-dir=$(brew --prefix readline) --with-openssl-dir=$(brew --prefix openssl) --with-opt-dir=$(brew --prefix libiconv)" rbenv install 2.1.5

rbenv global 2.1.5
rbenv rehash

