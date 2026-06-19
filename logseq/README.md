# logseq

## Install

1. Install app
2. Link in graph-independent config

   ```console
   $ mkdir -p ~/.logseq
   $ cd ~/.logseq
   $ ln -s ~/rucksack/logseq/config .
   $ ln -s ~/rucksack/logseq/plugins .
   $ ln -s ~/rucksack/logseq/settings .
   $ ln -s ~/rucksack/logseq/preferences.json .
   ```

## Connecting a Graph to a GitHub Repo

1. Create new graph
2. Add identity to (under `~/.logseq/git/.../.git/config`)
   ```
   [include]
     path = ~/rucksack/git/.gitconfig-ident-(username)
   ```
3. Create empty repo in GitHub
4. Add remote to local clone

