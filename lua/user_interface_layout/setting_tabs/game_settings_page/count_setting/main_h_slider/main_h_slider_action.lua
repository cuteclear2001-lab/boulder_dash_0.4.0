--res://lua/user_interface_layout/setting_tabs/game_settings_page/count_setting/main_h_slider/main_h_slider_action.lua
local Data = require("lua.user_interface_layout.setting_tabs.game_settings_page.count_setting.main_h_slider.main_h_slider_data")
local Config = require("lua.feature.action.config")
local User_Setting = require("lua.feature.data.user_setting")
local Value_Label_Action = require("lua.user_interface_layout.setting_tabs.game_settings_page.count_setting.value_label.value_label_action")

---@class Action.CountSetting.HSlider
local Main_H_Slider = {
}

---@param hSlider HSlider
function Main_H_Slider:init(hSlider)
    Data.hSlider = hSlider
    self:setup()
end

function Main_H_Slider:setup()
    ---@type HSlider
    local hSlider = Data.hSlider
    local callable = Callable(function(value)self["onChanged"](self, value)end)
    hSlider:connect("value_changed", callable)
    self:selectConfig()
end

function Main_H_Slider:selectConfig()
    local temp = Config:load()[User_Setting.SETTINGS][User_Setting.COUNT_SETTING]
    local value = tonumber(temp) or 5
--    self:onChanged(value)
--    Data.hSlider:set_value_no_signal(value)
    ---@type HSlider
    local hSlider = Data.hSlider
    hSlider:set_value(value)
end

---@param value integer
function Main_H_Slider:onChanged(value)
    Config:saveSetting(User_Setting.SETTINGS, User_Setting.COUNT_SETTING, tostring(value))
    Value_Label_Action:update(value)
--    print(string.format("%d", value))
end

return Main_H_Slider
