#!/usr/bin/env bash
function usage() {
  echo "Usage:  $0 (path-to-file-to-check) (expected-sha)"
  exit 1
}

function assert_file_exists() {
  if [[ ! -f "$1" ]]; then
    echo "File not found: \"$1\"."
    usage
  fi
}

function assert_sha_is_valid() {
  if [[ ${#1} -ne 64 ]]; then
    echo -n "'expected-sha' specified is invalid: "
    echo -n "expected a hash string 64 characters long "
    echo "but was ${#1} characters long."
    usage
  fi
}

if [[ $# -ne 2 ]]; then
  usage
fi

DOWNLOAD=$1
EXPECTED_SHA=$2
ACTUAL_SHA_FILE=$(mktemp)

assert_file_exists "${DOWNLOAD}"
assert_sha_is_valid ${EXPECTED_SHA}

shasum -a 256 $1 | awk '{ print $1 }' >${ACTUAL_SHA_FILE}
echo ${EXPECTED_SHA} | diff - ${ACTUAL_SHA_FILE}
SHA_OK=$?
if [[ SHA_OK -eq 0 ]]; then
   echo "SHAs match."
 else
   echo "SHAs do NOT match."
fi
