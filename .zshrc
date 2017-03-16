##### 環境変数

# 単語区切りの調整
# http://polamjag.hatenablog.jp/entry/2013/11/19/003727
export WORDCHARS="*?_-.[]~&;=!#$%^(){}<>"

##### 補完の設定
export ZLS_COLORS=$LS_COLORS

if [ -n "$LS_COLORS" ]; then
  zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
fi

zstyle ':completion:*:default' menu select=1
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit

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

fix_comp_assoc _comps        "${(k)_comps[@]}"
fix_comp_assoc _services     "${(k)_services[@]}"
fix_comp_assoc _patcomps     "${(k)_patcomps[@]}"
fix_comp_assoc _postpatcomps "${(k)_postpatcomps[@]}"

##### zsh setting
setopt prompt_subst
setopt nobeep
setopt list_types
setopt auto_list
setopt auto_menu
setopt hist_verify
setopt auto_param_slash
setopt mark_dirs
setopt null_glob

# コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
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

# http://shirusu-ni-tarazu.hatenablog.jp/entry/2013/01/18/034233
setopt nonomatch

##### auto-fu
# if [ -f ~/.zsh/auto-fu.zsh/auto-fu.zsh ]; then
#   source ~/.zsh/auto-fu.zsh/auto-fu.zsh
#   function zle-line-init () {
#       auto-fu-init
#   }
#   zle -N zle-line-init
#   zstyle ':completion:*' completer _oldlist _complete
# fi

##### vcs_info
# http://d.hatena.ne.jp/mollifier/20090814/p1
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%b)'
zstyle ':vcs_info:*' actionformats '(%b)[%a]'

precmd () {
  zstyle ':vcs_info:git:*:-all-' command /usr/local/bin/git
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

##### cd後自動でlsする
function chpwd() { gls -la --color=auto }

##### Prompt
# http://www.sakito.com/2011/11/zsh.html
autoload -U colors; colors

l_prompt="%{${fg_bold[red]}%} $ %{${reset_color}%}"
r_prompt="%F{blue} %D{%Y-%m-%d %H:%M:%S %Z} %1(v|%F{red}%1v%f|) %{${fg_bold[green]}%}[%(5~,%-2~/.../%2~,%~)] %{${reset_color}%}"

# 入力ミス時に出るやつ
s_prompt="%{${fg_bold[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

# root時
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

##### alias
[ -f ~/dotfiles/.zsh/alias.zsh ] && source ~/dotfiles/.zsh/alias.zsh

if [ -f ~/.zsh/dev_alias.zsh ]; then
  source ~/.zsh/dev_alias.zsh
fi

# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

# peco
[ -f ~/dotfiles/.zsh/peco_functions.zsh ] && source ~/dotfiles/.zsh/peco_functions.zsh

# bd
[ -f ~/dotfiles/.zsh/bd.zsh ] && source ~/dotfiles/.zsh/bd.zsh

ulimit -n 1024

agent="$HOME/.ssh/agent"
if [ -S "$SSH_AUTH_SOCK" ]; then
  case $SSH_AUTH_SOCK in
  /private/tmp/com.apple.launchd.*/Listeners )
      ln -snf "$SSH_AUTH_SOCK" $agent && export SSH_AUTH_SOCK=$agent ;;
  esac
elif [ -S $agent ]; then
  export SSH_AUTH_SOCK=$agent
else
  echo "no ssh-agent"
fi

