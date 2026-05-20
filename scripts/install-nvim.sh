#!/usr/bin/env bash
set -e

# CONFIGURATION VARIABLES
NEOVIM_VERSION="0.12.2"
INSTALL_PATH="/usr/local/bin"

APPIMAGE_NAME="nvim-linux-x86_64.appimage"
APPIMAGE_URL="https://github.com/neovim/neovim/releases/download/v${NEOVIM_VERSION}/${APPIMAGE_NAME}"

echo -e "[$0] CONFIGURATION:\n\tVERSION: $NEOVIM_VERSION\n\tPATH: $INSTALL_PATH\n\tAPPIMAGE_NAME: $APPIMAGE_NAME\n\tAPPIMAGE_URL: $APPIMAGE_URL"

if ! command -v fusermount &>/dev/null && ! command -v fuse &>/dev/null; then
    echo "[$0] warning: FUSE is not installed. Either install FUSE or extract the appimage using `--appimage-extract`"
    echo "[$0] it\'s suggested to install FUSE either way, it\'t very helpful."
fi

echo "[$0] installing Neovim v$NEOVIM_VERSION..."
if ! curl -fLo "$APPIMAGE_NAME" "$APPIMAGE_URL"; then
    echo "[$0] failed to download Neovim AppImage. Check version is accurate, and that you have internet connection."
    exit 1
fi

chmod u+x "$APPIMAGE_NAME"

echo "[$0] Moving AppImage to $INSTALL_PATH/nvim..."
if [ "$EUID" -ne 0 ]; then
    echo "[$0] moving the appimage to $INSTALL_PATH requires SUDO."
    echo "[$0] sudo permission is revoked after this action is complete. (sudo -k)"
    echo "[$0] hit enter 3x to ignore, you can manually move it on your own."
    if sudo -v; then
        sudo mv "$APPIMAGE_NAME" "$INSTALL_PATH/nvim"
        sudo -k
    else
        echo "[$0] sudo not granted, renaming to \'nvim\'"
        mv "$APPIMAGE_NAME" "./nvim"
    fi
else
    mv "$APPIMAGE" "$INSTALL_PATH/nvim"
fi


echo "[$0] neovim installed"
