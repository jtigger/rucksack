# rucksack

A light-weight tool for installing/uninstalling tools and configuration on an OSX workstation that follows the Boy Scouts rule: leave it as good (or better) than you found it.

Primarily intended for programmers who:
- rotate through workstations at some frequency;
- want to use a custom configuration; and
- want to be able to remove that custom configuration when they leave the machine, leaving it exactly how they found it.

## Features
- where possible, rucksack uses [brew](https://brew.sh/) and [brew cask]() to install anything.
    - it tracks which formula/casks are installed through rucksack; when uninstalling, only removes those formula.
- individual chunks of configuration called "pocket"s can be installed and uninstalled independently, allowing you to bring just the configuration you need on the given workstation.
- low-tech and readable bash.

## Why?

In short, most of what rucksack takes responsibility for is maintaining state about what it installed so as to "leave it the way you found it."
