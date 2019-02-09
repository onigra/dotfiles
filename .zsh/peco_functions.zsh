###
#
# zsh history
# http://blog.kenjiskywalker.org/blog/2014/06/12/peco/
#
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

###
#
# bundler管理下にあるgemのディレクトリに移動
# http://qiita.com/joker1007/items/2410529b8f4e2a2cbde9
#
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

##
#
# by cool-peco
# https://github.com/ryoppy/cool-peco
#
function _cool-peco-on-complete() {
  if zle; then
    BUFFER=$1
    CURSOR=$#BUFFER
    zle clear-screen
  else
    print -z $1
  fi
}

##
#
# file name search
#
function peco-file-search() {
  local res
  res=$(find . -name "*${1}*" | grep -v "/\." | peco)
  _cool-peco-on-complete $res
}

##
# select branch, and checkout
#
function gcp() {
  local res
  local branch=$(git branch -a | peco | tr -d ' ')

  if [ -n "$branch" ]; then
    if [[ "$branch" =~ "remotes/" ]]; then
      local b=$(echo $branch | cut -d '/' -f 3-)
      res="git checkout -b ${b} ${branch}"
    else
      res="git checkout ${branch}"
    fi
  fi

  _cool-peco-on-complete "$res"
}

##
#
#
# select ssh host from ~/.ssh/config
#
function s() {
  local res
  res=$(grep "Host " ~/.ssh/config | grep -v '*' | cut -b 6- | peco)
  if [ -n "$res" ]; then
    _cool-peco-on-complete "ssh $res"
  fi
}

##
#
# select pid by `ps aux`
#
function psp() {
  local res
  res=$(ps aux | peco | awk '{print $2}')
  _cool-peco-on-complete $res
}

##
#
# select tmux session
#
function tmap() {
  local res
  res=$(tmux list-sessions | peco | awk -F':' '{print $1}')
  if [ -n "$res" ]; then
    _cool-peco-on-complete "tmux attach -t $res"
  fi
}

##
#
# select ec2
#
function ec2ssh() {
  local res
  res=$(aws ec2 describe-instances --filter Name=instance-state-name,Values=running | \
        jq -r '.Reservations[].Instances[] | {PrivateIpAddress, InstanceName: (.Tags[] | select(.Key=="Name").Value)} | [.PrivateIpAddress, .InstanceName] | @tsv' | \
        peco | awk -F' ' '{print $1}')
  if [ -n "$res" ]; then
    _cool-peco-on-complete "ssh $res"
  fi
}
