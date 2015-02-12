# zsh history
# http://blog.kenjiskywalker.org/blog/2014/06/12/peco/
function peco-select-history() {
  local tac

  if which tac > /dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi

  BUFFER=$(history -n 1 | \
    eval $tac | \
    peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# bundler管理下にあるgemのディレクトリに移動
# http://qiita.com/joker1007/items/2410529b8f4e2a2cbde9
function cdgem() {
  local gem_name=$(bundle list | sed -e 's/^ *\* *//g' | peco | cut -d \  -f 1)

  if [ -n "$gem_name" ]; then
    local gem_dir=$(bundle show ${gem_name})
    echo "cd to ${gem_dir}"
    cd $(bundle show ${gem_name})
  fi
}
zle -N cdgem
bindkey '^g' cdgem

# pecoの結果をvimで起動
function to_vim() {
  find . -name '*.rb' | peco | xargs -o /Applications/MacVim.app/Contents/MacOS/Vim
}
zle -N to_vim
bindkey '^v' to_vim

# pecoで絞り込んだ出力結果に対してコマンドを実行
function p() {
  peco | while read LINE; do $@ $LINE; done
}

# .ssh/configのHostをpecoで選ぶ関数
function s() {
  ssh $(awk '
    tolower($1)=="host" {
      for (i=2; i<=NF; i++) {
        if ($i !~ "[*?]") {
          print $i
        }
      }
    }
  ' ~/.ssh/config | sort | peco)
}
