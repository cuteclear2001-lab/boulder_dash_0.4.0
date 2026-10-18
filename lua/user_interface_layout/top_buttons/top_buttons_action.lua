--res://lua/user_interface_layout/top_buttons/top_buttons_action.lua
local Data = require("lua.user_interface_layout.top_buttons.top_buttons_data")

---@classs Action.Top_Buttons:Control
local Top_Buttons = {
}

---@param control Control
function Top_Buttons:init(control)
    Data.control = control
end

return Top_Buttons
