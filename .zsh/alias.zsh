## sed
alias sed='gsed'

## ctags
alias ctags='/usr/local/bin/ctags'

# vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

## markdown書く時にMarkedで確認しながら編集できる設定
## http://blog.glidenote.com/blog/2013/01/10/vim-quickrun-marked/
alias marked='open -a Marked ; vi'

## diff
## colordiff: http://www.glidenote.com/archives/1403
alias diff='colordiff'
alias diffy='diff -y --suppress-common-lines'

## less
## colordiffの結果をパイプでlessとかに渡すとおかしなことになるので、
## -Rを付けるとちゃんとカラー表示される。
export LESS="-R"

## tmux
alias tm='tmux -2 new -s'
alias tml='tmux ls'
alias tmk='tmux kill-session -t'
alias tma='tmux -2 attach -t'
alias tmks='tmux kill-server'

## mysql
#alias mysql='mysql --pager='less -S''

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

function gw() {
  git commit --allow-empty -m "$1"
  git push origin $(current_branch)
  git pull-request -m "[WIP] $1"
}

function current_branch() {
  git rev-parse --abbrev-ref HEAD
}

## hub
## http://qiita.com/yaotti/items/a4a7f3f9a38d7d3415e3
function git(){hub "$@"}

## ls
alias ls='gls --color=auto'
alias ls='gls -la --color=auto'
alias la='ls -la --color=auto'
alias al='ls -la --color=auto'

## shasum
alias sha256="shasum -a 256"

## wget
alias wgets='wget --no-check-certificate'

## postgresql
alias psql.start='pg_ctl -l /usr/local/var/postgres/server.log start'
alias psql.stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# brew upgdate
alias bupdate='brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup'
alias bupgrade='brew outdated | grep -v tmux | xargs brew upgrade'

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

# .ssh/conf.d/* を1つの .ssh/configにする関数
function sshconfig() {
  mv ~/.ssh/config{,.bak}
  cat ~/.ssh/conf.d/*.conf > ~/.ssh/config
}

alias redisd='redis-server /usr/local/etc/redis.conf'
