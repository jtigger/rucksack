export BASH_SILENCE_DEPRECATION_WARNING=1

# baseline: project-independent tooling
source "$HOME/rucksack/bash/.bashrc.d/aliases"
source "$HOME/rucksack/bash/.bashrc.d/solarize"
# source `history` before `prompt` to keep history in-sync across shells.
source "$HOME/rucksack/bash/.bashrc.d/history"
source "$HOME/rucksack/bash/.bashrc.d/prompt"
source "$HOME/rucksack/bash/.bashrc.d/completion"
source "$HOME/rucksack/bash/.bashrc.d/lscolors"
source "$HOME/rucksack/bash/.bashrc.d/fzf"
export PATH="$PATH:$HOME/rucksack/bin"

source "$HOME/rucksack/golang/.bashrc"
source "$HOME/rucksack/carvel/.bashrc"

export BAT_THEME="Solarized (light)"

export PATH="$PATH:$HOME/workspace/k14s/bin"

# Wasmer
export WASMER_DIR="/Users/jtigger/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"
