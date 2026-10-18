--res://lua/user_interface_layout/setting_tabs/game_settings_page/language_setting/language_option_gd.lua

local Action = require("lua.user_interface_layout.setting_tabs.game_settings_page.language_setting.language_option_action")

---@class Gd.Language_Option:OptionButton
local Language_Option = {
    extends = OptionButton,
}

function Language_Option:_ready()
    self:init()
end

function Language_Option:init()
    Action:init(self)
    Action:selectConfig()
end

return Language_Option
