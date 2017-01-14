alias ll='ls -hla'
alias reload!='. ~/.profile'
alias binstubs='export PATH=./bin:${PATH%:./bin}'
alias gif-optimize-64='gifsicle --colors=64 --optimize=3 '
alias gif-optimize-32='gifsicle --colors=32 --optimize=3'
alias cask='brew cask'
alias memcache-stats='echo stats | nc 127.0.0.1 11211'
alias memcache-stats-watch='watch -d "echo stats | nc 127.0.0.1 11211 | grep -E \"get|set|miss|hit\""'
alias fix-upwork-app="/usr/libexec/PlistBuddy -c 'Add :NSSupportsAutomaticGraphicsSwitching bool YES' /Applications/Upwork.app/Contents/Info.plist"
alias weather="curl http://wttr.in"
alias df="df -H"
