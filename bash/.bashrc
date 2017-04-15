alias l='ls -laF'
alias ll='ls -laF'
alias p='ping www.google.com'
alias hidehiddenfiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
alias showhiddenfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'

alias efreal='exercism configure --dir=/Users/jtigger/projects/exercism-tracks && cd /Users/jtigger/projects/exercism-tracks'
alias eftest='exercism configure --dir=/Users/jtigger/projects/exercism-test && cd /Users/jtigger/projects/exercism-test'
alias ef='exercism fetch'

source "$RUCKSACK_HOME/bash/solarize"
