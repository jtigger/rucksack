# Installation

1. Wire-in config files
    ```zsh
    cd ~
    ln -s rucksack/git/.gitconfig .
    ln -s rucksack/git/.gitconfig-grep .
    ln -s rucksack/git/.gitignore .
    ```
2. (optional) set default identity

    ```zsh
    cd ~
    cat <<EOF >~/.gitconfig.local
    [include]
      path = ~/rucksack/git/.gitconfig-ident-jtigger
    EOF
    ```
    _(this file is sourced by `.gitconfig`, if present.)_

