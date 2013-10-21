function github {
  if [ -d .git ]; then
    remotes=$(git remote -v | awk -F'git@github.com:' '{print $2}' | cut -d" " -f1)
    if [ -z "$remotes" ];
    then
      remotes=$(git remote -v | awk -F'github.com/' '{print $2}' | cut -d" " -f1)
    fi

    remote_url=$(echo $remotes | cut -d" " -f1)
    url="https://github.com/"
    url="${url}${remote_url}"
    open $url
  else
    echo "Not a git repo"
  fi;
}
