#!/usr/bin/env bash

set -e

# Package List to Install
PACKAGES=(
	# System Packages
	curl
	wget
	btop
    iotop
	tree
	zip
	unzip
	stow
	rsync
	timeshift
	fd
	ripgrep
	file
	duf
	fzf
	nnn
    libnotify
    polkit
    polkit-gnome

	net-tools
	iproute2
	dnsutils
	nmap
	traceroute
	networkmanager
	blueman
	bluez
	bluez-tools

	pipewire
	wireplumber
	pipewire-pulse
	pipewire-audio

	xdg-desktop-portal
	xdg-desktop-portal-wlr
	xdg-desktop-portal-gtk

	thunar

	brightnessctl
    nwg-look

    openssh
	keychain

	git
	jq
	python-pip
    python-virtualenv

	kitty
    swaybg
    swayidle
    swaylock
	waybar
	fuzzel
    mako
	imv
)

mkdir -p "$HOME/Pictures/Screenshots"

pacman -Sy
# sudo apt update
pacman -S --needed "${PACKAGES[@]}"
# sudo apt install -y "${PACKAGES[@]}"

# FONTS=(
#     "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/IosevkaTerm.zip"
#     "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/NerdFontsSymbolsOnly.zip"
#     "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip"
# )
#
# if ! command -v zsh >/dev/null 2>&1; then
#     bash scripts/install-zsh.sh
# fi
#
# if ! command -v nvim >/dev/null 2>&1; then
#     bash scripts/install-nvim.sh
# fi
#
# bash scripts/install-font.sh "${FONTS[@]}"
# bash stow.sh

echo "done."
