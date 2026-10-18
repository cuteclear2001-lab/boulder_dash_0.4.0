--res://lua/user_interface_layout/setting_tabs/game_settings_page/reset_button/reset_button_action.lua
local Data = require("lua.user_interface_layout.setting_tabs.game_settings_page.reset_button.reset_button_data")
local User_Setting = require("lua.feature.data.user_setting")
local Config = require("lua.feature.action.config")
local Language_Option_Action = require("lua.user_interface_layout.setting_tabs.game_settings_page.language_setting.language_option_action")
--local Sound_Effect_Action = require("lua.user_interface_layout.setting_tabs.game_settings_page.sound_effect.sound_effect_action")
local Sound_Effect_Main_H_Slider_Data = require("lua.user_interface_layout.setting_tabs.game_settings_page.sound_effect.main_h_slider.main_h_slider_data")
local Count_Setting_Main_H_Slider_Data = require("lua.user_interface_layout.setting_tabs.game_settings_page.count_setting.main_h_slider.main_h_slider_data")

---@class Action.Game_Settings.Reset_Button
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
    local temp = Config:loadDefault()[User_Setting.SETTINGS][User_Setting.LANG]
    Config:saveSetting(User_Setting.SETTINGS, User_Setting.LANG, temp)
    Language_Option_Action:selectConfig()
    temp = Config:loadDefault()[User_Setting.SETTINGS][User_Setting.SOUND_EFFECT]
    Config:saveSetting(User_Setting.SETTINGS, User_Setting.SOUND_EFFECT, temp)
    local value = tonumber(temp) or 100
--    Sound_Effect_Action:onChanged(value)
    Sound_Effect_Main_H_Slider_Data.hSlider:set_value(value)
    temp = Config:loadDefault()[User_Setting.SETTINGS][User_Setting.COUNT_SETTING]
    Config:saveSetting(User_Setting.SETTINGS, User_Setting.COUNT_SETTING, temp)
    value = tonumber(temp) or 3
    Count_Setting_Main_H_Slider_Data.hSlider:set_value(value)
end

return Reset_Button
