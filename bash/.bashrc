echo "sourcing ~/.bashrc"
# I get it, zsh is the default shell; going all-in on bash 5.x+
export BASH_SILENCE_DEPRECATION_WARNING=1
export DARK_MODE=true
export EDITOR=vim

# many/most tools are installed through brew; to find them, initialize brew env, first.
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
source "$HOME/rucksack/bash/.bashrc.d/tailscale"
source "$HOME/rucksack/bash/.bashrc.d/bun"
source "$HOME/rucksack/bash/.bashrc.d/claude-code"

export PATH="$PATH:$HOME/rucksack/bin"
export PATH="$PATH:$HOME/rucksack/OSX/bin"

# enable asdf
source "$(brew --prefix)/opt/asdf/libexec/asdf.sh"

# configure bat
#export DARK_MODE=dark
if [[ -z ${DARK_MODE+x} ]]; then
  export BAT_THEME="Solarized (light)"
else
  export BAT_THEME="Solarized (dark)"
fi
export BAT_PAGER="less --no-init --RAW-CONTROL-CHARS --quit-if-one-screen"


# machine-specific config
if [[ -f "$HOME/rucksack/bash/$(hostname).bashrc" ]]; then
  source "$HOME/rucksack/bash/$(hostname).bashrc"
else
  echo "(warning: no custom .bashrc found for $(hostname); using common bash setup)"
fi

source "$HOME/.cargo/env"
