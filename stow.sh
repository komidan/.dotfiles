#!/usr/bin/env bash

set -e

DOTFILES="$HOME/.dotfiles/configs"

CONFIGS=(
	zsh
	kitty
	tmux
	nvim
    sway
    waybar
    mako
    fuzzel
)

# terrible fix but meh, you get a conflict error from stow otherwise
if [ -f "~/.zshrc" ]; then
    rm ~/.zshrc
fi

cd "$DOTFILES"

stow --verbose=1 -t "$HOME" "${CONFIGS[@]}"

echo "[$0] done."
