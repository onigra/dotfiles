#!/bin/sh

git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
mkdir -p ~/.rbenv/plugins
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/ianheggie/rbenv-binstubs ~/.rbenv/plugins/rbenv-binstubs
git clone https://github.com/amatsuda/gem-src.git ~/.rbenv/plugins/gem-src
git clone https://github.com/sstephenson/rbenv-default-gems.git ~/.rbenv/plugins/rbenv-default-gems

ln -s ~/dotfiles/default-gems ~/.rbenv/default-gems

# with-opt-dirはこれを参考.
# http://qiita.com/niwatako/items/1fd769d679ea6cd9a476
RUBY_CONFIGURE_OPTS="--enable-shared --disable-install-rdoc --with-opt-dir=$(brew --prefix libiconv)" rbenv install 2.3.1

rbenv global 2.3.1

