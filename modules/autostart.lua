-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    -- Secret service (for Chromium-based browsers)
    hl.exec_cmd("wal -R")
    

    -- Status bar
    hl.exec_cmd("waybar")

    -- Notification daemon
    -- hl.exec_cmd("swaync")
    hl.exec_cmd("dunst")
    -- Wallpaper daemon
    hl.exec_cmd("awww-daemon")

    hl.exec_cmd("hypridle")

    -- Clipboard history
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    -- hl.exec_once("gnome-keyring-daemon --start --components=secrets")
end)