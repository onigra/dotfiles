# PATH
export PATH="/usr/local/bin:/usr/local/sbin:/bin:/usr/sbin:/sbin:/usr/X11/bin:$PATH:"
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
export PATH="$(brew --prefix git)/share/git-core/contrib/diff-highlight:$PATH"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# nodebrew
# export PATH="$HOME/.nodebrew/current/bin:$PATH"

# golang
export GOPATH=$HOME
export PATH="$GOPATH/bin:$PATH"

# Java
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# phpbrew
[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc

# k8s
# export PATH="$HOME/kubernetes/platforms/darwin/amd64:$PATH"

# the Google Cloud SDK.
export PATH="$HOME/google-cloud-sdk/bin:$PATH"

# postgresql
export PGDATA=/usr/local/var/postgres
export PATH="$HOME/.composer/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"

if [ -f ~/.brew_api_token ]; then
  source ~/.brew_api_token
fi

# LANG
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

# EDITOR
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim

# direnv
eval "$(direnv hook zsh)"

