---------------------
-- MY PROGRAMS
---------------------

local terminal    = "kitty"
local fileManager = "dolphin"
local menu        = "rofi -show drun"

---------------------
-- MODIFIER KEY
---------------------

local mainMod = "SUPER" -- Windows key

---------------------
-- APPLICATIONS
---------------------

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E",      hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + D",      hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + R",      hl.dsp.exec_cmd("/home/t10nat/.config/waybar/launch.sh"))

-- Exit / Power Menu
hl.bind(
    mainMod .. " + M",
    hl.dsp.exec_cmd(
        "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"
    )
)

---------------------
-- WINDOW MANAGEMENT
---------------------

-- Close window
local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)

-- Toggle floating
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))

-- Toggle pseudo mode (Dwindle)
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())

-- Toggle split orientation
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

---------------------
-- WINDOW RESIZING
---------------------

-- Keyboard resize
hl.bind(
    "SUPER + code:20",
    hl.dsp.window.resize({ x = -50, y = 0, relative = true }),
    { repeating = true, description = "Shrink width" }
)

hl.bind(
    "SUPER + code:21",
    hl.dsp.window.resize({ x = 50, y = 0, relative = true }),
    { repeating = true, description = "Expand width" }
)

hl.bind(
    "SUPER + SHIFT + code:20",
    hl.dsp.window.resize({ x = 0, y = -50, relative = true }),
    { repeating = true, description = "Shrink height" }
)

hl.bind(
    "SUPER + SHIFT + code:21",
    hl.dsp.window.resize({ x = 0, y = 50, relative = true }),
    { repeating = true, description = "Expand height" }
)

-- Arrow-key resize
hl.bind(mainMod .. " + left",  hl.dsp.exec_cmd("hyprctl dispatch resizeactive -40 0"))
hl.bind(mainMod .. " + right", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 40 0"))
hl.bind(mainMod .. " + up",    hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 -40"))
hl.bind(mainMod .. " + down",  hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 40"))

---------------------
-- WINDOW MOVEMENT
---------------------

hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "down" }))

---------------------
-- MOUSE ACTIONS
---------------------

-- Drag window
hl.bind(
    mainMod .. " + mouse:272",
    hl.dsp.window.drag(),
    { mouse = true }
)

-- Resize window
hl.bind(
    mainMod .. " + mouse:273",
    hl.dsp.window.resize(),
    { mouse = true }
)

---------------------
-- SCREENSHOTS
---------------------

-- Region
hl.bind(
    "Print",
    hl.dsp.exec_cmd("hyprshot -m region --raw | satty --filename -")
)

-- Active window
hl.bind(
    "SHIFT + Print",
    hl.dsp.exec_cmd("hyprshot -m window --raw | satty --filename -")
)

-- Monitor
hl.bind(
    "CTRL + Print",
    hl.dsp.exec_cmd("hyprshot -m output --raw | satty --filename -")
)

---------------------
-- WORKSPACES
---------------------

for i = 1, 10 do
    local key = i % 10 -- Workspace 10 uses key 0

    -- Switch workspace
    hl.bind(
        mainMod .. " + " .. key,
        hl.dsp.focus({ workspace = i })
    )

    -- Move window to workspace
    hl.bind(
        mainMod .. " + SHIFT + " .. key,
        hl.dsp.window.move({ workspace = i })
    )
end
-- Clipboard History
hl.bind(
    mainMod .. " + Y",
    hl.dsp.exec_cmd("cliphist list | rofi -dmenu -i -p Clipboard | cliphist decode | wl-copy")
)

-- Emoji Picker
hl.bind(
    mainMod .. " + period",
    hl.dsp.exec_cmd("rofimoji")
)
---------------------
-- SPECIAL WORKSPACE
---------------------

hl.bind(
    mainMod .. " + S",
    hl.dsp.workspace.toggle_special("magic")
)

hl.bind(
    mainMod .. " + SHIFT + S",
    hl.dsp.window.move({ workspace = "special:magic" })
)

---------------------
-- SCROLL WORKSPACES
---------------------

hl.bind(
    mainMod .. " + mouse_down",
    hl.dsp.focus({ workspace = "e+1" })
)

hl.bind(
    mainMod .. " + mouse_up",
    hl.dsp.focus({ workspace = "e-1" })
)

---------------------
-- AUDIO CONTROLS
---------------------

hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86AudioMicMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true }
)

---------------------
-- BRIGHTNESS
---------------------

hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),
    { locked = true, repeating = true }
)

---------------------
-- MEDIA CONTROLS
---------------------

hl.bind(
    "XF86AudioPrev",
    hl.dsp.exec_cmd("playerctl previous"),
    { locked = true }
)

hl.bind(
    "XF86AudioPlay",
    hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true }
)

hl.bind(
    "XF86AudioPause",
    hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true }
)

hl.bind(
    "XF86AudioNext",
    hl.dsp.exec_cmd("playerctl next"),
    { locked = true }
)