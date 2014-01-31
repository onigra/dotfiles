##### 環境変数
# PATH
export PATH="/usr/local/bin:/usr/local/sbin:/bin:/usr/sbin:/sbin:/usr/X11/bin:$PATH"
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
export PATH="$(brew --prefix git)/share/git-core/contrib/diff-highlight:$PATH"

# the Google Cloud SDK.
export PATH="$HOME/google-cloud-sdk/bin:$PATH"

# if [ -f ~/google-cloud-sdk/arg_rc ]; then
#   source ~/google-cloud-sdk/arg_rc
# fi

if [ -f ~/.brew_api_token ]; then
  source ~/.brew_api_token
fi

# LANG
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8
# EDITOR
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# phpenv
# export PATH="$HOME/.phpenv/bin:$PATH"
# eval "$(phpenv init -)"

##### colors
export LSCOLORS=ExFxCxDxBxegedabagacad
eval $(gdircolors ~/.zsh/dircolors-solarized/dircolors.256dark)

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

# zshが悪さしないように
# http://shirusu-ni-tarazu.hatenablog.jp/entry/2013/01/18/034233
setopt nonomatch

##### auto-fu
if [ -f ~/.zsh/auto-fu.zsh/auto-fu.zsh ]; then
    source ~/.zsh/auto-fu.zsh/auto-fu.zsh
    function zle-line-init () {
        auto-fu-init
    }
    zle -N zle-line-init
    zstyle ':completion:*' completer _oldlist _complete
fi

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

# rubyのバージョン出す
rbenv_version() {
  echo -n "${$(rbenv version)%% *}"
}

# 一般ユーザ時
tmp_prompt="%{${fg_bold[red]}%}( ꒪﹃ ꒪) $(rbenv_version) > %{${reset_color}%}"
tmp_prompt2="%{${fg_bold[red]}%}%_> %{${reset_color}%}"
tmp_rprompt="%1(v|%F{magenta}%1v%f|)%{${fg_bold[green]}%}[%(5~,%-2~/.../%2~,%~)]%{${reset_color}%}"
tmp_sprompt="%{${fg_bold[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

# rootユーザ時(太字にし、アンダーバーをつける)
if [ ${UID} -eq 0 ]; then
  tmp_prompt="%B%U${tmp_prompt}%u%b"
  tmp_prompt2="%B%U${tmp_prompt2}%u%b"
  tmp_rprompt="%B%U${tmp_rprompt}%u%b"
  tmp_sprompt="%B%U${tmp_sprompt}%u%b"
fi

PROMPT=$tmp_prompt    # 通常のプロンプト
PROMPT2=$tmp_prompt2  # セカンダリのプロンプト(コマンドが2行以上の時に表示される)
RPROMPT=$tmp_rprompt  # 右側のプロンプト
SPROMPT=$tmp_sprompt  # スペル訂正用プロンプト

##### alias
[ -f ~/dotfiles/.zsh/.zshrc.alias ] && source ~/dotfiles/.zsh/.zshrc.alias

if [ -f "$(which dvm)" ]; then
  eval "$(dvm env)"
fi

