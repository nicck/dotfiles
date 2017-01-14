function github {
  if [ -d .git ]; then
    remotes=$(git remote -v | awk -F'git@github.com:' '{print $2}' | cut -d" " -f1)
    if [ -z "$remotes" ];
    then
      remotes=$(git remote -v | awk -F'github.com/' '{print $2}' | cut -d" " -f1)
    fi

    remote_url=$(echo $remotes | cut -d" " -f1)
    remote_url=$(echo $remote_url | awk -F'\.git' '{print $1}')

    branch=$(git branch | grep '*' | awk -F'\\* ' '{print $2}')

    url="https://github.com/"
    url="${url}${remote_url}/tree/${branch}"
    open $url
  else
    echo "Not a git repo"
  fi;
}
