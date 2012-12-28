# ------------------------------
# General Settings
# ------------------------------
## Environment variable configuration
##
## LANG
## http://curiousabt.blog27.fc2.com/blog-entry-65.html
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

## コマンド入力補完
if [ -f ~/.zsh/auto-fu.zsh ]; then
    source ~/.zsh/auto-fu.zsh
    function zle-line-init () {
        auto-fu-init
    }
    zle -N zle-line-init
    zstyle ':completion:*' completer _oldlist _complete
fi

## コマンドのオプションを表示
#autoload -U compinit
#compinit

## cd後自動でlsする
function chpwd() { ls -la }

## ctags
alias ctags='/usr/local/bin/ctags'

## エディタ(vim)
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

## diff
## colordiff: http://www.glidenote.com/archives/1403
alias difc='colordiff -w'
alias dify='diff -y --suppress-common-lines'

## less
## colordiffの結果をパイプでlessとかに渡すとおかしなことになるので、
## -Rを付けるとちゃんとカラー表示される。
export LESS="=R"

## tmux
alias tm='tmux -2'
alias tml='tmux ls'
alias tmk='tmux kill-session -t'
alias tma='tmux attach -t'

## mysql
alias mysql='mysql --pager='less -S''

## command edit
alias ls='ls -la'
alias la='ls -la'

## コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

# ------------------------------
# gitブランチとステータスの表示
# ------------------------------
## http://d.hatena.ne.jp/mollifier/20090814/p1
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%b)'
zstyle ':vcs_info:*' actionformats '(%b)[%a]'

precmd () {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

# ------------------------------
# Look And Feel Settings
# ------------------------------
# Terminal Colorの設定
export LSCOLORS=ExFxCxDxBxegedabagacad

# 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# ZLS_COLORSとは？
export ZLS_COLORS=$LS_COLORS

# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true

# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

### Prompt ###
# プロンプトに色を付ける
# http://www.sakito.com/2011/11/zsh.html
autoload -U colors; colors

# 一般ユーザ時
tmp_prompt="%{${fg[cyan]}%}%m%# %{${reset_color}%}"
tmp_prompt2="%{${fg[cyan]}%}%_> %{${reset_color}%}"
tmp_rprompt="%1(v|%F{magenta}%1v%f|)%{${fg[green]}%}[%(5~,%-2~/.../%2~,%~)]%{${reset_color}%}"
tmp_sprompt="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

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


# ------------------------------
# Programing Setting
# ------------------------------
### Ruby ###

# rbenv
eval "$(rbenv init -)"
