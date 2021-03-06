#!/usr/bin/env bash

set -eu
set -o pipefail

function main() {
 # git fetch --depth=1 origin +refs/tags/*:refs/tags/*

  local previous tag
 # previous="$(git describe --abbrev=0 --tags)"
  previous="$(git describe --tags `git rev-list --tags --max-count=1`)"
  tag="$(printf "%s" "$previous" | awk -F. '{$NF = $NF + 1;} 1' | sed 's/ /./g')"

  printf "v%s" "${tag#v}"
}

main "${@:-}"
