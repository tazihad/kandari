#!/usr/bin/env bash

set -euox pipefail

BASE=""
FEDORA_VERSION=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --base)
      BASE="$2"
      shift 2
      ;;
    --version)
      FEDORA_VERSION="$2"
      shift 2
      ;;
    *)
      echo "Unknown argument: $1"
      exit 1
      ;;
  esac
done

if [[ -z "$BASE" ]]; then
  echo "--base flag is required"
  exit 1
fi

if [[ -z "$FEDORA_VERSION" ]]; then
  echo "--version flag is required"
  exit 1
fi

for build-file in /tmp/build-file/base/*.sh; do
  if [[ -f "$build-file" ]]; then
    echo "Running $build-file"
    bash "$build-file" --version "$FEDORA_VERSION"
  fi
done

# If the image is BASE, then we don't need to run the same build-file again
if [[ "$BASE" == "base" ]]; then
  exit 0
fi

for build-file in /tmp/build-file/$BASE/*.sh; do
  if [[ -f "$build-file" ]]; then
    echo "Running $build-file"
    bash "$build-file" --version "$FEDORA_VERSION"
  fi
done
