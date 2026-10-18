--res://lua/user_interface_layout/setting_tabs/game_settings_page/sound_effect/value_label/value_label_gd.lua
local Action = require("lua.user_interface_layout.setting_tabs.game_settings_page.sound_effect.value_label.value_label_action")

---@class Gd.SoundEffect.ValueLabel
local Value_Label = {
    extends = Label,
}

function Value_Label:_ready()
    self:init()
end

function Value_Label:init()
    Action:init(self)
end

return Value_Label
