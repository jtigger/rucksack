#!/usr/bin/env bash -euo pipefail

set -x

zks="johnnycyberseed_ibm-zk jtigger_ai-zk jtigger_pete-holmes-zk"

for zk in $zks; do
  echo $zk
  pushd ~/.logseq/git/_Users_johnnycyberseed_workspace_${zk}/
  git push
  popd
done

