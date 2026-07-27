local M = {}

local path = os.getenv("HOME") .. "/.cache/wal/colors-hyprland.conf"

for line in io.lines(path) do
    local key, value = line:match("%$(%w+)%s*=%s*(.+)")
    if key and value then
        M[key] = value
    end
end

return M
