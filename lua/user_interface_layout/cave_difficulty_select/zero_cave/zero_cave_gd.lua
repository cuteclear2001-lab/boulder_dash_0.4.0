--res://lua/user_interface_layout/cave_difficulty_select/zero_cave/zero_cave_gd.lua
local Action = require("lua.user_interface_layout.cave_difficulty_select.zero_cave.zero_cave_action")

---@class Gd.Zero_Cave:Button
local Zero_Cave = {
    extends = Button,
}

function Zero_Cave:_ready()
    self:init()
end

function Zero_Cave:init()
    Action:init(self)
end

return Zero_Cave
