#!/usr/bin/env bash

set -e

# Package List to Install
PACKAGES=(
	# System Packages
	curl
	wget
	build-essential
	btop
    iotop
	tree
	zip
	unzip
	stow
	rsync
	timeshift
	fd-find
	ripgrep
	file
	duf
	fzf
	nnn
    libnotify4
    libnotify-bin

	net-tools
	iproute2
	dnsutils
	nmap
	traceroute
	network-manager
	network-manager-gnome
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

	lxappearance
	brightnessctl

	openssh-client
	openssh-server
	keychain

	git
	jq
    pipx
	python3
	python3-pip
	python3-venv

    mpv
    playerctl

	kitty
	sway
	swaylock
	swayidle
	swaybg
	waybar
	fuzzel
	mako-notifier
	wl-clipboard
	grim
	slurp
	imv
)

mkdir -p "$HOME/Pictures/Screenshots"

sudo apt update
sudo apt install -y "${PACKAGES[@]}"

FONTS=(
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/IosevkaTerm.zip"
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/NerdFontsSymbolsOnly.zip"
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip"
)

if ! command -v zsh >/dev/null 2>&1; then
    bash scripts/install-zsh.sh
fi

if ! command -v nvim >/dev/null 2>&1; then
    bash scripts/install-nvim.sh
fi

bash scripts/install-font.sh "${FONTS[@]}"
bash stow.sh

echo "done."
