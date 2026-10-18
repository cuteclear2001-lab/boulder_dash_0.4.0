--res://lua/user_interface_layout/cave_difficulty_select/cave_difficulty_select_action.lua
local Data = require("lua.user_interface_layout.cave_difficulty_select.cave_difficulty_select_data")

---@class Action.Cave_Difficulty_Select
local Cave_Difficulty_Select = {
}

---@param control Control
function Cave_Difficulty_Select:init(control)
    Data.control = control
end

return Cave_Difficulty_Select
