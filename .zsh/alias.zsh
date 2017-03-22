#################
# function
#################
# cd後自動でlsする
function chpwd() { gls -la --color=auto }

# 現在のブランチを取得
function current_branch() {
  git rev-parse --abbrev-ref HEAD
}

function gw() {
  git commit --allow-empty -m "$1"
  git push origin $(current_branch)
  git pull-request -m "[WIP] $1"
}

# http://blog.kazuhooku.com/2017/03/peco.html
function pero-func() {
  exec ag "$@" . | peco --exec 'awk -F : '"'"'{print "+" $2 " " $1}'"'"' | xargs less '
}

# hub
# http://qiita.com/yaotti/items/a4a7f3f9a38d7d3415e3
function git(){hub "$@"}

#################
# alias
#################
alias pero=pero-func

# sed
alias sed='gsed'

## ctags
alias ctags='/usr/local/bin/ctags'

# vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

## diff
## colordiff: http://www.glidenote.com/archives/1403
alias diff='colordiff'
alias diffy='diff -y --suppress-common-lines'

## tmux
alias tm='tmux -2u new -s'
alias tml='tmux ls'
alias tmk='tmux kill-session -t'
alias tma='tmux -2 attach -t'
alias tmks='tmux kill-server'

## memcached
alias mem='memcached -u memcached -d'

## bundler
alias be='bundle exec'
alias bi='bundle install --path vendor/bundle --binstubs .bundle/bin -j 10'
alias bu='bundle update'

## git
alias gch='git checkout HEAD'
alias gst='git status'
alias gca='git commit -a'
alias gpo='git push origin master'
alias gpc='git push origin $(current_branch)'
alias gdf='git diff'
alias gb='git branch'
alias gc='git checkout'
alias ga='git add --all'

# ls
alias ls='gls --color=auto'
alias ls='gls -la --color=auto'
alias la='ls -la --color=auto'
alias al='ls -la --color=auto'

# shasum
alias sha256="shasum -a 256"

# wget
alias wgets='wget --no-check-certificate'

# postgresql
alias psql.start='pg_ctl -l /usr/local/var/postgres/server.log start'
alias psql.stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# brew upgdate
alias bupdate='brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup'

# ghq
alias e='ghq list -p | ag -v vendor | p cd'
alias gg='ghq get'

# rails
alias rc='rails c'
alias rs='rails s'
alias rd='rails db'

# docker
alias dl='docker ps -l -q'

# タグ無しのimageを取得する
alias dnotag="docker images | awk '/^<none>/ { print $3 }'"

# redis
alias redisd='redis-server /usr/local/etc/redis.conf'
alias rails-cli='~/.rails/.bundle/bin/rails'
alias rails-new="~/.rails/.bundle/bin/rails new $1 --skip-bundle"

