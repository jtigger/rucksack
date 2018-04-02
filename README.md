rucksack
========

Light-weight configuration management for a programmer's workstation using bash.

Primarily intended for programmers who:
- rotate through workstations frequently;
- want to maintain custom configuration; and
- want to be able to remove that custom configuration when they leave the machine.

Features:
- direct support for installing [brew](https://brew.sh/) formula.
    - tracks which formula is installed from the rucksack; when uninstalling, only removes those formula.
- individual chunks of configuration called "pocket"s can be installed and uninstalled independently, allowing you to bring just the configuration you need on the given workstation.
- low-tech and readable bash.
