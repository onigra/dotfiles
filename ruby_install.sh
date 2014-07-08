#!/bin/sh

git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
mkdir -p ~/.rbenv/plugins
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/ianheggie/rbenv-binstubs ~/.rbenv/plugins/rbenv-binstubs
git clone https://github.com/amatsuda/gem-src.git ~/.rbenv/plugins/gem-src

RUBY_CONFIGURE_OPTS="--enable-shared --with-readline-dir=$(brew --prefix readline) --with-openssl-dir=$(brew --prefix openssl)" rbenv install 2.1.2

rbenv global 2.1.2
rbenv rehash

gem i bundler pry td rspec powder httparty spring spring-commands-cucumber spring-commands-rspec spring-commands-testunit
rbenv rehash

