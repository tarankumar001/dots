-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    -- Secret service (for Chromium-based browsers)
    

    -- Status bar
    hl.exec_cmd("waybar")

    -- Notification daemon
    -- hl.exec_cmd("swaync")

    -- Wallpaper daemon
    hl.exec_cmd("awww-daemon")

    hl.exec_once("hypridle")

    -- Clipboard history
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    -- hl.exec_once("gnome-keyring-daemon --start --components=secrets")
end)