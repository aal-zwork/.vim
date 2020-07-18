#!/usr/bin/env sh
git -C ~/.vim submodule update --init --recursive
vim &>/dev/null <<-EOF
    :VundleInstall
    :quita
EOF
