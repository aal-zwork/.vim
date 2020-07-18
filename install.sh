#!/usr/bin/env sh
git -C ~/.vim submodule update --init --recursive
vim <<-EOF
    :VundleInstall
    :quit
EOF
