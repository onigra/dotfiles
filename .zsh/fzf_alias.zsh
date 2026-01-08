export FZF_DEFAULT_OPTS='--reverse --border'

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
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}
