#!/usr/bin/env bash

set -eu
set -o pipefail

function main() {
  local previous tag
  previous="$(git describe --abbrev=0 --tags)"
  tag="$(printf "%s" "$previous" | awk -F. '{$NF = $NF + 1;} 1' | sed 's/ /./g')"

  printf "v%s" "${tag#v}"
}

main "${@:-}"
