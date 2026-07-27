-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    -- Status bar
    hl.exec_cmd("waybar")

    -- Notification daemon
    -- hl.exec_cmd("swaync")

    -- Wallpaper daemon
    hl.exec_cmd("awww-daemon")

    -- Clipboard history
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)