#!/usr/bin/env bash
set -o errexit -o nounset -o pipefail
set -o xtrace

jq -R 'split(".") | .[1] | @base64d | fromjson'
