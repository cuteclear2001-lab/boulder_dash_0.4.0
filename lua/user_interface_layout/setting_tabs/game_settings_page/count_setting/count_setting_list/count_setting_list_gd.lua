--res://lua/user_interface_layout/setting_tabs/game_settings_page/count_setting/count_setting_list/count_setting_list_gd.lua
local Action = require("lua.user_interface_layout.setting_tabs.game_settings_page.count_setting.count_setting_list.count_setting_list_action")

---@class Gd.CountSettingList:HBoxContainer
local Count_Setting_List = {
    extends = HBoxContainer,
}

function Count_Setting_List:_ready()
    self:init()
end

function Count_Setting_List:init()
    Action:init(self)
end

return Count_Setting_List
