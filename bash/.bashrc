export BASH_SILENCE_DEPRECATION_WARNING=1
if [[ $(arch) == "i386" ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
else
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

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
source "$HOME/rucksack/rancher-desktop/.bashrc"

export BAT_THEME="Solarized (dark)"
export BAT_PAGER="less --no-init --RAW-CONTROL-CHARS --quit-if-one-screen"

# Wasmer
export WASMER_DIR="/Users/jtigger/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ryanjo/google-cloud-sdk/path.bash.inc' ]; then . '/Users/ryanjo/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ryanjo/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/ryanjo/google-cloud-sdk/completion.bash.inc'; fi

# This can be removed after kubectl 1.26 is being used.
# Force kubectl to use the GKE authorization plugin rather than attempt baked-in auth code.
#   details: https://cloud.google.com/blog/products/containers-kubernetes/kubectl-auth-changes-in-gke
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
