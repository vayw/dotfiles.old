mkd() {
  mkdir -p $1 && cd $1
}

gitp() {
  current_branch=$(git branch --show-current)
  git push --set-upstream origin $current_branch
}
