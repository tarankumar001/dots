local colors = {}

for line in io.lines(os.getenv("HOME") .. "/.cache/wal/colors-hyprland.conf") do
    local key, value = line:match("%$(%w+)%s*=%s*(.+)")
    if key and value then
        colors[key] = value
    end
end

return colors
