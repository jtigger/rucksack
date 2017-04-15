# .bashrc-git
alias gg='git gp'
alias lg='git lg'
alias gst='git status'
alias gds='git diff --staged'
alias gitst='git status'
alias gitd='git diff --staged'

parse_git_branch() {
git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1_GIT='$(parse_git_branch)'

