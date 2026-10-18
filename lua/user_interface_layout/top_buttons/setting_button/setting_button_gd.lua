--res://lua/user_interface_layout/top_buttons/setting_button/setting_button_gd.lua
local Action = require("lua.user_interface_layout.top_buttons.setting_button.setting_button_action")

---@class Gd.Setting_Button:Button
local Setting_Button = {
    extends = Button,
}

function Setting_Button:_ready()
    self:init()
end

function Setting_Button:init()
    Action:init(self)
end

return Setting_Button
