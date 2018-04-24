#!/usr/bin/env bash
export POCKET="java"

cd ~
source rucksack/_core.sh

abort_if_pocket_installed
log "'${POCKET}' pocket installing..."
add_to_installed_pockets_list

brew_cask_install java8
brew_install gradle
brew_install gradle-completion
brew_cask_install font-dejavusansmono-nerd-font-mono
brew_cask_install intellij-idea

add_todo "Sync IntelliJ settings:\n  0. Help -> Register\n  1. File > Sync Settings to JetBrains Account... [Get Settings from Account]\n"

