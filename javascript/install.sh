#!/usr/bin/env bash
POCKET_NAME="javascript"

cd ~
source rucksack/_core.sh

abort_if_pocket_installed ${POCKET_NAME}
log "'${POCKET_NAME}' pocket installing..."

add_to_installed_pockets_list ${POCKET_NAME}

