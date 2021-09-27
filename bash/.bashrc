export BASH_SILENCE_DEPRECATION_WARNING=1

source "$HOME/rucksack/bash/.bashrc.d/aliases"
source "$HOME/rucksack/bash/.bashrc.d/solarize"
# source `history` before `prompt` to keep all shell history in-sync.
source "$HOME/rucksack/bash/.bashrc.d/history"
source "$HOME/rucksack/bash/.bashrc.d/prompt"
source "$HOME/rucksack/bash/.bashrc.d/completion"
source "$HOME/rucksack/bash/.bashrc.d/lscolors"
source "$HOME/rucksack/bash/.bashrc.d/fzf"

source "$HOME/rucksack/golang/.bashrc"

export BAT_THEME="Solarized (light)"

export PATH="$PATH:$HOME/rucksack/bin"
export PATH="$PATH:$HOME/workspace/k14s/bin"

# Wasmer
export WASMER_DIR="/Users/jtigger/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"
