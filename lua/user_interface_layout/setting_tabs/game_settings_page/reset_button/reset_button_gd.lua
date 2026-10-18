--res://lua/user_interface_layout/setting_tabs/game_settings_page/reset_button/reset_button_gd.lua
local Action = require("lua.user_interface_layout.setting_tabs.game_settings_page.reset_button.reset_button_action")

---@class Gd.Game_Settings.Reset_Button:Button
local Reset_Button = {
    extends = Button,
}

function Reset_Button:_ready()
    self:init()
end

function Reset_Button:init()
    Action:init(self)
end

return Reset_Button
