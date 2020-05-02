export BASH_SILENCE_DEPRECATION_WARNING=1

source "$HOME/rucksack/bash/.bashrc.d/aliases"
source "$HOME/rucksack/bash/.bashrc.d/solarize"
# source `history` before `prompt` to keep all shell history in-sync.
source "$HOME/rucksack/bash/.bashrc.d/history"
source "$HOME/rucksack/bash/.bashrc.d/prompt"
source "$HOME/rucksack/bash/.bashrc.d/completion"
source "$HOME/rucksack/bash/.bashrc.d/lscolors"

source "$HOME/rucksack/golang/.bashrc"

export PATH="$PATH:$HOME/rucksack/bin"

# https://mike.place/2017/fzf-fd/
FIND_ALL_ITEMS_IN_HOME="fd"
FIND_ALL_DIRS_IN_HOME="fd --type d"
export FZF_DEFAULT_COMMAND="$FIND_ALL_ITEMS_IN_HOME"
export FZF_CTRL_T_COMMAND="$FIND_ALL_ITEMS_IN_HOME"
export FZF_ALT_C_COMMAND="$FIND_ALL_DIRS_IN_HOME"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
