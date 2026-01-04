#################
# 環境変数
#################

path=(
  "/usr/local/bin"
  "/usr/local/sbin"
  "/usr/bin"
  "/usr/sbin"
  "/bin"
  "/sbin"
  "$HOME/google-cloud-sdk/bin"
)

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
# brew installの時に勝手にアップデートしないようにする
export HOMEBREW_NO_AUTO_UPDATE=1

# LANG
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

# EDITOR
export EDITOR="nvim"

# 単語区切りの調整
# http://polamjag.hatenablog.jp/entry/2013/11/19/003727
export WORDCHARS="*?_-.[]~&;=!#$%^(){}<>"

# less
# colordiffの結果をパイプでlessとかに渡すとおかしなことになるので、
# -Rを付けるとちゃんとカラー表示される。
export LESS="-R"

# Golang
export GOPATH=$HOME
export PATH="$GOPATH/bin:$PATH"

#################
# 基本設定
#################
setopt prompt_subst
setopt nobeep
setopt list_types
setopt auto_list
setopt auto_menu
setopt hist_verify
setopt auto_param_slash
setopt mark_dirs
setopt null_glob
setopt nonomatch # http://shirusu-ni-tarazu.hatenablog.jp/entry/2013/01/18/034233

autoload -Uz colors; colors
autoload -Uz compinit; compinit
autoload -Uz vcs_info

ulimit -n 1024

# 重複パスを登録しない
typeset -U path cdpath fpath manpath PATH

#################
# alias
#################
source ~/dotfiles/.zsh/alias.zsh
source ~/dotfiles/.zsh/peco_functions.zsh
source ~/dotfiles/.zsh/bd.zsh # http://blog.glidenote.com/blog/2014/05/15/zsh-bd/

# travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

# 仕事で使うaliasはdev_alias.zshに入れる
[ -f ~/.zsh/dev_alias.zsh ] && source ~/.zsh/dev_alias.zsh

#################
# プロンプト
#################
# 参考リンク
# http://www.sakito.com/2011/11/zsh.html

### Base
l_prompt="%{${fg_bold[red]}%} $ %{${reset_color}%}"
r_prompt="%F{blue} %D{%Y-%m-%d %H:%M:%S %Z} %1(v|%F{red}%1v%f|) %{${fg_bold[green]}%}[%(5~,%-2~/.../%2~,%~)] %{${reset_color}%}"

# 入力ミス時に出るやつ
s_prompt="%{${fg_bold[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

### root
root_l_prompt="%{${fg_bold[red]}%}% root %{${reset_color}%}"

# rootユーザ時(太字にし、アンダーバーをつける)
if [ ${UID} -eq 0 ]; then
  l_prompt="%B%U${l_prompt}%u%b"
  root_l_prompt="%B%U${root_l_prompt}%u%b"
  r_prompt="%B%U${r_prompt}%u%b"
  s_prompt="%B%U${s_prompt}%u%b"
fi

PROMPT=$l_prompt       # 通常のプロンプト
PROMPT2=$root_l_prompt # セカンダリのプロンプト(コマンドが2行以上の時に表示される)
RPROMPT=$r_prompt      # 右側のプロンプト
SPROMPT=$s_prompt      # スペル訂正用プロンプト

# vcs_info
# http://d.hatena.ne.jp/mollifier/20090814/p1
zstyle ':vcs_info:*' formats '(%b)'
zstyle ':vcs_info:*' actionformats '(%b)[%a]'

precmd () {
  zstyle ':vcs_info:git:*:-all-' command git
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

#################
# 補完
#################
eval "$(gdircolors)"

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} # Tab補完で表示される候補の色をlsと同じ色にする
zstyle ':completion:*:default' menu select=1
zstyle :compinstall filename '~/.zshrc'

# http://d.hatena.ne.jp/ganaware/20130514/1368501120
# ほとんどの補完の定義を削除する。
# special contexts の定義のみ残す (see: man zshcompsys)
fix_comp_assoc() {
  local var=$1
  shift
  for key in "$argv[@]"; do
    case $key in
    -redirect-,\<,*) unset "${var}[$key]";;
    -redirect-,\>,*) unset "${var}[$key]";;
    -value-,-*) ;;
    -value-,*) unset "${var}[$key]";;
    -*) ;;
    *) unset "${var}[$key]";;
    esac
  done
}

# fix_comp_assoc _comps        "${(k)_comps[@]}"
fix_comp_assoc _services     "${(k)_services[@]}"
fix_comp_assoc _patcomps     "${(k)_patcomps[@]}"
fix_comp_assoc _postpatcomps "${(k)_postpatcomps[@]}"

#################
# コマンド履歴
#################
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history
setopt hist_ignore_space

# 不要なコマンドを残さない
# http://mollifier.hatenablog.com/entry/20090728/p1
zshaddhistory() {
  local line=${1%%$'\n'}
  local cmd=${line%% *}

  [[  ${cmd} != (l|l[sal])
      && ${cmd} != (cd)
      && ${cmd} != (r[m])
  ]]
}

eval "$(mise activate zsh)"

