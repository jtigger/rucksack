echo "sourcing ${BASH_SOURCE[0]}..."

source "$HOME/rucksack/bash/.bashrc.d/tailscale"
source "$HOME/rucksack/bash/.bashrc.d/bun"
source "$HOME/.cargo/env"

# enable command-line launch of idea (e.g. to use the diff tool)
export PATH="$PATH:/Applications/IntelliJ IDEA CE.app/Contents/MacOS" 

if [[ -r ~/workspace/kdp/mf2/.local/.bashrc ]]; then
  source ~/workspace/kdp/mf2/.local/.bashrc
fi
