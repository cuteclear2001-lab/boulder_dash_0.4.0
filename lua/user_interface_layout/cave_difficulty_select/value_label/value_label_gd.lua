--res://lua/user_interface_layout/cave_difficulty_select/value_label/value_label_gd.lua
local Action = require("lua.user_interface_layout.cave_difficulty_select.value_label.value_label_action")

---@class Gd.Value_Label:Label
local Value_Label = {
    extends = Label,
}

function Value_Label:_ready()
    self:init()
end

function Value_Label:init()
    Action:init(self)
end

return Value_Label
