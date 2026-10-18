--res://lua/user_interface_layout/setting_tabs/game_settings_page/sound_effect/main_h_slider/main_h_slider_gd.lua
local Action = require("lua.user_interface_layout.setting_tabs.game_settings_page.sound_effect.main_h_slider.main_h_slider_action")

---@class Gd.SoundEffect.HSlider
local Main_H_Slider = {
    extends = HSlider,
}

function Main_H_Slider:_ready()
    self:init()
end

function Main_H_Slider:init()
    Action:init(self)
end

return Main_H_Slider
