#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# third party repo
#  - vscode repo
curl -o /etc/yum.repos.d/vscode.repo "https://packages.microsoft.com/yumrepos/vscode/config.repo"

cli_packages=(
    "zsh"
    "neovim"
    "fastfetch"
)

gui_packages=(
    "konqueror"
    "featherpad"
)

third_party_packages=(
    "code"
)

packages=(
    ${cli_packages[@]}
    ${gui_packages[@]}
    ${third_party_packages[@]}
)

rpm-ostree install ${packages[@]}