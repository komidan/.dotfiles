#!/usr/bin/env bash

DOTFILES_ZSH="$HOME/dotfiles/configs/zsh/.zshrc"
TARGET_ZSH="$HOME/.zshrc"
ZSH="$HOME/.oh-my-zsh/"

if ! command -v zsh &> /dev/null; then
    echo "[$0] zsh Installed, and configuration found!"
    exit 1
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "[$0] installing Oh-My-Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        echo "[$0] installed!"
    else
        echo "[$0] install failed! :shrug:"
        exit 1
    fi
else
    echo "[$0] zsh already installed!"
fi

mkdir -p "$ZSH/themes"
