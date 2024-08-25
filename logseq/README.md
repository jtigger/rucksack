# logseq

## Install

1. Install app
2. Plugins
   - logseq-mermaid-plugin
   - logseq-move-block
   - logseq-tabs
   - logseq-vim-shortcuts
3. Create space for my extensions of plugin config

   ```console
   $ cd ~/.logseq
   $ ln -s ~/rucksack/logseq/plugins .
   $ ln -s ~/rucksack/logseq/settings .
   $ ln -s ~/rucksack/logseq/etc .
   $ ln -s ~/rucksack/logseq/preferences.json .
   ```
4. Download mermaid ink server

   ```console
   $ cd ~/.logseq
   $ mkdir -p local/mermaid && cd local/mermaid
   $ git clone https://github.com/jihchi/mermaid.ink
   $ cd mermaid.ink
   $ npm install && npm start
   ```
   Listens on port 3000

## Connecting a Graph to a GitHub Repo

1. Create new graph
2. Add identity to (under `~/.logseq/git/.../.git/config`)
   ```
   [include]
     path = ~/rucksack/git/.gitconfig-ident-(username)
   ```
3. Create empty repo in GitHub
4. Add remote to local clone
5. Soft-link in the git hooks:
   ```
   (in .git/config/hooks)
   ln -s ~/rucksack/logseq/git/hooks/pre-commit .
   ln -s ~/rucksack/logseq/git/hooks/post-commit .
   ```
6. Prime the pump:
   ```
   (in the root of the git repo)
   git push -u origin main
   ```

