#!/usr/bin/env bash
POCKET_NAME="javascript"

cd ~
source rucksack/_core.sh

abort_if_pocket_not_installed ${POCKET_NAME}
log "'${POCKET_NAME}' pocket uninstalling..."

remove_from_installed_pockets_list ${POCKET_NAME}

