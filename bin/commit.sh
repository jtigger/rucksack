#!/bin/bash

set -e
set -x

BY_ME=false
for arg in "$@"; do
  if [ "$arg" = "--by-me" ]; then
    BY_ME=true
  fi
done

DIFF=$(git diff --staged)

if [ -z "$DIFF" ]; then
  echo "Error: No staged changes to commit"
  exit 1
fi

COMMIT_MESSAGE=$(claude -p --model haiku "Generate a concise git commit message in Conventional Commits format for the following staged changes. Start with a type (feat, fix, docs, style, refactor, perf, test, chore, etc.), include a scope in parentheses if applicable, and a short imperative description (50 chars max). If the commit is sufficiently complicated, include a commit body containing high-level summary of the changes. Return ONLY the commit message; not code fences.

Staged diff:
${DIFF}")

if [ -z "$COMMIT_MESSAGE" ]; then
  echo "Error: Failed to generate commit message"
  exit 1
fi

if [ "$BY_ME" = false ]; then
  COMMIT_MESSAGE="${COMMIT_MESSAGE}

Co-authored-by: Claude <noreply@anthropic.com>"
fi

git commit -m "${COMMIT_MESSAGE}"
