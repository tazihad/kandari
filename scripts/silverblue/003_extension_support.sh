#!/usr/bin/env bash

set -euox pipefail

# AppIndicator extension Support
gdbus call --session \
           --dest org.gnome.Shell.Extensions \
           --object-path /org/gnome/Shell/Extensions \
           --method org.gnome.Shell.Extensions.InstallRemoteExtension \
           "appindicatorsupport@rgcjonas.gmail.com"