completion=/usr/local/etc/bash_completion.d/npm

if test -f $completion
then
  source $completion
fi

# [[ `which npm` ]] && eval "$(npm completion -)"
