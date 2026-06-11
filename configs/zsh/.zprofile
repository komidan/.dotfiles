# ----------------------- #
#     CONFIGURE PATH      #
# ----------------------- #
export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME=qt6ct
export XDG_CURRENT_DESKTOP=niri
export XDG_SESSION_TYPE=wayland
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"

# Custom Startup
if [[ $(tty) == "/dev/tty1" && -z "$WAYLAND_DISPLAY" && -z "$DISPLAY" ]]; then
    echo -n "Start Niri? (y/N)"
    read -r -t 3 a
    case "$a" in
        [Nn]|[Nn][Oo])
            ;;
        *)
            uwsm start niri
            ;;
    esac
fi
