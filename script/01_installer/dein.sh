#!/bin/sh

mkdir -p ~/.cache
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
rm installer.sh

