# https://github.com/kadaan/zsh-rbenv-lazy

# rbenv
if type rbenv &> /dev/null; then
  local RBENV_SHIMS="${RBENV_ROOT:-${HOME}/.rbenv}/shims"
  export PATH="${RBENV_SHIMS}:${PATH}"
  source $(whence -p rbenv)/../../completions/rbenv.zsh

  function rbenv() {
    unset -f rbenv > /dev/null 2>&1
    eval "$(command rbenv init -)"
    rbenv "$@"
  }
fi

# ndenv
if type ndenv &> /dev/null; then
  local NDENV_SHIMS="${NDENV_ROOT:-${HOME}/.ndenv}/shims"
  export PATH="${NDENV_SHIMS}:${PATH}"
  source $(whence -p ndenv)/../../completions/ndenv.zsh

  function ndenv() {
    unset -f ndenv > /dev/null 2>&1
    eval "$(command ndenv init -)"
    ndenv "$@"
  }
fi

# pyenv
if type pyenv &> /dev/null; then
  local PYENV_SHIMS="${PYENV_ROOT:-${HOME}/.pyenv}/shims"
  export PATH="${PYENV_SHIMS}:${PATH}"
  source $(whence -p pyenv)/../../completions/pyenv.zsh

  function pyenv() {
    unset -f pyenv > /dev/null 2>&1
    eval "$(command pyenv init -)"
    pyenv "$@"
  }
fi


# jenv
if type jenv &> /dev/null; then
  local JENV_SHIMS="${JENV_ROOT:-${HOME}/.jenv}/shims"
  export PATH="${JENV_SHIMS}:${PATH}"

  function jenv() {
    unset -f jenv > /dev/null 2>&1
    eval "$(command jenv init -)"
    jenv "$@"
  }
fi

