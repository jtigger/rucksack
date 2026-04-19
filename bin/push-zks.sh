#!/usr/bin/env bash
set -euo pipefail

current_repo=""
trap 'echo "FAILED in: ${current_repo:-<none>}" >&2' ERR

set -x

ZK_GLOBS=(
  ~/workspace/jtigger/*-zk
  ~/workspace/johnnycyberseed/*-zk
)

shopt -s nullglob
for glob in "${ZK_GLOBS[@]}"; do
  for repo in $glob; do
    current_repo="$repo"
    cd "$repo"

    if [ -n "$(git status --porcelain)" ]; then
      git add -A
      msg=$(git diff --cached | claude -p --model haiku "Write a single conventional commit message (https://www.conventionalcommits.org/) summarizing these changes to a Logseq knowledge graph. Output ONLY the commit message — no preamble, no code fences.")
      git commit -m "$msg"
    fi

    git push
  done
done
