--res://lua/user_interface_layout/setting_tabs/game_settings_page/sound_effect/value_label/value_label_action.lua
local Data = require("lua.user_interface_layout.setting_tabs.game_settings_page.sound_effect.value_label.value_label_data")
local Config = require("lua.feature.action.config")
local User_Setting = require("lua.feature.data.user_setting")

---@class Action.SoundEffect.ValueLabel
local Value_Label = {
}

---@param label Label
function Value_Label:init(label)
    Data.label = label
    self:setup()
end

function Value_Label:setup()
    local temp = Config:load()[User_Setting.SETTINGS][User_Setting.SOUND_EFFECT]
    local value = tonumber(temp) or 100
    self:update(value)
end

---@param value integer
function Value_Label:update(value)
    ---@type Label
    local label = Data.label
    if not is_instance_valid(label) then
        return
    end
    label.text = string.format("%02d", value)
end

return Value_Label
