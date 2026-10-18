--res://lua/user_interface_layout/cave_difficulty_select/cave_h_slider/cave_h_slider_gd.lua
local Action = require("lua.user_interface_layout.cave_difficulty_select.cave_h_slider.cave_h_slider_action")

---@class Gd.Cave_H_Slider:HSlider
local Cave_H_Slider = {
    extends = HSlider,
}

function Cave_H_Slider:_ready()
    self:init()
end

function Cave_H_Slider:init()
    Action:init(self)
end

return Cave_H_Slider
