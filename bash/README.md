# Installation

1. Install dotfiles:

    ```bash
    cd ~
    cp rucksack/bash/.bash_profile.example .bash_profile
    ln -s rucksack/bash/.bashrc .
    ln -s rucksack/bash/.fdignore .
    ln -s rucksack/bash/.inputrc .
    ln -s rucksack/bash/.terminfo .
    mkdir -p $( dirname $( bat --config-file ) )
    ln -s rucksack/bash/.bat-config $( bat --config-file ) 
    ```

1. (after `brew bundle`) Install fuzzy matcher's keybindings and completions:

    ```bash
    /usr/local/opt/fzf/install
    ```

# Details

- we use `fd` (https://github.com/sharkdp/fd) as a (much) faster replacement
  for `find` to enumerate files and directories.

