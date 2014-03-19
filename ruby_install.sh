#!/bin/sh

git clone https://github.com/sstephenson/rbenv.git
mkdir -p ~/.rbenv/plugins
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

source ~/.zshrc

RUBY_CONFIGURE_OPTS="--enable-shared --with-readline-dir=$(brew --prefix readline) --with-openssl-dir=$(brew --prefix openssl)" rbenv install 2.1.1

rbenv global 2.1.1
rbenv rehash

gem i bundler pry td rspec powder spring spring-commands-cucumber spring-commands-rspec spring-commands-testunit

