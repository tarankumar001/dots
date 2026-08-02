#!/usr/bin/env bash

PLAYER=$(playerctl -l 2>/dev/null | head -n1)

# No player running
if [ -z "$PLAYER" ]; then
    echo ""
    exit 0
fi

STATUS=$(playerctl --player="$PLAYER" status 2>/dev/null)

# Player icons
case "$PLAYER" in
    spotify*)
        ICON=""
        ;;
    firefox*)
        ICON="󰈹"
        ;;
    chromium*)
        ICON=""
        ;;
    mpv*)
        ICON=""
        ;;
    vlc*)
        ICON="󰕼"
        ;;
    *)
        ICON=""
        ;;
esac

case "$STATUS" in
    Playing)
        playerctl metadata --player="$PLAYER" \
            --format "$ICON {{artist}} - {{title}}"
        ;;
    Paused)
        playerctl metadata --player="$PLAYER" \
            --format " {{artist}} - {{title}}"
        ;;
    Stopped)
        echo ""
        ;;
    *)
        echo ""
        ;;
esac
