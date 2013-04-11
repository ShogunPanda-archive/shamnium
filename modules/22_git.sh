if [ "$(which git)" != "" ]; then
  git config --global alias.fbn '! git symbolic-ref HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null'
  git config --global alias.bn '! git fbn | sed "s#refs/heads/##"'
  git config --global alias.task '! git bn | sed -E "s/(.+)-([0-9]+)$/\2/g"'
fi

git_prompt(){
  branch=$(git bn)
  revision=$(git rev-parse --short HEAD)
  [ "${branch}" != "" ] && echo " (${branch}@${revision})"
}