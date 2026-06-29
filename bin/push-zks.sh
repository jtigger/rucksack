#!/usr/bin/env zsh
setopt errexit nounset pipefail

current_repo=""
trap 'echo "FAILED in: ${current_repo:-<none>}" >&2' ERR

zk_repos=(~/workspace/**/*-zk(N/))

commit_prompt='Write a single conventional commit message (https://www.conventionalcommits.org/) summarizing these changes to a Logseq knowledge graph.
Output ONLY the commit message — no preamble, no code fences.'

for repo in $zk_repos; do
  current_repo="${repo/#$HOME/~}"
  cd "$repo"

  if [ "$(git rev-parse --show-toplevel 2>/dev/null)" != "$repo" ]; then
    echo "⏩ ${current_repo}"
    continue
  fi

  if [ -n "$(git status --porcelain)" ]; then
    git add -A
    msg=$(git diff --cached | claude -p --model haiku "$commit_prompt")
    git commit -q -m "$msg"
  fi

  if [ -n "$(git log --oneline HEAD --not --remotes)" ]; then
    git push -q
    echo "📡 ${current_repo}"
  else
    echo "👌 ${current_repo}"
  fi
done
