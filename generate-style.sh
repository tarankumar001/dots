#!/bin/bash

JSON="$HOME/.cache/wal/colors.json"

BACKGROUND=$(jq -r '.special.background' "$JSON")
FOREGROUND=$(jq -r '.special.foreground' "$JSON")
COLOR0=$(jq -r '.colors.color0' "$JSON")
COLOR4=$(jq -r '.colors.color4' "$JSON")
COLOR6=$(jq -r '.colors.color6' "$JSON")
COLOR8=$(jq -r '.colors.color8' "$JSON")

read R G B <<<$(printf "%d %d %d" \
0x${BACKGROUND:1:2} \
0x${BACKGROUND:3:2} \
0x${BACKGROUND:5:2})

cat > ~/.config/wlogout/style.css <<EOF
* {
    background-image: none;
    box-shadow: none;
    font-family: "JetBrainsMono Nerd Font", sans-serif;
}

window {
    background-color: rgba($R,$G,$B,0.78);
}

button {
    border-radius: 14px;
    border: 2px solid $COLOR8;

    background-color: $COLOR0;
    color: $FOREGROUND;

    margin: 14px;
    min-width: 180px;
    min-height: 180px;

    background-repeat: no-repeat;
    background-position: center 42px;
    background-size: 64px;

    transition: 200ms ease;
}

button:hover,
button:focus,
button:active {
    background-color: $COLOR4;
    border-color: $COLOR6;
    color: $BACKGROUND;
}

#lock {
    background-image: image(url("/usr/share/wlogout/assets/lock.svg"));
}

#logout {
    background-image: image(url("/usr/share/wlogout/assets/logout.svg"));
}

#suspend {
    background-image: image(url("/usr/share/wlogout/assets/suspend.svg"));
}

#hibernate {
    background-image: image(url("/usr/share/wlogout/assets/hibernate.svg"));
}

#shutdown {
    background-image: image(url("/usr/share/wlogout/assets/shutdown.svg"));
}

#reboot {
    background-image: image(url("/usr/share/wlogout/assets/reboot.svg"));
}
EOF