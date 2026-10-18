--res://lua/user_interface_layout/cave_difficulty_select/value_label/value_label_action.lua
local Data = require("lua.user_interface_layout.cave_difficulty_select.value_label.value_label_data")

---@class Action.Value_Label
local Value_Label = {
}

---@param label Label
function Value_Label:init(label)
    Data.label = label
end

---@param value integer
function Value_Label:update(value)
    ---@type Label
    local label = Data.label
    if not is_instance_valid(label) then
        return
    end
    label.text = string.format("%02d", value)
end

return Value_Label
