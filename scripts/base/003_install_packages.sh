#!/usr/bin/env bash

set -euox pipefail

rpm-ostree install \
  distrobox \
  fastfetch \
  ffmpeg \
  ffmpeg-libs \
  htop \
  podman-compose \
  zsh

