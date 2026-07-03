# ===- Core Aliases -===
alias l='ls -alFGh'     # all files; long form; non-file suffixes; colorize; human-readable sizes
alias ll='ls -alFGh'    # ^^
alias lll='ls -alFGh'   # ^^
alias lst='ls -FGahlt'  # ^^ and sort by date/time modified

alias cp='cp -vn'  # verbose; no overwriting
alias mv='mv -vn'  # verbose; no overwriting
alias rm='rm -vI'  # verbose; confirm if 3 or more files

alias du='du -h'   # human-readable sizes
alias ws='cd ~/workspace' 

# ===- Shell History -===
HISTFILE=~/.zsh_history  # persist history to disk (not guaranteed without this)
HISTSIZE=10000           # entries to keep in memory per session
SAVEHIST=10000           # entries to write to HISTFILE (keep in sync with HISTSIZE)
setopt SHARE_HISTORY     # write+read history across all open terminals in real time
setopt HIST_IGNORE_DUPS  # skip saving a command if identical to the previous one
setopt HIST_IGNORE_SPACE # prefix a command with a space to keep it out of history

# ===- Core PATH -===
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/rucksack/bin"
export PATH="$PATH:$HOME/rucksack/OSX/bin"

# ===- Common Add-on Tooling -===
export HELP_MODE=solicitous
source "$HOME/rucksack/fzf/.zshrc"

eval "$(starship init zsh)"   # configure shell prompt
eval "$(mise activate zsh)" && [[ ${HELP_MODE} == "solicitous" ]] && echo "⚡ mise"    # tool/env switcher
eval "$(direnv hook $SHELL)" && [[ ${HELP_MODE} == "solicitous" ]] && echo "⚡ direnv" # env switcher

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=($HOME/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

[[ -f ~/$(hostname).zshrc ]] && source ~/$(hostname).zshrc || echo "(no machine-specific config detected for \"$(hostname)\".)"

