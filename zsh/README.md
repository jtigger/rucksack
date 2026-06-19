# Installation

1. Install dotfiles:

   ```zsh
   cd ~
   ln -s rucksack/zsh/.zshrc
   mkdir -p $( dirname $( bat --config-file ) )
   ln -s rucksack/bash/.bat-config $( bat --config-file ) 
   ```
