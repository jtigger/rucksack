#/bin/bash

# TODO: make this installer idempotent
# TODO: collect and make symlinks based on patterns instead of individual files
cd ~
ln -s .rucksack/git/.gitconfig .
ln -s .rucksack/git/.gitconfig-grep .
ln -s .rucksack/git/.bashrc-git .
ln -s .rucksack/bash/.bashrc-aliases .
ln -s .rucksack/ruby/.bashrc-ruby .

# TODO: modify ~/.bashrc to source-in any symlink'ed files
