#!/usr/bin/env bash

set -euox pipefail

rpm-ostree install \
  qt6-qtimageformats \
  fcitx5 \
  kcm-fcitx5

