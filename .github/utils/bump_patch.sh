#!/usr/bin/env bash

set -eu
set -o pipefail

function main() {
  local version
  version="${1}"
  echo "$version" | awk -F. '{$NF = $NF + 1;} 1' | sed 's/ /./g'
}

main "${@:-}"
