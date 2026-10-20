--res://lua/user_interface_layout/cave_difficulty_select/cave_h_slider/cave_h_slider_action.lua
local Cave_Difficulty_Data = require("lua.feature.data.object.cave.cave_difficulty")
local Data = require("lua.user_interface_layout.cave_difficulty_select.cave_h_slider.cave_h_slider_data")
local Config = require("lua.feature.action.config")
local User_Setting = require("lua.feature.data.user_setting")
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
    local temp_unlocked = Config:load()[User_Setting.UNLOCKED]
    local temp_cave = tonumber(temp_unlocked[User_Setting.CAVE]) or 0
    hSlider:set_value(temp_cave)
end

---@param value integer
function Cave_H_Slider:onChanged(value)
    Value_Label_Action:update(value)
    Difficulty_Container_Action:setup(value)
end

return Cave_H_Slider
