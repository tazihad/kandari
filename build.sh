#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

rpm-ostree uninstall \
    firefox \
    firefox-langpacks

rpm-ostree install \
    zsh \
    fastfetch


systemctl enable podman.socket
