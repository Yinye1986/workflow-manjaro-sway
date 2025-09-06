#!/bin/bash

sudo pacman-mirrors -i -c China -m rank
sudo pacman -Syu
sudo pacman -S alacritty neovim yazi \
    fastfetch tree \
    fzf ripgrep \
    fcitx5 fcitx5-rime fcitx5-configtool
