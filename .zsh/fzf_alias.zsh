# tomasr/molokai
local fzf_color_option='--color=bg+:#293739,bg:#1B1D1E,border:#808080,spinner:#E6DB74,hl:#7E8E91,fg:#F8F8F2,header:#7E8E91,info:#A6E22E,pointer:#A6E22E,marker:#F92672,fg+:#F8F8F2,prompt:#F92672,hl+:#F92672'

export FZF_DEFAULT_OPTS="--reverse --border --height=90% '${fzf_color_option}'"

# fzf で検索したファイルを vim で開く
function ffv() {
  local file
  file=$(find . -path "*/.git" -prune -o -type f -print | fzf)
  [[ -n "$file" ]] && vim "$file"
}

# git branch を fzf で検索してチェックアウト
function ffb() {
  local branches branch
  branches=$(git branch -vv) &&
    branch=$(echo "$branches" | fzf) &&
    git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# remote branch も含む git branch を fzf で検索してチェックアウト
function ffbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
    branch=$(echo "$branches" | fzf) &&
    git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# git branch を fzf で検索して削除
function ffbd() {
  local branches branch
  branches=$(git branch -vv) &&
    branch=$(echo "$branches" | fzf) &&
    git branch -df $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# ps を fzf で見て pid を標準出力に出す
function ffps() {
  local pid
  ps aux | fzf | awk '{print $2}'
}

# ghq で管理してるディレクトリに cd する
function e() {
  cd $(ghq list -p | fzf)
}
