export NVM_DIR=~/.nvm

nvm_command=$(brew --prefix nvm)/nvm.sh
[ -f $nvm_command ] && source $nvm_command

completion=/usr/local/etc/bash_completion.d/nvm
[ -f $completion ] && source $completion
