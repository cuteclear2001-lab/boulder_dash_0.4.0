--res://lua/user_interface_layout/setting_tabs/game_settings_page/count_setting/zero_button/zero_button_gd.lua
local Action = require("lua.user_interface_layout.setting_tabs.game_settings_page.count_setting.zero_button.zero_button_action")

---@class Gd.ZeroButton:Button
local Zero_Button = {
    extends = Button,
}

function Zero_Button:_ready()
    self:init()
end

function Zero_Button:init()
    Action:init(self)
end

return Zero_Button
