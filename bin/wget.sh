#!/usr/bin/env bash

mirror_site="--recursive --timestamping --level=inf --no-remove-listing --no-parent"
make_navigable_from_disk="--page-requisites --convert-links --adjust-extension"
with_retry="--tries=0 --retry-connrefused --waitretry=5 --read-timeout=60 --timeout=60"

wget ${mirror_site} ${make_navigable_from_disk} ${with_retry} $1
