--res://lua/user_interface_layout/setting_tabs/game_settings_page/sound_effect/mute_button/mute_button_action.lua
local Data = require("lua.user_interface_layout.setting_tabs.game_settings_page.sound_effect.mute_button.mute_button_data")
local Main_H_Slider_Data = require("lua.user_interface_layout.setting_tabs.game_settings_page.sound_effect.main_h_slider.main_h_slider_data")

---@class Action.Mute_Button
local Mute_Button = {
}

---@param button Button
function Mute_Button:init(button)
    Data.button = button
    local callable = Callable(function()self["onPressed"](self)end)
    button.pressed:connect(callable)
end

function Mute_Button:onPressed()
--    print("Mute_Button_Action:pressed")
    ---@type HSlider
    local hSlider = Main_H_Slider_Data.hSlider
    hSlider:set_value(0)
end

return Mute_Button
