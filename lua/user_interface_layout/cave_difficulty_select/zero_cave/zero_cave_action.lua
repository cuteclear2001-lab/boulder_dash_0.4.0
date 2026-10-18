--res://lua/user_interface_layout/cave_difficulty_select/zero_cave/zero_cave_action.lua
local Data = require("lua.user_interface_layout.cave_difficulty_select.zero_cave.zero_cave_data")
local Cave_H_Slider_Data = require("lua.user_interface_layout.cave_difficulty_select.cave_h_slider.cave_h_slider_data")
local Cave_H_Slider_Action = require("lua.user_interface_layout.cave_difficulty_select.cave_h_slider.cave_h_slider_action")

---@class Action.Zero_Cave
local Zero_Cave = {
}

---@param button Button
function Zero_Cave:init(button)
    Data.button = button
    self:setup()
end

function Zero_Cave:setup()
    ---@type Button
    local button = Data.button
    local callable = Callable(function()self["onPressed"](self)end)
    button.pressed:connect(callable)
end

function Zero_Cave:onPressed()
    ---@type HSlider
    local hSlider = Cave_H_Slider_Data.hSlider
    hSlider:set_value(0)
    Cave_H_Slider_Action:onChanged(0)
--    print("Zero_Cave:onPressed()")
end

return Zero_Cave
