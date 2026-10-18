--res://lua/user_interface_layout/cave_difficulty_select/reset_button/reset_button_action.lua
local Data = require("lua.user_interface_layout.cave_difficulty_select.reset_button.reset_button_data")
local Zero_Cave_Action = require("lua.user_interface_layout.cave_difficulty_select.zero_cave.zero_cave_action")
local Config = require("lua.feature.action.config")
local User_Setting = require("lua.feature.data.user_setting")
local Difficulty_Container_Action = require("lua.user_interface_layout.cave_difficulty_select.difficulty_container.difficulty_container_action")
--local Cave_H_Slider_Data = require("lua.user_interface_layout.cave_difficulty_select.cave_h_slider.cave_h_slider_data")

---@class Action.Cave_Difficulty_Select.Reset_Button
local Reset_Button = {
}

---@param button Button
function Reset_Button:init(button)
    Data.button = button
    self:setup()
end

function Reset_Button:setup()
    ---@type Button
    local button = Data.button
    local callable = Callable(function()self["onPressed"](self)end)
    button.pressed:connect(callable)
end

function Reset_Button:onPressed()
    local temp_cave = Config:loadDefault()[User_Setting.UNLOCKED][User_Setting.CAVE]
    Config:saveSetting(User_Setting.UNLOCKED, User_Setting.CAVE, temp_cave)
    local temp_difficulty = Config:loadDefault()[User_Setting.UNLOCKED][User_Setting.DIFFICULTY]
    Config:saveSetting(User_Setting.UNLOCKED, User_Setting.DIFFICULTY, temp_difficulty)
    Zero_Cave_Action:onPressed()
    Difficulty_Container_Action:onPressed(0, 1)
--    Cave_H_Slider_Data.hSlider:set_value(0)
end

return Reset_Button
