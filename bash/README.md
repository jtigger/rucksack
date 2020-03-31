1. Install dotfiles:

    ```bash
    cd ~
    cp rucksack/bash/.bash_profile.example .bash_profile
    ln -s rucksack/bash/.bashrc .
    ln -s rucksack/bash/.fdignore .
    ln -s rucksack/bash/.gitignore .
    ln -s rucksack/bash/.inputrc .
    ```
1. (after `brew bundle`) Install fuzzy matcher's keybindings and completions:

    ```bash
    /usr/local/opt/fzf/install
    ```
