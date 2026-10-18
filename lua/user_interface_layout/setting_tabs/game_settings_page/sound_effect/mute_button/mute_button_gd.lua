--res://lua/user_interface_layout/setting_tabs/game_settings_page/sound_effect/mute_button/mute_button_gd.lua
local Action = require("lua.user_interface_layout.setting_tabs.game_settings_page.sound_effect.mute_button.mute_button_action")

---@class Gd.Mute_Button:Button
local Mute_Button = {
    extends = Button,
}

function Mute_Button:_ready()
    self:init()
end

function Mute_Button:init()
    Action:init(self)
end

return Mute_Button
