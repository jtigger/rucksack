#!/usr/bin/env bash

set -o errexit -o nounset -o pipefail
#set -o xtrace

grep -R "$*" ~/rucksack/chops
