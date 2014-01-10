#/bin/bash

# TODO: collect and make symlinks based on patterns instead of individual files
cd ~
ln -s .rucksack/git/.gitconfig .
ln -s .rucksack/git/.gitconfig-grep .
ln -s .rucksack/vim/.vimrc .

echo "for bash: Copy from .rucksack/bash/.bashrc.example..."
