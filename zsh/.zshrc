
# ===- Core Aliases -===
alias l='ls -alFGh'     # all files; long form; non-file suffixes; colorize; human-readable sizes
alias ll='ls -alFGh'    # ^^
alias lll='ls -alFGh'   # ^^
alias lst='ls -FGahlt'  # ^^ and sort by date/time modified

alias cp='cp -vn'  # verbose; no overwriting
alias mv='mv -vn'  # verbose; no overwriting
alias rm='rm -vI'  # verbose; confirm if 3 or more files

alias du='du -h'   # human-readable sizes

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


export HELP_MODE=solicitous
# ===- Common Add-on Tooling -===
source "$HOME/rucksack/fzf/.zshrc"

eval "$(starship init zsh)"
