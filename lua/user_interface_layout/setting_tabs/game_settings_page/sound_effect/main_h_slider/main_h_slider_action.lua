--res://lua/user_interface_layout/setting_tabs/game_settings_page/sound_effect/main_h_slider/main_h_slider_action.lua
local Data = require("lua.user_interface_layout.setting_tabs.game_settings_page.sound_effect.main_h_slider.main_h_slider_data")
local Config = require("lua.feature.action.config")
local User_Setting = require("lua.feature.data.user_setting")
local Value_Label_Action = require("lua.user_interface_layout.setting_tabs.game_settings_page.sound_effect.value_label.value_label_action")

---@class Action.SoundEffect.HSlider
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
    local temp = Config:load()[User_Setting.SETTINGS][User_Setting.SOUND_EFFECT]
    local value = tonumber(temp) or 100
--    self:onChanged(value)
--    Data.hSlider:set_value_no_signal(value)
    ---@type HSlider
    local hSlider = Data.hSlider
    hSlider:set_value(value)
end

---@param value integer
function Main_H_Slider:onChanged(value)
    local linear_value = value / 100.0
    if linear_value <= 0 then
        linear_value = 0.001
    end
    local db_volume = 20 * math.log(linear_value, 10)
    local master_bus_index = AudioServer:get_bus_index("Master")
    AudioServer:set_bus_volume_db(master_bus_index, db_volume)
    Config:saveSetting(User_Setting.SETTINGS, User_Setting.SOUND_EFFECT, tostring(value))
    Value_Label_Action:update(value)
--    print(string.format("%d", value))
end

return Main_H_Slider
