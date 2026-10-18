--res://lua/user_interface_layout/cave_difficulty_select/cave_h_slider/cave_h_slider_action.lua
local Cave_Difficulty_Data = require("lua.feature.data.object.cave.cave_difficulty")
local Data = require("lua.user_interface_layout.cave_difficulty_select.cave_h_slider.cave_h_slider_data")
local Value_Label_Action = require("lua.user_interface_layout.cave_difficulty_select.value_label.value_label_action")
local Difficulty_Container_Action = require("lua.user_interface_layout.cave_difficulty_select.difficulty_container.difficulty_container_action")

---@class Action.Cave_H_Slider
local Cave_H_Slider = {
}

---@param hSlider HSlider
function Cave_H_Slider:init(hSlider)
    Data.hSlider = hSlider
    self:setup()
end

function Cave_H_Slider:setup()
    ---@type HSlider
    local hSlider = Data.hSlider
    local callable = Callable(function(value)self["onChanged"](self, value)end)
    hSlider:connect("value_changed", callable)
    hSlider.max_value = #Cave_Difficulty_Data.data
end

---@param value integer
function Cave_H_Slider:onChanged(value)
    Value_Label_Action:update(value)
    Difficulty_Container_Action:setup(value)
end

return Cave_H_Slider
