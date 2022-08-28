# logseq

## Install

1. Install app
2. Plugins
   - logseq-mermaid-plugin
   - logseq-move-block
   - logseq-solarized-extended-theme
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
