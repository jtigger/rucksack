
alias ll='ls -laF'

# ===- Shell History -===
HISTFILE=~/.zsh_history  # persist history to disk (not guaranteed without this)
HISTSIZE=10000           # entries to keep in memory per session
SAVEHIST=10000           # entries to write to HISTFILE (keep in sync with HISTSIZE)
setopt SHARE_HISTORY     # write+read history across all open terminals in real time
setopt HIST_IGNORE_DUPS  # skip saving a command if identical to the previous one
setopt HIST_IGNORE_SPACE # prefix a command with a space to keep it out of history

export PATH="$HOME/.local/bin:$PATH"

eval "$(starship init zsh)"
