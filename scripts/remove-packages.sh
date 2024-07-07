#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

rpm-ostree uninstall \
    firefox \
    firefox-langpacks

# make script executable