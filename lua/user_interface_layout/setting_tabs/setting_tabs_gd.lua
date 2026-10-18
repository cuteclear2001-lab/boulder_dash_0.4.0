--res://lua/user_interface_layout/setting_tabs/setting_tabs_gd.lua
local Action = require("lua.user_interface_layout.setting_tabs.setting_tabs_action")

---@class Gd.Setting_Tabs:Control
local Setting_Tabs = {
    extends = Control,
}

function Setting_Tabs:_ready()
    self:init()
end

function Setting_Tabs:init()
    Action:init(self)
end

return Setting_Tabs
