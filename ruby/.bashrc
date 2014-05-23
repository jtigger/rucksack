alias be='bundle exec'

# >>> Enable these if using RVM for Rubies management
#PS1_RUBY='$(~/.rvm/bin/rvm-prompt)'
# Add RVM to PATH for scripting
#PATH_RUBY=$HOME/.rvm/bin
# <<<

PS1_RUBY='(x.y.z)'
PATH_RUBY="$HOME/.rbenv/shims"

eval "$(rbenv init -)"
