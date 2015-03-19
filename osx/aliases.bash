# brew install afsctool
alias packfs='afsctool -c -7 -m 10485760 -s 10 -v'
alias packfs!='sudo afsctool -c -7 -m 10485760 -s 10 -v'
alias wifi='networksetup -setairportpower airport off && networksetup -setairportpower airport on'
alias dns-flush='sudo killall -HUP mDNSResponder'
