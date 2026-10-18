--res://lua/user_interface_layout/cave_difficulty_select/cave_difficulty_select_gd.lua
local Action = require("lua.user_interface_layout.cave_difficulty_select.cave_difficulty_select_action")

---@class Gd.Cave_Difficulty_Select:Control
local Cave_Difficulty_Select = {
    extends = Control,
}

function Cave_Difficulty_Select:_ready()
    self:init()
end

function Cave_Difficulty_Select:init()
    Action:init(self)
end

return Cave_Difficulty_Select
