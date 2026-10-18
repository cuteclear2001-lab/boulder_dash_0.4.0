--res://lua/user_interface_layout/top_buttons/top_buttons_gd.lua
local Action = require("lua.user_interface_layout.top_buttons.top_buttons_action")

---@classs Gd.Top_Buttons:Control
local Top_Buttons = {
    extends = Control,
}

function Top_Buttons:_ready()
    self:init()
end

function Top_Buttons:init()
    Action:init(self)
end

return Top_Buttons
